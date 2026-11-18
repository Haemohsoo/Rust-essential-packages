# Rust crate installer for Windows PowerShell 5.1+ / PowerShell 7+
# Library crates are PROJECT dependencies, not global installations.
# Usage: .\install_rust_crates.ps1 -ProjectPath C:\work\rust_science -Category all
# Preview: .\install_rust_crates.ps1 -ProjectPath C:\work\rust_science -DryRun
# Global CLI tools: .\install_rust_crates.ps1 -Category cli -DryRun



<# 
Usage
First, install Rust and Cargo from rustup.rs.

Then extract the ZIP and open PowerShell.

1. Preview installations
.\install_rust_crates.ps1 -Category all -DryRun


2. Install all library categories
.\install_rust_crates.ps1 -Category all -ProjectPath D:\rust\rust_science


3. Install only numerical computing crates
.\install_rust_crates.ps1 -Category numerical -ProjectPath D:\rust\rust_science


4. Install command-line applications globally
.\install_rust_crates.ps1 -Category cli


Features
- Automatically creates a Cargo project when necessary.
- Organizes crates by category.
- Supports -DryRun, -Upgrade, and -IncludeOptional.
- Continues after individual installation failures.
- Skips selected heavyweight dependencies unless explicitly requested.
- Reports successful, skipped, and failed operations.
Important difference from R and Ruby: Rust library crates are installed as dependencies of a Cargo project, not globally. The script uses cargo add for libraries and cargo install for executable applications.

The script has not been tested against a live Windows Rust installation. 
#>


[CmdletBinding()]
param(
  [ValidateSet('all','essential','numerical','data','visualization','network','languages','cli')]
  [string]$Category = 'all',
  [string]$ProjectPath = (Join-Path (Get-Location).Path 'rust_science'),
  [switch]$DryRun,
  [switch]$Upgrade,
  [switch]$IncludeOptional
)
$ErrorActionPreference = 'Stop'
$script:Failed = 0
$script:Skipped = 0
$script:Added = 0
$script:Planned = 0
$script:Seen = @{}
$groups = [ordered]@{
  essential = @('anyhow','thiserror','serde','serde_json','clap','log','env_logger','rayon')
  numerical = @('ndarray','nalgebra','faer','num-complex','num-traits','rustfft','realfft','statrs','argmin','rand','rand_distr')
  data = @('polars','csv','calamine','arrow','parquet','chrono')
  visualization = @('plotters','plotly')
  network = @('reqwest','tokio','url','scraper')
  languages = @('pyo3')
  cli = @('ripgrep','bat','fd-find','cargo-edit','cargo-audit')
}
$optional = @('polars','arrow','parquet','pyo3','faer') # potentially large builds or native dependencies
function Invoke-Cargo([string[]]$Arguments) {
  Write-Host ('> cargo ' + ($Arguments -join ' '))
  if ($DryRun) { $script:Planned++; return $true }
  try {
    & cargo @Arguments
    if ($LASTEXITCODE -ne 0) { $script:Failed++; return $false }
    return $true
  } catch {
    Write-Warning $_.Exception.Message
    $script:Failed++
    return $false
  }
}
if (-not (Get-Command cargo -ErrorAction SilentlyContinue)) {
  throw 'Cargo not found. Install Rust from https://rustup.rs/ and restart PowerShell.'
}
$selected = if ($Category -eq 'all') { @($groups.Keys | Where-Object { $_ -ne 'cli' }) } else { @($Category) }
$needsProject = @($selected | Where-Object { $_ -ne 'cli' }).Count -gt 0
if ($needsProject) {
  $ProjectPath = [System.IO.Path]::GetFullPath($ProjectPath)
  $manifest = Join-Path $ProjectPath 'Cargo.toml'
  if (-not (Test-Path -LiteralPath $manifest)) {
    Write-Host "Project does not exist: $ProjectPath"
    if (-not (Invoke-Cargo @('new','--bin','--vcs','none',$ProjectPath))) {
      if (-not $DryRun) { throw 'Could not create Rust project.' }
    }
  }
  if (-not $DryRun -and -not (Test-Path -LiteralPath $manifest)) { throw "Cargo.toml not found: $manifest" }
}
foreach ($group in $selected) {
  Write-Host "`n=== $group ==="
  foreach ($crate in $groups[$group]) {
    if ($script:Seen.ContainsKey($crate)) { $script:Skipped++; continue }
    $script:Seen[$crate] = $true
    if ($optional -contains $crate -and -not $IncludeOptional) {
      Write-Host "[OPTIONAL SKIP] $crate (use -IncludeOptional)"
      $script:Skipped++
      continue
    }
    if ($group -eq 'cli') {
      $args = @('install',$crate,'--locked')
      if ($Upgrade) { $args += '--force' }
    } else {
      $args = @('add',$crate,'--manifest-path',$manifest)
    }
    if (Invoke-Cargo $args) { if (-not $DryRun) { $script:Added++ } }
  }
}
Write-Host "`nSummary: successful=$script:Added planned=$script:Planned skipped=$script:Skipped failed=$script:Failed"
if ($script:Failed -gt 0) { exit 1 }

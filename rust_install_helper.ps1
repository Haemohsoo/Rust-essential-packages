# Shared helper. Run category scripts or install_rust_crates_all.ps1, not this file.
function Invoke-RustCategory {
 param([string]$Name,[string[]]$Crates,[bool]$IsCli=$false,[string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional)
 if (-not (Get-Command cargo -ErrorAction SilentlyContinue)) { throw 'Cargo not found. Install Rust from https://rustup.rs/' }
 $ok=0; $failed=0; $skipped=0; $planned=0
 if (-not $IsCli) {
  $ProjectPath=[System.IO.Path]::GetFullPath($ProjectPath)
  $manifest=Join-Path $ProjectPath 'Cargo.toml'
  if (-not (Test-Path -LiteralPath $manifest)) {
   Write-Host "> cargo new --bin --vcs none `"$ProjectPath`""
   if ($DryRun) { $planned++ } else { & cargo new --bin --vcs none $ProjectPath; if ($LASTEXITCODE -ne 0) { throw 'Could not create Cargo project' } }
  }
  if (-not $DryRun -and -not (Test-Path -LiteralPath $manifest)) { throw "Missing Cargo.toml: $manifest" }
 }
 Write-Host "`n=== $Name ==="
 foreach ($crate in $Crates) {
  if (-not $IncludeOptional -and $crate -in @('polars','arrow','parquet','pyo3','faer')) { Write-Host "[OPTIONAL SKIP] $crate"; $skipped++; continue }
  if ($IsCli) { $cargoArgs=@('install',$crate,'--locked'); if ($Upgrade) { $cargoArgs+= '--force' } }
  else { $cargoArgs=@('add',$crate,'--manifest-path',$manifest) }
  Write-Host ('> cargo ' + ($cargoArgs -join ' '))
  if ($DryRun) { $planned++; continue }
  try { & cargo @cargoArgs; if ($LASTEXITCODE -ne 0) { Write-Warning "Failed: $crate"; $failed++ } else { $ok++ } }
  catch { Write-Warning "Failed: $crate - $_"; $failed++ }
 }
 Write-Host "Summary ($Name): successful=$ok planned=$planned skipped=$skipped failed=$failed"
 return $failed
}

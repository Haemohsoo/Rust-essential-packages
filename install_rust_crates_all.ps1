# Run each category file in sequence, each crate independently.
[CmdletBinding()]
param([string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional,[switch]$IncludeCli)
$failed = 0
$categories = @('01-essential','02-numerical','03-data','04-visualization','05-network','06-languages')
if ($IncludeCli) { $categories += '07-cli' }
foreach ($category in $categories) {
  $scriptPath = Join-Path $PSScriptRoot ("install_rust_crates_$category.ps1")
  & $scriptPath -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional
  if ($LASTEXITCODE -ne 0) { $failed++ }
}
if ($failed -gt 0) { exit 1 }

# Category: 04-visualization
# Usage: .\install_rust_crates_04-visualization.ps1 -ProjectPath D:\rust\rust_science -DryRun
[CmdletBinding()]
param([string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional)
. (Join-Path $PSScriptRoot 'rust_install_helper.ps1')
$failures = 0
# plotters: Charts and publication-ready plotting.
# Homepage: https://crates.io/crates/plotters
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('plotters') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# plotly: Interactive Plotly charts.
# Homepage: https://crates.io/crates/plotly
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('plotly') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

if ($failures -gt 0) { exit 1 }

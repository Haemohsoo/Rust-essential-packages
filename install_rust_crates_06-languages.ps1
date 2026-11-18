# Category: 06-languages
# Usage: .\install_rust_crates_06-languages.ps1 -ProjectPath D:\rust\rust_science -DryRun
[CmdletBinding()]
param([string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional)
. (Join-Path $PSScriptRoot 'rust_install_helper.ps1')
$failures = 0
# pyo3: Python and Rust interoperability.
# Homepage: https://crates.io/crates/pyo3
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('pyo3') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

if ($failures -gt 0) { exit 1 }

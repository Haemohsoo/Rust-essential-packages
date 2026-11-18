# Category: 03-data
# Usage: .\install_rust_crates_03-data.ps1 -ProjectPath D:\rust\rust_science -DryRun
[CmdletBinding()]
param([string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional)
. (Join-Path $PSScriptRoot 'rust_install_helper.ps1')
$failures = 0
# polars: DataFrame and data processing.
# Homepage: https://crates.io/crates/polars
$failures += Invoke-RustCategory -Name '03-data' -Crates @('polars') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# csv: CSV reading and writing.
# Homepage: https://crates.io/crates/csv
$failures += Invoke-RustCategory -Name '03-data' -Crates @('csv') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# calamine: Read Excel and OpenDocument spreadsheets.
# Homepage: https://crates.io/crates/calamine
$failures += Invoke-RustCategory -Name '03-data' -Crates @('calamine') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# arrow: Apache Arrow columnar data.
# Homepage: https://crates.io/crates/arrow
$failures += Invoke-RustCategory -Name '03-data' -Crates @('arrow') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# parquet: Apache Parquet data format.
# Homepage: https://crates.io/crates/parquet
$failures += Invoke-RustCategory -Name '03-data' -Crates @('parquet') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# chrono: Date and time handling.
# Homepage: https://crates.io/crates/chrono
$failures += Invoke-RustCategory -Name '03-data' -Crates @('chrono') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

if ($failures -gt 0) { exit 1 }

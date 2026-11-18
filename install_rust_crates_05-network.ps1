# Category: 05-network
# Usage: .\install_rust_crates_05-network.ps1 -ProjectPath D:\rust\rust_science -DryRun
[CmdletBinding()]
param([string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional)
. (Join-Path $PSScriptRoot 'rust_install_helper.ps1')
$failures = 0
# reqwest: HTTP client.
# Homepage: https://crates.io/crates/reqwest
$failures += Invoke-RustCategory -Name '05-network' -Crates @('reqwest') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# tokio: Asynchronous runtime.
# Homepage: https://crates.io/crates/tokio
$failures += Invoke-RustCategory -Name '05-network' -Crates @('tokio') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# url: URL parsing and manipulation.
# Homepage: https://crates.io/crates/url
$failures += Invoke-RustCategory -Name '05-network' -Crates @('url') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# scraper: HTML parsing and CSS selectors.
# Homepage: https://crates.io/crates/scraper
$failures += Invoke-RustCategory -Name '05-network' -Crates @('scraper') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

if ($failures -gt 0) { exit 1 }

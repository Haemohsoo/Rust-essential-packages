# Category: 01-essential
# Usage: .\install_rust_crates_01-essential.ps1 -ProjectPath D:\rust\rust_science -DryRun
[CmdletBinding()]
param([string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional)
. (Join-Path $PSScriptRoot 'rust_install_helper.ps1')
$failures = 0
# anyhow: Flexible application error handling.
# Homepage: https://crates.io/crates/anyhow
$failures += Invoke-RustCategory -Name '01-essential' -Crates @('anyhow') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# thiserror: Derive custom error types.
# Homepage: https://crates.io/crates/thiserror
$failures += Invoke-RustCategory -Name '01-essential' -Crates @('thiserror') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# serde: Serialization and deserialization framework.
# Homepage: https://crates.io/crates/serde
$failures += Invoke-RustCategory -Name '01-essential' -Crates @('serde') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# serde_json: JSON serialization with Serde.
# Homepage: https://crates.io/crates/serde_json
$failures += Invoke-RustCategory -Name '01-essential' -Crates @('serde_json') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# clap: Command-line argument parser.
# Homepage: https://crates.io/crates/clap
$failures += Invoke-RustCategory -Name '01-essential' -Crates @('clap') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# log: Logging facade.
# Homepage: https://crates.io/crates/log
$failures += Invoke-RustCategory -Name '01-essential' -Crates @('log') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# env_logger: Environment-configured logger.
# Homepage: https://crates.io/crates/env_logger
$failures += Invoke-RustCategory -Name '01-essential' -Crates @('env_logger') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# rayon: Data-parallel iterators.
# Homepage: https://crates.io/crates/rayon
$failures += Invoke-RustCategory -Name '01-essential' -Crates @('rayon') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

if ($failures -gt 0) { exit 1 }

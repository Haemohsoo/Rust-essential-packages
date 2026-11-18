# Category: 07-cli
# Usage: .\install_rust_crates_07-cli.ps1 -ProjectPath D:\rust\rust_science -DryRun
[CmdletBinding()]
param([string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional)
. (Join-Path $PSScriptRoot 'rust_install_helper.ps1')
$failures = 0
# ripgrep: Fast recursive text search.
# Homepage: https://crates.io/crates/ripgrep
$failures += Invoke-RustCategory -Name '07-cli' -Crates @('ripgrep') -IsCli $true -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# bat: Syntax-highlighted file viewer.
# Homepage: https://crates.io/crates/bat
$failures += Invoke-RustCategory -Name '07-cli' -Crates @('bat') -IsCli $true -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# fd-find: Fast file search.
# Homepage: https://crates.io/crates/fd-find
$failures += Invoke-RustCategory -Name '07-cli' -Crates @('fd-find') -IsCli $true -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# cargo-edit: Cargo dependency management commands.
# Homepage: https://crates.io/crates/cargo-edit
$failures += Invoke-RustCategory -Name '07-cli' -Crates @('cargo-edit') -IsCli $true -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# cargo-audit: Audit dependency security advisories.
# Homepage: https://crates.io/crates/cargo-audit
$failures += Invoke-RustCategory -Name '07-cli' -Crates @('cargo-audit') -IsCli $true -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# evcxr_repl: Interactive Rust REPL.
# Homepage: https://crates.io/crates/evcxr_repl
$failures += Invoke-RustCategory -Name '07-cli' -Crates @('evcxr_repl') -IsCli $true -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# evcxr_jupyter: Rust Jupyter notebook kernel.
# Homepage: https://crates.io/crates/evcxr_jupyter
$failures += Invoke-RustCategory -Name '07-cli' -Crates @('evcxr_jupyter') -IsCli $true -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# irust: Interactive Rust REPL.
# Homepage: https://crates.io/crates/irust
$failures += Invoke-RustCategory -Name '07-cli' -Crates @('irust') -IsCli $true -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# rust-script: Run standalone Rust script files.
# Homepage: https://crates.io/crates/rust-script
$failures += Invoke-RustCategory -Name '07-cli' -Crates @('rust-script') -IsCli $true -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

if ($failures -gt 0) { exit 1 }

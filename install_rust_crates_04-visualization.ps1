# Category: 04-visualization
# Usage: .\install_rust_crates_04-visualization.ps1 -ProjectPath D:\rust\rust_science -DryRun
[CmdletBinding()]
param([string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional)
. (Join-Path $PSScriptRoot 'rust_install_helper.ps1')
$failures = 0

# plotters: Native Rust 2D charts and SVG/bitmap rendering.
# Homepage: https://crates.io/crates/plotters
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('plotters') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# plotly: Interactive 2D and 3D Plotly charts.
# Homepage: https://crates.io/crates/plotly
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('plotly') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# plotlib: Simple static charts and plots.
# Homepage: https://crates.io/crates/plotlib
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('plotlib') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# charming: Apache ECharts visualization bindings.
# Homepage: https://crates.io/crates/charming
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('charming') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# gnuplot: Plotting through the external Gnuplot program.
# Homepage: https://crates.io/crates/gnuplot
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('gnuplot') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# poloto: SVG plotting in Rust.
# Homepage: https://crates.io/crates/poloto
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('poloto') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# plotpy: Matplotlib-backed plotting from Rust; requires Python and Matplotlib.
# Homepage: https://crates.io/crates/plotpy
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('plotpy') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# matplotlib: Rust interface to Python Matplotlib; requires Python and Matplotlib.
# Homepage: https://crates.io/crates/matplotlib
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('matplotlib') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# pyo3: Rust-Python interoperability for calling Matplotlib via Python.
# Homepage: https://crates.io/crates/pyo3
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('pyo3') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional


# ggplot-rs: Grammar of Graphics plotting inspired by R ggplot2.
# Homepage: https://github.com/sipemu/ggplot-rs
$failures += Invoke-RustCategory -Name '04-visualization' -Crates @('ggplot-rs') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

if ($failures -gt 0) { exit 1 }

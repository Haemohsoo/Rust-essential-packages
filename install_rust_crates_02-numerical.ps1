# Category: 02-numerical
# Usage: .\install_rust_crates_02-numerical.ps1 -ProjectPath D:\rust\rust_science -DryRun
[CmdletBinding()]
param([string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional)
. (Join-Path $PSScriptRoot 'rust_install_helper.ps1')
$failures = 0
# ndarray: N-dimensional array operations.
# Homepage: https://crates.io/crates/ndarray
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('ndarray') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# nalgebra: Linear algebra and geometry.
# Homepage: https://crates.io/crates/nalgebra
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('nalgebra') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# faer: High-performance linear algebra.
# Homepage: https://crates.io/crates/faer
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('faer') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# num-complex: Complex number types.
# Homepage: https://crates.io/crates/num-complex
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('num-complex') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# num-traits: Generic numeric traits.
# Homepage: https://crates.io/crates/num-traits
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('num-traits') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# rustfft: Fast Fourier transform.
# Homepage: https://crates.io/crates/rustfft
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('rustfft') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# realfft: FFT for real-valued signals.
# Homepage: https://crates.io/crates/realfft
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('realfft') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# statrs: Statistics and probability distributions.
# Homepage: https://crates.io/crates/statrs
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('statrs') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# argmin: Numerical optimization algorithms.
# Homepage: https://crates.io/crates/argmin
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('argmin') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# rand: Random number generation.
# Homepage: https://crates.io/crates/rand
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('rand') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# rand_distr: Probability distributions for rand.
# Homepage: https://crates.io/crates/rand_distr
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('rand_distr') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# Native dependency note: cargo add only updates Cargo.toml; install native GSL/BLAS libraries separately.
# Choose ONE BLAS backend at build time; do not activate conflicting blas-src features.

# GSL: GNU Scientific Library Rust bindings (rgsl); requires native GSL >=2 installed and linked on Windows.
# Homepage: https://crates.io/crates/GSL
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('GSL') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# blas: Safe Rust interface to BLAS routines; requires a BLAS implementation for linking.
# Homepage: https://crates.io/crates/blas
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('blas') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# cblas: CBLAS interface for matrix and vector operations; requires native BLAS backend.
# Homepage: https://crates.io/crates/cblas
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('cblas') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# lapack: Rust bindings for LAPACK linear algebra routines; requires LAPACK backend.
# Homepage: https://crates.io/crates/lapack
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('lapack') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# blas-src: Select a BLAS backend using Cargo features; configure exactly one implementation.
# Homepage: https://crates.io/crates/blas-src
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('blas-src') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# openblas-src: OpenBLAS BLAS/LAPACK provider; on Windows requires preinstalled OpenBLAS via vcpkg and system feature.
# Homepage: https://crates.io/crates/openblas-src
$failures += Invoke-RustCategory -Name '02-numerical' -Crates @('openblas-src') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

if ($failures -gt 0) { exit 1 }

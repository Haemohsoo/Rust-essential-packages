@echo off
setlocal EnableExtensions
rem Category: 02-numerical
rem Each crate is installed/added separately; failures do not stop subsequent crates.
rem Set RUST_PROJECT to the Cargo project folder for library crates.
rem Set RUST_DRY_RUN=1 to preview; RUST_INCLUDE_OPTIONAL=1 for heavy crates.
set "FAILED=0"

rem ndarray: N-dimensional array operations.
rem Homepage: https://crates.io/crates/ndarray
call "%~dp0rust_install_helper.bat" library ndarray
if errorlevel 1 set "FAILED=1"

rem nalgebra: Linear algebra and geometry.
rem Homepage: https://crates.io/crates/nalgebra
call "%~dp0rust_install_helper.bat" library nalgebra
if errorlevel 1 set "FAILED=1"

rem faer: High-performance linear algebra.
rem Homepage: https://crates.io/crates/faer
call "%~dp0rust_install_helper.bat" library faer
if errorlevel 1 set "FAILED=1"

rem num-complex: Complex number types.
rem Homepage: https://crates.io/crates/num-complex
call "%~dp0rust_install_helper.bat" library num-complex
if errorlevel 1 set "FAILED=1"

rem num-traits: Generic numeric traits.
rem Homepage: https://crates.io/crates/num-traits
call "%~dp0rust_install_helper.bat" library num-traits
if errorlevel 1 set "FAILED=1"

rem rustfft: Fast Fourier transform.
rem Homepage: https://crates.io/crates/rustfft
call "%~dp0rust_install_helper.bat" library rustfft
if errorlevel 1 set "FAILED=1"

rem realfft: FFT for real-valued signals.
rem Homepage: https://crates.io/crates/realfft
call "%~dp0rust_install_helper.bat" library realfft
if errorlevel 1 set "FAILED=1"

rem statrs: Statistics and probability distributions.
rem Homepage: https://crates.io/crates/statrs
call "%~dp0rust_install_helper.bat" library statrs
if errorlevel 1 set "FAILED=1"

rem argmin: Numerical optimization algorithms.
rem Homepage: https://crates.io/crates/argmin
call "%~dp0rust_install_helper.bat" library argmin
if errorlevel 1 set "FAILED=1"

rem rand: Random number generation.
rem Homepage: https://crates.io/crates/rand
call "%~dp0rust_install_helper.bat" library rand
if errorlevel 1 set "FAILED=1"

rem rand_distr: Probability distributions for rand.
rem Homepage: https://crates.io/crates/rand_distr
call "%~dp0rust_install_helper.bat" library rand_distr
if errorlevel 1 set "FAILED=1"

rem Native dependency note: cargo add only updates Cargo.toml; GSL and BLAS binaries must be installed separately.
rem Choose ONE BLAS backend at build time; do not activate conflicting blas-src features.

rem GSL: GNU Scientific Library Rust bindings (rgsl); requires native GSL >=2 installed and linked on Windows.
rem Homepage: https://crates.io/crates/GSL
call "%~dp0rust_install_helper.bat" library GSL
if errorlevel 1 set "FAILED=1"

rem blas: Safe Rust interface to BLAS routines; requires a BLAS implementation for linking.
rem Homepage: https://crates.io/crates/blas
call "%~dp0rust_install_helper.bat" library blas
if errorlevel 1 set "FAILED=1"

rem cblas: CBLAS interface for matrix and vector operations; requires native BLAS backend.
rem Homepage: https://crates.io/crates/cblas
call "%~dp0rust_install_helper.bat" library cblas
if errorlevel 1 set "FAILED=1"

rem lapack: Rust bindings for LAPACK linear algebra routines; requires LAPACK backend.
rem Homepage: https://crates.io/crates/lapack
call "%~dp0rust_install_helper.bat" library lapack
if errorlevel 1 set "FAILED=1"

rem blas-src: Select a BLAS backend using Cargo features; configure exactly one implementation.
rem Homepage: https://crates.io/crates/blas-src
call "%~dp0rust_install_helper.bat" library blas-src
if errorlevel 1 set "FAILED=1"

rem openblas-src: OpenBLAS BLAS/LAPACK provider; on Windows requires preinstalled OpenBLAS via vcpkg and system feature.
rem Homepage: https://crates.io/crates/openblas-src
call "%~dp0rust_install_helper.bat" library openblas-src
if errorlevel 1 set "FAILED=1"

endlocal & exit /b %FAILED%

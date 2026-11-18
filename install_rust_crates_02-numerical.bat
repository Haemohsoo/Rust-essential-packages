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

endlocal & exit /b %FAILED%

@echo off
setlocal EnableExtensions
rem Category: 06-languages
rem Each crate is installed/added separately; failures do not stop subsequent crates.
rem Set RUST_PROJECT to the Cargo project folder for library crates.
rem Set RUST_DRY_RUN=1 to preview; RUST_INCLUDE_OPTIONAL=1 for heavy crates.
set "FAILED=0"

rem pyo3: Python and Rust interoperability.
rem Homepage: https://crates.io/crates/pyo3
call "%~dp0rust_install_helper.bat" library pyo3
if errorlevel 1 set "FAILED=1"

endlocal & exit /b %FAILED%

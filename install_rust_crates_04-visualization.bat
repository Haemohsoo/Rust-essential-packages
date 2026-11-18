@echo off
setlocal EnableExtensions
rem Category: 04-visualization
rem Each crate is installed/added separately; failures do not stop subsequent crates.
rem Set RUST_PROJECT to the Cargo project folder for library crates.
rem Set RUST_DRY_RUN=1 to preview; RUST_INCLUDE_OPTIONAL=1 for heavy crates.
set "FAILED=0"

rem plotters: Charts and publication-ready plotting.
rem Homepage: https://crates.io/crates/plotters
call "%~dp0rust_install_helper.bat" library plotters
if errorlevel 1 set "FAILED=1"

rem plotly: Interactive Plotly charts.
rem Homepage: https://crates.io/crates/plotly
call "%~dp0rust_install_helper.bat" library plotly
if errorlevel 1 set "FAILED=1"

endlocal & exit /b %FAILED%

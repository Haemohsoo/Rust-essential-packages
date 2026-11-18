@echo off
setlocal EnableExtensions
rem Category: 04-visualization
rem Each crate is added separately; failures do not stop subsequent crates.
rem Set RUST_PROJECT to the Cargo project folder.
rem Set RUST_DRY_RUN=1 to preview.
set "FAILED=0"

rem plotters: Native Rust 2D charts and SVG/bitmap rendering.
rem Homepage: https://crates.io/crates/plotters
call "%~dp0rust_install_helper.bat" library plotters
if errorlevel 1 set "FAILED=1"

rem plotly: Interactive 2D and 3D Plotly charts.
rem Homepage: https://crates.io/crates/plotly
call "%~dp0rust_install_helper.bat" library plotly
if errorlevel 1 set "FAILED=1"

rem plotlib: Simple static charts and plots.
rem Homepage: https://crates.io/crates/plotlib
call "%~dp0rust_install_helper.bat" library plotlib
if errorlevel 1 set "FAILED=1"

rem charming: Apache ECharts visualization bindings.
rem Homepage: https://crates.io/crates/charming
call "%~dp0rust_install_helper.bat" library charming
if errorlevel 1 set "FAILED=1"

rem gnuplot: Plotting through the external Gnuplot program.
rem Homepage: https://crates.io/crates/gnuplot
call "%~dp0rust_install_helper.bat" library gnuplot
if errorlevel 1 set "FAILED=1"

rem poloto: SVG plotting in Rust.
rem Homepage: https://crates.io/crates/poloto
call "%~dp0rust_install_helper.bat" library poloto
if errorlevel 1 set "FAILED=1"

rem plotpy: Matplotlib-backed plotting from Rust; requires Python and Matplotlib.
rem Homepage: https://crates.io/crates/plotpy
call "%~dp0rust_install_helper.bat" library plotpy
if errorlevel 1 set "FAILED=1"

rem matplotlib: Rust interface to Python Matplotlib; requires Python and Matplotlib.
rem Homepage: https://crates.io/crates/matplotlib
call "%~dp0rust_install_helper.bat" library matplotlib
if errorlevel 1 set "FAILED=1"

rem pyo3: Rust-Python interoperability for calling Matplotlib via Python.
rem Homepage: https://crates.io/crates/pyo3
call "%~dp0rust_install_helper.bat" library pyo3
if errorlevel 1 set "FAILED=1"


rem ggplot-rs: Grammar of Graphics plotting inspired by R ggplot2.
rem Homepage: https://github.com/sipemu/ggplot-rs
call "%~dp0rust_install_helper.bat" library ggplot-rs
if errorlevel 1 set "FAILED=1"

endlocal & exit /b %FAILED%

@echo off
setlocal EnableExtensions
rem Category: 03-data
rem Each crate is installed/added separately; failures do not stop subsequent crates.
rem Set RUST_PROJECT to the Cargo project folder for library crates.
rem Set RUST_DRY_RUN=1 to preview; RUST_INCLUDE_OPTIONAL=1 for heavy crates.
set "FAILED=0"

rem polars: DataFrame and data processing.
rem Homepage: https://crates.io/crates/polars
call "%~dp0rust_install_helper.bat" library polars
if errorlevel 1 set "FAILED=1"

rem csv: CSV reading and writing.
rem Homepage: https://crates.io/crates/csv
call "%~dp0rust_install_helper.bat" library csv
if errorlevel 1 set "FAILED=1"

rem calamine: Read Excel and OpenDocument spreadsheets.
rem Homepage: https://crates.io/crates/calamine
call "%~dp0rust_install_helper.bat" library calamine
if errorlevel 1 set "FAILED=1"

rem arrow: Apache Arrow columnar data.
rem Homepage: https://crates.io/crates/arrow
call "%~dp0rust_install_helper.bat" library arrow
if errorlevel 1 set "FAILED=1"

rem parquet: Apache Parquet data format.
rem Homepage: https://crates.io/crates/parquet
call "%~dp0rust_install_helper.bat" library parquet
if errorlevel 1 set "FAILED=1"

rem chrono: Date and time handling.
rem Homepage: https://crates.io/crates/chrono
call "%~dp0rust_install_helper.bat" library chrono
if errorlevel 1 set "FAILED=1"

endlocal & exit /b %FAILED%

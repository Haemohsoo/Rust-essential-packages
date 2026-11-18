@echo off
setlocal EnableExtensions
rem Category: 05-network
rem Each crate is installed/added separately; failures do not stop subsequent crates.
rem Set RUST_PROJECT to the Cargo project folder for library crates.
rem Set RUST_DRY_RUN=1 to preview; RUST_INCLUDE_OPTIONAL=1 for heavy crates.
set "FAILED=0"

rem reqwest: HTTP client.
rem Homepage: https://crates.io/crates/reqwest
call "%~dp0rust_install_helper.bat" library reqwest
if errorlevel 1 set "FAILED=1"

rem tokio: Asynchronous runtime.
rem Homepage: https://crates.io/crates/tokio
call "%~dp0rust_install_helper.bat" library tokio
if errorlevel 1 set "FAILED=1"

rem url: URL parsing and manipulation.
rem Homepage: https://crates.io/crates/url
call "%~dp0rust_install_helper.bat" library url
if errorlevel 1 set "FAILED=1"

rem scraper: HTML parsing and CSS selectors.
rem Homepage: https://crates.io/crates/scraper
call "%~dp0rust_install_helper.bat" library scraper
if errorlevel 1 set "FAILED=1"

endlocal & exit /b %FAILED%

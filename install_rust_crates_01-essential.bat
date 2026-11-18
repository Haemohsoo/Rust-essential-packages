@echo off
setlocal EnableExtensions
rem Category: 01-essential
rem Each crate is installed/added separately; failures do not stop subsequent crates.
rem Set RUST_PROJECT to the Cargo project folder for library crates.
rem Set RUST_DRY_RUN=1 to preview; RUST_INCLUDE_OPTIONAL=1 for heavy crates.
set "FAILED=0"

rem anyhow: Flexible application error handling.
rem Homepage: https://crates.io/crates/anyhow
call "%~dp0rust_install_helper.bat" library anyhow
if errorlevel 1 set "FAILED=1"

rem thiserror: Derive custom error types.
rem Homepage: https://crates.io/crates/thiserror
call "%~dp0rust_install_helper.bat" library thiserror
if errorlevel 1 set "FAILED=1"

rem serde: Serialization and deserialization framework.
rem Homepage: https://crates.io/crates/serde
call "%~dp0rust_install_helper.bat" library serde
if errorlevel 1 set "FAILED=1"

rem serde_json: JSON serialization with Serde.
rem Homepage: https://crates.io/crates/serde_json
call "%~dp0rust_install_helper.bat" library serde_json
if errorlevel 1 set "FAILED=1"

rem clap: Command-line argument parser.
rem Homepage: https://crates.io/crates/clap
call "%~dp0rust_install_helper.bat" library clap
if errorlevel 1 set "FAILED=1"

rem log: Logging facade.
rem Homepage: https://crates.io/crates/log
call "%~dp0rust_install_helper.bat" library log
if errorlevel 1 set "FAILED=1"

rem env_logger: Environment-configured logger.
rem Homepage: https://crates.io/crates/env_logger
call "%~dp0rust_install_helper.bat" library env_logger
if errorlevel 1 set "FAILED=1"

rem rayon: Data-parallel iterators.
rem Homepage: https://crates.io/crates/rayon
call "%~dp0rust_install_helper.bat" library rayon
if errorlevel 1 set "FAILED=1"

endlocal & exit /b %FAILED%

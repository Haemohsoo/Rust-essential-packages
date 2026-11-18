@echo off
setlocal EnableExtensions
rem Category: 07-cli
rem Each crate is installed/added separately; failures do not stop subsequent crates.
rem Set RUST_PROJECT to the Cargo project folder for library crates.
rem Set RUST_DRY_RUN=1 to preview; RUST_INCLUDE_OPTIONAL=1 for heavy crates.
set "FAILED=0"

rem ripgrep: Fast recursive text search.
rem Homepage: https://crates.io/crates/ripgrep
call "%~dp0rust_install_helper.bat" cli ripgrep
if errorlevel 1 set "FAILED=1"

rem bat: Syntax-highlighted file viewer.
rem Homepage: https://crates.io/crates/bat
call "%~dp0rust_install_helper.bat" cli bat
if errorlevel 1 set "FAILED=1"

rem fd-find: Fast file search.
rem Homepage: https://crates.io/crates/fd-find
call "%~dp0rust_install_helper.bat" cli fd-find
if errorlevel 1 set "FAILED=1"

rem cargo-edit: Cargo dependency management commands.
rem Homepage: https://crates.io/crates/cargo-edit
call "%~dp0rust_install_helper.bat" cli cargo-edit
if errorlevel 1 set "FAILED=1"

rem cargo-audit: Audit dependency security advisories.
rem Homepage: https://crates.io/crates/cargo-audit
call "%~dp0rust_install_helper.bat" cli cargo-audit
if errorlevel 1 set "FAILED=1"

rem evcxr_repl: Interactive Rust REPL.
rem Homepage: https://crates.io/crates/evcxr_repl
call "%~dp0rust_install_helper.bat" cli evcxr_repl
if errorlevel 1 set "FAILED=1"

rem evcxr_jupyter: Rust Jupyter notebook kernel.
rem Homepage: https://crates.io/crates/evcxr_jupyter
call "%~dp0rust_install_helper.bat" cli evcxr_jupyter
if errorlevel 1 set "FAILED=1"

rem irust: Interactive Rust REPL.
rem Homepage: https://crates.io/crates/irust
call "%~dp0rust_install_helper.bat" cli irust
if errorlevel 1 set "FAILED=1"

rem rust-script: Run standalone Rust script files.
rem Homepage: https://crates.io/crates/rust-script
call "%~dp0rust_install_helper.bat" cli rust-script
if errorlevel 1 set "FAILED=1"

endlocal & exit /b %FAILED%

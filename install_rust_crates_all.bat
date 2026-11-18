@echo off
setlocal EnableExtensions
rem Usage: install_rust_crates_all.bat [project_path] [--dry-run] [--upgrade] [--include-optional] [--include-cli]
set "RUST_PROJECT=%CD%\rust_science"
set "RUST_DRY_RUN=0"
set "RUST_UPGRADE=0"
set "RUST_INCLUDE_OPTIONAL=0"
set "INCLUDE_CLI=0"
set "PROJECT_SET=0"
:parse
if "%~1"=="" goto run
if /I "%~1"=="--dry-run" (set "RUST_DRY_RUN=1"&shift&goto parse)
if /I "%~1"=="--upgrade" (set "RUST_UPGRADE=1"&shift&goto parse)
if /I "%~1"=="--include-optional" (set "RUST_INCLUDE_OPTIONAL=1"&shift&goto parse)
if /I "%~1"=="--include-cli" (set "INCLUDE_CLI=1"&shift&goto parse)
if "%PROJECT_SET%"=="0" (set "RUST_PROJECT=%~1"&set "PROJECT_SET=1"&shift&goto parse)
echo [ERROR] Unknown argument: %~1
exit /b 2
:run
set "FAILED=0"
call "%~dp0install_rust_crates_01-essential.bat"
if errorlevel 1 set "FAILED=1"
call "%~dp0install_rust_crates_02-numerical.bat"
if errorlevel 1 set "FAILED=1"
call "%~dp0install_rust_crates_03-data.bat"
if errorlevel 1 set "FAILED=1"
call "%~dp0install_rust_crates_04-visualization.bat"
if errorlevel 1 set "FAILED=1"
call "%~dp0install_rust_crates_05-network.bat"
if errorlevel 1 set "FAILED=1"
call "%~dp0install_rust_crates_06-languages.bat"
if errorlevel 1 set "FAILED=1"
if "%INCLUDE_CLI%"=="1" (
 call "%~dp0install_rust_crates_07-cli.bat"
 if errorlevel 1 set "FAILED=1"
)
if "%FAILED%"=="1" (endlocal&exit /b 1)
endlocal&exit /b 0

@echo off
rem Shared batch helper; called by category scripts.
rem Usage: call rust_install_helper.bat category crate1 crate2 ...
setlocal EnableExtensions EnableDelayedExpansion
set "CATEGORY=%~1"
shift
set "PROJECT=%RUST_PROJECT%"
if not defined PROJECT set "PROJECT=%CD%\rust_science"
set "OK=0"
set "FAIL=0"
set "SKIP=0"
set "PLAN=0"
where cargo >nul 2>&1
if errorlevel 1 (echo [ERROR] Cargo not found. Install Rust from https://rustup.rs/&endlocal&exit /b 1)
if /I not "%CATEGORY%"=="cli" (
 for %%I in ("!PROJECT!") do set "PROJECT=%%~fI"
 set "MANIFEST=!PROJECT!\Cargo.toml"
 if not exist "!MANIFEST!" (
  echo ^> cargo new --bin --vcs none "!PROJECT!"
  if "!RUST_DRY_RUN!"=="1" (set /a PLAN+=1) else (
   cargo new --bin --vcs none "!PROJECT!"
   if errorlevel 1 (echo [ERROR] Project creation failed&endlocal&exit /b 1)
  )
 )
)
echo.
echo === %CATEGORY% ===
:loop
if "%~1"=="" goto done
set "CRATE=%~1"
set "OPTIONAL=0"
for %%O in (polars arrow parquet pyo3 faer) do if /I "!CRATE!"=="%%O" set "OPTIONAL=1"
if "!OPTIONAL!"=="1" if not "!RUST_INCLUDE_OPTIONAL!"=="1" (
 echo [OPTIONAL SKIP] !CRATE!
 set /a SKIP+=1
) else (call :install)
if "!OPTIONAL!"=="0" call :install
shift
goto loop
:install
if /I "%CATEGORY%"=="cli" (
 echo ^> cargo install !CRATE! --locked
 if "!RUST_DRY_RUN!"=="1" (set /a PLAN+=1&exit /b 0)
 if "!RUST_UPGRADE!"=="1" (cargo install "!CRATE!" --locked --force) else (cargo install "!CRATE!" --locked)
) else (
 echo ^> cargo add !CRATE! --manifest-path "!MANIFEST!"
 if "!RUST_DRY_RUN!"=="1" (set /a PLAN+=1&exit /b 0)
 cargo add "!CRATE!" --manifest-path "!MANIFEST!"
)
if errorlevel 1 (echo [FAILED] !CRATE!&set /a FAIL+=1) else (set /a OK+=1)
exit /b 0
:done
echo Summary: successful=!OK! planned=!PLAN! skipped=!SKIP! failed=!FAIL!
if !FAIL! GTR 0 (endlocal&exit /b 1)
endlocal&exit /b 0

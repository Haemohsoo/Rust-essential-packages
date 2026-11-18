@echo off
setlocal EnableExtensions
rem Category: 06-languages
rem Each crate is added separately; failures do not stop subsequent crates.
rem Requires a Cargo project; native runtimes/SDKs may be needed at build time.
set "FAILED=0"

rem libc: C types and low-level system interfaces.
rem Homepage: https://crates.io/crates/libc
call "%~dp0rust_install_helper.bat" library libc
if errorlevel 1 set "FAILED=1"

rem bindgen: Generate Rust FFI bindings from C/C++ headers.
rem Homepage: https://crates.io/crates/bindgen
call "%~dp0rust_install_helper.bat" library bindgen
if errorlevel 1 set "FAILED=1"

rem libloading: Load shared libraries and DLLs at runtime.
rem Homepage: https://crates.io/crates/libloading
call "%~dp0rust_install_helper.bat" library libloading
if errorlevel 1 set "FAILED=1"

rem cxx: Safe Rust/C++ interoperability.
rem Homepage: https://crates.io/crates/cxx
call "%~dp0rust_install_helper.bat" library cxx
if errorlevel 1 set "FAILED=1"

rem autocxx: Generate Rust bindings for C++ APIs.
rem Homepage: https://crates.io/crates/autocxx
call "%~dp0rust_install_helper.bat" library autocxx
if errorlevel 1 set "FAILED=1"

rem cc: Compile C/C++ source in Cargo build scripts.
rem Homepage: https://crates.io/crates/cc
call "%~dp0rust_install_helper.bat" library cc
if errorlevel 1 set "FAILED=1"

rem pyo3: Embed Python or expose Rust functions to Python.
rem Homepage: https://crates.io/crates/pyo3
call "%~dp0rust_install_helper.bat" library pyo3
if errorlevel 1 set "FAILED=1"

rem numpy: Exchange NumPy arrays with Rust through PyO3.
rem Homepage: https://crates.io/crates/numpy
call "%~dp0rust_install_helper.bat" library numpy
if errorlevel 1 set "FAILED=1"

rem extendr-api: High-level interoperability between Rust and R.
rem Homepage: https://crates.io/crates/extendr-api
call "%~dp0rust_install_helper.bat" library extendr-api
if errorlevel 1 set "FAILED=1"

rem extendr-ffi: Low-level R foreign-function interface.
rem Homepage: https://crates.io/crates/extendr-ffi
call "%~dp0rust_install_helper.bat" library extendr-ffi
if errorlevel 1 set "FAILED=1"

rem magnus: Ruby extensions and embedding Ruby from Rust.
rem Homepage: https://crates.io/crates/magnus
call "%~dp0rust_install_helper.bat" library magnus
if errorlevel 1 set "FAILED=1"

rem rb-sys: Low-level Ruby C API bindings.
rem Homepage: https://crates.io/crates/rb-sys
call "%~dp0rust_install_helper.bat" library rb-sys
if errorlevel 1 set "FAILED=1"

rem matlab-sys: Low-level MATLAB C API bindings.
rem Homepage: https://crates.io/crates/matlab-sys
call "%~dp0rust_install_helper.bat" library matlab-sys
if errorlevel 1 set "FAILED=1"

rem rustmex: Build MATLAB MEX extensions in Rust.
rem Homepage: https://crates.io/crates/rustmex
call "%~dp0rust_install_helper.bat" library rustmex
if errorlevel 1 set "FAILED=1"

rem matlas: MATLAB-related Rust integration utilities.
rem Homepage: https://crates.io/crates/matlas
call "%~dp0rust_install_helper.bat" library matlas
if errorlevel 1 set "FAILED=1"

rem jlrs: Julia runtime interoperability and data exchange.
rem Homepage: https://crates.io/crates/jlrs
call "%~dp0rust_install_helper.bat" library jlrs
if errorlevel 1 set "FAILED=1"

rem jni: Java Native Interface bindings.
rem Homepage: https://crates.io/crates/jni
call "%~dp0rust_install_helper.bat" library jni
if errorlevel 1 set "FAILED=1"

rem j4rs: Call Java code from Rust.
rem Homepage: https://crates.io/crates/j4rs
call "%~dp0rust_install_helper.bat" library j4rs
if errorlevel 1 set "FAILED=1"

rem netcorehost: Host the .NET runtime from Rust.
rem Homepage: https://crates.io/crates/netcorehost
call "%~dp0rust_install_helper.bat" library netcorehost
if errorlevel 1 set "FAILED=1"

endlocal & exit /b %FAILED%

# Category: 06-languages
# Each crate is added separately; native runtimes/SDKs may be needed at build time.
[CmdletBinding()]
param([string]$ProjectPath=(Join-Path (Get-Location).Path 'rust_science'),[switch]$DryRun,[switch]$Upgrade,[switch]$IncludeOptional)
. (Join-Path $PSScriptRoot 'rust_install_helper.ps1')
$failures = 0

# libc: C types and low-level system interfaces.
# Homepage: https://crates.io/crates/libc
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('libc') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# bindgen: Generate Rust FFI bindings from C/C++ headers.
# Homepage: https://crates.io/crates/bindgen
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('bindgen') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# libloading: Load shared libraries and DLLs at runtime.
# Homepage: https://crates.io/crates/libloading
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('libloading') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# cxx: Safe Rust/C++ interoperability.
# Homepage: https://crates.io/crates/cxx
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('cxx') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# autocxx: Generate Rust bindings for C++ APIs.
# Homepage: https://crates.io/crates/autocxx
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('autocxx') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# cc: Compile C/C++ source in Cargo build scripts.
# Homepage: https://crates.io/crates/cc
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('cc') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# pyo3: Embed Python or expose Rust functions to Python.
# Homepage: https://crates.io/crates/pyo3
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('pyo3') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# numpy: Exchange NumPy arrays with Rust through PyO3.
# Homepage: https://crates.io/crates/numpy
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('numpy') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# extendr-api: High-level interoperability between Rust and R.
# Homepage: https://crates.io/crates/extendr-api
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('extendr-api') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# extendr-ffi: Low-level R foreign-function interface.
# Homepage: https://crates.io/crates/extendr-ffi
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('extendr-ffi') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# magnus: Ruby extensions and embedding Ruby from Rust.
# Homepage: https://crates.io/crates/magnus
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('magnus') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# rb-sys: Low-level Ruby C API bindings.
# Homepage: https://crates.io/crates/rb-sys
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('rb-sys') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# matlab-sys: Low-level MATLAB C API bindings.
# Homepage: https://crates.io/crates/matlab-sys
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('matlab-sys') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# rustmex: Build MATLAB MEX extensions in Rust.
# Homepage: https://crates.io/crates/rustmex
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('rustmex') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# matlas: MATLAB-related Rust integration utilities.
# Homepage: https://crates.io/crates/matlas
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('matlas') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# jlrs: Julia runtime interoperability and data exchange.
# Homepage: https://crates.io/crates/jlrs
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('jlrs') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# jni: Java Native Interface bindings.
# Homepage: https://crates.io/crates/jni
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('jni') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# j4rs: Call Java code from Rust.
# Homepage: https://crates.io/crates/j4rs
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('j4rs') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

# netcorehost: Host the .NET runtime from Rust.
# Homepage: https://crates.io/crates/netcorehost
$failures += Invoke-RustCategory -Name '06-languages' -Crates @('netcorehost') -IsCli $false -ProjectPath $ProjectPath -DryRun:$DryRun -Upgrade:$Upgrade -IncludeOptional:$IncludeOptional

if ($failures -gt 0) { exit 1 }

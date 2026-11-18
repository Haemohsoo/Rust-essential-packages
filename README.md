# Rust crate installer

Rust libraries belong to a Cargo **project**. This script creates a project if needed and runs `cargo add` for library crates. CLI programs are installed separately with `cargo install`.

## Requirements
- Windows PowerShell 5.1 or PowerShell 7+
- Rust/Cargo installed via https://rustup.rs/
- Network connection and a working Rust compiler/toolchain
- `cargo add` supported by modern Cargo versions

## Examples
```powershell
# Preview without changing files
.\install_rust_crates.ps1 -Category all -ProjectPath D:\rust\rust_science -DryRun

# Install library dependencies into the project
.\install_rust_crates.ps1 -Category all -ProjectPath D:\rust\rust_science

# Include heavier / native-dependency crates
.\install_rust_crates.ps1 -Category all -ProjectPath D:\rust\rust_science -IncludeOptional

# Install command-line tools globally (not Rust libraries)
.\install_rust_crates.ps1 -Category cli

# Force reinstall CLI tools to get current releases
.\install_rust_crates.ps1 -Category cli -Upgrade
```

`all` covers essential, numerical, data, visualization, network, and languages; it deliberately excludes CLI tools. Optional heavy crates are skipped unless `-IncludeOptional` is provided. `-Upgrade` affects only CLI tools; for project dependencies use `cargo update` within the project to update the lockfile subject to manifest constraints. Installing a crate as a dependency does not necessarily compile it immediately; run `cargo check` or `cargo build` afterward. Some crates need feature flags, system libraries, or additional code to be useful.

A failure for an individual crate is reported and installation proceeds with the next crate. The script returns exit code 1 if any crate failed.

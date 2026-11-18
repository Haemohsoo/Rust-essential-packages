Rust crate installers, split by category

Each category has matching .bat and .ps1 files. Keep the helper files in the same directory.

Batch:
  install_rust_crates_all.bat D:\rust\rust_science --dry-run
  install_rust_crates_all.bat D:\rust\rust_science --include-optional --include-cli
  set RUST_PROJECT=D:\rust\rust_science
  install_rust_crates_02-numerical.bat
  install_rust_crates_07-cli.bat

PowerShell:
  .\install_rust_crates_all.ps1 -ProjectPath D:\rust\rust_science -DryRun
  .\install_rust_crates_all.ps1 -ProjectPath D:\rust\rust_science -IncludeOptional -IncludeCli
  .\install_rust_crates_02-numerical.ps1 -ProjectPath D:\rust\rust_science
  .\install_rust_crates_07-cli.ps1

Notes:
- Libraries are added to Cargo.toml using cargo add, not installed globally.
- CLI tools are installed globally using cargo install --locked.
- Heavy crates (polars, arrow, parquet, pyo3, faer) are optional.
- All-category runners exclude CLI by default.
- Batch category scripts use RUST_PROJECT and RUST_DRY_RUN=1 environment variables.
- After installing evcxr_jupyter, run evcxr_jupyter --install separately.
- Scripts are not tested on Windows.

Updated: each crate now has its own call/invocation and two comments:
- Description of the crate
- Homepage (crates.io package page)
Errors for one crate do not prevent attempting the next crate.
The all-category runners call each category; optional crates remain skipped by default.

Numerical additions: GSL, blas, cblas, lapack, blas-src, openblas-src.
Native GSL and BLAS libraries are not installed by cargo add. For Windows OpenBLAS see https://docs.rs/openblas-src/latest/openblas_src/ and use vcpkg + system feature.

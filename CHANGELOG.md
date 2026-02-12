## 0.0.1-beta.62 - 2026-02-12
### Improved
 - Fix main menu loop

## 0.0.1-beta.61 - 2026-02-12
### Improved
 - Retry mechanism for failed backups.

## 0.0.1-beta.60 - 2026-02-12
### Improved
 - Improved error handling and user feedback during installation failures
 - Menu navigation to confirm configuration values before starting installation

## 0.0.1-beta.59 - 2026-02-05
### Improved
 - Smart download retry: skip re-downloading if zip already exists and only extraction failed
 - Backup/rollback: create backup before update and restore on failure
 - File lock handling: detect locked files, show locking process, offer to terminate and retry
 - Local copy: now copies both service and installer folders (was only copying service)
### Fixed
 - Local copy detection: use Directory.Exists instead of File.Exists
 - Prevent copying over running installer when running from installation folder

## 0.0.1-beta.58 - 2026-02-04
### Fixed
 - Copy of the files when retrying installation

## 0.0.1-beta.57 - 2026-02-04
### Added
 - Broker configuration will work only with existing brokers
### Fixed
 - Fix how passwords are maneged in configuration classes. Encrypting them when saving and decrypting when loading.

## 0.0.1-beta.56 - 2026-02-04
### Added
 - Display installer version and installed version on welcome screen
### Fixed
 - Fix installed version not updating after returning to main menu from successful installation

## 0.0.1-beta.55 - 2026-02-04
### Added
 - Option to create desktop shortcuts after successful installation (Edge Connector Setup and Workflow Studio)

## 0.0.1-beta.54 - 2026-02-04
### Fix
 - Fix HTTPs support

## 0.0.1-beta.53 - 2026-02-03
### Fix
 - Fix startup problem

## 0.0.1-beta.52 - 2026-02-03
### Added
 - Restart Service menu item
 - Open logs
### Fix
 - Menu navigation
 - Uninstall option in the main menu

## 0.0.1-beta.51 - 2026-02-03
### Fix
 - Better menu navigation after the installation is complete
 - Uninstall option in the main menu

## 0.0.1-beta.50 - 2026-02-02
### Fix
 - Fix download and execution of latest installer version

## 0.0.1-beta.49 - 2026-02-02
### Added
 - Splits server and user databases files

## 0.0.1-beta.47 - 2026-01-30
### Added
- Fix branding of WorkflowServer and WorkflowStudio
- Copying files from installer directory instead of downloading it.

## 0.0.1-beta.45 - 2026-01-30
### Fixed
- Fix Elsa SQLite database path resolution when running as Windows service (resolves "no such table: Roles" error)

## 0.0.1-beta.44 - 2026-01-30
### Improved
- Optimize installer extraction by extracting directly to destination instead of temp folder

## 0.0.1-beta.43 - 2026-01-30
### Fixed
- Exit installer immediately on Ctrl+C instead of waiting indefinitely

## 0.0.1-beta.42 - 2026-01-30
### Fixed
- Add spinner to URL health checks in installer to improve UX feedback

## 0.0.1-beta.41 - 2026-01-30
### Adds
- Firewall configuration
- HTTPS configuration

## 0.0.1-beta.40 - 2026-01-27
### Fixed
- Adds dotnet workload install wasm-tools to pipeline

## 0.0.1-beta.37 - 2026-01-27
### Fixed
- Adds --runtime parameter to azure-pipeline.yaml

## 0.0.1-beta.36 - 2026-01-27
### Fixed
- Fixes for build pipeline

## 0.0.1-beta.35 - 2026-01-27
### Fixed
- Manage ElsaServer Users

## 0.0.1-beta.33 - 2026-01-27
### Fixed
- Fix format in ShowUrls method.

## 0.0.1-beta.32 - 2026-01-27
### Fixed
- Using existing configuration params as default for updates

## 0.0.1-beta.31 - 2026-01-27
### Fixed
- Fix build intermitent fail

## 0.0.1-beta.30 - 2026-01-27
### Fixed
- Improve UX of EdgeConnector Installer in multiple places

## 0.0.1-beta.29 - 2026-01-27
### Fixed
- Improve UX of EdgeConnector Installer in multiple places

## 0.0.1-beta.28 - 2026-01-27
### Fixed
- Improve UX of EdgeConnector Installer

## 0.0.1-beta.27 - 2026-01-23
### Fixed
- Fix validation if installer is latest version

## 0.0.1-beta.26 - 2026-01-23
### Fixed
- Download and execute latest installer version

## 0.0.1-beta.25 - 2026-01-23
### Fixed
- Fixes for EdgeConnector Installer

## 0.0.1-beta.24 - 2026-01-22
### Fixed
- adds target: master

## 0.0.1-beta.23 - 2026-01-22
### Fixed
- fix build in release mode

## 0.0.1-beta.22 - 2026-01-22
### Fixed
- tagSource userSpecifiedTag in github release task

## 0.0.1-beta.21 - 2026-01-22
### Fixed
- removes target parameter from github release task

## 0.0.1-beta.20 - 2026-01-21
### Fixed
- should not create a new branch in the releases repo

## 0.0.1-beta.19 - 2026-01-21
### Fixed
- using PAT to interact with github repo.

## 0.0.1-beta.18 - 2026-01-21
### Fixed
- push changelog to GitHub Releases repository

## 0.0.1-beta.17 - 2026-01-21
### Fixed
- changes tagSource argument to use GitHub Releases

## 0.0.1-beta.16 - 2026-01-21
### Fixed
- Split release for beta and stable versions

## 0.0.1-beta.15 - 2026-01-21
### Fixed
- Fix makeLatest argument flag

## 0.0.1-beta.13 - 2026-01-21
### Fixed
- Fix GitHub repo name

## 0.0.1-beta.12 - 2026-01-21
### Fixed
- Not using github release changelog extraction

## 0.0.1-beta.11 - 2026-01-21
### Fixed
- Using single file publish only for the installer

## 0.0.1-beta.9 - 2026-01-21
### Fixed
- Github Releases

## 0.0.1-beta.8 - 2026-01-21
### Fixed
- Single file publish output

## 0.0.1-beta.7 - 2026-01-21
### Fixed
- GitHub Releases

## 0.0.1-beta.6 - 2026-01-21
### Fixed
- Versioning format in change log file

## 0.0.1-beta.1 - 2026-01-21
### Added
- Elsa workflow integration first release
- Using Github Releases for deployment artifacts

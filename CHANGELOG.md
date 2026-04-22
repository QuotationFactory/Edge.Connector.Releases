## 0.2.0-beta.1 - 2026-04-22
### Changed
    - Bumping version

## 0.1.0-beta.10 - 2026-04-22
### Changed
    - Backup process

## 0.1.0-beta.9 - 2026-04-21
### Added
    - Serilog file logging for the installer — all console output is mirrored to `logs/installer-{date}.log`.
    - Progress messages throughout the update process so users can follow each step (asset lookup, version check, disk space, backup, download, extraction).
    - "Connecting to download server..." spinner with 30-second connection timeout to prevent silent freezes.
    - Log messages before download and extraction steps with version, asset, and path details.
### Changed
    - Download connection phase now shows a visible spinner instead of appearing frozen.
    - Connection timeout reduced from 5 minutes to 30 seconds for the initial server contact; clear error on timeout.

## 0.1.0-beta.8 - 2026-04-21
### Added
    - "Open Workflow Studio in browser" menu option.

## 0.1.0-beta.7 - 2026-04-21
### Changed
    - Reduced service stop settle time from 30s to 10s.
    - Fixed helper text color consistency in configuration prompts.

## 0.1.0-beta.6 - 2026-04-21
### Added
    - PowerShell one-liner install script (`install.ps1`) for quick setup from terminal.
    - New "Edit features and settings" menu option to reconfigure without reinstalling.
### Changed
    - Installed version now refreshes after install in the main menu.
    - Declining uninstall or download now returns to main menu instead of exiting.
    - Service is stopped before port configuration during installation.

## 0.1.0-beta.5 - 2026-04-21
### Changed
    - Installed version now refreshes after install in the main menu.
    - Declining uninstall or download now returns to main menu instead of exiting.
    - Service is stopped before port configuration during installation.
### Added
    - New "Edit features and settings" menu option to reconfigure without reinstalling.

## 0.1.0-beta.4 - 2026-04-21
### Changed
    - Split single release ZIP into separate Service and Installer ZIPs. Installer downloads only the service ZIP for install/update; self-bootstrap downloads only the installer ZIP.

## 0.1.0-beta.3 - 2026-04-20
### Changed
    - Restructured installation layout: service files now live directly in the EdgeConnector folder, with installer and data as sibling folders under the base directory.

## 0.1.0-beta.2 - 2026-04-20
### Added
    - New Workflow Studio.
    - Installer improvements

## 0.1.0-beta.1 - 2026-04-13
### Added
    - New Workflow Studio.

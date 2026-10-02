# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- TEMPLATE: `hemtt publish` looks up the entry whose heading exactly
matches the current project version (see .hemtt/project.toml's
[version] / addons/main/script_version.hpp) -- so before publishing,
rename "[Unreleased]" below to "[X.Y.Z] - YYYY-MM-DD" matching that
version, and start a fresh empty [Unreleased] section above it. -->

## [Unreleased]

### Added

- The ACE self-interaction menu now covers everything the chat commands do: saving under a name or with every marker, loading a chosen phase on a chosen channel or locally, unloading a chosen phase, and deleting a phase.
- Singleplayer support: with the access mode set to ACE interaction or both, phases can be saved in singleplayer.

### Fixed

- The access mode setting, the ACE interaction entries and the "chat commands are disabled" message are now translated instead of always being shown in English.

## [1.0.1] - 2026-10-01

Hotfix for the 1.0.0 release.

### Fixed

- Include `img/icon_ca.paa` in the release build, so the mod icon is no longer missing in the launcher and main menu.

### Changed

- Changed the mod accent colour (`dlcColor`) to amber `#E8A33D`.

## [1.0.0] - 2026-10-01

First stable release. Save the map markers you place as named phases in your profile and load them again later on the same map.

### Added

- Chat commands `#savemarkers`, `#loadmarkers`, `#unloadmarkers`, `#listmarkers` and `#deletemarkers`.
- ACE self-interaction menu and a CBA setting to choose the access mode (chat commands, ACE interaction or both).
- Loading a phase into a chosen marker channel, or locally only.

### Changed

- Renamed the GitHub repository from `markersave` to `phaseline`.

## [0.1.0] - 2026-10-01

### Added

- Initial release: save, load, unload, list and delete map marker phases via chat commands, extracted from the TTT mod's markersave component.

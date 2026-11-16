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

## [1.1.0] - 2026-10-02

The ACE menu now does everything the chat commands do, Phase Line works in singleplayer, and other players' markers can be saved.

### Added

* Phase Line - Add everything the chat commands do to the ACE self-interaction menu: saving under a name or with every marker, loading a chosen phase on a chosen channel or locally, unloading a chosen phase, and deleting a phase (#4) by Andx667
* Phase Line - Add singleplayer support: with the access mode set to ACE interaction or both, phases can be saved in singleplayer (#5) by Andx667
* Phase Line - Add saving other players' markers: `#savemarkers --other` saves the markers placed by other players, and the ACE menu lists each other player under "Save markers" to save that player's markers as a phase named after them. The CBA setting "Show other players in the save menu" (on by default) hides that list (#6) by Andx667

### Changed

* Phase Line - Change `--all` to be recognised only by `#savemarkers`. The other commands used to ignore it; they now treat it as part of the phase name (#6) by Andx667

### Fixed

* Phase Line - Fix the access mode not being changeable on a dedicated server, which made the ACE menu unavailable there. It is now a per-player setting (#7) by Andx667
* Phase Line - Fix the access mode setting, the ACE interaction entries and the "chat commands are disabled" message always being shown in English (#3) by Andx667

## [1.0.1] - 2026-10-01

Hotfix for the 1.0.0 release.

### Fixed

* Phase Line - Fix the missing mod icon in the launcher and main menu by including `img/icon_ca.paa` in the release build (#1) by Andx667

### Changed

* Phase Line - Change the mod accent colour (`dlcColor`) to amber `#E8A33D` by Andx667

## [1.0.0] - 2026-10-01

First stable release. Save the map markers you place as named phases in your profile and load them again later on the same map.

### Added

* Phase Line - Add the chat commands `#savemarkers`, `#loadmarkers`, `#unloadmarkers`, `#listmarkers` and `#deletemarkers` by Andx667
* Phase Line - Add the ACE self-interaction menu and a CBA setting to choose the access mode (chat commands, ACE interaction or both) by Andx667
* Phase Line - Add loading a phase into a chosen marker channel, or locally only by Andx667

### Changed

* Repo - Change the GitHub repository name from `markersave` to `phaseline` by Andx667

## [0.1.0] - 2026-10-01

### Added

* Phase Line - Add saving, loading, unloading, listing and deleting map marker phases via chat commands, extracted from the TTT mod's markersave component by Andx667

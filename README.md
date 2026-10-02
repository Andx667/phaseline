# Phase Line

_Your plan, ready when you are._

<p align="center">
    <img src="https://github.com/Andx667/phaseline/blob/main/img/logo.png" alt="Phase Line Logo">
</p>

<p align="center">
    <a href="https://github.com/Andx667/phaseline/issues">
        <img src="https://img.shields.io/github/issues-raw/Andx667/phaseline.svg?style=flat-square&label=Issues" alt="Phase Line Issues">
    </a>
    <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=3811355264">
        <img src="https://img.shields.io/steam/downloads/3811355264.svg?style=flat-square&label=Downloads" alt="Phase Line Downloads">
    </a>
    <a href="https://github.com/Andx667/phaseline/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-MIT-blue?style=flat-square" alt="Phase Line License">
    </a>
    <br>
    <img src="https://img.shields.io/github/actions/workflow/status/Andx667/phaseline/check.yml?style=flat-square&label=Check" alt="Check">
    <img src="https://img.shields.io/github/actions/workflow/status/Andx667/phaseline/validate.yml?style=flat-square&label=Validate" alt="Validate">
</p>

__Requires__ [CBA_A3](https://github.com/CBATeam/CBA_A3) and [ACE3](https://github.com/acemod/ACE3).

__Phase Line__ (PL) saves the map markers you place as named "phases" in your own profile and loads them again later on the same map. Plan in the local multiplayer preview (Eden), then bring the plan onto the map phase by phase in the real multiplayer.

__Client-side only__: no server installation required, other players do not need the mod. Servers that verify signatures must allow its key.

The project is entirely __open-source__ and any contributions are welcome.

Steam Workshop: <https://steamcommunity.com/sharedfiles/filedetails/?id=3811355264>  
Discord: <https://discord.gg/ag4v6kxYAa>

## Features

The system can be accessed through several modes. The default is chat commands, but you can switch the access mode from the CBA settings menu to ACE interaction or both. Both offer the same features.

- `#savemarkers [name]` saves your markers (including drawn lines) as a new phase. By default only markers that are not yet in any phase are saved, so you can draw phase 1, save, draw phase 2, save. `--all` saves every marker. An existing name is overwritten.
- `#savemarkers [name] --other` saves the markers placed by other players instead of your own.
- `#loadmarkers [phase] [channel]` recreates a phase on the current map. Without arguments the next phase that isn't on the map yet is loaded. `channel` is `global`, `side`, `command`, `group`, `vehicle` or `direct` (default: side); `local` shows the markers only to you.
- `#unloadmarkers [phase]` removes the markers of a loaded phase again.
- `#listmarkers` lists the saved phases of the current map.
- `#deletemarkers <phase>` deletes a saved phase from your profile.

The ACE self-interaction menu "Phase Line" has the same functions:

- __Save markers__ saves the new markers under the next free default name. Its sub-menu lists every other player who placed markers; selecting one saves that player's markers as a phase named after the player. "All other players" saves them together. The CBA setting "Show other players in the save menu" hides this sub-menu. __Save markers as...__ opens a dialog for the name and for saving every marker; that option is preselected when all your markers are already in a phase.
- __Load markers__ loads the next phase. Its sub-menu lists the phases that are not loaded yet; selecting one loads it on the default channel, its own sub-menu picks the channel or "Local only".
- __Unload markers__ removes the most recently loaded phase, its sub-menu lists every loaded phase.
- __List markers__ lists the saved phases of the current map.
- __Delete phase__ lists the saved phases, each with a "Confirm" entry that deletes it.

Saving works in any multiplayer session, including the local multiplayer preview. Singleplayer has no chat, so there Phase Line works once the access mode is set to ACE interaction or both. A phase saved from other players' markers loads like any other: the markers are recreated as your own on the channel you choose, so check the channel before sharing markers that were not placed on it. Only markers your client received can be saved, not those on channels you are not part of.

Phases are stored per player in the Arma profile and per map. At most 500 markers fit in one phase.

## Contributing

For new contributors, see the [Contributing Setup & Guidelines](./.github/CONTRIBUTING.md).

## License

Phase Line is licensed under [MIT](./LICENSE).

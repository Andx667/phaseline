# Phase Line

_Your plan, ready when you are._

<p align="center">
    <img src="https://github.com/Andx667/markersave/blob/main/img/icon.png" alt="Phase Line Logo">
</p>

<p align="center">
    <a href="https://github.com/Andx667/markersave/issues">
        <img src="https://img.shields.io/github/issues-raw/Andx667/markersave.svg?style=flat-square&label=Issues" alt="Phase Line Issues">
    </a>
    <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=0">
        <img src="https://img.shields.io/steam/downloads/0.svg?style=flat-square&label=Downloads" alt="Phase Line Downloads">
    </a>
    <a href="https://github.com/Andx667/markersave/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-MIT-blue?style=flat-square" alt="Phase Line License">
    </a>
    <br>
    <img src="https://img.shields.io/github/actions/workflow/status/Andx667/markersave/check.yml?style=flat-square&label=Check" alt="Check">
    <img src="https://img.shields.io/github/actions/workflow/status/Andx667/markersave/validate.yml?style=flat-square&label=Validate" alt="Validate">
</p>

__Requires__ [CBA_A3](https://github.com/CBATeam/CBA_A3) and [ACE3](https://github.com/acemod/ACE3).

__Phase Line__ (PL) saves the map markers you place as named "phases" in your own profile and loads them again later on the same map. Plan in the local multiplayer preview (Eden), then bring the plan onto the map phase by phase in the real multiplayer.

The project is entirely __open-source__ and any contributions are welcome.

Steam Workshop: <https://steamcommunity.com/sharedfiles/filedetails/?id=0>
Discord: <https://discord.gg/ag4v6kxYAa>

## Features

The system can be accessed through several modes. The default is chat commands, but you can switch the access mode from the CBA settings menu to ACE interaction or both. The ACE self-interaction menu "Phase Line" offers save, load, unload and list with default settings (no names, channels or deleting; use the chat commands for those).

- `#savemarkers [name]` saves your markers (including drawn lines) as a new phase. By default only markers that are not yet in any phase are saved, so you can draw phase 1, save, draw phase 2, save. `--all` saves every marker. An existing name is overwritten.
- `#loadmarkers [phase] [channel]` recreates a phase on the current map. Without arguments the next phase that isn't on the map yet is loaded. `channel` is `global`, `side`, `command`, `group`, `vehicle` or `direct` (default: side); `local` shows the markers only to you.
- `#unloadmarkers [phase]` removes the markers of a loaded phase again.
- `#listmarkers` lists the saved phases of the current map.
- `#deletemarkers <phase>` deletes a saved phase from your profile.

Saving works in any multiplayer session, including the local multiplayer preview. Phases are stored per player in the Arma profile and per map. At most 500 markers fit in one phase.

## Contributing

For new contributors, see the [Contributing Setup & Guidelines](./.github/CONTRIBUTING.md).

## License

Phase Line is licensed under [MIT](./LICENSE).

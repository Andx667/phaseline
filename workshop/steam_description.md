# Phase Line

_Your plan, ready when you are._

**Phase Line** (PL) saves the map markers you place as named "phases" in your own profile and loads them again later on the same map. Plan in the local multiplayer preview (Eden), then bring the plan onto the map phase by phase in the real multiplayer.

**Client-side only**: no server installation required, other players do not need the mod. Servers that verify signatures must allow its key.

# Requirements

- [CBA_A3](https://github.com/CBATeam/CBA_A3)
- [ACE3](https://github.com/acemod/ACE3)

# Features

The system can be accessed through several modes. The default is chat commands, but you can switch the access mode from the CBA settings menu to ACE interaction or both. The ACE self-interaction menu "Phase Line" offers the same features: saving under a name, loading a chosen phase on a chosen channel, unloading, listing and deleting.

- **#savemarkers [name]** saves your markers (including drawn lines) as a new phase. By default only markers that are not yet in any phase are saved, so you can draw phase 1, save, draw phase 2, save. Adding **--all** saves every marker. An existing name is overwritten.
- **#loadmarkers [phase] [channel]** recreates a phase on the current map. Without arguments the next phase that isn't on the map yet is loaded. The channel is one of global, side, command, group, vehicle or direct (default: side); with local the markers are shown only to you.
- **#unloadmarkers [phase]** removes the markers of a loaded phase again.
- **#listmarkers** lists the saved phases of the current map.
- **#deletemarkers** followed by a phase name deletes that saved phase from your profile.

Saving works in any multiplayer session, including the local multiplayer preview. Phases are stored per player in the Arma profile and per map. At most 500 markers fit in one phase.

# Source & Issues

Fully open-source. Bug reports, feature requests, and contributions are all welcome.

[GitHub Repository](https://github.com/Andx667/phaseline)
[Report an Issue](https://github.com/Andx667/phaseline/issues)
[Discord](https://discord.gg/ag4v6kxYAa)

Licensed under [MIT](https://github.com/Andx667/phaseline/blob/main/LICENSE).

---

Suchst du eine deutschsprachige Arma3 und Reforger Community? -> https://tacticalteam.de/mitmachen

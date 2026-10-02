#include "..\script_component.hpp"
/*
 * Author: Andx
 * Saves the map markers placed by other players as a phase.
 * The phase is loaded like any other, the markers then belong to the loading player.
 *
 * Arguments:
 * 0: Phase name, defaults to the player's name if a player ID is given, otherwise to "Phase N" <STRING> (default: "")
 * 1: Only save markers not yet saved or loaded this session <BOOL> (default: true)
 * 2: Player ID (see getPlayerID) of the player whose markers are saved, empty for all other players <STRING> (default: "")
 *
 * Return Value:
 * Phase was saved <BOOL>
 *
 * Example:
 * [] call pl_phaseline_fnc_saveOtherMarkers
 * ["", false, "5"] call pl_phaseline_fnc_saveOtherMarkers
 *
 * Public: Yes
 */

params [
    ["_name", "", [""]],
    ["_onlyNew", true, [true]],
    ["_owner", "", [""]]
];

private _markersByOwner = call FUNC(getOtherMarkers);

private _markers = if (_owner isEqualTo "") then {
    flatten (values _markersByOwner)
} else {
    _markersByOwner getOrDefault [_owner, []]
};

if (_owner isNotEqualTo "" && {(trim _name) isEqualTo ""}) then {
    _name = [_owner] call FUNC(getPlayerName);
};

[_name, _onlyNew, _markers] call FUNC(savePhase) // return

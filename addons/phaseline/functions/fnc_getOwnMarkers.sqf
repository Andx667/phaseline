#include "..\script_component.hpp"
/*
 * Author: Andx
 * Returns the map markers placed by the local player.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Marker names <ARRAY>
 *
 * Example:
 * [] call pl_phaseline_fnc_getOwnMarkers
 *
 * Public: No
 */

// Auf einem Server sind auch die Marker anderer Spieler sichtbar, deshalb nur die eigene Spieler-ID.
// Im Einzelspieler gehören alle gesetzten Marker dem Spieler.
private _prefix = if (isMultiplayer) then {
    format ["%1%2/", USER_MARKER_PREFIX, getPlayerID player]
} else {
    USER_MARKER_PREFIX
};

allMapMarkers select {(_x select [0, count _prefix]) isEqualTo _prefix} // return

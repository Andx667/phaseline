#include "..\script_component.hpp"
/*
 * Author: Andx
 * Returns the user placed map markers of the other players, grouped by the player who placed them.
 * Only markers the local client knows about are found, so none on channels it is not part of.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Player ID (see getPlayerID) to array of marker names <HASHMAP>
 *
 * Example:
 * [] call pl_phaseline_fnc_getOtherMarkers
 *
 * Public: No
 */

private _result = createHashMap;

// Im Einzelspieler gehören alle gesetzten Marker dem Spieler
if (!isMultiplayer) exitWith {_result};

private _ownId = getPlayerID player;
private _prefixLength = count USER_MARKER_PREFIX;

{
    if ((_x select [0, _prefixLength]) isEqualTo USER_MARKER_PREFIX) then {
        // Name im Format der Engine: _USER_DEFINED #<Spieler-ID>/<Marker-ID>/<Kanal>
        private _owner = ((_x select [_prefixLength]) splitString "/") param [0, ""];

        if (_owner isNotEqualTo "" && {_owner isNotEqualTo _ownId}) then {
            (_result getOrDefault [_owner, [], true]) pushBack _x;
        };
    };
} forEach allMapMarkers;

_result // return

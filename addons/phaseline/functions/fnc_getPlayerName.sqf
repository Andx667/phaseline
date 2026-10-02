#include "..\script_component.hpp"
/*
 * Author: Andx
 * Returns the name of the player with the given player ID.
 *
 * Arguments:
 * 0: Player ID, see getPlayerID <STRING>
 *
 * Return Value:
 * Player name, a placeholder with the ID if the player is no longer connected <STRING>
 *
 * Example:
 * ["2"] call pl_phaseline_fnc_getPlayerName
 *
 * Public: No
 */

params [["_id", "", [""]]];

private _players = allPlayers;
private _index = _players findIf {getPlayerID _x isEqualTo _id};

// Die ID gilt nur für eine Verbindung, Marker bleiben nach dem Verlassen des Spielers aber liegen
if (_index == -1) exitWith {
    format [LLSTRING(unknownPlayer), _id]
};

[_players select _index] call ace_common_fnc_getName // return

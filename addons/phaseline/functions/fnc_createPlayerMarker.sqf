#include "..\script_component.hpp"
/*
 * Author: veteran29, Andx
 * Creates a player owned map marker locally, named like a marker placed by hand.
 * Based on ttt_common_fnc_createPlayerMarker.
 *
 * Arguments:
 * 0: Marker position <ARRAY, OBJECT>
 * 1: Channel to create the marker on, see Channel IDs <STRING, NUMBER> (default: 1)
 * 2: Player owning the marker <OBJECT> (default: player)
 *
 * Return Value:
 * Marker ID, empty string if could not create <STRING>
 *
 * Example:
 * [player, "global"] call pl_phaseline_fnc_createPlayerMarker
 *
 * Public: No
 */

#define CHANNEL_MIN 0
#define CHANNEL_MAX 5

params [
    ["_position", [0, 0, 0], [[], objNull]],
    ["_channel", 1, [0, ""]],
    ["_player", player, [objNull]]
];

if (_channel isEqualType "") then {
    _channel = CHANNEL_NAMES find _channel;
};

if (_channel < CHANNEL_MIN || {_channel > CHANNEL_MAX}) exitWith {
    ERROR_1("Invalid channel given! - %1",_channel);

    "" // return
};

private _id = format ["%1_%2", QUOTE(PREFIX), GVAR(playerMarkerIdx)];
GVAR(playerMarkerIdx) = GVAR(playerMarkerIdx) + 1;

// Der Name im Format der Engine, damit der Spieler den Marker selbst löschen kann
private _markerId = format ["_USER_DEFINED #%1/%2/%3", getPlayerID _player, _id, _channel];

createMarkerLocal [_markerId, _position, _channel, _player] // return

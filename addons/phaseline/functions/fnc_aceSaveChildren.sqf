#include "..\script_component.hpp"
/*
 * Author: Andx
 * Creates the ACE interaction entries for saving the markers of other players.
 * There is one entry for each other player with markers on the map and one for all of them.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Actions, each as [action, children, target] <ARRAY>
 *
 * Example:
 * [player] call pl_phaseline_fnc_aceSaveChildren
 *
 * Public: No
 */

params ["_target"];

// Die Einstellung blendet nur diese Einträge aus, #savemarkers --other geht immer
if !(missionNamespace getVariable [QGVAR(saveOthers), true]) exitWith {[]};

private _markersByOwner = call FUNC(getOtherMarkers);

if (count _markersByOwner == 0) exitWith {[]};

private _actions = [];

{
    // Die Phase heißt wie der Spieler und wird überschrieben, deshalb immer alle seine Marker statt nur der neuen
    private _action = [
        format [QGVAR(save_%1), _x],
        format ["%1 (%2)", [_x] call FUNC(getPlayerName), count _y],
        "",
        {
            params ["", "", "_args"];

            _args call FUNC(saveOtherMarkers);
        },
        {true},
        {},
        ["", false, _x]
    ] call ace_interact_menu_fnc_createAction;

    _actions pushBack [_action, [], _target];
} forEach _markersByOwner;

// Wie #savemarkers --other
private _allAction = [
    QGVAR(save_others),
    LLSTRING(actionSaveOthers),
    "",
    {[] call FUNC(saveOtherMarkers);},
    {true}
] call ace_interact_menu_fnc_createAction;

_actions pushBack [_allAction, [], _target];

_actions // return

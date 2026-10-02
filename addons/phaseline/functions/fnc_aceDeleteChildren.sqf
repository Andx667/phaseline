#include "..\script_component.hpp"
/*
 * Author: Andx
 * Creates the ACE interaction entries for deleting a saved phase.
 * The phase entry itself does nothing, deleting needs the "Confirm" child.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Actions, each as [action, children, target] <ARRAY>
 *
 * Example:
 * [player] call pl_phaseline_fnc_aceDeleteChildren
 *
 * Public: No
 */

params ["_target"];

private _actions = [];

{
    // Das Menü löst beim Loslassen der Taste aus, ein Eintrag direkt auf der Phase wäre zu leicht versehentlich getroffen
    private _confirmAction = [
        format [QGVAR(delete_%1_confirm), _forEachIndex],
        LLSTRING(confirmDelete),
        "",
        {
            params ["", "", "_args"];

            _args call FUNC(deletePhase);
        },
        {true},
        {},
        [_x]
    ] call ace_interact_menu_fnc_createAction;

    private _action = [format [QGVAR(delete_%1), _forEachIndex], _x, "", {}, {true}] call ace_interact_menu_fnc_createAction;

    _actions pushBack [_action, [[_confirmAction, []]], _target];
} forEach (call FUNC(getPhaseNames));

_actions // return

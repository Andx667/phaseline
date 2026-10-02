#include "..\script_component.hpp"
/*
 * Author: Andx
 * Creates the ACE interaction entries for unloading a specific loaded phase.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Actions, each as [action, children, target] <ARRAY>
 *
 * Example:
 * [player] call pl_phaseline_fnc_aceUnloadChildren
 *
 * Public: No
 */

params ["_target"];

private _actions = [];

{
    _x params ["", "", "_name"];

    private _action = [
        format [QGVAR(unload_%1), _forEachIndex],
        _name,
        "",
        {
            params ["", "", "_args"];

            _args call FUNC(unloadPhase);
        },
        {true},
        {},
        [_name]
    ] call ace_interact_menu_fnc_createAction;

    _actions pushBack [_action, [], _target];
} forEach GVAR(loadedPhases);

_actions // return

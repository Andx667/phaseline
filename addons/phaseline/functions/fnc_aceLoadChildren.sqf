#include "..\script_component.hpp"
/*
 * Author: Andx
 * Creates the ACE interaction entries for loading a specific phase.
 * Each phase that is not loaded yet gets an entry, with one child per channel and one for local markers.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Actions, each as [action, children, target] <ARRAY>
 *
 * Example:
 * [player] call pl_phaseline_fnc_aceLoadChildren
 *
 * Public: No
 */

params ["_target"];

// Reihenfolge entspricht den Kanal-IDs
private _channelLabels = [
    LLSTRING(channelGlobal),
    LLSTRING(channelSide),
    LLSTRING(channelCommand),
    LLSTRING(channelGroup),
    LLSTRING(channelVehicle),
    LLSTRING(channelDirect)
];

private _actions = [];

{
    private _name = _x;
    private _phaseIndex = _forEachIndex;

    if (([_name] call FUNC(getLoadedIndex)) == -1) then {
        private _children = [];

        {
            private _channelAction = [
                format [QGVAR(load_%1_%2), _phaseIndex, _forEachIndex],
                _x,
                "",
                {
                    params ["", "", "_args"];

                    _args call FUNC(loadPhase);
                },
                {
                    params ["", "", "_args"];

                    // select 2 = mapMarkers (ab 2.20)
                    (channelEnabled (_args select 1)) select 2
                },
                {},
                [_name, _forEachIndex]
            ] call ace_interact_menu_fnc_createAction;

            _children pushBack [_channelAction, []];
        } forEach _channelLabels;

        private _localAction = [
            format [QGVAR(load_%1_local), _phaseIndex],
            LLSTRING(channelLocal),
            "",
            {
                params ["", "", "_args"];

                _args call FUNC(loadPhase);
            },
            {true},
            {},
            [_name, -1, true]
        ] call ace_interact_menu_fnc_createAction;

        _children pushBack [_localAction, []];

        // Ohne Kanalwahl gilt der Standardkanal, wie bei #loadmarkers <phase>
        private _action = [
            format [QGVAR(load_%1), _phaseIndex],
            _name,
            "",
            {
                params ["", "", "_args"];

                _args call FUNC(loadPhase);
            },
            {true},
            {},
            [_name]
        ] call ace_interact_menu_fnc_createAction;

        _actions pushBack [_action, _children, _target];
    };
} forEach (call FUNC(getPhaseNames));

_actions // return

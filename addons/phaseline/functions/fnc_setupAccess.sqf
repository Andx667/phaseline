#include "..\script_component.hpp"

if !(hasInterface) exitWith {};

// Erst nach dem postInit, vorher gibt es weder den Spieler noch die CBA-/ACE-Funktionen
if !(missionNamespace getVariable [QGVAR(accessReady), false]) exitWith {};

private _mode = missionNamespace getVariable [QGVAR(accessMode), ACCESS_MODE_CHAT];

if !(isNil QGVAR(aceUnitEH)) then {
    ["unit", GVAR(aceUnitEH)] call CBA_fnc_removePlayerEventHandler;
    GVAR(aceUnitEH) = nil;
};

if !(isNil QGVAR(aceActionUnit)) then {
    [GVAR(aceActionUnit)] call FUNC(removeAceActions);

    GVAR(aceActionUnit) = nil;
};

if !(_mode in [ACCESS_MODE_ACE, ACCESS_MODE_ALL]) exitWith {};
if !(isClass (configFile >> "CfgPatches" >> "ace_interact_menu")) exitWith {};

// Aktionen hängen am Objekt, deshalb bei jedem Einheitenwechsel (Respawn, Teamswitch) neu setzen
GVAR(aceUnitEH) = ["unit", {
    params ["_unit", "_oldUnit"];

    [_oldUnit] call FUNC(removeAceActions);

    GVAR(aceActionUnit) = _unit;

    if (isNull _unit) exitWith {};

    private _menuAction = [QGVAR(accessMenu), QUOTE(COMPONENT_BEAUTIFIED), "", {true}, {true}] call ace_interact_menu_fnc_createAction;
    [_unit, 1, ["ACE_SelfActions"], _menuAction] call ace_interact_menu_fnc_addActionToObject;

    {
        _x params ["_id", "_name", "_code", ["_condition", {true}], ["_children", {}]];

        private _action = [_id, _name, "", _code, _condition, _children] call ace_interact_menu_fnc_createAction;
        [_unit, 1, ["ACE_SelfActions", QGVAR(accessMenu)], _action] call ace_interact_menu_fnc_addActionToObject;
    } forEach [
        [QGVAR(saveAction), LLSTRING(actionSave), {[] call FUNC(savePhase);}, {true}, FUNC(aceSaveChildren)],
        // Erst im nächsten Frame, das Interaktionsmenü schließt sich noch
        [QGVAR(saveAsAction), LLSTRING(actionSaveAs), {[{createDialog QGVAR(saveDialog)}] call CBA_fnc_execNextFrame;}],
        [QGVAR(loadAction), LLSTRING(actionLoad), {[] call FUNC(loadPhase);}, {true}, FUNC(aceLoadChildren)],
        [QGVAR(unloadAction), LLSTRING(actionUnload), {[] call FUNC(unloadPhase);}, {true}, FUNC(aceUnloadChildren)],
        [QGVAR(listAction), LLSTRING(actionList), {[] call FUNC(listPhases);}],
        [QGVAR(deleteAction), LLSTRING(actionDelete), {}, {(call FUNC(getPhaseNames)) isNotEqualTo []}, FUNC(aceDeleteChildren)]
    ];
}, true] call CBA_fnc_addPlayerEventHandler;

true

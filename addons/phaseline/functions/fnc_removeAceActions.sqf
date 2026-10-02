#include "..\script_component.hpp"
/*
 * Author: Andx
 * Removes the ACE self-interaction menu of this addon from a unit.
 * Children are removed first, ACE does not clean them up with the parent.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call pl_phaseline_fnc_removeAceActions
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {};

{
    [_unit, 1, ["ACE_SelfActions", QGVAR(accessMenu), _x]] call ace_interact_menu_fnc_removeActionFromObject;
} forEach [QGVAR(saveAction), QGVAR(saveAsAction), QGVAR(loadAction), QGVAR(unloadAction), QGVAR(listAction), QGVAR(deleteAction)];

[_unit, 1, ["ACE_SelfActions", QGVAR(accessMenu)]] call ace_interact_menu_fnc_removeActionFromObject;

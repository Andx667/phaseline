#include "..\script_component.hpp"
/*
 * Author: Andx
 * Saves a phase with the name entered in the save dialog, if the dialog was confirmed.
 *
 * Arguments:
 * 0: Save dialog <DISPLAY>
 * 1: Exit code <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display, 1] call pl_phaseline_fnc_onSaveDialogUnload
 *
 * Public: No
 */

params ["_display", "_exitCode"];

if (_exitCode != EXIT_CODE_OK) exitWith {};

private _name = ctrlText (_display displayCtrl IDC_SAVE_NAME);
private _all = cbChecked (_display displayCtrl IDC_SAVE_ALL);

[_name, !_all] call FUNC(savePhase);

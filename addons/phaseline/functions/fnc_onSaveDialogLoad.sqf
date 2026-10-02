#include "..\script_component.hpp"
/*
 * Author: Andx
 * Prepares the save dialog: preselects saving every marker if there are no new ones and focuses the name.
 *
 * Arguments:
 * 0: Save dialog <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display] call pl_phaseline_fnc_onSaveDialogLoad
 *
 * Public: No
 */

params ["_display"];

// Ohne neue Marker gäbe es nichts zu speichern, ein zweiter Name für dieselben Marker braucht dann alle
private _hasNew = (call FUNC(getOwnMarkers)) findIf {!(_x in GVAR(savedMarkers))} != -1;

(_display displayCtrl IDC_SAVE_ALL) cbSetChecked !_hasNew;

ctrlSetFocus (_display displayCtrl IDC_SAVE_NAME);

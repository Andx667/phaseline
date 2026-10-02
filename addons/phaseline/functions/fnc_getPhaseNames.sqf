#include "..\script_component.hpp"
/*
 * Author: Andx
 * Returns the names of the saved marker phases of the current map.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Phase names in saved order <ARRAY>
 *
 * Example:
 * [] call pl_phaseline_fnc_getPhaseNames
 *
 * Public: No
 */

// Das ACE-Menü fragt die Namen laufend ab, deshalb ohne die Kopie aller Marker aus fnc_getPhases
private _data = profileNamespace getVariable [PHASES_VAR, []];

if (_data isEqualTo [] || {(_data select 0) isNotEqualTo PHASE_FORMAT_VERSION}) exitWith {[]};

(_data select 1) apply {_x select 0} // return

#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Marker die schon in einer Phase gespeichert oder aus einer geladen wurden
GVAR(savedMarkers) = createHashMap;
// [phaseKey, markerNames, phaseName], in Ladereihenfolge
GVAR(loadedPhases) = [];
// Laufender Index für die Marker-IDs aus fnc_createPlayerMarker
GVAR(playerMarkerIdx) = 0;

[
    QGVAR(accessMode),
    "LIST",
    [LSTRING(accessMode), LSTRING(accessModeDesc)],
    [QUOTE(COMPONENT_BEAUTIFIED), LSTRING(accessCategory)],
    [[ACCESS_MODE_CHAT, ACCESS_MODE_ACE, ACCESS_MODE_ALL], [LSTRING(accessModeChat), LSTRING(accessModeAce), LSTRING(accessModeAll)]],
    ACCESS_MODE_CHAT,
    {
        params ["_value"];

        GVAR(accessMode) = _value;

        if (hasInterface) then {
            [] call FUNC(setupAccess);
        };
    }
] call CBA_fnc_addSetting;

ADDON = true;

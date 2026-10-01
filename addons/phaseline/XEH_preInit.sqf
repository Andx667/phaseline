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
    ["Access mode", "Choose how to access Phase Line."],
    [QUOTE(COMPONENT_BEAUTIFIED), "Access"],
    [[ACCESS_MODE_CHAT, ACCESS_MODE_ACE, ACCESS_MODE_ALL], ["Chat commands", "ACE interaction", "Both"]],
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

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
    [[ACCESS_MODE_CHAT, ACCESS_MODE_ACE, ACCESS_MODE_ALL], [LSTRING(accessModeChat), LSTRING(accessModeAce), LSTRING(accessModeAll)], 0],
    // Client-Einstellung: Der Mod läuft nur beim Spieler, ein Server ohne den Mod kann sie nicht vorgeben
    false,
    {
        params ["_value"];

        GVAR(accessMode) = _value;

        if (hasInterface) then {
            [] call FUNC(setupAccess);
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(saveOthers),
    "CHECKBOX",
    [LSTRING(saveOthers), LSTRING(saveOthersDesc)],
    [QUOTE(COMPONENT_BEAUTIFIED), LSTRING(savingCategory)],
    true
] call CBA_fnc_addSetting;

ADDON = true;

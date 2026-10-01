#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Marker die schon in einer Phase gespeichert oder aus einer geladen wurden
GVAR(savedMarkers) = createHashMap;
// [phaseKey, markerNames, phaseName], in Ladereihenfolge
GVAR(loadedPhases) = [];
// Laufender Index für die Marker-IDs aus fnc_createPlayerMarker
GVAR(playerMarkerIdx) = 0;

ADDON = true;

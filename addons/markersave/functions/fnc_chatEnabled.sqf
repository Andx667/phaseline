#include "..\script_component.hpp"

private _mode = missionNamespace getVariable [QGVAR(accessMode), ACCESS_MODE_CHAT];

if (_mode in [ACCESS_MODE_CHAT, ACCESS_MODE_ALL]) exitWith {true};

systemChat "Marker Phases: Chat commands are disabled in the CBA settings.";

false

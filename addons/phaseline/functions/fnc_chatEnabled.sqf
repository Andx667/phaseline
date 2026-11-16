#include "..\script_component.hpp"

private _mode = missionNamespace getVariable [QGVAR(accessMode), ACCESS_MODE_CHAT];

if (_mode in [ACCESS_MODE_CHAT, ACCESS_MODE_ALL]) exitWith {true};

[LLSTRING(chatDisabled)] call ace_common_fnc_displayTextStructured;

false

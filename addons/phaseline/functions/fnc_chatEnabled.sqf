#include "..\script_component.hpp"
/*
 * Author: Andx
 * Checks whether the chat commands are enabled by the access mode setting.
 * Tells the player if they are not.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Chat commands are enabled <BOOL>
 *
 * Example:
 * call pl_phaseline_fnc_chatEnabled
 *
 * Public: No
 */

private _mode = missionNamespace getVariable [QGVAR(accessMode), ACCESS_MODE_CHAT];

if (_mode in [ACCESS_MODE_CHAT, ACCESS_MODE_ALL]) exitWith {true};

[LLSTRING(chatDisabled)] call ace_common_fnc_displayTextStructured;

false

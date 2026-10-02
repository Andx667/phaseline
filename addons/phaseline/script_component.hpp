#define COMPONENT phaseline
#define COMPONENT_BEAUTIFIED Phase Line

#include "\z\pl\addons\main\script_mod.hpp"
#include "\z\pl\addons\main\script_macros.hpp"

// Layout der gespeicherten Daten, bei inkompatiblen Änderungen erhöhen
#define PHASE_FORMAT_VERSION 1
#define PHASES_VAR format ['%1_%2', QGVAR(phases), toLower worldName]

#define USER_MARKER_PREFIX "_USER_DEFINED #"
#define MAX_MARKERS_PER_PHASE 500
#define MARKERS_PER_FRAME 10

#define CHANNEL_NAMES ["global", "side", "command", "group", "vehicle", "direct"]
#define DEFAULT_CHANNEL 1

#define ACCESS_MODE_ACE 0
#define ACCESS_MODE_CHAT 1
#define ACCESS_MODE_ALL 2

#define IDC_SAVE_NAME 1400
#define IDC_SAVE_ALL 2800
// Exit-Code eines Displays, das über den OK-Button (idc 1) geschlossen wurde
#define EXIT_CODE_OK 1

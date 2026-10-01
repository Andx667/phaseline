#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        author = AUTHOR;
        url = "https://github.com/Andx667/markersave";
        authors[] = {"Andx"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"pl_main", "cba_main", "ace_common"};
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

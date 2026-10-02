// Zentriertes 40x25-Raster, wie GUI_GRID_CENTER aus defineCommonGrids.inc
#define GRID_W_ABS ((safeZoneW / safeZoneH) min 1.2)
#define GRID_H_ABS (GRID_W_ABS / 1.2)
#define POS_W(N) ((N) * (GRID_W_ABS / 40))
#define POS_H(N) ((N) * (GRID_H_ABS / 25))
#define POS_X(N) (POS_W(N) + (safeZoneX + (safeZoneW - GRID_W_ABS) / 2))
#define POS_Y(N) (POS_H(N) + (safeZoneY + (safeZoneH - GRID_H_ABS) / 2))

class RscText;
class RscEdit;
class RscCheckBox;
class RscButtonMenuOK;
class RscButtonMenuCancel;

class GVAR(saveDialog) {
    idd = -1;
    movingEnable = 0;
    onLoad = QUOTE(ctrlSetFocus ((_this select 0) displayCtrl IDC_SAVE_NAME));
    onUnload = QUOTE(_this call FUNC(onSaveDialogUnload));

    class controlsBackground {
        class Title: RscText {
            idc = -1;
            text = CSTRING(saveDialogTitle);
            colorBackground[] = {
                "(profileNamespace getVariable ['GUI_BCG_RGB_R',0.13])",
                "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.54])",
                "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.21])",
                "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"
            };
            x = QUOTE(POS_X(10));
            y = QUOTE(POS_Y(9));
            w = QUOTE(POS_W(20));
            h = QUOTE(POS_H(1));
        };

        class Background: RscText {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.7};
            x = QUOTE(POS_X(10));
            y = QUOTE(POS_Y(10.1));
            w = QUOTE(POS_W(20));
            h = QUOTE(POS_H(3.3));
        };
    };

    class controls {
        class NameLabel: RscText {
            idc = -1;
            text = CSTRING(saveDialogName);
            tooltip = CSTRING(saveDialogNameTooltip);
            x = QUOTE(POS_X(10.5));
            y = QUOTE(POS_Y(10.6));
            w = QUOTE(POS_W(5));
            h = QUOTE(POS_H(1));
        };

        class NameEdit: RscEdit {
            idc = IDC_SAVE_NAME;
            tooltip = CSTRING(saveDialogNameTooltip);
            x = QUOTE(POS_X(15.5));
            y = QUOTE(POS_Y(10.6));
            w = QUOTE(POS_W(14));
            h = QUOTE(POS_H(1));
        };

        class AllCheckbox: RscCheckBox {
            idc = IDC_SAVE_ALL;
            x = QUOTE(POS_X(10.5));
            y = QUOTE(POS_Y(12));
            w = QUOTE(POS_W(1));
            h = QUOTE(POS_H(1));
        };

        class AllLabel: RscText {
            idc = -1;
            text = CSTRING(saveDialogAll);
            x = QUOTE(POS_X(11.5));
            y = QUOTE(POS_Y(12));
            w = QUOTE(POS_W(18));
            h = QUOTE(POS_H(1));
        };

        class ButtonCancel: RscButtonMenuCancel {
            x = QUOTE(POS_X(10));
            y = QUOTE(POS_Y(13.5));
            w = QUOTE(POS_W(6.25));
            h = QUOTE(POS_H(1));
        };

        class ButtonOK: RscButtonMenuOK {
            x = QUOTE(POS_X(23.75));
            y = QUOTE(POS_Y(13.5));
            w = QUOTE(POS_W(6.25));
            h = QUOTE(POS_H(1));
        };
    };
};

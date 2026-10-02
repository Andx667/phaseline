# Marker-Phasen

Speichert die vom Spieler gesetzten Kartenmarker als benannte "Phasen" im eigenen Profil (`profileNamespace`) und lädt sie später auf derselben Karte wieder. Gedacht, um in der lokalen Multiplayer-Vorschau (Eden) eine Planung vorzubereiten und sie im echten Multiplayer Phase für Phase auf die Karte zu bringen. Gespeichert werden kann in jedem Multiplayer, also auch auf einem Server, und im Einzelspieler über das ACE-Menü. Die Bedienung ist über CBA-Einstellungen konfigurierbar und unterstützt ACE-Interaktion, Chat-Befehle (`#savemarkers`, `#loadmarkers`, `#unloadmarkers`, `#listmarkers`, `#deletemarkers`). Die Bedienung ist in der [README](../../README.md) beschrieben.

## Abhängigkeiten

- CBA - Chat-Befehle (CBA_fnc_registerChatCommand), Per-Frame-Handler und die Makros.
- ACE - `ace_common_fnc_displayTextStructured` für die Rückmeldungen.

Die Marker erzeugt `fnc_createPlayerMarker` (ursprünglich aus `ttt_common`) mit dem richtigen _USER_DEFINED-Namen, sodass der Spieler sie wie selbst gesetzte Marker wieder löschen kann.

## Speicherformat

Pro Karte eine Profilvariable `pl_phaseline_phases_<toLower worldName>` mit dem Inhalt `[PHASE_FORMAT_VERSION, phasen]`. Jede Phase ist `[name, systemTime, records]`, jeder Record `[shape, type, color, size, brush, dir, text, alpha, pos, polyline]`. Es sind bewusst verschachtelte Arrays statt einer HashMap, damit das Profil-Format keine Fragen offen lässt. Bei einer inkompatiblen Änderung muss `PHASE_FORMAT_VERSION` erhöht werden - `fnc_getPhases` liefert für unbekannte Versionen eine leere Liste.

Gespeichert werden nur Marker, deren Name mit `_USER_DEFINED #<Spieler-ID>/` beginnt (also vom Spieler gesetzt, inklusive gezeichneter Linien als `POLYLINE`). Missions- und Editormarker bleiben außen vor. `saveProfileNamespace` wird nach jeder Änderung aufgerufen, damit nichts bei einem Absturz verloren geht.

## Speichern

`fnc_savePhase` ist im Multiplayer immer erlaubt (`isMultiplayer`), die Eden-Vorschau zählt dazu. Im Einzelspieler gibt es keinen Chat für die Befehle, deshalb speichert die Funktion dort nur, wenn die Zugriffsart das ACE-Menü einschließt. Weil auf einem Server auch die Marker anderer Spieler in `allMapMarkers` stehen, wird im Multiplayer nur nach dem Präfix `_USER_DEFINED #<getPlayerID player>/` gefiltert (Format aus `fnc_createPlayerMarker`). Im Einzelspieler gehören alle `_USER_DEFINED`-Marker dem Spieler, dort reicht `_USER_DEFINED #`.

Die Rückmeldungen erscheinen als ACE-Hint (`ace_common_fnc_displayTextStructured`), weil der Chat mit Clear HUD ausgeblendet ist. Mehrzeilige Ausgaben (`#listmarkers`, Ladeergebnis) gehen als ein einziger Hint raus, da jeder neue Hint den vorherigen ersetzt.

Nach jedem erfolgreichen Speichern legt `fnc_addDiaryRecord` einen Tagebucheintrag im Thema "Marker-Phasen" an (Phasenname, Markeranzahl, Uhrzeit). Das Thema gehört zur Einheit des Spielers und wird bei Bedarf neu erzeugt (`diarySubjectExists`), auch nach einem Respawn. Der Eintrag ist nur ein Protokoll der laufenden Sitzung, die Daten selbst liegen im Profil.

Standardmäßig werden nur Marker gespeichert, die in dieser Sitzung noch in keiner Phase waren (`GVAR(savedMarkers)`, ein Set der Markernamen). Das macht den Phasenablauf aus: Phase 1 zeichnen, speichern, Phase 2 zeichnen, speichern - ohne dass Phase 1 doppelt landet. Auch aus einer Phase geladene Marker werden dort eingetragen. `--all` ignoriert das Set. Ein gleichnamiger Eintrag wird überschrieben, mehr als `MAX_MARKERS_PER_PHASE` Marker werden abgelehnt, statt still abzuschneiden.

## Marker anderer Spieler

Mit der CBA-Einstellung `pl_phaseline_saveOthers` speichert `fnc_saveOtherMarkers` auch Marker, die andere Spieler gesetzt haben. `fnc_getOtherMarkers` gruppiert dafür alle `_USER_DEFINED`-Marker nach der Spieler-ID aus dem Markernamen und lässt die eigenen weg. Gefunden wird nur, was der eigene Client kennt, also keine Marker aus Kanälen, in denen der Spieler nicht ist.

`#savemarkers --other` speichert die Marker aller anderen Spieler zusammen, mit den üblichen Regeln für Name und `--all`. Das ACE-Menü zeigt unter "Marker speichern" einen Eintrag pro Spieler. Dessen Phase heißt wie der Spieler (`fnc_getPlayerName`, über `allPlayers` und `getPlayerID`) und enthält immer alle seine Marker statt nur der neuen, weil ein erneutes Speichern die Phase gleichen Namens überschreibt. Hat der Spieler den Server verlassen, gibt es zu seiner ID keinen Namen mehr, die Phase heißt dann "Unbekannter Spieler (ID)". Das gilt auch für eigene Marker von vor einem Reconnect, da die ID pro Verbindung vergeben wird.

Die Phase ist eine ganz normale: Beim Laden gehören die Marker dem ladenden Spieler und landen auf dem gewählten Kanal, der ursprüngliche Kanal wird nicht gespeichert.

## Laden

Die Marker werden lokal angelegt (`createMarkerLocal` über `fnc_createPlayerMarker`), alle Eigenschaften lokal gesetzt und zuletzt mit `setMarkerAlpha` einmal global gesendet. Das ist der Weg, den auch Tagging2Map nutzt, und laut Arma-Wiki der empfohlene, um den Marker nur einmal komplett über das Netzwerk zu schicken. Lokale Marker (`local`) überspringen den globalen Befehl und bleiben beim Spieler. Im Einzelspieler lädt `fnc_loadPhase` immer lokal, die Kanalprüfung entfällt.

Pro Frame werden `MARKERS_PER_FRAME` Marker erzeugt (CBA-PFH), damit große Phasen keinen Netzwerk-Schub auslösen. Entlädt der Spieler die Phase währenddessen, beendet der PFH sich selbst.

Der Kanal kommt aus dem Befehl oder ist `DEFAULT_CHANNEL`. Ohne expliziten Kanal wird auf den ersten Kanal ausgewichen, der Marker erlaubt (`channelEnabled` Index 2, ab Arma 2.20). Gezeichnete Linien werden übersprungen, wenn der Kanal Zeichnen verbietet (Index 3).

## ACE-Menü

`fnc_setupAccess` hängt das Menü "Phase Line" an die Einheit des Spielers. Die Einträge mit festem Inhalt (Speichern, Speichern unter, Auflisten) sind normale Aktionen, die Listen der Phasen entstehen über `insertChildren` (`fnc_aceLoadChildren`, `fnc_aceUnloadChildren`, `fnc_aceDeleteChildren`). ACE baut den Baum höchstens einmal pro Sekunde neu, solange das Menü offen ist. Deshalb liest `fnc_getPhaseNames` nur die Namen aus dem Profil, ohne die Marker zu kopieren.

Unter "Laden" hat jede noch nicht geladene Phase einen Eintrag pro Kanal, der Marker erlaubt, und "Nur lokal". Der Eintrag der Phase selbst lädt auf dem Standardkanal. Unter "Löschen" löst erst der Untereintrag "Bestätigen" aus, weil das Menü beim Loslassen der Taste den Eintrag unter dem Cursor ausführt.

"Speichern unter" öffnet den Dialog `pl_phaseline_saveDialog` (`ui/saveDialog.hpp`) mit Namensfeld und der Checkbox für `--all`. Gespeichert wird im `onUnload` (`fnc_onSaveDialogUnload`), wenn der Dialog über OK geschlossen wurde.

## Maintainer

- Andx

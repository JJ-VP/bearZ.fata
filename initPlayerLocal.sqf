/*
 * initPlayerLocal.sqf
 * Author: JJ
 *
 * Args:
 * 0: The player unit <OBJECT>
 * 1: did the unit JIP? <BOOL>
 *
 * Return Value:
 * nil (No return)
 *
 * This file is executed by the client when the player first connects to the server.
 */

waituntil {!(IsNull (findDisplay 46))};
player allowDamage false;
titleText ["Loading player data!", "BLACK", 0.01];
uiSleep 4;
initDone = true;
uiSleep 2;
titleText ["", "BLACK IN", 2];
uiSleep 2;
player allowDamage true;
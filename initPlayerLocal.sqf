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

call jjx_fnc_keys;

player allowDamage false;
titleText ["Loading player data!", "BLACK", 0.01];
sleep 4;
initDone = true;
sleep 2;
titleText ["", "BLACK IN", 2];
sleep 2;
player allowDamage true;

call jjx_fnc_EH;
call jjx_fnc_loops;
call jjx_fnc_unflip;

edn_fortification_keydown = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call edn_fnc_keyCheck"];

//Chat Commands
["command", {
    ["help"] call jjx_fnc_commands;
}, "adminLogged"] call CBA_fnc_registerChatCommand;

["help", {
    ["help"] call jjx_fnc_commands;
}, "adminLogged"] call CBA_fnc_registerChatCommand;

["menu", {
    ["menu"] call jjx_fnc_commands;
}, "adminLogged"] call CBA_fnc_registerChatCommand;


player setVariable ["cAdded", false];
player setVariable ["bAdded", false];
player setVariable ["vAdded", false];
player setVariable ["_ary", []];

while{true} do {
	call dvl_fnc_checkWater;
	//player setVariable ["_ary", [player getVariable "_ary"] call dvl_fnc_spawnLoot];
	uiSleep 0.05;
};
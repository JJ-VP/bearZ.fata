/*
 * fn_debugMenu.sqf
 * Author: JJ
 *
 * Args:
 * nil (No arguments)
 *
 * Return Value:
 * nil (No return)
 *
 * This function opens the debug menu and adds data to the menu
 */

_isAdmin = player call jjx_fnc_isAdmin;

jjx_debug_open = {
	if (!isNull (findDisplay -10)) exitWith {closeDialog 2;}; //If menu is already open, close it
	createDialog "debugMenu"; //Open the menu
	waitUntil {!isNull (findDisplay -10)}; //Wait for the menu to be open
	[] spawn jjx_debug_update; //Spawn the update function
};

jjx_debug_update = {
	while {!isNull (findDisplay -10)} do {
		call jjx_admin_players;
		{
			remoteExec ["jjx_admin_steamName", _x];
			lbAdd [1500, name _x];
			((findDisplay -1) displayCtrl 1500) ctrlSetEventHandler ["LBDblClick", "_this call jjx_admin_playerInfo"];
			lbSetTooltip [1500, _forEachIndex, format ["Name: %1 ~ Steam: %2 ~ UID: %3", name _x, _x getVariable "steamName", getPlayerUID _x]];
		} forEach playerList; //For all online players, add them to the player list in the GUI

		uiSleep 0.05; //Menu refresh rate (currently 20Hz)
		lbClear 1500; //Clear the players list
		lbClear 1501; //Clear the features list
	};
};

jjx_debug_init = {
	if (isMultiplayer) then {
		jjx_admin_players = {playerList = allPlayers;}; //If multiplayer playerList = all players
		publicVariable "playerList";
	} else {
		jjx_admin_players = {playerList = switchableUnits;}; //If not multiplayer playerList = switchable units
		publicVariable "playerList";
	};
};

jjx_debug_start = {
	waitUntil {time > 0};
	if (_isAdmin) then { //If UID is in jjx_admin
		call jjx_debug_init; //Initalise menu
		waitUntil{!isNull (findDisplay 46)}; //Wait untill the game screen is avalible
		call jjx_debug_open; //Open the menu
	};
};

jjx_debug_localExec = {
	params ["_debugCode"];
	_code = "[] spawn {" + _debugCode + "};";
	[call compile _code] spawn {_this select 0};
};

jjx_debug_serverExec = {
	params ["_debugCode", "_enviroment"];
	_code = "[] spawn { " + _debugCode + "};";
	[call compile _code] remoteExec ["call", _enviroment, true];
};

jjx_debug_remoteExec = {
	params ["_debugCode", "_selectedIndex"];
	if (_selectedIndex != -1) then {
		_player = playerList select _selectedIndex;
		_code = "[] spawn { " + _debugCode + "};";
		[call compile _code] remoteExec ["call", _player, true];
	} else {
		hintSilent parseText format ["%1 Select a player", hintHeader];
		[] spawn {uiSleep 3;hintSilent "";};
	};
};

call jjx_debug_start; //Start the menu
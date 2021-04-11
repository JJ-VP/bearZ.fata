/*
 * fn_openMenu.sqf
 * Author: JJ
 *
 * Args:
 * nil (No arguments)
 *
 * Return Value:
 * nil (No return)
 *
 * This function opens the admin menu and adds data to the menu
 */

#define jjx_menu_red [ 1, 0.22, 0.22, 1]
#define jjx_menu_green [ 0.22, 0.7, 0.2, 1]

_isAdmin = player call jjx_fnc_isAdmin;


jjx_menu_open = {
	if (!isNull (findDisplay -1)) exitWith {closeDialog 2;};
	createDialog "adminMenu";
	waitUntil {!isNull (findDisplay -1)};
	[] spawn jjx_menu_update;
};

jjx_menu_update = {
	while {!isNull (findDisplay -1)} do {
		call jjx_menu_players;
		{
			remoteExec ["jjx_menu_steamName", _x];
			lbAdd [1500, name _x];
			((findDisplay -1) displayCtrl 1500) ctrlSetEventHandler ["LBDblClick", "_this call jjx_menu_playerInfo"];
			lbSetTooltip [1500, _forEachIndex, format ["Name: %1 ~ Steam: %2 ~ UID: %3", name _x, _x getVariable "steamName", getPlayerUID _x]];
		} forEach playerList;

		features = [];
		{
			features pushback _x
		} forEach featuresOff; publicVariable "features";

		{
			switch(_x select 1) do {
				case "god": {
					if ((lbCurSel 1500) != -1) then {
						if (isDamageAllowed (playerList select (lbCurSel 1500))) then {
							lbAdd [1501, format ["%1 - OFF", _x select 0]];
							lbSetColor [1501,  _forEachIndex, jjx_menu_red];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						} else {
							lbAdd [1501, format ["%1 - ON", _x select 0]];
							lbSetColor [1501, _forEachIndex, jjx_menu_green];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						};
					} else {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_menu_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				case "mapTP": {
					if ((lbCurSel 1500) != -1) then {
						if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_mapTP")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_mapTP")}) then {
							lbAdd [1501, format ["%1 - OFF", _x select 0]];
							lbSetColor [1501,  _forEachIndex, jjx_menu_red];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						} else {
							lbAdd [1501, format ["%1 - ON", _x select 0]];
							lbSetColor [1501, _forEachIndex, jjx_menu_green];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						};
					} else {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_menu_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				//next case...
				default {
					lbAdd [1501, _x select 0];
					lbSetTooltip [1501, _forEachIndex, _x select 3];
				};
			};
		} forEach features;

		uiSleep 0.05;
		lbClear 1500;
		lbClear 1501;
	};
};

jjx_menu_exec = {
	hint "called";
	params ["_player","_feature"];
	if (_feature != -1) then {
		if ((features select _feature) select 2) then {
			if (_player != -1) then {
				_code = format ["[%1] spawn jjx_menu_%2", _player, (features select _feature) select 1];
				call compile _code;
			} else {
				hintSilent parseText format ["%1 To execute %2 you need to select a player", hintHeader, format["<t color='#f45f42'>%1</t>", (features select _feature) select 0]];
			};
		} else {_code = format ["[] spawn jjx_menu_%1", (features select _feature) select 1]; call compile _code; };
	} else {
		hintSilent parseText format ["%1 Select a feature", hintHeader];
	};
};
publicVariable "jjx_menu_exec";

jjx_menu_init = {
	hintHeader = "<t color='#41f48c' size='2'>BearZ Admin Menu</t><br /><t size='0.68'>by JJ</t><br />-------- -_- --------<br /><br />";
	publicVariable hintHeader;

	features = [];
	featuresOff = [
		["Kill", "kill", true, "Select a player to kill"],
		["Heal", "heal", true, "Select a player to heal"],
		["TP to player", "tpToPlayer", true, "Select a player to teleport to"],
		["TP player here", "tpPlayerHere", true, "Select a player to teleport them here"],
		["God", "god", true, "Select a player to toggle their imortality"],
		["Map TP", "mapTP", true, "Select a player to toggle their map teleportation"]
	];
	publicVariable "featuresOff";

	if (isMultiplayer) then {
		jjx_menu_players = {playerList = allPlayers;};
		publicVariable "playerList";
	} else {
		jjx_menu_players = {playerList = switchableUnits;};
		publicVariable "playerList";
	};

	call jjx_menu_players;
};

jjx_menu_start = {
	waitUntil {time > 0};
	if (_isAdmin) then {
		call jjx_menu_init;
		waitUntil{!isNull (findDisplay 46)};
		call jjx_menu_open;
	};
};

jjx_menu_steamName = {
	player setVariable ["steamName", profileNameSteam, true];
};

jjx_menu_playerInfo = {
	params["_idc", "_selectedIndex"];
	_infoName = format ["Name: %1", name (playerList select _selectedIndex)];
	_infoSteam = format ["Steam: %1", (playerList select _selectedIndex) getVariable "steamName"];
	_infoUID = format ["UID: %1", getPlayerUID (playerList select _selectedIndex)];
	_infoLoadout = getUnitLoadout (playerList select _selectedIndex);
	copyToClipboard format ["%1 -> %2 ~ %3 ~ %4 ~~ -_- ~~ %5", "BearZ admin menu", _infoName, _infoSteam, _infoUID, _infoLoadout];
	hintSilent parseText format ["%1 %2 <br /> %3 <br /> %4 <br /><br /> <t size='1.6' color='#f45f42'>The players equipment was copied to clipboard, press CTRL+V in a note program to paste it.</t>", hintHeader, _infoName, _infoSteam, _infoUID];uiSleep 4;hintSilent "";
};




// FEATURES BELOW

jjx_menu_kill = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You killed<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];uiSleep 3;hintSilent "";
	_player setDamage 1;
};

jjx_menu_heal = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You healed<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];uiSleep 3;hintSilent "";
	_player setDamage 0;
};

jjx_menu_god = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;

	if (isDamageAllowed _player) then {
		_player allowDamage false;
		hintSilent parseText format ["%1You made<br/><t color='#42ebf4'>%2</t><br />immortal", hintHeader, name _player];uiSleep 3;hintSilent "";
	} else {
		_player allowDamage true;
		hintSilent parseText format ["%1You made<br/><t color='#42ebf4'>%2</t><br />mortal", hintHeader, name _player];uiSleep 3;hintSilent "";
	};
};

jjx_menu_tpToPlayer = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You teleported to<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];uiSleep 3;hintSilent "";
	player setPosASL (getPosASL _player);
};

jjx_menu_tpPlayerHere = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You teleported<br/><t color='#42ebf4'>%2</t><br />to you", hintHeader, name _player];uiSleep 3;hintSilent "";
	_player setPosASL (getPosASL player);
};

jjx_menu_mapTP = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled map TP for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];uiSleep 3;hintSilent "";
	remoteExec ["jjx_menu_mapTPExec", _player];
};
jjx_menu_mapTPExec = {
	if ((isNil {player getVariable "jjx_mapTP"}) || {!(player getVariable "jjx_mapTP")}) then {
		player setVariable ["jjx_mapTP", true, true];
		hint parseText format ["%1 An admin has enabled map teleportation for you!<br /><t color='#f45f42'>ALT + click</t><br />on the map to teleport", hintHeader];uiSleep 5;hintSilent "";
		player onMapSingleClick "if (_alt) then { player setPosATL _pos }";
	} else {
		player setVariable ["jjx_mapTP", false, true];
		hint parseText format ["%1 An admin has disabled map teleportation for you!", hintHeader];uiSleep 5;hintSilent "";
		player onMapSingleClick "if (_alt) then {hint parseText format ['%1Map teleportation is disabled!', hintHeader];};";
	};
};

//


// AFTER

jjx_menu_publishVar = {
	{
	publicVariable format ["jjx_menu_", _x select 1];
	} forEach featuresOff;
};

call jjx_menu_start;
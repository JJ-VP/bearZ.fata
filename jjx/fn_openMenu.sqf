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
				case "freeze": {
					if ((lbCurSel 1500) != -1) then {
						if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_frozen")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_frozen")}) then {
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
				case "markers": {
					if ((lbCurSel 1500) != -1) then {
						if (isNil {((playerList select (lbCurSel 1500)) getVariable "mapMarkers")} || {!((playerList select (lbCurSel 1500)) getVariable "mapMarkers")}) then {
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

//Want to modify exec so it executes agaist the local player if no payer is selected from the playerlist.
jjx_menu_exec = {
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
		//Need to test if I can add a header / spacer (actions)
		["Save mission", "saveMission", false, "Save the current state of the mission with GRAD Persistence"],
		["Kill", "kill", true, "Select a player to kill"],
		["Heal", "heal", true, "Select a player to heal"],
		["TP to player", "tpToPlayer", true, "Select a player to teleport to"],
		["TP player here", "tpPlayerHere", true, "Select a player to teleport them here"],
		["Repair", "repair", true, "Select a player to repair their vehicle or don't select a player to repair whatever you are looking at"],
		["Delete", "delete", true, "Select a player to delete their vehicle or don't select a player to delete whatever you are looking at"],
		["Explode vehicle", "explode", true, "Select a player to destroy their vehicle"],
		["Destroy vehicle", "destroy", true, "Select a player to destroy their vehicle (No explosion)"],
		["Spectate", "spectator", true, "Select a player to spectate"],
		["Freecam", "freecam", true, "Select a player to put them into freecam"],
		["Arsenal", "arsenal", true, "Select a player to open the arsenal for them"],
		["Garage", "garage", true, "Select a player to open the garage for them"],
		["Piss", "pee", true, "Make the player you select have the sudden urge to piss"],
		//Header / spacer (Toggleable)
		["God", "god", true, "Select a player to toggle their imortality"],
		["Map TP", "mapTP", true, "Select a player to toggle their map teleportation"],
		["Freeze", "freeze", true, "Select a player to toggle freeze them"],
		["Map Markers", "markers", true, "Select a player to toggle map markers for them"],
		//Header /spacer (Utility)
		["Go to lobby", "lobby", true, "Select a player to send them to the lobby"],
		["Player info", "info", true, "Get info on the selected player"]
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

jjx_menu_saveMission = {
	hintSilent parseText format ["%1Mission save command sent", hintHeader, name _player];
	[true, 60] remoteExec ["grad_persistence_fnc_saveMission", 2];
};

jjx_menu_kill = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You killed<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	_player setDamage 1;
	uiSleep 3;hintSilent "";
};

jjx_menu_heal = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You healed<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	_player setDamage 0;
	uiSleep 3;hintSilent "";
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
	hintSilent parseText format ["%1You teleported to<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	player setPosASL (getPosASL _player);
	uiSleep 3;hintSilent "";
};

jjx_menu_tpPlayerHere = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You teleported<br/><t color='#42ebf4'>%2</t><br />to you", hintHeader, name _player];
	_player setPosASL (getPosASL player);
	uiSleep 3;hintSilent "";
};

jjx_menu_mapTP = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled map TP for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_menu_mapTPExec", _player];
	uiSleep 3;hintSilent "";
};
jjx_menu_mapTPExec = {
	if ((isNil {player getVariable "jjx_mapTP"}) || {!(player getVariable "jjx_mapTP")}) then {
		player setVariable ["jjx_mapTP", true, true];
		hint parseText format ["%1 An admin has enabled map teleportation for you!<br /><t color='#f45f42'>ALT + click</t><br />on the map to teleport", hintHeader];
		player onMapSingleClick "if (_alt) then { player setPosATL _pos }";
		uiSleep 5;hintSilent "";
	} else {
		player setVariable ["jjx_mapTP", false, true];
		hint parseText format ["%1 An admin has disabled map teleportation for you!", hintHeader];
		player onMapSingleClick "if (_alt) then {};";
		uiSleep 5;hintSilent "";
	};
};

jjx_menu_freeze = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled freeze for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_menu_freezeExec", _player];
	uiSleep 3;hintSilent "";
};
jjx_menu_freezeExec = {
	if (userInputDisabled) then {
		disableUserInput false;
		player setVariable ["jjx_frozen", false, true];
	} else {
		disableUserInput true;
		player setVariable ["jjx_frozen", true, true];
	};
};

jjx_menu_repair = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	if (_player == player) then {
		hintSilent parseText format ["%1You repaired<br/><t color='#42ebf4'>%2</t>", hintHeader, cursorObject];
		cursorObject setDamage 0;
		uiSleep 3;hintSilent "";
	} else {
		hintSilent parseText format ["%1You repaired<br/><t color='#42ebf4'>%2's</t><br />vehicle", hintHeader, name _player];
		remoteExec ["jjx_menu_repairExec", _player];
		uiSleep 3;hintSilent "";
	};
};
jjx_menu_repairExec = {
	_vehicle = vehicle player;
	_vehicle setDamage 0;
};

jjx_menu_delete = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You deleted<br/><t color='#42ebf4'>%2's</t><br />vehicle", hintHeader, name _player];
	remoteExec ["jjx_menu_deleteExec", _player];
	uiSleep 3;hintSilent "";
};
jjx_menu_deleteExec = {
	_vehicle = vehicle player;
	deleteVehicle _vehicle;
};

jjx_menu_explode = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	if (_player == player) then {
		_vehicle = vehicle player;
		hintSilent parseText format ["%1You exploded<br/><t color='#42ebf4'>%2</t>", hintHeader, _vehicle];
		_vehicle setDamage [1, true];
		uiSleep 3;hintSilent "";
	} else {
		hintSilent parseText format ["%1You exploded<br/><t color='#42ebf4'>%2's</t><br />vehicle", hintHeader, name _player];
		[true] remoteExec ["jjx_menu_destroyExec", _player];
		uiSleep 3;hintSilent "";
	};
};
jjx_menu_destroy = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	if (_player == player) then {
		_vehicle = vehicle player;
		hintSilent parseText format ["%1You destroyed<br/><t color='#42ebf4'>%2</t>", hintHeader, _vehicle];
		_vehicle setDamage [1, false];
		uiSleep 3;hintSilent "";
	} else {
		hintSilent parseText format ["%1You destroyed<br/><t color='#42ebf4'>%2's</t><br />vehicle", hintHeader, name _player];
		[false] remoteExec ["jjx_menu_destroyExec", _player];
		uiSleep 3;hintSilent "";
	};
};
jjx_menu_destroyExec = {
	params["_explode"];
	_vehicle = vehicle player;
	if (_explode) then {
		_vehicle setDamage [1, true];
	} else {
		_vehicle setDamage [1, false];
	};
};

jjx_menu_spectator = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You are now spectating<br/><t color='#42ebf4'>%2</t><br />to stop spectating press F10", hintHeader, name _player];
	_player switchCamera "INTERNAL";
	stopSpectating = (findDisplay 46) displayAddEventHandler ["KeyDown",
		"if ((_this select 1) == 68) then {
			(findDisplay 46) displayRemoveEventHandler ['KeyDown', stopSpectating];
			player switchCamera 'INTERNAL';
		};false"
	];
	uiSleep 3;hintSilent "";
};

jjx_menu_markers = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled map markers for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_menu_markersExec", _player];
	uiSleep 3;hintSilent "";
};
jjx_menu_markersExec = {
	if (((isNil {player getVariable "mapMarkers"}) || (isNil {player getVariable "markerList"})) || {!(player getVariable "mapMarkers")}) then {
		player setVariable ["mapMarkers", true, true];
		player setVariable ["markerList", [], true];
		{
			pName = "";
			{pName = pName + _x; pName} forEach ((name _x) splitString " ");
			_markerTest = format ["marker_%1", pName];
			if (!(_markerTest in allMapMarkers)) then {
				_code = format ['createMarkerLocal ["marker_%1", [%2, %3]];
				"marker_%1" setMarkerShapeLocal "ICON";
				"marker_%1" setMarkerTypeLocal "mil_dot";
				"marker_%1" setMarkerColorLocal "ColorPink";
				"marker_%1" setMarkerTextLocal "%1";
				', pName, (position _x select 0), (position _x select 1)];
				call compile _code;
				(player getVariable "markerList") pushback _x;
			};
		} forEach allPlayers;

		[] spawn {
			while {(player getVariable "mapMarkers")} do {
				{
					sName = "";
					{sName = sName + _x; sName} forEach ((name _x) splitString " ");
					_code = format ['"marker_%1" setMarkerPosLocal [%2, %3]',
					sName, (position _x select 0), (position _x select 1)];
					call compile _code;
				} forEach (player getVariable "markerList");
				uiSleep 0.01;
			};
		};
		exit;
	} else {
		player setVariable ["mapMarkers", false, true];
		{
			xName = "";
			{xName = xName + _x; xName} forEach ((name _x) splitString " ");
			deleteMarkerLocal format ["marker_%1", xName];
		} forEach (player getVariable "markerList");

		player setVariable ["markerList", [], true];
	};
};

jjx_menu_freecam = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You enabled freecam for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_menu_freecamExec", _player];
	uiSleep 3;hintSilent "";
};
jjx_menu_freecamExec = {
	[] execVM "a3\functions_f\Debug\fn_camera.sqf";
};

jjx_menu_lobby = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You sent<br/><t color='#42ebf4'>%2</t><br />to the lobby", hintHeader, name _player];
	remoteExec ["jjx_menu_lobbyExec", _player];
	uiSleep 3;hintSilent "";
};
jjx_menu_lobbyExec = {
	(findDisplay 46) closeDisplay 0;
};

jjx_menu_arsenal = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You put<br/><t color='#42ebf4'>%2</t><br />in to the arsenal", hintHeader, name _player];
	if (_player == player) then {
		closeDialog 0;
		["Open", true] call BIS_fnc_arsenal;
	} else {
		["Open", true] remoteExec ["BIS_fnc_arsenal", _player];
	};
	uiSleep 3;hintSilent "";
};

jjx_menu_garage = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You put<br/><t color='#42ebf4'>%2</t><br />in to the garage", hintHeader, name _player];
	if (_player == player) then {
		closeDialog 0;
		["Open", true] call BIS_fnc_garage;
	} else {
		["Open", true] remoteExec ["BIS_fnc_garage", _player];
	};
	uiSleep 3;hintSilent "";
};

jjx_menu_takeLoadout = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You took<br/><t color='#42ebf4'>%2's</t><br />loadout", hintHeader, name _player];
	player setUnitLoadout (getUnitLoadout _player);
	uiSleep 3;hintSilent "";
};

jjx_menu_giveLoadout = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You gave<br/><t color='#42ebf4'>%2</t><br />your loadout", hintHeader, name _player];
	_player setUnitLoadout (getUnitLoadout player);
	uiSleep 3;hintSilent "";
};

jjx_menu_info = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1<t size='1.2' color='#f4e242'>Name: </t><br />%2<br /><br /><t size='1.2' color='#f4e242'>UID: </t><br />%3<br /><br /><t size='1.2' color='#f4e242'>Position: </t><br />%4<br /><br /><t size='1.2' color='#f4e242'>Equip: </t><br />%5<br /><br /><t size='1.6' color='#f45f42'>Player equipment copied to clipboard.</t>", hintHeader, name _player, getPlayerUID _player, position _player, getUnitLoadout _player];
	copyToClipboard str(getUnitLoadout _player);
	uiSleep 6;hintSilent "";
};

jjx_menu_pee = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You made<br/><t color='#42ebf4'>%2</t><br />pee", hintHeader, name _player];
	remoteExec ["jjx_menu_peeExec", _player];
	uiSleep 3;hintSilent "";
};
jjx_menu_peeExec = {
	player playMove "Acts_AidlPercMstpSlowWrflDnon_pissing"; sleep 4;
	player allowDamage true; 
	player enableSimulation true;
	player enableSimulationGlobal true;
	player triggerDynamicSimulation true;
	_dir = getDir player;
	_stream = "#particlesource" createVehicleLocal [0,0,0];
	_stream setParticleRandom [0,[0.004,0.004,0.004],[0.01,0.01,0.01],30,0.01,[0,0,0,0],1,0.02,360];
	_stream setDropInterval 0.001;
	_stream attachTo [player,[0.1,0.15,-0.10],"Pelvis"] ;
	for "_i" from 0 to 1 step 0.01 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02; }; sleep 4;
	for "_i" from 1 to 0.4 step -0.01 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02;};
	for "_i" from 0.4 to 0.8 step 0.02 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.0};
	for "_i" from 0.8 to 0.2 step -0.01 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02;};
	for "_i" from 0.2 to 0.3 step 0.02 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02;};
	for "_i" from 0.3 to 0.1 step -0.01 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02;};
	for "_i" from 0.1 to 0 step -0.01 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (_dir) * _i,cos (_dir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,_i],[0.8,0.7,0.2,_i],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02;};
	deleteVehicle _stream;
};



//


// AFTER

jjx_menu_publishVar = {
	{
	publicVariable format ["jjx_menu_", _x select 1];
	} forEach featuresOff;
};

call jjx_menu_start;

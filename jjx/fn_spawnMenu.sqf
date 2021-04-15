/*
 * fn_spawnMenu.sqf
 * Author: JJ
 *
 * Args:
 * nil (No arguments)
 *
 * Return Value:
 * nil (No return)
 *
 * This function opens the spawn menu and adds data to the menu
 */

_isAdmin = player call jjx_fnc_isAdmin;

jjx_spawn_bags = [];
jjx_spawn_vehs = [];
jjx_spawn_objs = [];
jjx_spawn_weps = [];
jjx_spawn_mags = [];

_cfg = configFile >> "cfgVehicles";
for "_j" from 0 to (count _cfg)-1 do {
	_c = _cfg select _j;
	if (isClass _c) then {
		_t = configName _c;
		if (toLower _t find "_base" isEqualTo -1) then {
			_backpack = getText(configFile >> "cfgVehicles" >> _t >> "vehicleClass") == "BackPacks";
			if (_backpack) then {
				jjx_spawn_bags pushBack _t
			}
			else {
				if ((_t isKindOf "Air") || (_t isKindOf "LandVehicle") || (_t isKindOf "Ship")) then {
					_pic = getText(_c >> "picture");
					if !((toLower _pic) in ["", "pictureheal", "picturepapercar", "picturething", "pictureobject"]) then {
						jjx_spawn_vehs pushBack _t;
					};
				}
				else {
					if ((_t isKindOf "Building") || (_t isKindOf "ThingX") || (_t isKindOf "Constructions_static_F") || (_t isKindOf "Constructions_foundation_F")) then {
						jjx_spawn_objs pushBack _t;
					};
				};
			};
		};
	};
};
_cfg = configFile >> "cfgWeapons";
for "_i" from 0 to (count _cfg)-1 do {
	_c = _cfg select _i;
	if (isClass _c) then {
		_t = configName _c;
		if (toLower _t find "_base" isEqualTo -1) then {
			if ((getText(_c >> "displayName") != "") && {getText(_c >> "picture") != ""} && {getNumber(_c >> "scope") in [0,2]}) then {
				jjx_spawn_weps pushBack _t;
			};
		};
	};
};
_cfg = configFile >> "cfgMagazines";
for "_i" from 0 to (count _cfg)-1 do {
	_c = _cfg select _i;
	if (isClass _c) then {
		_t = configName _c;
		if (toLower _t find "_base" isEqualTo -1) then {
			if ((getText(_c >> "displayName") != "") && {getText(_c >> "picture") != ""} && {getNumber(_c >> "scope") in [0,2]}) then {
				jjx_spawn_mags pushBack _t;
			};
		};
	};
};
//jjx_spawn_all = jjx_spawn_bags+jjx_spawn_vehs+jjx_spawn_objs+jjx_spawn_weps+jjx_spawn_mags;

jjx_spawn_open ={
	if (!isNull (findDisplay -20)) exitWith {closeDialog 2;}; //If menu is already open, close it
	createDialog "spawnMenu"; //Open the menu
	waitUntil {!isNull (findDisplay -20)}; //Wait for the menu to be open
	[] spawn jjx_spawn_update; //Spawn the update function
};

jjx_spawn_start = {
	waitUntil {time > 0};
	if (_isAdmin) then { //If UID is in jjx_admin
		waitUntil{!isNull (findDisplay 46)}; //Wait untill the game screen is avalible
		call jjx_spawn_open; //Open the menu
	};
};

jjx_spawn_update = {

	{lbAdd [1510, _x];} forEach jjx_spawn_bags;
	{lbAdd [1511, _x];} forEach jjx_spawn_vehs;
	{lbAdd [1512, _x];} forEach jjx_spawn_objs;
	{lbAdd [1513, _x];} forEach jjx_spawn_weps;
	{lbAdd [1514, _x];} forEach jjx_spawn_mags;
};

call jjx_spawn_start;

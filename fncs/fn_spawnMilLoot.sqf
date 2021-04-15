/*
 * spawnMilLoot.sqf
 * Author: Devils
 *
 * Args:
 * nil (No arguments)
 *
 * Return Value:
 * nil (No return)
 *
 * This file is used to spawn military loot in ant box that has "milcrate" anywhere in its variable name.
 */

//variable init
_milGear = call dvl_fnc_getUniformsTable + call dvl_fnc_getVestsTable + call dvl_fnc_getHeadgearTable;

//weapon and mag
_milWeapons = call dvl_fnc_getWeaponTable;

_gearChance = 0.4;
_gearItems = 2;

_wepChance = 0.3;
_wepItems = 1;

//get all mil crates (milCrate in)
{
	if("milcrate" in _x) then {
		//clear all old loot
		_crate = missionNamespace getVariable _x;
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
	    clearBackpackCargoGlobal _crate;
		//gen gear loot
		for "_temp" from 1 to _gearItems do {
			//gen a random value
			_chance = (random 100) / 100;
			//if val < chance
			if(_chance <= _gearChance) then {
				//pick random item
				_length = count _milGear;
				_index = ceil random _length - 1;
				//add to crate
    			_crate addItemCargoGlobal [(_milGear select _index), 1];
			};
		};
		//gen weapon loot
		for "_temp" from 1 to _wepItems do {
			//gen a random value
			_chance = (random 100) / 100;
			//if val < chance
			if(_chance <= _wepChance) then {
				//pick random item
				_length = count _milWeapons;
				_index = ceil random _length - 1;
				//weapon
				_weapon = (_milWeapons select _index);
				//get compat mag
				_mags = [_weapon] call BIS_fnc_compatibleMagazines;
				_mag = _mags select 0;
				//add to crate
    			_crate addItemCargoGlobal [_weapon, 1];
    			_crate addItemCargoGlobal [_mag, ceil ((random 2) + 1)];
			};
		};
	};
} forEach allVariables missionNamespace;

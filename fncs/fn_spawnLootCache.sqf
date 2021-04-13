/*
 * fn_spawnLootCache.sqf
 * Author: Devils 
 *
 * Return Value:
 * nil (No return)
 *
 * Load the loot caches with random loot from the table
 */

_lootItems = call dvl_fnc_getItemsTable;
 _numItems = 6;
 _itemsChance = 0.5;

_lootAttachments = call dvl_fnc_getAttachTable;
 _numAttach = 1;
 _attachChance = 0.1;

_lootMags = call dvl_fnc_getMagTable;
 _numMags = 2;
 _magChance = 0.3;

//get all loot crates (lootCrate in)
{
	if("tarkovcache" in _x) then {
		//clear all old loot
		_dvlCrate = missionNamespace getVariable _x;
		clearItemCargoGlobal _dvlCrate;
		clearMagazineCargoGlobal _dvlCrate;
		clearWeaponCargoGlobal _dvlCrate;
	    clearBackpackCargoGlobal _dvlCrate;
		//gen gear loot
		for "_temp" from 1 to _numItems do {
			//gen a random value
			_chance = (random 100) / 100;
			//if val < chance
			if(_chance <= _itemsChance) then {
				//pick random item
				_length = count _lootItems;
				_index = ceil random _length - 1;
				//add to crate
    			_dvlCrate addItemCargoGlobal [(_lootItems select _index), 1];
			};
		};
		//gen attachments loot
		for "_temp" from 1 to _numAttach do {
			//gen a random value
			_chance = (random 100) / 100;
			//if val < chance
			if(_chance <= _attachChance) then {
				//pick random item
				_length = count _lootAttachments;
				_index = ceil random _length - 1;
				//add to crate
    			_dvlCrate addItemCargoGlobal [(_lootAttachments select _index), 1];
			};
		};
		//gen mag loot
		for "_temp" from 1 to _numMags do {
			//gen a random value
			_chance = (random 100) / 100;
			//if val < chance
			if(_chance <= _magChance) then {
				//pick random item
				_length = count _lootMags;
				_index = ceil random _length - 1;
				//add to crate
    			_dvlCrate addItemCargoGlobal [(_lootMags select _index), ceil ((random 2) + 1)];
			};
		};
	};
} forEach allVariables missionNamespace;
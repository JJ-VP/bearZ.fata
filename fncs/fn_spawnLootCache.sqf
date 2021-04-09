/*
 * fn_spawnLootCache.sqf
 * Author: Devils 
 *
 * Return Value:
 * nil (No return)
 *
 * Load the loot caches with random loot from the table
 */

//items like food and water
_lootItems = [
	"rvg_canteenPurified",
	"rvg_purificationTablets",
	"rvg_Rabbit_Meat_Cooked",
	"rvg_docFolder",
	"VA_Bloodbag_F",
	"VA_Bedrull",
	"rvg_money",
	"VA_Bandage_F",
	"rvg_plasticBottlePurified",
	"VA_CanFranta"
	];
//suppressors and sights
_lootAttachments = [
	"CUP_optic_HoloBlack",
	"CUP_optic_ACOG_TA01B_Black",
	"optic_Hamr",
	"CUP_muzzle_snds_SCAR_L",
	"muzzle_snds_M",
	"CUP_muzzle_mfsup_Flashhider_556x45_OD"
	];
//STANAG and the lot
_lootMags = [
	"CUP_30Rnd_556x45_Stanag",
	"CUP_30Rnd_Sa58_M",
	"150Rnd_762x54_Box",
	"CUP_30Rnd_9x19AP_Vityaz",
	"CUP_30Rnd_556x45_Stanag_Mk16_black",
	"CUP_30Rnd_762x39_AK47_M",
	"CUP_30Rnd_762x39_AK103_bakelite_M"
];

_numItems = 6;
_itemsChance = 0.5;

_numAttach = 1;
_attachChance = 0.1;

_numMags = 2;
_magChance = 0.3;

//get all loot crates (lootCrate in)
{
	if("lootcrate" in _x) then {
		//clear all old loot
		_crate = missionNamespace getVariable _x;
		clearItemCargoGlobal _crate;
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
    			_crate addItemCargoGlobal [(_lootItems select _index), 1];
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
    			_crate addItemCargoGlobal [(_lootAttachments select _index), 1];
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
    			_crate addItemCargoGlobal [(_lootMags select _index), ceil ((random 2) + 1)];
			};
		};
	};
} forEach allVariables missionNamespace;
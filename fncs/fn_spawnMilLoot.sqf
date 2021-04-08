//variable init
_milGear = ["CFP_HV2_Ciras_Olive"
];
_gearChance = 0.4;
_gearItems = 2;
//weapon and mag
_milWeapons = [["CUP_arifle_M4A1_MOE_short_black", "CUP_30Rnd_556x45_Stanag"]
];
_wepChance = 0.3;
_wepItems = 1;

//get all mil crates (milCrate in)
{
	if("milcrate" in _x) then {
		//clear all old loot
		_crate = missionNamespace getVariable _x;
		clearItemCargoGlobal _crate;
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
				//add to crate
    			_crate addItemCargoGlobal [(_milWeapons select _index select 0), 1];
    			_crate addItemCargoGlobal [(_milWeapons select _index select 1), ceil ((random 2) + 1)];
			};
		};
	};
} forEach allVariables missionNamespace;

//variable init
_milGear = [
	"CFP_HV2_Ciras_Olive",
	"ACE_NVG_Wide",
	"CUP_H_BAF_DDPM_Mk6_GOGGLES_PRR",
	"CUP_H_BAF_Crew_Helmet_DDPM",
	"CUP_H_USArmy_HelmetMICH",
	"CUP_H_USMC_Headset_GoggleW_HelmetWDL",
	"CUP_U_B_CDF_MNT_2",
	"CUP_U_O_CHDKZ_Kam_07",
	"CUP_V_B_GER_Carrier_Vest",
	"CUP_V_IDF_Vest",
	"CUP_V_I_RACS_Carrier_Vest_wdl_2",
	"CUP_V_B_PASGT_desert",
	"CUP_V_B_MTV_Pouches"
];
//weapon and mag
_milWeapons = [
	["CUP_arifle_M4A1_MOE_short_black", "CUP_30Rnd_556x45_Stanag"],
	["CUP_arifle_Sa58P_frontris_woodland", "CUP_30Rnd_Sa58_M"],
	["LMG_Zafir_F", "150Rnd_762x54_Box"],
	["CUP_smg_vityaz_vfg_top_rail", "CUP_30Rnd_9x19AP_Vityaz"],
	["CUP_arifle_Mk16_CQC_FG_black", "CUP_30Rnd_556x45_Stanag_Mk16_black"],
	["CUP_arifle_OTS14_GROZA_762_Grip", "CUP_30Rnd_762x39_AK47_M"],
	["CUP_arifle_AK103_railed", "CUP_30Rnd_762x39_AK103_bakelite_M"]
];

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

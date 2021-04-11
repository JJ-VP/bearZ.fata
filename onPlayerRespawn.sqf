/*
 * OnPlayerRespawn.sqf
 * Author: JJ
 *
 * Args:
 * 0: The unit the player is controlling after the respawn <OBJECT>
 * 1: The unit the player was controlling before the respawn <OBJECT>
 * 2: The type of respawn <NUMBER>
 * 3: The respawn delay <NUMBER>
 *
 * Return Value:
 * nil (No return)
 *
 * This file is executed by the client when the player unit dies and on load if respawnOnStart is set to 0 or 1 (if set to -1 this file will not be executed at any time)
 */
if (isNil "initDone") then {
	initDone = false;
};

waituntil {!IsNull (findDisplay 46)};
waituntil {initDone == true};


if ((backpack player == "") && (vest player == "") && (primaryWeapon player == "") && (secondaryWeapon player == "") && (handgunWeapon player == "")) then {
	//Check if they player has any loot that isnt part of the base loadout
	_pistols = [
		["CUP_srifle_CZ550_rail", "CUP_5x_22_LR_17_HMR_M"],
		["CUP_hgun_Phantom","CUP_18Rnd_9x19_Phantom"],
		["CUP_hgun_Glock17","CUP_17Rnd_9x19_glock17"],
		["CUP_hgun_PMM","CUP_12Rnd_9x18_PMM_M"],
		["CUP_sgun_CZ584","CUP_1Rnd_B_CZ584_74Pellets"],
		["CUP_sgun_CZ584","CUP_1Rnd_B_CZ584_74Slug"],
		["CUP_hgun_Colt1911_snds","CUP_7Rnd_45ACP_1911"],
		["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"],
		["CUP_smg_bizon_snds","CUP_64Rnd_Green_Tracer_9x19_Bizon_M"],
		["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"],
		["CUP_hgun_glock17_flashlight","CUP_17Rnd_9x19_glock17"]
		];
	_length = count _pistols;
	_index = ceil random _length - 1; //Pick a random gun with ammo
	player addMagazines [(_pistols select _index select 1), ceil ((random 2) + 1)];
	player addMagazines ["rvg_money", ceil ((random 3) + 1)];
	player addWeapon (_pistols select _index select 0);
	//get list respawn_west markers
	_respawns = [];
	{
	  if ("respawn_west" in _x) then {
	   _respawns pushback _x;
	  }
	} forEach allMapMarkers;
	//get random marker
	_length = count _respawns;
	_index = ceil random _length - 1;
	_temp =  _respawns select _index;
	_pos = getMarkerPos (_temp);
	//move player to marker
	player setPosASL _pos;//Spawn the player at a random respawn_west marker
};
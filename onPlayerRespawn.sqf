//give player random pistol
//gun, mag
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
_index = random _length;
systemChat (_pistols select _index select 0);
player addMagazine (_pistols select _index select 1);
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
_index = random _length;
_temp =  _respawns select _index;
_pos = getMarkerPos (_temp);
//move player to marker
player setPosASL _pos;
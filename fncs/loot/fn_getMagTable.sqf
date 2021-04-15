_weapons = call dvl_fnc_getWeaponTable;
_table = [];

_length = (count _weapons) - 1;

for "_i" from 0 to _length do {
	_weapon = _weapons select _i;
	_mags = [_weapon] call BIS_fnc_compatibleMagazines;
	_mag = _mags select 0;
	_table append [_mag];
};

_table
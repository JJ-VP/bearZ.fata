/*
 * 
 * Author: Devils 
 *
 * Params:
 * Array of loot var names
 *
 * Return Value:
 * Array of loot names
 *
 * Dyanmically spawn loot in
 */


/*
_Buildings = _Buildings - _Buildingsclose;
_oldHouses = store the houses they are near
_allHouses = nearestTerrainObjects [player, ["BUILDING"], _lootZone];

_newhouses = _allHouses - _oldHouses
only spawn markers on _newhouses
*/





params ["_prev"];
_lootZone = 50;
_all = [];
_max = 0;

//if an old marker is still in range add it to _all
_length = (count _prev) - 1;
//if there are markers to check
if(_length != 0) then {
	for "_i" from 0 to _length do {
		_marker = _prev select _i;
		_pos = getMarkerPos _marker;
		if(player distance2D _pos < _lootZone) then {
			_all append [_marker];
		}else{
			deleteMarker _marker;
		};
		//generate a max
		_number = parseNumber ((_marker splitString "location:") select 0);
		if(_max < _number) then {
			_max = _number;
		};
	};
};

//get the new markers
_ary = nearestTerrainObjects [player, ["BUILDING"], _lootZone];
if(_ary isEqualTo []) then {
	_all = [];
	//and clear any left over variables that may exist
	{
		if("location" in _x) then {
			deleteMarker _x;
		};
	}forEach allMapMarkers;
}else{
	_length = (count _ary) - 1;
	for "_j" from 0 to _length do {
		_obj = _ary select _j;
		_pos = getPos _obj;
		//if the marker is unique add it to all
		if([_pos, _prev] call dvl_fnc_returnIfSamePos) then {
			_string = format["location:%1", _j + _max + 1];
			_marker = createMarker[_string, _pos, 0];
			_marker setMarkerPos _pos;
			_marker setMarkerType "mil_box";
			_all append [_marker];
		};
	}; 
};

_all


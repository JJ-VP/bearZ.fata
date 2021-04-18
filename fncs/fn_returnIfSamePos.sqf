/*
i will edit this
*/

params ["_pos", "_ary"];
_unique = true;
_length = (count _ary) - 1;

if(_length != 0)then{
	for "_i" from 0 to _length do {
		_checkPos = getMarkerPos (_ary select _i);
		if(_checkPos isEqualTo _pos) then {
			_unique = false;
			break;
		};
	};
};

_unique
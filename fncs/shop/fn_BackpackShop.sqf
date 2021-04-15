//trader table
_mags = call dvl_fnc_getBackpackTable;

//output
_length = (count _mags) - 1;
_sidebar = 1501;
_pricebar = 1502;

for "_i" from 0 to _length do {
	_price = 10;
	_string = (_mags select _i);
	_displayText = getText (configFile >> "cfgVehicles" >> _string >> "displayName");

	lbAdd [_sidebar, _displayText];
	lbSetData [_sidebar, _i, _string];

	if(_string == "rvg_bergan") then {
		_price = 40;
	};
	if(_string == "rvg_carryall_1") then {
		_price = 30;
	};
	if(_string == "rvg_kitbag") then {
		_price = 30;
	};

	_string = "$" + str _price;
	lbAdd [_pricebar, _string];
};

done = true;
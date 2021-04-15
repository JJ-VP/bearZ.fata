//trader table
_mags = call dvl_fnc_getUniformsTable;

//output
_length = (count _mags) - 1;
_sidebar = 1501;
_pricebar = 1502;

for "_i" from 0 to _length do {
	_price = 5;
	_string = (_mags select _i);
	_displayText = getText (configFile >> "CfgWeapons" >> _string >> "displayName");

	lbAdd [_sidebar, _displayText];
	lbSetData [_sidebar, _i, _string];

	if(_string == "CUP_U_O_RUS_Ghillie") then {
		_price = 50;
	};


	_string = "$" + str _price;
	lbAdd [_pricebar, _string];
};

done = true;
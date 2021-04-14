//trader table
_mags = call dvl_fnc_getMagTable;

_price = 20;

//output
_length = (count _mags) - 1;
_sidebar = 1501;
_pricebar = 1502;

for "_i" from 0 to _length do {
	_string = (_mags select _i);
	_displayText = getText (configFile >> "CfgMagazines" >> _string >> "displayName");
	_lvl = getText (configFile >> "CfgMagazines" >> _string >> "descriptionShort");

	lbAdd [_sidebar, _displayText];
	lbSetData [_sidebar, _i, _string];
	_string = "$" + str _price;
	lbAdd [_pricebar, _string];
};

done = true;

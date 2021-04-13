//trader table
_mags = call dvl_fnc_getHeadGearTable;

_price = 15;

//output
_length = (count _mags) - 1;
_sidebar = 1501;
_pricebar = 1502;

for "_i" from 0 to _length do {
	_string = (_mags select _i);
	lbAdd [_sidebar, _string];
	_string = "$" + str _price;
	lbAdd [_pricebar, _string];
};

done = true;
//trader table
_mags = call dvl_fnc_getVestsTable;

_basePrice = 10;

//output
_length = (count _mags) - 1;
_sidebar = 1501;
_pricebar = 1502;

for "_i" from 0 to _length do {
	_string = (_mags select _i);
	_displayText = getText (configFile >> "CfgWeapons" >> _string >> "displayName");
	_lvl = getText (configFile >> "CfgWeapons" >> _string >> "descriptionShort");

	lbAdd [_sidebar, _displayText];
	lbSetData [_sidebar, _i, _string];

	//strip useless stuff
	_lvl = (_lvl splitString "Armor Level ") select 0;
	//calculate new price
	_price = "NA";
	if(_lvl == "Explosive Resistant") then {
		_price = _basePrice + _basePrice * 5;
	};
	if(_lvl == "IV") then {
		_price = _basePrice + _basePrice * 4;
	};
	if(_lvl == "III") then {
		_price = _basePrice + _basePrice * 3;
	};
	if(_lvl == "II") then {
		_price = _basePrice + _basePrice * 2;
	};
	if(_lvl == "I") then {
		_price = _basePrice + _basePrice * 1;
	};
	if(_lvl == "N") then {
		_price = _basePrice + _basePrice * 0;
	};


	_string = "$" + str _price;
	lbAdd [_pricebar, _string];
};

done = true;
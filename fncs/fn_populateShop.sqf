/*
Author: Devils
Description: On list load make it look pretty
Return Value: nil
*/
// get the right list box
_display = findDisplay 420;
_sidebar = 1500;
//add all the options there
lbAdd [_sidebar, "Compat. Mags"];
lbAdd [_sidebar, "Magazines"];
lbAdd [_sidebar, "Weapons"];
lbAdd [_sidebar, "Items"];
lbAdd [_sidebar, "Uniforms"];
lbAdd [_sidebar, "Backpack"];
lbAdd [_sidebar, "Vests"];
lbAdd [_sidebar, "HeadGear"];

[] spawn{
_currentIndex = -999;
//load current selection
while{!isNull (findDisplay 420)} do {
	//get the selection
	_index = lbCurSel 1500;
	if(_index == _currentIndex) then{
		continue;
	}else{
		_currentIndex = _index;
		//if the chosen type has changed
		//clear the item panel and price panel
		lbClear 1501;
		lbClear 1502;
	};
	//get the chosen type of item
	_selection = lbText [1500, _index];
	//if an error slipped through skip back to start of loop
	if(_index == -1) then {
		continue;
	};
	if(_selection == "Compat. Mags") then {
		//get primary gun and add to lb
		_weapon = primaryWeapon player;
		if (_weapon != "") then {
			_mags = [_weapon] call BIS_fnc_compatibleMagazines;
			_price = 20;
			_length = (count _mags) - 1;
			for "_i" from 0 to _length do {
				lbAdd [1501, _mags select _i];
				lbAdd [1502, format["$%1", _price]];
			};
		};
		//get launcher and add to lb
		_weapon = secondaryWeapon player;
		if (_weapon != "") then {
			_mags = [_weapon] call BIS_fnc_compatibleMagazines;
			_price = 50;
			_length = (count _mags) - 1;
			for "_i" from 0 to _length do {
				lbAdd [1501, _mags select _i];
				lbAdd [1502, format["$%1", _price]];
			};
		};
		//get handun and add to lb
		_weapon = handgunWeapon player;
		if (_weapon != "") then {
			_mags = [_weapon] call BIS_fnc_compatibleMagazines;
			_price = 10;
			_length = (count _mags) - 1;
			for "_i" from 0 to _length do {
				lbAdd [1501, _mags select _i];
				lbAdd [1502, format["$%1", _price]];
			};
		};
	}else{
		done = false;
		//construct file path name
		_function = "fncs\shop\fn_" + _selection + "Shop.sqf";
		//populate available items on right
		_waiter = call compile "execVM _function;";
		waitUntil{done};
		};
}; 

};

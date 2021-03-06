//check a selection has been made
if((lbCurSel 1500 > -1) && (lbCurSel 1501 > -1)) then {
	//load vars
	_index = lbCurSel 1501;
	//_className = lbText [1501, _index];
	_className = lbData [1501, _index];
    _strprice = lbText [1502, _index];
	//check they have enough space for the item
	if(!(player canAdd _className)) exitWith {hint format["You dont have enough space to store %1", getText (configFile >> "CfgWeapons" >> _className >> "displayName")];};
	//check they have enough money for item "rvg_money"
    _price = parseNumber ((_strprice splitString "$") select 0);
    _total = ({_x == "rvg_money"} count (uniformItems player)) + ({_x == "rvg_money"} count (vestItems player)) + ({_x == "rvg_money"} count (backpackItems player));
    if (_total < _price) exitWith {hint format["You have %1, you need %2", _total, _price];};
    //give them the item
    player addItem _className;
    //remove all money then give them (_total - _price)
    while{(0 < _price) && ("rvg_money" in uniformItems player)} do {
    	player removeItemFromUniform "rvg_money";
    	_price = _price - 1;
    };
    while{(0 < _price) && ("rvg_money" in vestItems player)} do {
    	player removeItemFromVest "rvg_money";
    	_price = _price - 1;
    };
    while{(0 < _price) && ("rvg_money" in backpackItems player)} do {
    	player removeItemFromBackpack "rvg_money";
    	_price = _price - 1;
    };
} else {
	hint "you need to make a choice";
}

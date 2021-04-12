//check a selection has been made
if((lbCurSel 1500 > -1) && (lbCurSel 1501 > -1)) then {
	//load vars
	_index = lbCurSel 1501;
	_className = lbText [1501, _index];
	_strprice = lbText [1502, _index];
	//check they have enough space for the item
	if(!(player canAdd _className)) exitWith {hint format["You dont have enough space to store %1", _className];};
	//check they have enough money for item "rvg_money"
    _price = parseNumber ((_strprice splitString "$") select 0);
    _total = ({_x == "rvg_money"} count (uniformItems player)) + ({_x == "rvg_money"} count (vestItems player)) + ({_x == "rvg_money"} count (backpackItems player));
    if (_total < _price) exitWith {hint format["You have %1, you need %2", _total, _price];};
    //give them the item
    _notAdded = true;
    if ((player canAddItemToBackpack [_className, 1]) && _notAdded) then {
    	_notAdded = false;
    	player addItemToBackpack _className;
    };
    if ((player canAddItemToUniform [_className, 1]) && _notAdded) then {
    	_notAdded = false;
    	player addItemToUniform _className;
    };
    if ((player canAddItemToVest [_className, 1]) && _notAdded) then {
    	_notAdded = false;
    	player addItemToVest _className;
    };
    //remove all money then give them (_total - _price)
    if(_price > 0) then {
    	//count uniform inventory
    	_sum = {_x == "rvg_money"} count (uniformItems player);
    	_price = _price - _sum;
    	player removeItemFromUniform "rvg_money";
    	//if we took too much money balance it out
    	if(_price < 0) then {
    		for "_i" from _price to -1 do {
    			player addItemToUniform "rvg_money";
    		};
    	};
    };
    if(_price > 0) then {
    	//count vest inventory
    	_sum = {_x == "rvg_money"} count (vestItems player);
    	_price = _price - _sum;
    	player removeItemFromVest "rvg_money";
    	if(_price < 0) then {
    		for "_i" from _price to -1 do {
    			player addItemToVest "rvg_money";
    		};
    	};    
    };
    if(_price > 0) then {
    	//count backpack inventory
    	_sum = {_x == "rvg_money"} count (backpackItems player);
    	_price = _price - _sum;
    	player removeItemFromBackpack "rvg_money";
    	if(_price < 0) then {
    		for "_i" from _price to -1 do {
    			player addItemToBackpack "rvg_money";
    		};
    	};    
    };
	//remove this
	hint format["you now have %1", _total - _price];
} else {
	systemChat format["index: %1, index: %2", lbCurSel 1500, lbCurSel 1501];
	hint "you need to make a choice"
}

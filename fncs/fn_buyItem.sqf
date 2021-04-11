//check a selection has been made
if((lbCurSel 1500 > -1) && (lbCurSel 1501 > -1)) then {
	//load vars
	_index = lbCurSel 1501;
	_className = lbText [1501, _index];
	_strprice = lbText [1502, _index];
	//check they have enough space for the item
	//check they have enough money for item "rvg_money"
    _price = parseNumber ((_strprice splitString "$") select 0);
	//remove this
	systemChat format["you want to buy %1 for %2", _className, _price];
} else {
	systemChat format["index: %1, index: %2", lbCurSel 1500, lbCurSel 1501];
	hint "you need to make a choice"
}

/*
Author: Devils
Description: On list load make it look pretty
Return Value: nil
*/
// get the right list box
_display = findDisplay 420;
_sidebar = 1500;
//add all the options there
lbAdd [_sidebar, "Magazines"];
lbAdd [_sidebar, "Medical"];
lbAdd [_sidebar, "Items"];
lbAdd [_sidebar, "Uniforms"];
lbAdd [_sidebar, "Backpack"];
lbAdd [_sidebar, "Vests"];
lbAdd [_sidebar, "HeadGear"];

[] spawn{
//load current selection
while{!isNull (findDisplay 420)} do {
	//clear the sidepanel
	lbClear 1501;
	lbClear 1502;
	//get the selection
	_index = lbCurSel 1500;
	_selection = lbText [1500, _index];
	if(_index == -1) then {
		continue;
	};
	//construct file path name
	_function = "fncs\shop\fn_" + _selection + "Shop.sqf";
	//populate available items on right
	execVM _function;
	//sleep for x
	systemChat "finished loop";
	uiSleep 3;
	}; 

};

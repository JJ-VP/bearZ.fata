/*
 * fn_EH.sqf
 * Author: JJ
 *
 * Args:
 * nil (No arguments)
 *
 * Return Value:
 * nil (No return)
 *
 * This function adds event handlers
 */

//Stop players from opening the inventory of alive units (includes traders)
player addEventHandler ["InventoryOpened",{
	params ["_unit","_container"];
	_override = false;
	_allUnitBackpackContainers = allUnits select {alive _x} apply {backpackContainer _x};
	
	if (_container in _allUnitBackpackContainers) then {
		_override = true;
	};
	
	_override
}];
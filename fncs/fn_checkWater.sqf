/*
 * spawnMilLoot.sqf
 * Author: Devils
 *
 * Args:
 * nil (No arguments)
 *
 * Return Value:
 * nil (No return)
 *
 * Checks if the player can fill up their bottle
 */

//are they in water and do they have an empty x
if((surfaceIsWater getPosATL player) && ([player, "rvg_canteenEmpty"] call BIS_fnc_hasItem) && !(player getVariable "cAdded")) then {
	_canteenAction = player addAction[
		"Fill up canteen",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
	    	player removeItem "rvg_canteenEmpty";
			player addItem "rvg_canteen";
			player removeAction (_this select 2);
			player setVariable ["cAdded", false];
		},
		nil,3,true,true,"","true",-1,false,"",""
	];
	player setVariable ["cID", _canteenAction];
	player setVariable ["cAdded", true];
};
if((surfaceIsWater getPosATL player) && ([player, "VA_Waterbottle_empty"] call BIS_fnc_hasItem) && !(player getVariable "vAdded")) then {
	_bottleAction = player addAction[
		"Fill up water bottle",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
	    	player removeItem "VA_Waterbottle_empty";
			player addItem "rvg_plasticBottle";
			player removeAction (_this select 2);
			player setVariable ["vAdded", false];
		},
		nil,3,true,true,"","true",-1,false,"",""
	];
	player setVariable ["vID", _bottleAction];
	player setVariable ["vAdded", true];
};
if((surfaceIsWater getPosATL player) && ([player, "rvg_plasticBottleEmpty"] call BIS_fnc_hasItem) && !(player getVariable "bAdded")) then {
	_rvgBottleAction = player addAction[
		"Fill up water bottle",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
	    	player removeItem "rvg_plasticBottleEmpty";
			player addItem "rvg_plasticBottle";
			player removeAction (_this select 2);
			player setVariable ["bAdded", false];
		},
		nil,3,true,true,"","true",-1,false,"",""
	];
	player setVariable ["bID", _rvgBottleAction];
	player setVariable ["bAdded", true];
};
//are they out of water and still have the action
if((player getVariable "cAdded") && !(surfaceIsWater getPosATL player)) then {
	player removeAction (player getVariable "cID");
	player setVariable ["cAdded", false];
};
if((player getVariable "bAdded") && !(surfaceIsWater getPosATL player)) then {
	player removeAction (player getVariable "bID");
	player setVariable ["bAdded", false];
};
if((player getVariable "vAdded") && !(surfaceIsWater getPosATL player)) then {
	player removeAction (player getVariable "vID");
	player setVariable ["vAdded", false];
};
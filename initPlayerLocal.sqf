/*
 * initPlayerLocal.sqf
 * Author: JJ
 *
 * Args:
 * 0: The player unit <OBJECT>
 * 1: did the unit JIP? <BOOL>
 *
 * Return Value:
 * nil (No return)
 *
 * This file is executed by the client when the player first connects to the server.
 */

waituntil {!(IsNull (findDisplay 46))};

call jjx_fnc_keys;
call jjx_fnc_EH;

player allowDamage false;
titleText ["Loading player data!", "BLACK", 0.01];
uiSleep 4;
initDone = true;
uiSleep 2;
titleText ["", "BLACK IN", 2];
uiSleep 2;
player allowDamage true;


player setVariable ["cAdded", false];
player setVariable ["bAdded", false];
player setVariable ["vAdded", true];


while{true} do {
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
		player setVariable ["bID", _bottleAction];
		player setVariable ["bAdded", true];
	};
	if((surfaceIsWater getPosATL player) && ([player, "rvg_plasticBottleEmpty"] call BIS_fnc_hasItem) && !(player getVariable "bAdded")) then {
		_canteenAction = player addAction[
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
		player setVariable ["cID", _canteenAction];
		player setVariable ["cAdded", true];
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
		player removeAction (player getVariable "bID");
		player setVariable ["vAdded", false];
	};
	//wait a second
	uiSleep 0.05;

};
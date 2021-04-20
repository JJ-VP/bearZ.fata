/*
 * initServer.sqf
 * Author: JJ & Devils
 *
 * Args:
 * nil (No arguments)
 *
 * Return Value:
 * nil (No return)
 *
 * This file is executed by the server during startup (before init.sqf)
 */

jjx_admin = ["76561198119540788","76561198156022880","_SP_PLAYER_"];
publicVariable "jjx_admin";
["Initialize"] call BIS_fnc_dynamicGroups;

_this spawn{
	_duration = 60 * 20;// 60 * num minutes you want
	waitUntil { Time > 0};
	call dvl_fnc_spawnMilLoot;
	call dvl_fnc_spawnLootCache;

	while{_duration != 0} do {
		uiSleep _duration;
		call dvl_fnc_spawnMilLoot;
		call dvl_fnc_spawnLootCache;
	};
};

_this spawn {
	while {time > 0} do {
		if ((daytime > 5.75) && (daytime < 18.5)) then { //If time is after 5:45AM and before 6:30PM
			setTimeMultiplier 4;
		} else {
			setTimeMultiplier 40;
		};
		sleep 10;
	};
};

_this spawn {
	while {time > 0} do {
		_duration = 60 * 240;
		sleep _duration;
		"Mission saving in 10 seconds!" remoteExec ["systemChat", 0, true];
		"Expect desync until save is complete!" remoteExec ["systemChat", 0, true];
		[false] call grad_persistence_fnc_saveMission;
	};
}; //Save the mission every 4 hours

 [] spawn {
  while {true} do {
   {
    _x addCuratorEditableObjects [allUnits, true];
    _x addCuratorEditableObjects [vehicles, true];
    sleep 60;
   } forEach allCurators; 
  };
 }; //Add all objects to zeus
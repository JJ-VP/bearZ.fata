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
		"loop" remoteExec ["hint", 0, true];
	};
};
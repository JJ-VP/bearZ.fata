/*
 * initServer.sqf
 * Author: Devils
 *
 * Args:
 * nil (No arguments)
 *
 * Return Value:
 * nil (No return)
 *
 * This file is executed by the server during startup (before init.sqf)
 */

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
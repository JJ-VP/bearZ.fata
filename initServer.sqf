_this spawn{
	_duration = 60 * 20;// 60 * num minutes you want
	waitUntil { Time > 0};
	call dvl_fnc_spawnMilLoot;

	while{_duration != 0} do {
		uiSleep _duration;
		call dvl_fnc_spawnMilLoot;
	};
};
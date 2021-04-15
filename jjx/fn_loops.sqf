/*
 * fn_loops.sqf
 * Author: JJ
 *
 * Args:
 * nil (No args)
 *
 * Return Value:
 * nil (No return)
 *
 * This file executes while loops on the player
 */

[] spawn {
	while {getCustomAimCoef player > 0.25} do {
		player setCustomAimCoef 0.25;
		uiSleep 1;
	};
};

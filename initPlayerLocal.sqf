waituntil {!(IsNull (findDisplay 46))};
player allowDamage false;
titleText ["Loading player data!", "BLACK", 0.01];
uiSleep 4;
initDone = true;
uiSleep 2;
titleText ["", "BLACK IN", 2];
uiSleep 2;
player allowDamage true;
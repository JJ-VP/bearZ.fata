#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_persistence {
    class common {
        file = MODULES_DIRECTORY\grad-persistence\functions\common;

        class blacklistClasses {};
        class blacklistObjects {};
        class clearMissionData {};
        class generateCountArray {};
        class getMarkerChannel {};
        class getMissionTag {};
        class getSaveData {};
        class handleDisconnect {};
        class handleJIP {};
        class initModule {postInit = 1;};
        class isBlacklisted {};
        class showWarningMessage {};
        class tagEditorObjects {};
        class unblacklistClasses {};
        class unblacklistObjects {};
    };

    class load {
        file = MODULES_DIRECTORY\grad-persistence\functions\load;

        class addBackpacks {};
        class addItems {};
        class addMagazines {};
        class addWeaponItems {};
        class createVehicleCrew {};
        class loadAllPlayers {};
        class loadContainers {};
        class loadGroups {};
        class loadMarkers {};
        class loadMission {};
        class loadObjectVars {};
        class loadPlayer {};
        class loadPlayerChatcommandServer {};
        class loadStatics {};
        class loadTasks {};
        class loadTeamAccounts {};
        class loadTimeAndDate {};
        class loadTriggers {};
        class loadTurretMagazines {};
        class loadVariables {};
        class loadVehicleHits {};
        class loadVehicleInventory {};
        class loadVehicles {};
        class requestLoadPlayer {};
    };

    class save {
        file = MODULES_DIRECTORY\grad-persistence\functions\save;

        class deInstanceTFARRadios {};
        class getApplicableMarkers {};
        class getInventory {};
        class saveAllPlayers {};
        class saveContainers {};
        class saveGroups {};
        class saveMarkers {};
        class saveMission {};
        class saveObjectVars {};
        class savePlayer {};
        class saveStatics {};
        class saveTasks {};
        class saveTeamAccounts {};
        class saveTimeAndDate {};
        class saveTriggers {};
        class saveVariables {};
        class saveVehicles {};
    };
};

class edn {
    class fortify {
        file = MODULES_DIRECTORY\fortify;
        class addBlueprint {};
        class addConstructionsToZeus {};
        class alignObject {};
        class buildObject {};
        class clearBlueprints {};
        class distanceObject {};
        class keyCheck {};
        class moveObject {};
        class openConstructionMenu {};
        class openFortificationMenu {};
        class removeItemCargoGlobal {};
        class removeObject {};
        class turnObject {};
        class updateCollisions {};
        class updateConstructionMenu {};
        class dropResource {};
    };
};

class SA {
    class AdvancedSlingLoading {
        file = MODULES_DIRECTORY;
        class advancedSlingLoadingInit {positInit=1;};
    };
    class AdvancedTowing {
        file = MODULES_DIRECTORY;
        class advancedTowingInit {positInit=1;}
    };
};
class TraderMenu{
	idd = 420;
	enableMoving = false;
	onload = "[] spawn{call dvl_fnc_populateShop;}";
	class controls{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;

			x = 0.323679 * safezoneW + safezoneX;
			y = 0.264902 * safezoneH + safezoneY;
			w = 0.352643 * safezoneW;
			h = 0.470196 * safezoneH;
		};
		class SelectItemType: RscListBox
		{
			idc = 1500;

			x = 0.336903 * safezoneW + safezoneX;
			y = 0.28371 * safezoneH + safezoneY;
			w = 0.0396723 * safezoneW;
			h = 0.282118 * safezoneH;
		};
		class selectActualItem: RscListBox
		{
			idc = 1501;

			x = 0.394207 * safezoneW + safezoneX;
			y = 0.28371 * safezoneH + safezoneY;
			w = 0.233626 * safezoneW;
			h = 0.413773 * safezoneH;
		};
		class BuyButton: RscButton
		{
			idc = 1600;
			action = "[] spawn{call dvl_fnc_buyItem;}";
			text = "BUY";
			x = 0.336903 * safezoneW + safezoneX;
			y = 0.594039 * safezoneH + safezoneY;
			w = 0.0396723 * safezoneW;
			h = 0.0376157 * safezoneH;
		};
		class SellButton: RscButton
		{
			idc = 1601;

			text = "SELL";
			x = 0.336903 * safezoneW + safezoneX;
			y = 0.659867 * safezoneH + safezoneY;
			w = 0.0396723 * safezoneW;
			h = 0.0376157 * safezoneH;
		};
		class prices: RscListbox
		{
			idc = 1502;
			x = 0.627833 * safezoneW + safezoneX;
			y = 0.28371 * safezoneH + safezoneY;
			w = 0.0396723 * safezoneW;
			h = 0.413773 * safezoneH;
		};
	};
};

class adminMenu 
{
	idd = -1;
	enablemoving = false;

	class controls
	{
		class guiBackground: IGUIBack
		{
			idc = 2200;
			x = 0.314328 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.288822 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class txtMenu: RscText
		{
			idc = 1000;
			text = "BearZ Admin Menu";
			x = 0.314328 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.278507 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnClose: RscButton
		{
			idc = 1600;
			onMouseButtonClick = "closeDialog 2;";
			text = "X";
			x = 0.592836 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0103151 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,0};
			tooltip = "Close the menu";
		};
		class lstPlayers: RscListBox
		{
			idc = 1500;
			x = 0.324644 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class txtPlayers: RscText
		{
			idc = 1001;
			text = "Players";
			x = 0.319486 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0979933 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lstFeatures: RscListBox
		{
			idc = 1501;
			x = 0.427794 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.165041 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class txtFeatures: RscText
		{
			idc = 1002;
			text = "Features";
			x = 0.427794 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.165041 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnSelect: RscButton
		{
			idc = 1601;
			onMouseButtonClick = "[(lbCurSel 1500), (lbCurSel 1501)] call jjx_admin_exec;";
			text = "Execute";
			x = 0.324644 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnVariables: RscButton
		{
			idc = 1604;
			text = "Variable Menu";
			x = 0.391692 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnSpawn: RscButton
		{
			idc = 1606;
			text = "Spawn Menu";
			x = 0.463897 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btnDebug: RscButton
		{
			idc = 1605;
			onMouseButtonClick = "closeDialog 2;call jjx_fnc_debugMenu;";
			text = "Debug Menu";
			x = 0.530945 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class guiBackgroundRight: IGUIBack
		{
			idc = 2201;
			x = 0.613466 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class txtLoadouts: RscText
		{
			idc = 1005;
			text = "Loadouts";
			x = 0.613466 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lstLoadouts: RscListBox
		{
			idc = 1502;
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class edtLoadoutName: RscEdit
		{
			idc = 1400;
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnLoad: RscButton
		{
			idc = 1602;
			text = "Load";
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnSave: RscButton
		{
			idc = 1603;
			onMouseButtonClick = "call jjx_admin_save;";
			text = "Save";
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class debugMenu 
{
	idd = -10;
	enablemoving = false;

	class controls
	{
		class guiBackground: IGUIBack
		{
			idc = 2200;
		
			x = 0.355589 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.288822 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class txtDebugMenu: RscText
		{
			idc = 1000;
			text = "BearZ Debug Menu";
			x = 0.355589 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.278507 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnClose: RscButton
		{
			idc = 1600;
			text = "X";
			x = 0.634096 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0103151 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txtPlayers: RscText
		{
			idc = 1001;
			text = "Players";
			x = 0.365904 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lstPlayers: RscListbox
		{
			idc = 1500;
			x = 0.365904 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class txtDebug: RscText
		{
			idc = 1002;
			text = "Debug Console";
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.195987 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class guiBackgroundCode: IGUIBack
		{
			idc = 2201;
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.195987 * safezoneW;
			h = 0.253 * safezoneH;
			colorText[] = {0.133,0.133,0.133,1};
		};
		class edtCode: RscEdit
		{
			idc = 1400;
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.195987 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class btnLocal: RscButton
		{
			idc = 1601;
			onMouseButtonClick = "[(ctrlText 1400)] call jjx_debug_localExec;";
			text = "Local Execute";
			x = 0.572207 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "You execute this code";
		};
		class btnServer: RscButton
		{
			idc = 1602;
			onMouseButtonClick = "[(ctrlText 1400), 2] call jjx_debug_serverExec;";
			text = "Server Execute";
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Server execute this code";
		};
		class btnGlobal: RscButton
		{
			idc = 1603;
			onMouseButtonClick = "[(ctrlText 1400), 0] call jjx_debug_serverExec;";
			text = "Global Execute";
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "All players and server execute this code";
		};
		class btnRemote: RscButton
		{
			idc = 1604;
			onMouseButtonClick = "[(ctrlText 1400), (lbCurSel 1500)] call jjx_debug_remoteExec;";
			text = "Remote Execute";
			x = 0.365904 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Execute this code on the selected player";
		};
	};
};
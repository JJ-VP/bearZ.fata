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
			text = "BUY"; //--- ToDo: Localize;
			x = 0.336903 * safezoneW + safezoneX;
			y = 0.594039 * safezoneH + safezoneY;
			w = 0.0396723 * safezoneW;
			h = 0.0376157 * safezoneH;
		};
		class SellButton: RscButton
		{
			idc = 1601;

			text = "SELL"; //--- ToDo: Localize;
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
			x = 0.355589 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.288822 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class txtMenu: RscText
		{
			idc = 1000;
			text = "BearZ Admin Menu";
			x = 0.355589 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.278507 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnClose: RscButton
		{
			idc = 1600;
			text = "X";
			onMouseButtonClick = "closeDialog 2;";
			x = 0.634096 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0103151 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,0};
			tooltip = "Close the menu";
		};
		class lstPlayers: RscListbox
		{
			idc = 1500;
			x = 0.365904 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class txtPlayers: RscText
		{
			idc = 1001;
			text = "Players";
			x = 0.365904 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lstFeatures: RscListbox
		{
			idc = 1501;
			x = 0.448424 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.185671 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class txtFeatures: RscText
		{
			idc = 1002;
			text = "Features";
			x = 0.448425 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.185671 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnSelect: RscButton
		{
			idc = 1601;
			text = "Select";
			onMouseButtonClick = "[(lbCurSel 1500), (lbCurSel 1501)] call jjx_menu_exec;";
			x = 0.365904 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};
// --Fortification Open Construction Menu
#define EDN_FORTIFICATION_OPENCONSTRUCTIONMENU_KEY 20 // By default 20 = "T"
#define EDN_FORTIFICATION_OPENCONSTRUCTIONMENU_SHIFT false
#define EDN_FORTIFICATION_OPENCONSTRUCTIONMENU_CTRL false
#define EDN_FORTIFICATION_OPENCONSTRUCTIONMENU_ALT false
// --Fortification Open Construction Menu
#define EDN_FORTIFICATION_TURNLEFT_KEY 36 // By default 36 = "J"
#define EDN_FORTIFICATION_TURNLEFT_SHIFT false
#define EDN_FORTIFICATION_TURNLEFT_CTRL false
#define EDN_FORTIFICATION_TURNLEFT_ALT false
// --Fortification Open Construction Menu
#define EDN_FORTIFICATION_TURNRIGHT_KEY 38 // By default 38 = "L"
#define EDN_FORTIFICATION_TURNRIGHT_SHIFT false
#define EDN_FORTIFICATION_TURNRIGHT_CTRL false
#define EDN_FORTIFICATION_TURNRIGHT_ALT false
// --Fortification Open Construction Menu
#define EDN_FORTIFICATION_MINUSDISTANCE_KEY 37 // By default 37 = "K"
#define EDN_FORTIFICATION_MINUSDISTANCE_SHIFT false
#define EDN_FORTIFICATION_MINUSDISTANCE_CTRL false
#define EDN_FORTIFICATION_MINUSDISTANCE_ALT false
// --Fortification Open Construction Menu
#define EDN_FORTIFICATION_PLUSDISTANCE_KEY 23 // By default 23 = "I"
#define EDN_FORTIFICATION_PLUSDISTANCE_SHIFT false
#define EDN_FORTIFICATION_PLUSDISTANCE_CTRL false
#define EDN_FORTIFICATION_PLUSDISTANCE_ALT false

if (isDedicated) exitWith {};
if (!(isnil "edn_fortification_keydown")) exitwith {};

edn_fortification_zeus_array = [];

edn_fortification_array = [
["Sandbag Walls",//Done
["Land_BagFence_Short_F",[["jjx_sandbag",2]]],
["Land_BagFence_Long_F",[["jjx_sandbag",3]]],
["Land_BagFence_End_F",[["jjx_sandbag",1]]],
["Land_BagFence_Round_F",[["jjx_sandbag",3]]],
["Land_BagFence_Corner_F",[["jjx_sandbag",2]]],
["Land_SandbagBarricade_01_half_F",[["jjx_sandbag",2]]],
["Land_SandbagBarricade_01_F",[["jjx_sandbag",4]]],
["Land_SandbagBarricade_01_hole_F",[["jjx_sandbag",4]]]
],
["Walls",//Want more tbh
["Land_ConcreteWall_01_m_4m_F",[["jjx_Cinderblock",2],["jjx_Wirecoil",1]]],
["Land_ConcreteWall_01_m_8m_F",[["jjx_Cinderblock",4],["jjx_Wirecoil",2]]],
["Land_HBarrier_1_F",[["jjx_sandbag",1]]],
["Land_HBarrier_3_F",[["jjx_sandbag",3]]],
["Land_HBarrier_5_F",[["jjx_sandbag",5]]],
["Land_HBarrier_Big_F",[["jjx_sandbag",6]]],
["Land_HBarrierWall_corridor_F",[["jjx_sandbag",4]]],
["Land_HBarrierWall_corner_F",[["jjx_sandbag",4]]],
["Land_HBarrierWall6_F",[["jjx_sandbag",6]]],
["Land_HBarrierWall4_F",[["jjx_sandbag",4]]],
["Land_HBarrierTower_F",[["jjx_sandbag",6]]]
],
["Camo",//Not done
["CamoNet_BLUFOR_F",[["jjx_camoNet",1],["jjx_metalPipe",1]]],
["CamoNet_BLUFOR_open_F",[["jjx_camoNet",2],["jjx_metalPipe",2]]],
["CamoNet_BLUFOR_big_F",[["jjx_camoNet",4],["jjx_metalPipe",4]]],
["Land_BagBunker_Tower_F",[["jjx_camoNet",2],["jjx_sandbag",8]]]
],
["Decoration",//Not done
["Land_Campfire_F",[["jjx_Woodplank",2]]]
],
["Misc",//Not done
["rvg_dome_tent_blu",[["rvg_foldedTent_blue",1]]],
["rvg_dome_tent_grn",[["rvg_foldedTent",1]]],
["rvg_dome_tent_gry",[["rvg_foldedTent_grey",1]]],
["Land_Sleeping_bag_F",[["rvg_sleepingBag_Blue",1]]],
["Land_Sleeping_bag_blue_F",[["rvg_sleepingBag_Blue",1]]],
["Land_Sleeping_bag_brown_F",[["rvg_sleepingBag_Blue",1]]]
]
];

edn_fortification_categorieId = 0;
edn_fortification_classnameId = 0;
EDN_Fortification_alignToGround = false;
edn_fortification_inventoryHolder = objNull;

//Get Data from Userconfig
EDN_FORTIFICATION_KEYBINDINGS = [
[EDN_FORTIFICATION_OPENCONSTRUCTIONMENU_KEY,EDN_FORTIFICATION_OPENCONSTRUCTIONMENU_SHIFT,EDN_FORTIFICATION_OPENCONSTRUCTIONMENU_CTRL,EDN_FORTIFICATION_OPENCONSTRUCTIONMENU_ALT],
[EDN_FORTIFICATION_TURNLEFT_KEY,EDN_FORTIFICATION_TURNLEFT_SHIFT,EDN_FORTIFICATION_TURNLEFT_CTRL,EDN_FORTIFICATION_TURNLEFT_ALT],
[EDN_FORTIFICATION_TURNRIGHT_KEY,EDN_FORTIFICATION_TURNRIGHT_SHIFT,EDN_FORTIFICATION_TURNRIGHT_CTRL,EDN_FORTIFICATION_TURNRIGHT_ALT],
[EDN_FORTIFICATION_MINUSDISTANCE_KEY,EDN_FORTIFICATION_MINUSDISTANCE_SHIFT,EDN_FORTIFICATION_MINUSDISTANCE_CTRL,EDN_FORTIFICATION_MINUSDISTANCE_ALT],
[EDN_FORTIFICATION_PLUSDISTANCE_KEY,EDN_FORTIFICATION_PLUSDISTANCE_SHIFT,EDN_FORTIFICATION_PLUSDISTANCE_CTRL,EDN_FORTIFICATION_PLUSDISTANCE_ALT]
];

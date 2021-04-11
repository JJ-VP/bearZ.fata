/*
Author: Devils
Description: On list load make it look pretty
Return Value: nil
*/
// get the right list box
_display = findDisplay 420;
_sidebar = _display displayCtrl 1500;
//add all the options there
_sidebar lbAdd "Magazines";
_sidebar lbAdd "Medical";
_sidebar lbAdd "Items";
_sidebar lbAdd "Uniforms";
_sidebar lbAdd "Backpacks";
_sidebar lbAdd "Vests";
_sidebar lbAdd "HeadGear";
///set_resolution(w, h)
WIN_WID = argument0;
WIN_HEI = argument1;
WIN_HWID = WIN_WID >> 1;
WIN_HHEI = WIN_HEI >> 1;
window_set_size(WIN_WID, WIN_HEI);

var _divw = WIN_WID div 480;
var _divh = WIN_HEI div 300;

SCREEN_MULT = min(_divw, _divh);

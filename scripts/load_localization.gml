#define load_localization
/// load_localization(lang)
/*
    lang arugment is localization file name
    EX:) ko_kr will load localization from "ko_kr.json" file
*/

//var FILE = file_text_get(DIR_LANG + argument0);
var FILE = file_text_open_read(DIR_LANG + string(argument0));

// oh no
if (FILE == -1)
{
    show_debug_message("LOC :: LOCALIZATION FILE [" + DIR_LANG + string(argument0) + "] DOES NOT EXIST!!");
    return false;
}

// read from json
var _json = "";
while (!file_text_eof(FILE))
    _json += file_text_readln(FILE);
var _map = json_decode(_json);

ds_map_copy(global.lang, _map);
ds_map_destroy(_map);
file_text_close(FILE);

// Update pizza quip
with (oPIZZA)
    event_user(0);

// Set font if neccessary
if (font_exists(global.fntMain))
    font_delete(global.fntMain);
global.fntMain = font_add("data/" + global.lang[? "FONT"], 12, false, false, 0, 0);

// fallback font
show_debug_message("FNT : " + string(global.fntMain) + " | " + string(font_exists(global.fntMain)) + " | " + string(font_get_last(global.fntMain)));
if (global.fntMain == -1 || is_undefined(global.fntMain))
{
    show_debug_message("FALLBACK FONT!!");
    global.fntMain = font_add("data/neodgm.ttf", 12, false, false, 0, 0);
}

return true;

#define load_localization_abs
/// load_localization_abs(lang)
/*
    lang arugment is localization file name
    EX:) ko_kr will load localization from "ko_kr.json" file
*/

//var FILE = file_text_get(DIR_LANG + argument0);
var FILE = file_text_open_read(string(argument0));

// oh no
if (FILE == -1)
{
    show_debug_message("LOC :: LOCALIZATION FILE [" + string(argument0) + "] DOES NOT EXIST!!");
    return false;
}

// read from json
var _json = "";
while (!file_text_eof(FILE))
    _json += file_text_readln(FILE);
var _map = json_decode(_json);

ds_map_copy(global.lang, _map);
ds_map_destroy(_map);
file_text_close(FILE);

// Update pizza quip
with (oPIZZA)
    event_user(0);

// Set font if neccessary
if (font_exists(global.fntMain))
    font_delete(global.fntMain);
global.fntMain = font_add("data/" + global.lang[? "FONT"], 12, false, false, 0, 0);

// fallback font
if (global.fntMain == -1 || is_undefined(global.fntMain))
{
    show_debug_message("FALLBACK FONT!!");
    global.fntMain = font_add("data/neodgm.ttf", 12, false, false, 0, 0);
}

return true;

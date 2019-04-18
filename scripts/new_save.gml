#define new_save
var _volume255 = floor(0.5 * 255);

ini_open("options.ini");
ini_write_real("THE_RAT_ZONE", "sfx_volume", _volume255);
ini_write_real("THE_RAT_ZONE", "bgm_volume", _volume255);
ini_write_real("THE_RAT_ZONE", "win_wid", 1280);
ini_write_real("THE_RAT_ZONE", "win_hei", 720);
ini_write_real("THE_RAT_ZONE", "tutorial", 0);
ini_write_real("THE_CHILLZONE", "hiscore", 0);
ini_write_string("CALZONE", "BABA", "YOU");
ini_close();

#define new_lang_save
/// make lang list
var _file = file_text_open_write("lang_list.txt");
file_text_write_string(_file, "local_english.json");
file_text_writeln(_file);
file_text_write_string(_file, "local_korean.json");
file_text_writeln(_file);
file_text_close(_file);

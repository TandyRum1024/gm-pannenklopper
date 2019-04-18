var _READ = file_exists("options.ini");

if (_READ)
{
    var _volumeBGM, _volumeSFX;
    ini_open("options.ini");
    _volumeBGM = ini_read_real("THE_RAT_ZONE", "bgm_volume", floor(0.5 * 255));
    _volumeSFX = ini_read_real("THE_RAT_ZONE", "sfx_volume", floor(0.5 * 255));
    var _wid = ini_read_real("THE_RAT_ZONE", "win_wid", 1280);
    var _hei = ini_read_real("THE_RAT_ZONE", "win_hei", 720);
    global.introDone = ini_read_real("THE_RAT_ZONE", "tutorial", 0);
    global.gameHiScore = ini_read_real("THE_CHILLZONE", "hiscore", 0);
    ini_close();
    
    show_debug_message("VOL : " + string(_volumeBGM));
    show_debug_message("SCORE : " + string(global.gameHiScore));
    
    set_resolution(_wid, _hei);
    
    // assign new volume
    var _foof = 1 / 255;
    global.BGMvolume = _volumeBGM * _foof;// _foof;
    global.BGMvolumeTitle = global.BGMvolume * global.volumeModifier * 1.1;
    global.SFXvolume = _volumeSFX * _foof;
    
    // Load langauge
    var _file = file_text_open_read("lang_list.txt");
    var _map = -1;
    ds_list_clear(global.lang_file);
    ds_list_clear(global.lang_name);
    if (_file != -1)
    {
        while (!file_text_eof(_file))
        {
            var _ln = file_text_readln(_file);
            var _fname = string_delete(_ln, string_length(_ln) - 1, 2); // trim newline
            show_debug_message("LOCALE LOCATED : [" + _fname + "]");
            
            var _local = file_text_open_read(DIR_LANG + _fname);
            if (_local != -1)
            {
                var _json = "";
                while (!file_text_eof(_local))
                    _json += file_text_readln(_local);
                file_text_close(_local);
                _map = json_decode(_json);
                
                if (_map[? "LANG"] != undefined)
                {
                    ds_list_add(global.lang_file, _fname);
                    ds_list_add(global.lang_name, _map[? "LANG"]);
                    show_debug_message("LOCALE LOADED : [" + string(_map[? "LANG"]) + "]");
                }
                ds_map_destroy(_map);
            }
        }
        file_text_close(_file);
    }
    else
        new_lang_save();
    return true;
}
else // make new one
{
    var _file = file_text_open_read("lang_list.txt");
    if (_file == -1)
        new_lang_save();
    else
        file_text_close(_file);
    
    new_save();
    return false;
}

var _READ = file_exists("options.ini");

if (_READ)
{
    ini_open("options.ini");
    // assign new volume
    var _volumeBGM = floor(global.BGMvolume * 255), _volumeSFX = floor(global.SFXvolume * 255);
    
    show_debug_message("VOL : " + string(_volumeBGM));
    show_debug_message("SCORE : " + string(global.gameHiScore));
    
    ini_write_real("THE_RAT_ZONE", "sfx_volume", _volumeSFX);
    ini_write_real("THE_RAT_ZONE", "bgm_volume", _volumeBGM);
    ini_write_real("THE_RAT_ZONE", "win_wid", WIN_WID);
    ini_write_real("THE_RAT_ZONE", "win_hei", WIN_HEI);
    ini_write_real("THE_RAT_ZONE", "tutorial", global.introDone);
    ini_write_real("THE_CHILLZONE", "hiscore", global.gameHiScore);
    ini_write_string("CALZONE", "BABA", "YOU");
    ini_close();
}
else // make new one
{
    new_save();
}

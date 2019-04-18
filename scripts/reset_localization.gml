#define reset_localization
/// reset_localization()
/*
    Inits default localization -- The english
*/
show_debug_message("NEW LOCALE!");

if (ds_exists(global.lang, ds_type_map))
    ds_map_destroy(global.lang);
    
global.lang = ds_map_create();
load_localization_abs("data/local_temp.json");

// save to file
file_copy("data/local_temp.json", DIR_LANG + "local_english.json");
file_copy("data/local_korean.json", DIR_LANG + "local_korean.json");
new_lang_save();
load_save();

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
/*
var _locfile = file_text_open_write(DIR_LANG + "local_english.json");
file_text_write_string(_locfile, _json);
file_text_close(_locfile);
*/

#define loc_unused
/// METADATA??
LOC[? "FONT"] = "neodgm.ttf";
LOC[? "LANG"] = "ENGLISH";

/// A] TITLE
LOC[? "TITLE_BRAG"] = "ENTERTAINMENT PROGRAM FOR CULT OF JABRILS GAMEJAM#PROGRAM BY ZIK@2019"; // header info
LOC[? "TITLE_TEXT"] = "PANNEN KLOPPER"; // game title
LOC[? "TITLE_SCORE"] = "HI-SCORE : "; // HI-SCORE
LOC[? "TITLE_KEYS"] = "press [Z] key to schüt#[F1] for settings"; // input info

/// B] UI
LOC[? "SETTINGS_KEYS_TOP"] = "[F1] : SAVE & RETURN | [F9] : DELETE DATA";
LOC[? "SETTINGS_KEYS_BOTTOM"] = "[UP/DOWN] to navigate#[+ OR RIGHT] & [- OR LEFT] to adjust";
LOC[? "SETTINGS_DELETE"] = "Data deleted!";
LOC[? "SETTINGS_VOLUME_MUSIC"] = "MUSIC VOLUME : ";
LOC[? "SETTINGS_VOLUME_SOUND"] = "SOUND VOLUME : ";
LOC[? "SETTINGS_RESOLUTION"] = "RESOLUTION : ";

LOC[? "INGAME_READY"] = "READY!";
LOC[? "INGAME_SCORE"] = "SCORE : ";
LOC[? "INGAME_HISCORE"] = "HI-SCORE : ";
LOC[? "INGAME_OHNO"] = "EL DORO GOT EATEN!";

LOC[? "END_TEXT"] = "YOU HAVE FAILED.#EL DORO IS NOT HAPPY.#==========#PRESS [R] KEY TO RESET, [ESC] KEY TO TITLE";
LOC[? "END_SCORE"] = "FINAL SCORE : ";
LOC[? "END_HISCORE"] = "HI-SCORE : ";
LOC[? "END_NEW_BEST"] = "NEW HI-SCORE!";

/// C] EL DORO
LOC[? "DORO_INTRO_1_2"] = "Use [ARROW KEYS] to flock around,#[Z] key to schüt..#Try it!";
LOC[? "DORO_INTRO_1_1"] = "Hey kid... My name is EL DORO the GOD#and those hungry gamers are trying to eat me alive..#Can you keep those blokes away from me?";

LOC[? "DORO_INTRO_2_1"] = "Jåhahahåå.. Finally.. A mankind that can serve me properly.";
LOC[? "DORO_INTRO_2_2"] = "See that big boy frying pan up there?#You can shoot into it & ricochet the bullets to#make them STYLISH and blast those dinks with STYLE!!";
LOC[? "DORO_INTRO_2_3"] = "I higly admire that refreshing sound of ricochet...";
LOC[? "DORO_INTRO_2_4"] = "But be careful though, That boy is *REALLY HEAVY*..#Get your head hit by that thing then you're gonna'#SPLAT into one big messy pancake! (and die horribly.)";
LOC[? "DORO_INTRO_2_5"] = "... So that's it, Utilize your BULLETS and FRYING PAN#And keep those GAMERS away#And keep me alive!";
LOC[? "DORO_INTRO_2_6"] = "And now, I'm going to let this bad boy drop..#Watch your Noggin there kid!";

LOC[? "DORO_OUCH_1"] = "Can you guys stop munching on me please";
LOC[? "DORO_OUCH_2"] = "ow";
LOC[? "DORO_OUCH_3"] = "NJÖH IT HURRRRRRTS";
LOC[? "DORO_OUCH_4"] = "NICE JOB KID";
LOC[? "DORO_OUCH_5"] = "bummer";
LOC[? "DORO_OUCH_6"] = "OAGH";
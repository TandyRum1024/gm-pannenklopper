///bgm_set(mus, time)
if (argument0 != -1)
{
    global.BGM = audio_play_sound(argument0, 0, 1);
    audio_sound_gain(global.BGM, 0, 0);
    audio_sound_gain(global.BGM, global.BGMvolume * global.volumeModifier, argument1);
    
    global.BGMPlaying = true;
}
else
{
    audio_sound_gain(global.BGM, 0, argument1);
    
    global.BGMPlaying = false;
}


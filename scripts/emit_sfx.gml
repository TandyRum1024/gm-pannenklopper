///emit_sfx(sound, volume, pitch)
var _sfx = audio_play_sound(argument0, 0, 0);
audio_sound_gain(_sfx, argument1 * global.SFXvolume, 0);
audio_sound_pitch(_sfx, argument2);

return _sfx;

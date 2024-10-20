function scr_music()
{
    var snd;
    
    snd = argument[irandom(argument_count - 1)];
    global.backgroundmusic = audio_play_sound(snd, 10, true);
}

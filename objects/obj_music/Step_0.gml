audio_group_set_gain(sfx_hidingalarm, global.musicvolume, 0);
audio_group_set_gain(mus_butcher, global.sfxvolume, 0);

if (room == Titlescreen)
{
    audio_master_gain(global.menuvolume);
    global.menuvolume -= 0.00015;
}

audio_sound_pitch(global.backgroundmusic, musPitch);

if (musSlowdown == 1)
{
    audio_sound_gain(ambiencemus, 0.6 * global.musicvolume, 2000);
    audio_sound_gain(mus, 0, 2000);
}
else
{
    audio_sound_gain(ambiencemus, 0, 2000);
    audio_sound_gain(mus, 0.6 * global.musicvolume, 2000);
}

if (room != butcher_4)
{
    if (musSlowdown == 0)
    {
        musSlowdown = -1;
        audio_sound_gain(mus, 0.6 * global.musicvolume, 5);
    }
}

if (!obj_pause.pause)
{
    if (!audio_is_playing(mus) && mus != -4)
    {
        audio_stop_sound(global.backgroundmusic);
        scr_music(mus);
        
        if (muscontinue)
        {
            audio_sound_set_track_position(global.backgroundmusic, fdoff);
            muscontinue = 0;
        }
    }
}
else if (!audio_is_playing(mus_pause))
{
    audio_stop_sound(global.backgroundmusic);
    scr_music(mus_pause);
}

if (!audio_is_playing(mus_pause))
    fdoff = audio_sound_get_track_position(global.backgroundmusic);

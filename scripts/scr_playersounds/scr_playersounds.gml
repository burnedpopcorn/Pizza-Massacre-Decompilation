function scr_playersounds()
{
    if (state == states.dash && sprite_index != spr_sprintstart && !obj_pause.pause && room != tutorialskip_1)
    {
        if (onground)
        {
            if (!audio_is_playing(sfx_dash))
                scr_soundeffect(sfx_dash);
        }
        else
        {
            audio_stop_sound(sfx_dash);
        }
    }
    else
    {
        audio_stop_sound(sfx_dash);
    }
}

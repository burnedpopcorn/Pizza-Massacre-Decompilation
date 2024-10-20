var i, b;

roomname = room_get_name(room);
global.menuvolume = global.sfxvolume;
i = 0;

while (i < array_length(music_array))
{
    b = music_array[i];
    
    if (room == b[0])
    {
        mus = b[1];
        break;
    }
    else
    {
        i++;
        continue;
    }
}

if (room == butcher_4)
{
    ambiencemus = audio_play_sound(mus_ambience, 1, true);
    audio_sound_gain(ambiencemus, 0, 0);
}

if (string_letters(roomname) == "butcher" && mus != mus_butcher)
{
    mus = mus_butcher;
    muscontinue = 1;
}

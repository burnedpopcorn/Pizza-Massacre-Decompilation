scr_getinput();

if (key_up2 || keyboard_check_pressed(vk_up))
{
    if (optionselect > 0)
        optionselect -= 1;
    
    scr_soundeffect(sfx_footstep);
}

if (key_down2 || keyboard_check_pressed(vk_down))
{
    if (optionselect < 1)
        optionselect += 1;
    
    scr_soundeffect(sfx_footstep);
}

if (key_start && selectable)
{
    ini_open("saveDataPM.ini");
    ini_write_real("Music", "Volume", global.musicvolume);
    ini_write_real("SFX", "Volume", global.sfxvolume);
    ini_close();
    instance_destroy();
}

switch (optionselect)
{
    case 0:
        if (-key_left2 && global.musicvolume > 0)
            global.musicvolume -= 0.1;
        
        if (key_right2 && global.musicvolume < 1)
            global.musicvolume += 0.1;
        
        break;
    
    case 1:
        if (-key_left2 && global.sfxvolume > 0)
            global.sfxvolume -= 0.1;
        
        if (key_right2 && global.sfxvolume < 1)
            global.sfxvolume += 0.1;
        
        break;
}

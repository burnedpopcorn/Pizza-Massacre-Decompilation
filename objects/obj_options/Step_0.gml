if (room == Titlescreen)
{
    instance_deactivate_all(true);
    instance_activate_object(self);
    instance_activate_object(obj_music);
    instance_activate_object(obj_camera);
    instance_activate_object(obj_pause);
    instance_activate_object(obj_keyconfig);
    instance_activate_object(obj_audioconfig);
}

if (!instance_exists(obj_keyconfig) && !instance_exists(obj_audioconfig))
{
    scr_getinput();
    
    if (key_up2 || keyboard_check_pressed(vk_up))
    {
        scr_soundeffect(sfx_footstep);
        
        if (optionselect > 0)
            optionselect -= 1;
    }
    
    if (key_down2 || keyboard_check_pressed(vk_down))
    {
        scr_soundeffect(sfx_footstep);
        
        if (optionselect < 3)
            optionselect += 1;
    }
    
    if (key_start)
    {
        instance_activate_all();
        instance_destroy();
    }
    
    switch (optionselect)
    {
        case 0:
            if (key_left2 || keyboard_check_pressed(vk_left))
            {
                option_fs = false;
                ini_open("saveDataPM.ini");
                global.fullscreen = ini_write_real("Options", "Fullscreen", 0);
                show_debug_message("option saved!");
                ini_close();
                window_set_fullscreen(false);
            }
            
            if (key_right2 || keyboard_check_pressed(vk_right))
            {
                option_fs = true;
                ini_open("saveDataPM.ini");
                global.fullscreen = ini_write_real("Options", "Fullscreen", 1);
                show_debug_message("option saved!");
                ini_close();
                window_set_fullscreen(true);
            }
            
            break;
        
        case 1:
            if (key_left2 || keyboard_check_pressed(vk_left))
            {
                option_st = false;
                ini_open("saveDataPM.ini");
                global.speedruntimer = ini_write_real("Options", "Speedrun Timer", 0);
                show_debug_message("option saved!");
                ini_close();
                global.speedruntimer = 0;
            }
            
            if (key_right2 || keyboard_check_pressed(vk_right))
            {
                option_st = true;
                ini_open("saveDataPM.ini");
                global.speedruntimer = ini_write_real("Options", "Speedrun Timer", 1);
                show_debug_message("option saved!");
                ini_close();
                global.speedruntimer = 1;
            }
            
            break;
        
        case 2:
            if (key_jump)
            {
                instance_create_depth(x, y, -7, obj_keyconfig);
                scr_soundeffect(sfx_footstep);
            }
            
            break;
        
        case 3:
            if (key_jump)
            {
                instance_create_depth(x, y, -7, obj_audioconfig);
                scr_soundeffect(sfx_footstep);
            }
            
            break;
    }
}

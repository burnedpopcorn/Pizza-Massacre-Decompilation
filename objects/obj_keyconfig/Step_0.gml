scr_getinput();

if (selecting == -1)
{
    if (key_up2 || keyboard_check_pressed(vk_up))
    {
        if (keyselect > 0)
            keyselect -= 1;
        
        scr_soundeffect(sfx_footstep);
    }
    
    if (key_down2 || keyboard_check_pressed(vk_down))
    {
        if (keyselect < 7)
            keyselect += 1;
        
        scr_soundeffect(sfx_footstep);
    }
    
    if (-key_left2)
        keyselect = -1;
}

if (key_jump && selecting == -1)
{
    if (selectable)
    {
        switch (keyselect)
        {
            case -1:
                ini_open("saveDataPM.ini");
                ini_write_string("KeyPress", "Up", global.key_up);
                ini_write_string("KeyPress", "Down", global.key_down);
                ini_write_string("KeyPress", "Left", global.key_left);
                ini_write_string("KeyPress", "Right", global.key_right);
                ini_write_string("KeyPress", "Jump", global.key_jump);
                ini_write_string("KeyPress", "Attack", global.key_attack);
                ini_write_string("KeyPress", "Dash", global.key_dash);
                ini_close();
                instance_destroy();
                break;
            
            case 0:
                selecting = keyselect;
                global.key_up = -1;
                selectable = 0;
                alarm[0] = 5;
                break;
            
            case 1:
                selecting = keyselect;
                global.key_down = -1;
                selectable = 0;
                alarm[0] = 5;
                break;
            
            case 2:
                selecting = keyselect;
                global.key_left = -1;
                selectable = 0;
                alarm[0] = 5;
                break;
            
            case 3:
                selecting = keyselect;
                global.key_right = -1;
                selectable = 0;
                alarm[0] = 5;
                break;
            
            case 4:
                selecting = keyselect;
                global.key_jump = -1;
                selectable = 0;
                alarm[0] = 5;
                break;
            
            case 5:
                selecting = keyselect;
                global.key_attack = -1;
                selectable = 0;
                alarm[0] = 5;
                break;
            
            case 6:
                selecting = keyselect;
                global.key_dash = -1;
                selectable = 0;
                alarm[0] = 5;
                break;
            
            case 7:
                selecting = keyselect;
                global.key_start = -1;
                selectable = 0;
                alarm[0] = 5;
                break;
        }
    }
}

if (selecting != -1 && selectable)
{
    switch (selecting)
    {
        case 0:
            if (keyboard_check_pressed(vk_anykey))
            {
                global.key_up = keyboard_key;
                selecting = -1;
            }
            
            break;
        
        case 1:
            if (keyboard_check_pressed(vk_anykey))
            {
                global.key_down = keyboard_key;
                selecting = -1;
            }
            
            break;
        
        case 2:
            if (keyboard_check_pressed(vk_anykey))
            {
                global.key_left = keyboard_key;
                selecting = -1;
            }
            
            break;
        
        case 3:
            if (keyboard_check_pressed(vk_anykey))
            {
                global.key_right = keyboard_key;
                selecting = -1;
            }
            
            break;
        
        case 4:
            if (keyboard_check_pressed(vk_anykey))
            {
                global.key_jump = keyboard_key;
                selecting = -1;
            }
            
            break;
        
        case 5:
            if (keyboard_check_pressed(vk_anykey))
            {
                global.key_attack = keyboard_key;
                selecting = -1;
            }
            
            break;
        
        case 6:
            if (keyboard_check_pressed(vk_anykey))
            {
                global.key_dash = keyboard_key;
                selecting = -1;
            }
            
            break;
        
        case 7:
            if (keyboard_check_pressed(vk_anykey))
            {
                global.key_start = keyboard_key;
                selecting = -1;
            }
            
            break;
    }
}

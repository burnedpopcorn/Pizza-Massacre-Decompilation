scr_getinput();

if (key_jump && !lock)
{
    flash = 1;
    global.menuvolume = 1;
    
    with (obj_peptitle)
    {
        sprite_index = spr_pepmenu_trans;
        image_index = 0;
    }
    
    layer_set_visible(lay_id, true);
    layer_set_visible(lay_id2, false);
    darkalpha = 0.7;
    alarm[5] = 5;
    alarm[6] = 25;
    alarm[7] = 35;
    
    with (obj_music)
        mus = mus_menu;
    
    lock = 1;
}

if (lock && !instance_exists(obj_options))
{
    if (!start)
    {
        titley = lerp(titley, 480, 0.12);
        
        with (obj_gamejoltLogIn)
            y = lerp(y, 42, 0.12);
    }
    else
    {
        titley = lerp(titley, 1020, 0.12);
        
        with (obj_gamejoltLogIn)
            y = lerp(y, -160, 0.12);
    }
    
    if (optselected != -1 && !start)
    {
        optselected += (key_left2 + key_right2);
        optselected = clamp(optselected, 0, 2);
        
        if (os != optselected)
        {
            layer_sprite_index(spr_id, optselected);
            os = optselected;
        }
    }
    
    if (key_jump && !start)
    {
        switch (optselected)
        {
            case 0:
                start = 1;
                alarm[0] = 30;
                alarm[3] = 100;
                
                with (obj_camera)
                    alarm[0] = 50;
                
                break;
            
            case 1:
                instance_create_depth(x, y, -6, obj_options);
                break;
            
            case 2:
                start = 1;
                alarm[8] = 50;
                break;
        }
    }
}
else
{
    darkalpha += 0.00005;
    
    if (darkalpha >= 1.1)
        game_end();
}

layer_sprite_alpha(spr_id2, darkalpha);

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

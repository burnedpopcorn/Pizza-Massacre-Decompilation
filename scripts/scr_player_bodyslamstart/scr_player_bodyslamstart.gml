function scr_player_bodyslamstart()
{
    mask_index = spr_player_mask;
    move = key_left + key_right;
    
    if (!onground)
    {
        hsp = move * movespeed;
        
        if (move != xscale && movespeed != 0)
            movespeed -= 0.05;
        
        if (scr_solid(x + hsp, y))
        {
            movespeed = 0;
            mach2 = 0;
        }
        
        if (move != 0 && movespeed < 7)
            movespeed += 0.25;
        
        if (movespeed > 7)
            movespeed -= 0.05;
        
        if (move != 0)
            xscale = move;
        
        if (floor(image_index) > 3)
        {
            if (!instance_exists(obj_trail))
            {
                with (instance_create_depth(x, y, 2, obj_trail))
                {
                    sprite_index = other.sprite_index;
                    image_speed = other.image_speed;
                    image_xscale = other.xscale;
                }
            }
        }
    }
    
    image_speed = 0.4;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = states.bodyslamfall;
        sprite_index = spr_bodyslamfall;
        image_index = 0;
    }
}

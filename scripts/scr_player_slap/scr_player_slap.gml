function scr_player_slap()
{
    mask_index = spr_player_mask;
    move = key_left + key_right;
    hsp = move * movespeed;
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < 4)
            movespeed += 0.5;
        else if (floor(movespeed) == 4)
            movespeed = 4;
    }
    else
    {
        movespeed = 0;
    }
    
    if (onground)
    {
        if (move != 0)
        {
            if (movespeed < 2)
                image_speed = 0.1;
            else if (movespeed > 3 && movespeed < 4)
                image_speed = 0.2;
            else
                image_speed = 0.275;
            
            if (sprite_index == spr_slap1 || sprite_index == spr_slap1air)
                sprite_index = spr_slap1walk;
            
            if (sprite_index == spr_slap2 || sprite_index == spr_slap2air)
                sprite_index = spr_slap2walk;
            
            if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope) && xscale == move && !place_meeting(x, y + 1, obj_slope))
                movespeed = 0;
        }
        else
        {
            if (sprite_index == spr_slap1walk || sprite_index == spr_slap1air)
                sprite_index = spr_slap1;
            
            if (sprite_index == spr_slap2walk || sprite_index == spr_slap2air)
                sprite_index = spr_slap2;
            
            image_speed = 0.25;
        }
    }
    else
    {
        image_speed = 0.25;
    }
    
    if (movespeed > 6)
        movespeed -= 0.1;
    
    if (floor(image_index) == (image_number - 1))
    {
        if (key_attack2)
        {
            slaphand *= -1;
            
            if (slaphand == 1)
            {
                if (onground)
                {
                    if (move != 0)
                        sprite_index = spr_slap1walk;
                    else
                        sprite_index = spr_slap1;
                }
                else
                {
                    sprite_index = spr_slap1air;
                }
            }
            
            if (slaphand == -1)
            {
                if (onground)
                {
                    if (move != 0)
                        sprite_index = spr_slap2walk;
                    else
                        sprite_index = spr_slap2;
                }
                else
                {
                    sprite_index = spr_slap2air;
                }
            }
            
            image_index = 0;
        }
        else
        {
            state = states.normal;
            sprite_index = spr_idle;
            image_index = 0;
        }
    }
    
    if (onground)
    {
        if (key_jump)
        {
            vsp = -11;
            state = states.jump;
            jumpAnim = true;
            jumpstop = false;
            sprite_index = spr_jump;
            image_index = 0;
        }
    }
    
    if (key_down && onground)
    {
        state = states.crouch;
        
        if (movespeed > 0)
            movespeed = 3;
        
        sprite_index = spr_crouch;
        image_index = 0;
    }
    
    if (place_meeting(x, y, obj_ladder) && key_up)
    {
        state = states.climb;
        
        with (instance_place(x, y, obj_ladder))
        {
            other.stairsID = id;
            
            if (object_index == obj_stairs)
                other.on_stairs = 1;
        }
    }
    
    if (!instance_exists(obj_walkcloud) && move != 0 && onground)
        instance_create_depth(x, y + 8, -3, obj_walkcloud);
}

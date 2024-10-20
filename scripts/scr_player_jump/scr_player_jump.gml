function scr_player_jump()
{
    mask_index = spr_player_mask;
    image_speed = 0.25;
    move = key_left + key_right;
    
    if (wall_jumping)
    {
        if (jumpAnim)
        {
            xscale *= -1;
            jumpAnim = 0;
        }
        
        move = xscale;
    }
    
    if (move != 0)
    {
        if (!wall_jumping)
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
    
    hsp = move * movespeed;
    
    if (!jumpstop)
    {
        if (!key_jump2 && vsp < 0.5)
        {
            vsp /= 20;
            jumpstop = true;
        }
        else if (scr_solid(x, y - 1) && !jumpAnim)
        {
            vsp = grav;
            jumpstop = true;
        }
    }
    
    if (key_attack2)
    {
        state = states.slap;
        
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
        
        slaphand *= -1;
        image_index = 0;
    }
    
    if (!wall_jumping)
    {
        if ((place_meeting(x + 1, y, obj_wall) && xscale == 1) || (place_meeting(x - 1, y, obj_wall) && xscale == -1))
        {
            walljumptimer--;
            
            if (walljumptimer <= 0 && vsp > 0)
            {
                if (!place_meeting(x + hsp, y, obj_destroyables) && !scr_slope() && !onground)
                {
                    state = states.walljump;
                    sprite_index = spr_player_walljump;
                    image_index = 0;
                    vsp = 1;
                    walljumptimer = 5;
                    alarm[2] = -1;
                }
            }
        }
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_bodyslambounce)
    {
        jumpAnim = false;
        sprite_index = spr_fall;
    }
    
    if (onground && vsp > 0)
    {
        if (room == PP_1 && !global.firstfall)
            global.firstfall = 1;
        
        jumpAnim = false;
        jumpstop = false;
        wall_jumping = 0;
        sprite_index = spr_land;
        state = states.normal;
    }
    
    if (key_down2 && !onground)
    {
        state = states.bodyslamstart;
        sprite_index = spr_bodyslamstart;
        image_index = 0;
        vsp = -4;
        movespeed = 2;
        scr_soundeffect(sfx_groundpoundstart);
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
    
    if (movespeed > 6)
        movespeed -= 0.1;
}

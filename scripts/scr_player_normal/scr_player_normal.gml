function scr_player_normal()
{
    mask_index = spr_player_mask;
    move = key_left + key_right;
    hsp = move * movespeed;
    
    if (move != 0)
    {
        xscale = move;
        sprite_index = spr_walk;
        
        if (movespeed < 4)
            movespeed += 0.5;
        else if (floor(movespeed) == 4)
            movespeed = 4;
        
        if (movespeed < 2)
            image_speed = 0.1;
        else if (movespeed > 3 && movespeed < 4)
            image_speed = 0.2;
        else
            image_speed = 0.275;
    }
    else
    {
        if (sprite_index != spr_land && sprite_index != spr_crouchend)
            sprite_index = spr_idle;
        
        image_speed = 0.2;
        movespeed = 0;
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
            
            with (instance_create_depth(x, y + 8, -3, obj_walkcloud))
                sprite_index = spr_jumpsmoke;
            
            scr_soundeffect(sfx_jump);
        }
    }
    else
    {
        state = states.jump;
        sprite_index = spr_player_fall;
        image_index = 0;
    }
    
    if (movespeed > 6)
        movespeed -= 0.1;
    
    if (key_down && onground)
    {
        state = states.crouch;
        
        if (movespeed > 0)
            movespeed = 3;
        
        sprite_index = spr_crouch;
        image_index = 0;
    }
    
    if (key_dash)
    {
        state = states.dash;
        movespeed = 4;
        sprite_index = spr_sprintstart;
        image_index = 0;
        dashAnim = 1;
        dashing = 1;
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
    
    if (sprite_index == spr_land || sprite_index == spr_crouchend)
    {
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_idle;
            image_index = 0;
        }
    }
    
    if (!instance_exists(obj_walkcloud) && move != 0 && onground)
    {
        with (instance_create_depth(x, y + 8, -3, obj_walkcloud))
        {
            scr_soundeffect(sfx_footstep);
            image_xscale = other.xscale;
        }
    }
}

function scr_player_dashattack()
{
    mask_index = spr_player_mask;
    move = key_left + key_right;
    hsp = xscale * movespeed;
    
    if (wall_jumping)
    {
        if (jumpAnim == true)
            jumpAnim = false;
        
        move = xscale;
        hsp = xscale * movespeed;
    }
    
    image_speed = 0.25;
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_sprint;
        state = states.dash;
        image_index = 0;
    }
    
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
    
    if (onground)
    {
        if (movespeed < 11)
            movespeed += 0.6;
    }
    
    if (movespeed > 6)
    {
        if (!instance_exists(obj_trail))
        {
            with (instance_create_depth(x, y, 2, obj_trail))
            {
                image_blend = choose(c_red, c_blue, c_green);
                sprite_index = other.sprite_index;
                image_speed = other.image_speed;
                image_xscale = other.xscale;
            }
        }
    }
    
    if ((place_meeting(x + hsp, y, obj_wall) && !scr_slope() && scr_solid_slope(x + sign(hsp), y)) || place_meeting(x + sign(hsp), y, obj_wall))
    {
        if (onground && !place_meeting(x + hsp, y, obj_destroyables))
        {
            state = states.bump;
            sprite_index = spr_wallsplat;
            image_index = 0;
            dashing = 0;
        }
    }
    
    if ((place_meeting(x + 1, y, obj_wall) && xscale == 1) || (place_meeting(x - 1, y, obj_wall) && xscale == -1))
    {
        if (!place_meeting(x + hsp, y, obj_destroyables) && !scr_slope() && !onground)
        {
            state = states.walljump;
            sprite_index = spr_player_walljump;
            image_index = 0;
            vsp = -1;
        }
    }
    
    if (key_jump)
        input_buffer_walljump = 0;
    
    if (!key_dash)
    {
        state = states.dashskid;
        sprite_index = spr_sprintend;
        image_index = 0;
        dashAnim = 1;
        dashing = 0;
    }
    
    if (place_meeting(x, y, obj_ladder) && key_up)
    {
        state = states.climb;
        dashing = 0;
        
        with (instance_place(x, y, obj_ladder))
        {
            other.stairsID = id;
            
            if (object_index == obj_stairs)
                other.on_stairs = 1;
        }
    }
    
    if (key_jump && onground)
    {
        sprite_index = spr_sprintjump;
        image_index = 0;
        state = states.dash;
        vsp = -11;
        scr_soundeffect(sfx_jump);
    }
    
    if (key_down && onground)
    {
        state = states.crouch;
        sprite_index = spr_crouch;
        image_index = 0;
        dashing = 0;
    }
    
    if (!instance_exists(obj_dashcloud) && onground)
    {
        with (instance_create_depth(x, y + 8, -3, obj_dashcloud))
            image_xscale = other.xscale;
    }
}

function scr_player_dash()
{
    mask_index = spr_player_mask;
    move = key_left + key_right;
    hsp = xscale * movespeed;
    
    if (wall_jumping)
    {
        if (jumpAnim == true)
        {
            xscale *= -1;
            jumpAnim = false;
        }
        
        move = xscale;
        hsp = xscale * movespeed;
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
    
    if (onground && sprite_index != spr_sprintstart && sprite_index != spr_sprintjump)
    {
        if (wall_jumping)
            wall_jumping = false;
        
        sprite_index = spr_sprint;
    }
    
    if (sprite_index == spr_sprintstart && floor(image_index) == (image_number - 1))
    {
        image_index = 0;
        sprite_index = spr_sprint;
    }
    
    if (sprite_index == spr_sprintjump && floor(image_index) == (image_number - 1))
    {
        image_index = 0;
        sprite_index = spr_sprint;
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
    
    if (sprite_index != spr_sprintjump)
        image_speed = 0.35;
    else
        image_speed = 0.25;
    
    if (onground)
    {
        jumpstop = true;
        
        if (movespeed < 10)
            movespeed += 0.4;
        
        if (movespeed > 10)
            movespeed -= 0.4;
    }
    
    if (movespeed > 6)
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
    
    if (key_attack)
    {
        state = states.dashattack;
        sprite_index = spr_player_dashattack;
        image_index = 0;
    }
    
    if ((place_meeting(x + hsp, y, obj_wall) && !scr_slope() && scr_solid_slope(x + sign(hsp), y)) || place_meeting(x + sign(hsp), y, obj_wall))
    {
        if (onground && !place_meeting(x + hsp, y, obj_destroyables))
        {
            wall_jumping = 0;
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
    
    if (move == -xscale && onground)
    {
        state = states.dashskid;
        sprite_index = spr_sprintslidebooststart;
        image_index = 0;
        dashAnim = 1;
    }
    
    if (!key_dash)
    {
        if (onground)
        {
            state = states.dashskid;
            sprite_index = spr_sprintend;
            image_index = 0;
            dashAnim = 1;
            dashing = 0;
            movespeed -= 2;
        }
        else
        {
            state = states.jump;
            sprite_index = spr_fall;
            image_index = 0;
            dashAnim = 1;
            dashing = 0;
        }
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
        vsp = -11;
        jumpstop = false;
        
        with (instance_create_depth(x, y + 8, -3, obj_walkcloud))
            sprite_index = spr_jumpsmoke;
        
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

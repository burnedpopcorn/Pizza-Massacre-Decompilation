function scr_player_crouch()
{
    mask_index = spr_player_crouchmask;
    move = key_left + key_right;
    hsp = move * movespeed;
    
    if (move != 0)
    {
        xscale = move;
        sprite_index = spr_crouchwalk;
        
        if (movespeed < 3)
            movespeed += 0.5;
        else if (floor(movespeed) == 3)
            movespeed = 3;
        
        if (movespeed < 1)
            image_speed = 0.1;
        else if (movespeed > 2 && movespeed < 3)
            image_speed = 0.2;
        else
            image_speed = 0.275;
        
        if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope) && xscale == move && !place_meeting(x, y + 1, obj_slope))
            movespeed = 0;
    }
    else
    {
        sprite_index = spr_crouchidle;
        image_speed = 0.2;
        movespeed = 0;
    }
    
    if (onground)
    {
        if (key_jump && !scr_solid_player(x, y - 16) && !scr_solid_player(x, y - 32))
        {
            vsp = -8;
            state = states.crouchjump;
            jumpAnim = true;
            jumpstop = false;
            sprite_index = spr_crouchjump;
            image_index = 0;
        }
        
        if (!key_down && !scr_solid_player(x, y - 16) && !scr_solid_player(x, y - 32))
        {
            state = states.normal;
            sprite_index = spr_crouchend;
            image_index = 0;
        }
    }
    else
    {
        state = states.crouchjump;
        sprite_index = spr_crouchjump;
        image_index = 0;
    }
    
    if (movespeed > 6)
        movespeed -= 0.1;
    
    if (sprite_index == spr_crouch && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_idle;
        image_index = 0;
    }
}

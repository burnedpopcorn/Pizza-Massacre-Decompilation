function scr_player_crouchjump()
{
    mask_index = spr_player_crouchmask;
    image_speed = 0.25;
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
    
    if (floor(image_index) == (image_number - 1))
    {
        jumpAnim = false;
        sprite_index = spr_crouchfall;
    }
    
    if (onground && vsp > 0)
    {
        jumpAnim = false;
        jumpstop = false;
        sprite_index = spr_crouchland;
        state = states.crouch;
    }
    
    if (movespeed > 6)
        movespeed -= 0.1;
}

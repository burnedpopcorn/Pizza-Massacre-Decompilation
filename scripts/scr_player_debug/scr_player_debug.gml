function scr_player_debug()
{
    mask_index = spr_player_mask;
    move = key_left + key_right;
    hsp = 0;
    vsp = 0;
    hspeed = move * movespeed;
    
    if (move != 0)
        movespeed = 6;
    else
        movespeed = 0;
    
    if (key_up)
        vspeed = -4;
    else if (key_down)
        vspeed = 4;
    else
        vspeed = 0;
}

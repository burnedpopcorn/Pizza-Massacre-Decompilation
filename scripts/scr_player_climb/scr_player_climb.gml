function scr_player_climb()
{
    movespeed = 4;
    vmovespeed = 4;
    move = key_left + key_right;
    vmove = -key_up + key_down;
    mask_index = spr_player_mask;
    image_speed = 0.25;
    hsp = 0;
    vsp = 0;
    jumpAnim = 1;
    
    if (stairsID.image_xscale != 3)
        x = lerp(x, stairsID.x + 36, 0.12);
    else
        x = lerp(x, stairsID.x + 52, 0.12);
    
    vsp = vmove * vmovespeed;
    
    if (!place_meeting(x, y, obj_stairs))
    {
        if (vmove == 1)
            sprite_index = spr_ladderdown;
        
        if (vmove == 0)
            sprite_index = spr_ladderidle;
        
        if (vmove == -1)
            sprite_index = spr_ladderclimb;
    }
    else
    {
        if (vmove == 1)
            sprite_index = spr_stairdown;
        
        if (vmove == 0 && sprite_index == spr_stairdown)
            sprite_index = spr_stairdownidle;
        
        if (vmove == -1)
            sprite_index = spr_stairup;
        
        if (vmove == 0 && sprite_index == spr_stairup)
            sprite_index = spr_stairupidle;
    }
    
    if (key_jump)
    {
        state = states.jump;
        sprite_index = spr_jump;
        image_index = 0;
        movespeed = 4;
        vsp = -5;
        on_stairs = 0;
        stairsID = -4;
    }
    
    if (!place_meeting(x, y, obj_ladder))
    {
        if (!on_stairs)
        {
            state = states.jump;
            sprite_index = spr_jump;
            image_index = 0;
            movespeed = 0;
            vsp = -5;
        }
        else
        {
            state = states.normal;
            sprite_index = spr_idle;
            image_index = 0;
            movespeed = 0;
            vsp = 0;
        }
        
        on_stairs = 0;
        stairsID = -4;
    }
    
    if (key_down && onground && !place_meeting(x, y, obj_platform))
    {
        state = states.normal;
        sprite_index = spr_idle;
        image_index = 0;
        on_stairs = 0;
        stairsID = -4;
    }
}

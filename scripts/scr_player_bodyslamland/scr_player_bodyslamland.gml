function scr_player_bodyslamland()
{
    image_speed = 0.25;
    mask_index = spr_player_mask;
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = states.normal;
        sprite_index = spr_idle;
        image_index = 0;
    }
    
    if (floor(image_index) == 3 && key_jump2)
    {
        state = states.jump;
        sprite_index = spr_bodyslambounce;
        image_index = 0;
        vsp = -14;
        jumpstop = false;
        scr_soundeffect(sfx_jump);
    }
}

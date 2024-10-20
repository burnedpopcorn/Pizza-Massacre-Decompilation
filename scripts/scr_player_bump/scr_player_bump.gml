function scr_player_bump()
{
    image_speed = 0.25;
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_fall;
        image_index = 0;
        state = states.jump;
    }
}

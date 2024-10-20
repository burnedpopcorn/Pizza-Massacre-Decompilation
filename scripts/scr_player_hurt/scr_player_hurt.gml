function scr_player_hurt()
{
    image_alpha = 1;
    image_speed = 0.25;
    inv_frames = 1;
    movespeed = 4;
    hurted = 1;
    alarm[0] = 80;
    
    if (onground && vsp > 0)
    {
        movespeed = 0;
        state = states.normal;
    }
}

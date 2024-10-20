function scr_player_climbbackup()
{
    image_speed = 0.25;
    sprite_index = spr_ladderclimb;
    hsp = 0;
    vsp = 0;
    climby -= 6;
    climbindex += 0.3;
    
    if (climby <= y)
    {
        state = states.normal;
        sprite_index = spr_idle;
        image_index = 0;
        image_alpha = 1;
        climbindex = 0;
    }
}

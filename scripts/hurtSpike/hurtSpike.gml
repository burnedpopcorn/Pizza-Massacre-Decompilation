function hurtSpike()
{
    if (!inv_frames && state != states.climbbackup && state != states.doorin)
    {
        if (object_index == obj_player1)
        {
            if (string_letters(room_get_name(room)) != "PP")
                global.p1_hp -= 1;
        }
        
        vsp = -6;
        hsp = -sign(x - other.x) * -5;
        state = states.hurt;
        sprite_index = spr_hurt;
        image_index = 0;
        inv_frames = 1;
        hurted = 1;
    }
}

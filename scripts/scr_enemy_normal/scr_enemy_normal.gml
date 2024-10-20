function scr_enemy_normal()
{
    image_speed = 0.25;
    mask_index = spr_player_mask;
    
    switch (object_index)
    {
        case obj_forknight:
        case obj_cheeseslime:
            hsp = xscale * movespeed;
            movespeed = 2;
            
            if ((place_meeting(x + 1, y, obj_wall) && xscale == 1) || (place_meeting(x - 1, y, obj_wall) && xscale == -1) || place_meeting(x + hsp, y, obj_hallway))
                xscale *= -1;
            
            if (!(scr_solid(x + (xscale * 15), y + 31) || place_meeting(x + (xscale * 15), y + 31, obj_platform)))
                xscale *= -1;
            
            break;
        
        case obj_olivefly:
            hsp = xscale * -movespeed;
            movespeed = 2;
            
            if ((place_meeting(x + 1, y, obj_wall) && xscale == -1) || (place_meeting(x - 1, y, obj_wall) && xscale == 1) || place_meeting(x + hsp, y, obj_hallway))
                xscale *= -1;
            
            break;
    }
}

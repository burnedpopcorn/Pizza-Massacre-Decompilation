function scr_player_dead()
{
    image_alpha = 1;
    image_speed = 0.25;
    hsp = movespeed * -xscale;
    inv_frames = 1;
    hurted = 1;
    alarm[0] = 80;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_deathstart)
    {
        sprite_index = spr_player_deathairstart;
        image_index = 0;
        vsp = -11;
        movespeed = 6;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_deathairstart)
    {
        sprite_index = spr_player_deathair;
        image_index = 0;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_deathland)
    {
        sprite_index = spr_player_deathground;
        image_index = 0;
    }
    
    if (sprite_index == spr_player_deathstart)
    {
        hsp = 0;
        vsp = 0;
    }
    
    if ((place_meeting(x + 1, y, obj_wall) && xscale == 1) || (place_meeting(x - 1, y, obj_wall) && xscale == -1) || place_meeting(x + hsp, y, obj_hallway))
        xscale *= -1;
    
    if (onground)
    {
        if (movespeed > 0)
            movespeed -= 0.4;
        else
            movespeed = 0;
    }
    
    if (onground && vsp > 0 && sprite_index != spr_player_deathstart && sprite_index != spr_player_deathground && sprite_index != spr_player_deathland)
    {
        alarm[1] = 150;
        sprite_index = spr_player_deathland;
        image_index = 0;
    }
}

function scr_player_dashskid()
{
    image_speed = 0.25;
    mask_index = spr_player_mask;
    
    if (movespeed >= 0)
        movespeed -= 0.4;
    
    move = key_right + key_left;
    hsp = xscale * movespeed;
    
    if (sprite_index == spr_sprintslidebooststart || sprite_index == spr_sprintslideboost)
    {
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_sprintslideboost;
            image_index = 0;
        }
        
        if (floor(movespeed) <= 0 && onground)
        {
            if (move == -xscale)
            {
                state = states.dash;
                sprite_index = spr_sprint;
                movespeed = 6;
                xscale = move;
            }
            else
            {
                state = states.normal;
                sprite_index = spr_idle;
                image_index = 0;
            }
        }
    }
    else if (floor(image_index) == (image_number - 1))
    {
        state = states.normal;
        sprite_index = spr_idle;
        image_index = 0;
    }
    
    if (place_meeting(x + hsp, y, obj_wall) && !scr_slope())
    {
        state = states.normal;
        movespeed = 0;
        image_index = 0;
        sprite_index = spr_idle;
    }
}

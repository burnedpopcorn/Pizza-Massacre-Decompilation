function scr_player_bodyslamfall()
{
    mask_index = spr_player_mask;
    move = key_left + key_right;
    
    if (!onground)
    {
        hsp = move * movespeed;
        
        if (move != 0)
        {
            if (xscale != move)
            {
                movespeed = 2;
                xscale = move;
            }
        }
        
        if (movespeed < 4)
            movespeed += 0.3;
        else if (floor(movespeed) == 4)
            movespeed = 4;
        
        if (vsp > 12 && !instance_exists(bodyslamefID))
        {
            with (instance_create_depth(x, y, -7, obj_bodyslameffect))
            {
                playerID = other.id;
                other.bodyslamefID = id;
            }
        }
        
        if (!instance_exists(obj_trail))
        {
            with (instance_create_depth(x, y, 2, obj_trail))
            {
                sprite_index = other.sprite_index;
                image_speed = other.image_speed;
                image_xscale = other.xscale;
            }
        }
    }
    
    if (onground && !place_meeting(x, y + vsp + 6, obj_destroyables))
    {
        scr_soundeffect(sfx_groundpoundland);
        state = states.bodyslamland;
        sprite_index = spr_bodyslamland;
        image_index = 0;
    }
}

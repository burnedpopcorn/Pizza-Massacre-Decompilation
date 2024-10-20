function scr_player_walljump()
{
    image_speed = 0.25;
    mask_index = spr_player_mask;
    wall_jumping = 1;
    jumpAnim = true;
    
    if (key_jump)
    {
        vsp = -13;
        jumpAnim = 1;
        jumpstop = false;
        move = xscale;
        
        if (!dashing)
        {
            state = states.jump;
            movespeed = 6;
            sprite_index = spr_jump;
        }
        else
        {
            state = states.dash;
            sprite_index = spr_sprintjump;
        }
        
        alarm[2] = 25;
        image_index = 0;
        scr_soundeffect(sfx_jump);
    }
    
    if (!place_meeting(x + 1, y, obj_wall) && !place_meeting(x - 1, y, obj_wall))
    {
        state = states.jump;
        sprite_index = spr_fall;
        image_index = 0;
        xscale *= -1;
        movespeed = 0;
        wall_jumping = 0;
    }
    
    if (onground)
    {
        state = states.normal;
        sprite_index = spr_land;
        image_index = 0;
        wall_jumping = 0;
    }
    
    if (floor(image_index) == (image_number - 1))
        image_index = image_number - 1;
}

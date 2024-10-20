function scr_collide_destructibles()
{
    if (state == states.dash || state == states.dashattack || state == states.slap)
    {
        if (place_meeting(x + 6, y, obj_destroyables))
        {
            with (instance_place(x + 6, y, obj_destroyables))
                instance_destroy();
        }
        
        if (place_meeting(x - 6, y, obj_destroyables))
        {
            with (instance_place(x - 6, y, obj_destroyables))
                instance_destroy();
        }
    }
    
    if (state == states.bodyslamfall)
    {
        if (place_meeting(x, y + vsp + 6, obj_destroyables))
        {
            with (instance_place(x, y + vsp + 6, obj_destroyables))
                instance_destroy();
        }
    }
}

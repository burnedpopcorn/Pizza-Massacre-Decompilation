if (!instance_exists(baddieID))
{
    instance_destroy();
}
else
{
    x = baddieID.x;
    y = baddieID.y;
    image_xscale = baddieID.xscale;
    
    if (place_meeting(x + 14, y, obj_player) || place_meeting(x - 14, y, obj_player) || place_meeting(x, y + 14, obj_player) || place_meeting(x, y - 14, obj_player))
    {
        with (obj_player)
        {
            if (state == states.dashattack || state == states.bodyslamstart || state == states.bodyslamfall || state == states.bodyslamland)
                Instakill();
        }
    }
    
    if (place_meeting(x + 6, y, obj_player) || place_meeting(x - 6, y, obj_player) || place_meeting(x, y + 6, obj_player) || place_meeting(x, y - 6, obj_player))
    {
        with (obj_player)
        {
            if (state == states.slap)
            {
                if (floor(image_index) == 2 || floor(image_index) == 3)
                    Instakill();
            }
        }
    }
}

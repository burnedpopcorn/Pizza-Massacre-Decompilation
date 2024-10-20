if (place_meeting(x, y, other) && room != butcher_1)
{
    with (other)
    {
        if (key_up && state == states.normal)
        {
            if (!instance_exists(obj_fadeout))
            {
                with (other)
                {
                    image_index = 1;
                    alarm[1] = 15;
                }
                
                if (x != (other.x + 42))
                {
                    if (x <= (other.x + 42))
                        xscale = 1;
                    else
                        xscale = -1;
                }
                
                targetDoor = other.targetDoor;
                
                with (instance_create_depth(x, y, -99, obj_fadeout))
                    fdin = 0;
                
                doorID = other.id;
                state = states.unknown_state;
                sprite_index = spr_player_doorin;
                image_index = 0;
                scr_soundeffect(sfx_enterdoor);
            }
        }
    }
}

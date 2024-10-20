switch (targetDoor)
{
    case "A":
        if (instance_exists(obj_doorA))
        {
            x = obj_doorA.x + 16;
            y = obj_doorA.y - 62;
        }
        
        break;
    
    case "B":
        if (instance_exists(obj_doorB))
        {
            x = obj_doorB.x + 16;
            y = obj_doorB.y - 62;
        }
        
        break;
    
    case "C":
        if (instance_exists(obj_doorC))
        {
            x = obj_doorC.x + 16;
            y = obj_doorC.y - 62;
        }
        
        break;
    
    case "D":
        if (instance_exists(obj_doorD))
        {
            x = obj_doorD.x + 16;
            y = obj_doorD.y - 62;
        }
        
        break;
    
    case "F":
        if (instance_exists(obj_doorF))
        {
            x = obj_doorF.x + 16;
            y = obj_doorF.y - 62;
        }
        
        break;
}

if (instance_exists(obj_followerparent))
{
    with (obj_followerparent)
    {
        x = obj_player1.x;
        y = obj_player1.y;
    }
}

if (state == states.unknown_state && place_meeting(x, y, obj_door))
{
    doorID = -4;
    state = states.normal;
    sprite_index = spr_idle;
    image_index = 0;
}

if (state == states.unknown_state || state == states.doorin)
{
    if (room == afterdemo_playground)
    {
        doorID = -4;
        state = states.normal;
        sprite_index = spr_idle;
        image_index = 0;
    }
}

if (audio_is_playing(sfx_frankfootsteps))
    audio_stop_sound(sfx_frankfootsteps);

roomstartx = x;
roomstarty = y;

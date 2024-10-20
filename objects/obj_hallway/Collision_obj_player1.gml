with (other)
{
    if (state != states.doorin)
    {
        if (!other.savedpos)
        {
            other.savedpos = true;
            other.savedx = x;
            other.savedy = y;
        }
        
        x = other.savedx;
        y = other.savedy;
        
        if (!instance_exists(obj_fadeout))
        {
            with (other)
                alarm[1] = 3;
            
            with (obj_camera)
                lockinplace = 0;
            
            targetDoor = other.targetDoor;
            
            with (instance_create_depth(x, y, -99, obj_fadeout))
                fdin = 0;
        }
    }
}

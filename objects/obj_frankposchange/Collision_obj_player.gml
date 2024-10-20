if (instance_exists(obj_frankwurst))
{
    if (!activated && obj_frankwurst.sprite_index != spr_frankwurst_chase && obj_frankwurst.sprite_index != spr_frankwurst_attack && obj_frankwurst.sprite_index != spr_frankwurst_idle)
    {
        activated = true;
        
        with (obj_frankwurst)
        {
            if (other.removefrank)
                ds_list_add(global.saveroom, id);
            
            start = 0;
            movespeed = 0;
            state = 3;
            sprite_index = spr_frankwurst_walk;
            image_index = 0;
            x = other.frankposx;
            y = other.frankposy;
        }
    }
}

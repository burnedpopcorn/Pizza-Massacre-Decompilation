function scr_solid_monster(argument0, argument1)
{
    var old_x, old_y, num, _collided, i, b;
    
    old_x = x;
    old_y = y;
    x = argument0;
    y = argument1;
    
    if (place_meeting(x, y, obj_monsterwall))
    {
        x = old_x;
        y = old_y;
        return true;
    }
    
    if (y > old_y && place_meeting(x, y, obj_monsterplatform))
    {
        num = instance_place_list(x, y, obj_monsterplatform, global.instancelist, false);
        _collided = false;
        
        for (i = 0; i < num; i++)
        {
            b = ds_list_find_value(global.instancelist, i);
            
            if (id != b.id && !place_meeting(x, old_y, b) && place_meeting(x, y, b))
                _collided = true;
        }
        
        ds_list_clear(global.instancelist);
        
        if (_collided)
        {
            x = old_x;
            y = old_y;
            return true;
        }
    }
    
    if (check_slope(obj_monsterslope))
    {
        x = old_x;
        y = old_y;
        return true;
    }
    
    x = old_x;
    y = old_y;
    return false;
}

function scr_solid_slope_monster(argument0, argument1)
{
    var old_x, old_y, inst;
    
    old_x = x;
    old_y = y;
    x = argument0;
    y = argument1;
    
    if (check_slope(obj_monsterslope))
    {
        inst = instance_place(x, y, obj_monsterslope);
        
        if (sign(inst.image_xscale) != xscale)
        {
            x = old_x;
            y = old_y;
            return true;
        }
    }
    
    x = old_x;
    y = old_y;
    return false;
}

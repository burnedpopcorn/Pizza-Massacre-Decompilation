function scr_solid(argument0, argument1)
{
    var old_x, old_y, num, _collided, i, b;
    
    old_x = x;
    old_y = y;
    x = argument0;
    y = argument1;
    
    if (place_meeting(x, y, obj_wall))
    {
        x = old_x;
        y = old_y;
        return true;
    }
    
    if (y > old_y && place_meeting(x, y, obj_platform))
    {
        num = instance_place_list(x, y, obj_platform, global.instancelist, false);
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
    
    if (check_slope(obj_slope))
    {
        x = old_x;
        y = old_y;
        return true;
    }
    
    x = old_x;
    y = old_y;
    return false;
}

function check_slope(argument0)
{
    var slope, object_side, slope_start, slope_end, m;
    
    slope = instance_place(x, y, argument0);
    
    if (slope)
    {
        with (slope)
        {
            object_side = 0;
            slope_start = 0;
            slope_end = 0;
            
            if (image_xscale > 0)
            {
                object_side = other.bbox_right;
                slope_start = bbox_bottom;
                slope_end = bbox_top;
            }
            else
            {
                object_side = other.bbox_left;
                slope_start = bbox_top;
                slope_end = bbox_bottom;
            }
            
            m = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
            slope = slope_start - round(m * (object_side - bbox_left));
            
            if (other.bbox_bottom >= slope)
                return true;
        }
    }
    
    return false;
}

function scr_solid_slope(argument0, argument1)
{
    var old_x, old_y, inst;
    
    old_x = x;
    old_y = y;
    x = argument0;
    y = argument1;
    
    if (check_slope(obj_slope))
    {
        inst = instance_place(x, y, obj_slope);
        
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

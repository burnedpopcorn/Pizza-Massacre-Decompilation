function instance_create_afterimage(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7)
{
    with (instance_create_depth(argument0, argument1, 1, obj_afterimage))
    {
        hspeed = argument6;
        vspeed = argument7;
        sprite_index = argument2;
        image_index = argument3;
        
        if (argument4 != 0)
            image_blend = argument4;
        
        image_alpha = argument5;
        
        if (variable_instance_exists(other, "xscale"))
            image_xscale = other.xscale;
        else
            image_xscale = other.image_xscale;
    }
}

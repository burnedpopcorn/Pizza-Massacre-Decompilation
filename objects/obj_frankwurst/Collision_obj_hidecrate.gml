if (sprite_index == spr_frankwurst_attack && floor(image_index) > 1)
{
    with (other)
    {
        with (instance_create_depth(other.x, other.y, 2, obj_baddiedead))
        {
            sprite_index = other.sprite_index;
            image_index = 0;
            hsp = 0;
            image_angle = random_range(0, -360);
        }
        
        instance_destroy();
    }
}

with (instance_create_depth(x, y, -9, obj_collecthud))
{
    collectval = 10;
    sprite_index = other.sprite_index;
}

scr_soundeffect(choose(sfx_collect1, sfx_collect2, sfx_collect3));
instance_destroy();

if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
    {
        with (instance_create_depth(x, y, -4, obj_debris))
            sprite_index = spr_destroyable_bigdebris;
    }
    
    with (obj_camera)
        shake = 15;
    
    scr_soundeffect(sfx_bigblock);
    ds_list_add(global.saveroom, id);
}

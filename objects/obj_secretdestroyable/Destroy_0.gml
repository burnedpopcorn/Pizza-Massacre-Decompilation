var lay_id, map_id, data, ind;

if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
    {
        with (instance_create_depth(x, y, -4, obj_debris))
        {
            sprite_index = other.debrisspr;
            image_index = random_range(0, other.maxind);
        }
    }
    
    with (obj_camera)
        shake = 15;
    
    scr_soundeffect(sfx_smallblock);
    ds_list_add(global.saveroom, id);
}

lay_id = layer_get_id("Tiles_1");
map_id = layer_tilemap_get_id(lay_id);
data = tilemap_get_at_pixel(map_id, x, y);
ind = tile_get_index(data);
data = tile_set_empty(data);
tilemap_set_at_pixel(map_id, data, x, y);

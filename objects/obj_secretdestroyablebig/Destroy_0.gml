var lay_id, map_id, data, data2, data3, data4, ind;

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
    
    scr_soundeffect(sfx_bigblock);
    ds_list_add(global.saveroom, id);
}

lay_id = layer_get_id("Tiles_1");
map_id = layer_tilemap_get_id(lay_id);
data = tilemap_get_at_pixel(map_id, x, y);
data2 = tilemap_get_at_pixel(map_id, x + 32, y + 32);
data3 = tilemap_get_at_pixel(map_id, x + 32, y);
data4 = tilemap_get_at_pixel(map_id, x, y + 32);
ind = tile_get_index(data);
data = tile_set_empty(data);
data2 = tile_set_empty(data2);
data3 = tile_set_empty(data3);
data4 = tile_set_empty(data4);
tilemap_set_at_pixel(map_id, data, x, y);
tilemap_set_at_pixel(map_id, data2, x + 32, y + 32);
tilemap_set_at_pixel(map_id, data3, x + 32, y);
tilemap_set_at_pixel(map_id, data4, x, y + 32);

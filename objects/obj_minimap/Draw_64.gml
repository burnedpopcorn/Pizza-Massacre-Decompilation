var i, map_object_index, map_object_color, j, instance, slopeinstance, current_left, current_top, current_right, current_bottom;

if (scr_noguiroom())
    exit;

display_set_gui_size(960, 540);
draw_set_color(background_color);
draw_rectangle(x, y, x + width, y + height, false);

for (i = 0; i < array_length_1d(objects_to_draw); i += 2)
{
    map_object_index = objects_to_draw[i];
    map_object_color = objects_to_draw[i + 1];
    draw_set_color(map_object_color);
    
    for (j = 0; j < instance_number(map_object_index); j++)
    {
        instance = instance_find(map_object_index, j);
        slopeinstance = instance_find(obj_slope, j);
        current_left = instance.bbox_left * scale;
        current_top = instance.bbox_top * scale;
        current_right = instance.bbox_right * scale;
        current_bottom = instance.bbox_bottom * scale;
        draw_rectangle(x + current_left, x + current_top, x + current_right, x + current_bottom, false);
    }
}

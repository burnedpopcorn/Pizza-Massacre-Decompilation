if (floor(image_index) == (image_number - 1) && sprite_index == spr_pepmenu_trans)
{
    sprite_index = spr_pepmenu_idle;
    image_index = 0;
}

if (obj_pressstart.optselected != 0 && obj_pressstart.optselected != -1)
    image_blend = #5B5B5B;
else
    image_blend = c_white;

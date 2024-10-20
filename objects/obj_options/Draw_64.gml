var _os;

draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0);
draw_set_font(global.font);
draw_set_halign(fa_center);
draw_set_color(c_white);

if (instance_exists(obj_keyconfig) || instance_exists(obj_audioconfig))
    exit;

_os = optionselect;
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 100, "FULLSCREEN", c_white, c_white, c_white, c_white, (_os == 0) ? 3 : 0.5);

if (option_fs)
    draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 150, "Enabled", c_white, c_white, c_white, c_white, (_os == 0) ? 3 : 0.5);
else
    draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 150, "Disabled", c_white, c_white, c_white, c_white, (_os == 0) ? 3 : 0.5);

draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 200, "SPEEDRUN TIMER", c_white, c_white, c_white, c_white, (_os == 1) ? 3 : 0.5);

if (option_st)
    draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 250, "Enabled", c_white, c_white, c_white, c_white, (_os == 1) ? 3 : 0.5);
else
    draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 250, "Disabled", c_white, c_white, c_white, c_white, (_os == 1) ? 3 : 0.5);

draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 300, "KEY CONFIG", c_white, c_white, c_white, c_white, (_os == 2) ? 3 : 0.5);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 350, "AUDIO CONFIG", c_white, c_white, c_white, c_white, (_os == 3) ? 3 : 0.5);

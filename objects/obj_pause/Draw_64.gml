var _os;

if (instance_exists(obj_options))
    exit;

_os = select;
draw_set_font(global.font);
draw_set_halign(fa_center);
draw_sprite_tiled_ext(bg_pause, -1, bgx, bgy, 1, 1, c_white, bgalpha);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, opt1y, "RESUME", c_white, c_white, c_white, c_white, (_os == 0) ? 4 : 0.5);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, opt2y, "RESTART LEVEL", c_white, c_white, c_white, c_white, (_os == 1) ? 4 : 0.5);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, opt3y, "BACK TO TUTORIAL", c_white, c_white, c_white, c_white, (_os == 2) ? 4 : 0.5);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, opt4y, "OPTIONS", c_white, c_white, c_white, c_white, (_os == 3) ? 4 : 0.5);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, opt5y, "EXIT LEVEL", c_white, c_white, c_white, c_white, (_os == 4) ? 4 : 0.5);

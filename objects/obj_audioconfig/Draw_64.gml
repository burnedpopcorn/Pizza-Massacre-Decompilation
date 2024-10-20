var _os;

draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0);
draw_set_font(global.font);
draw_set_halign(fa_center);
draw_set_color(c_white);
_os = optionselect;
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 200, "MUSIC VOLUME", c_white, c_white, c_white, c_white, (_os == 0) ? 2 : 0.5);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 250, global.musicvolume, c_white, c_white, c_white, c_white, (_os == 0) ? 2 : 0.5);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 300, "SFX VOLUME", c_white, c_white, c_white, c_white, (_os == 1) ? 2 : 0.5);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 350, global.sfxvolume, c_white, c_white, c_white, c_white, (_os == 1) ? 2 : 0.5);

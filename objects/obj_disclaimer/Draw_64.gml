draw_set_font(global.font);
draw_set_halign(fa_center);
draw_set_color(c_white);

draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 100, "NOTICE!", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 150, "This is a DECOMPILATION of", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 200, "Pizza Massacre (HotFix 2)", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 250, "Note that there may be issues because", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 300, "Decompilers aren't always accurate", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 350, "If you are having crashes or other", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 400, "issues, then report them to me", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 500, "Press [" + scr_keyname(global.key_jump) + "] to continue", c_white, c_white, c_white, c_white, 1);

/*
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 100, "HEADS UP!", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 150, "This is a demo that was supposed to release", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 200, "on halloween, but we had to delay it.", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 250, "NOTE: Controller input is not fully supported!!", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 300, "Some assets might get changed in the future.", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 350, "If you are having trouble with logging into", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 400, "your GJ account, use your game token.", c_white, c_white, c_white, c_white, 1);
draw_text_colour(camera_get_view_width(view_camera[0]) / 2, 500, "Press [" + scr_keyname(global.key_jump) + "] to continue", c_white, c_white, c_white, c_white, 1);

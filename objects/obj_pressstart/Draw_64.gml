var _os;

_os = optselected;
draw_sprite_ext(spr_titleopt, 0, 204, titley, 1, 1, 0, c_white, (_os == 0) ? 2 : 0.5);
draw_sprite_ext(spr_titleopt, 1, 498, titley, 1, 1, 0, c_white, (_os == 1) ? 2 : 0.5);
draw_sprite_ext(spr_titleopt, 2, 816, titley, 1, 1, 0, c_white, (_os == 2) ? 2 : 0.5);

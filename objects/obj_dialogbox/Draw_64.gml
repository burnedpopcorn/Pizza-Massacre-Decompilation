var _len, _str;

draw_set_font(global.font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);
draw_sprite_ext(spr_dialogchar, 0, 125, dialogchar_y, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_dialogbox, 0, 0, dialogbox_y, 1, 1, 0, c_white, 0.65);

if (showdialog)
{
    _len = string_length(text[text_current]);
    
    if (char_current < _len)
        char_current += char_speed;
    
    _str = string_copy(text[text_current], 1, char_current);
    draw_text(text_x, text_y, _str);
}

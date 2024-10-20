draw_set_halign(fa_left);
draw_set_font(global.font);
draw_set_valign(fa_bottom);

if (obj_pressstart.lock)
{
    loginy = lerp(loginy, 35, 0.12);
    draw_text(5, loginy, "Welcome back, " + my_username + "!");
}

draw_set_valign(fa_top);

if (scr_noguiroom() || !global.speedruntimer || off)
    exit;

draw_set_font(global.font);
draw_set_halign(fa_left);

if (stop)
    draw_set_color(c_red);
else
    draw_set_color(c_white);

draw_set_alpha(1);

if (glitch)
{
    draw_text(868, texty, string_hash_to_newline(glitchletter + ":" + glitchletter2));
}
else
{
    if (global.tutorial_seconds < 10)
        draw_text(860, 505, string_hash_to_newline(string(global.tutorial_minutes) + ":0" + string(global.tutorial_seconds)));
    else
        draw_text(860, 505, string_hash_to_newline(string(global.tutorial_minutes) + ":" + string(global.tutorial_seconds)));
    
    if (global.tutorial_milliseconds < 10)
        draw_text_transformed(935, 520, string_hash_to_newline(":0" + string(global.tutorial_milliseconds)), 0.5, 0.5, 0);
    else
        draw_text_transformed(935, 520, string_hash_to_newline(":" + string(global.tutorial_milliseconds)), 0.5, 0.5, 0);
}

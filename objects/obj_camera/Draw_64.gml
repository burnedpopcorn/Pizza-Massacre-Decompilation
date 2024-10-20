var cameraw, camerah;

display_set_gui_size(960, 540);
draw_set_alpha(1);

if (string_letters(room_get_name(room)) == "PP")
    exit;

if (room == halloween_demoend || room == afterdemo_playground)
    exit;

if (dark_lighting)
{
    cameraw = camera_get_view_width(view_camera[0]) + 32;
    camerah = camera_get_view_height(view_camera[0]) + 32;
    draw_set_color(c_black);
    
    if (room != butcher_11 && room != butcher_12)
        draw_set_alpha(0.4);
    else
        draw_set_alpha(0.6);
    
    draw_rectangle(0, 0, cameraw, camerah, false);
    draw_set_alpha(1);
}

if (room != Titlescreen && room != Init && room != Disclaimer && room != tutorialskip_1)
{
    draw_set_color(c_white);
    draw_sprite_ext(spr_weaponHUD_BG, 0, 124, 124, 1, 1, 0, c_white, alpha);
    draw_sprite_ext(asset_get_index("spr_weaponHUD_" + string(obj_player1.weapon)), -1, 124, 124, 1, 1, 0, c_white, alpha);
    draw_sprite(spr_healthHUD, global.p1_hp, 866, 92);
    draw_set_font(global.pointfont);
    draw_sprite(spr_plate, 0, 124, 42);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(128 + irandom_range(-collectshake, collectshake), 3 + irandom_range(-collectshake, collectshake), global.collect);
}

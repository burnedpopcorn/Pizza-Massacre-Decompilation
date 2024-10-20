draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);

if (uparrow)
    draw_sprite_ext(spr_uparrow, uparrow_ind, x, y - 65, 1, 1, image_angle, image_blend, image_alpha);

if (state == states.climbbackup)
    draw_sprite_ext(spr_player_ladderclimb, climbindex, x, climby, 1, 1, image_angle, image_blend, 1);

if (flash)
{
    shader_set(shd_hit);
    draw_self();
    shader_reset();
}

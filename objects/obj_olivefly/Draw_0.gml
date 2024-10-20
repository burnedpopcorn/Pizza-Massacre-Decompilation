draw_sprite_ext(sprite_index, image_index, x, y + Wave(-6, 6, 2, 2), xscale, yscale, 0, c_white, 1);

if (flash)
{
    shader_set(shd_hit);
    draw_self();
    shader_reset();
}

hsp = sign(x - obj_player.x) * random_range(8, 12);
vsp = random_range(-10, -18);
grav = 0.5;

if (x != obj_player1.x)
    image_xscale = -sign(x - obj_player1.x);

depth = -9;
flash = 1;
gui = 0;

if (vsp < 20)
    vsp += grav;

x += hsp;
y += sign(vsp);
y += vsp;

if (flash && alarm[4] <= 0)
    alarm[4] = 0.04 * room_speed;

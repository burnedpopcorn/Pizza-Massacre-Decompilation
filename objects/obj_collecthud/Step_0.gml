hsp = lengthdir_x(24, point_direction(x, y, 100, 35));
vsp = lengthdir_y(24, point_direction(x, y, 100, 35));
x += hsp;
y += vsp;

if (x <= 100 && y <= 35)
{
    with (obj_camera)
    {
        global.collect += other.collectval;
        collectshake += 10;
    }
    
    instance_destroy();
}

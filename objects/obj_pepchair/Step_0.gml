if (onground && !chairb)
{
    chairb = 1;
    image_index = 1;
    vsp = -11;
    
    if (hsp != 0)
        hsp *= 6;
    else
        hsp = 6;
    
    grav = 0.5;
    ds_list_add(global.saveroom, id);
}

if (!chairb)
{
    scr_collide();
}
else
{
    if (vsp < 20)
        vsp += grav;
    
    x += hsp;
    y += sign(vsp);
    y += vsp;
}

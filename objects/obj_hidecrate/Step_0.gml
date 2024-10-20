if (abs(distance_to_object(obj_player1)) < 400 && !global.hide_notif)
{
    scr_soundeffect(sfx_hidingalarm);
    hide = 1;
    global.hide_notif = 1;
}

if (hide == 1)
{
    uparrow_ind += 0.25;
    
    if (place_meeting(x, y, obj_player))
        hide = 0;
}

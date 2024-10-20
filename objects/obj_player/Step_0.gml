if (room != Titlescreen && room != Init && room != Disclaimer && room != halloween_demoend && room != tutorialskip_1)
{
    scr_stateswitch();
}
else
{
    hsp = 0;
    vsp = 0;
    x = -1000;
    y = -1000;
}

if (uparrow)
    uparrow_ind += 0.25;

if (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_tutorialsign))
{
    if (room != butcher_1)
    {
        if (state == states.normal)
            uparrow = true;
        else
            uparrow = false;
    }
}
else
{
    uparrow = false;
}

if (input_buffer_walljump < 15)
    input_buffer_walljump++;

if (flash && alarm[4] <= 0)
    alarm[4] = 0.04 * room_speed;

if (inv_frames && state != states.hurt && state != states.dead && state != states.climbbackup)
    image_alpha = 0.5;
else if (state != states.climbbackup)
    image_alpha = 1;

if (state == states.walljump)
    grav = 0.2;
else if (state == states.bodyslamfall)
    grav = 0.75;
else
    grav = 0.5;

if (state != states.crouch && state != states.crouchjump)
    mask_index = spr_player_mask;
else
    mask_index = spr_player_crouchmask;

if (y > (room_height + 450) || y < -800)
{
    if (room != Init && room != Titlescreen && room != Disclaimer && room != tutorialskip_1 && state != states.climbbackup)
    {
        state = states.climbbackup;
        image_alpha = 0;
        climby = 540;
        x = roomstartx;
        y = roomstarty;
        
        if (room == PP_3)
            trophy_push(states.normal, global.trophies_tut1, "tutorial1");
    }
}

if (global.p1_hp <= 0 && state != states.dead)
{
    state = states.dead;
    sprite_index = spr_player_deathstart;
    image_index = 0;
}

scr_playersounds();
scr_collide_player();
scr_collide_destructibles();

var targetplayer;

if (room == butcher_4)
{
    if (abs(distance_to_object(obj_player)) < 335 && !active)
    {
        active = true;
        alarm[0] = 200;
        
        with (obj_music)
            musSlowdown = 1;
        
        ds_list_add(global.saveroom, id);
    }
    
    if (abs(distance_to_object(obj_player1)) < 150 && !alarmed)
    {
        alarmed = true;
        state = 2;
        image_index = 0;
        
        with (obj_music)
        {
            musSlowdown = 0;
            mus = mus_frankchase;
        }
    }
}

targetplayer = obj_player1.id;

switch (state)
{
    case 0:
        hsp = 0;
        
        if (room != butcher_4)
        {
            if (sprite_index != spr_frankwurst_activate && sprite_index != spr_frankwurst_chase)
            {
                sprite_index = spr_frankwurst_deactivated;
            }
            else if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_frankwurst_chase;
                image_index = 0;
                state = 2;
                movespeed = 4;
            }
            
            image_speed = 0.25;
        }
        
        break;
    
    case 1:
        hsp = move * movespeed;
        
        if (move != 0)
            image_xscale = -move;
        
        break;
    
    case 2:
        attackcooldown--;
        hsp = image_xscale * -movespeed;
        
        if (room == butcher_12)
            movespeed = 9.2;
        else
            movespeed = 8;
        
        if (targetplayer.x > (x - 18) && targetplayer.x < (x + 18))
        {
            sprite_index = spr_frankwurst_idle;
            movespeed = 0;
            
            if (audio_is_playing(sfx_frankfootsteps))
                audio_stop_sound(sfx_frankfootsteps);
        }
        else if (place_meeting(x + 1, y, obj_monsterwall) || place_meeting(x - 1, y, obj_monsterwall))
        {
            sprite_index = spr_frankwurst_idle;
            movespeed = 0;
            
            if (audio_is_playing(sfx_frankfootsteps))
                audio_stop_sound(sfx_frankfootsteps);
        }
        else
        {
            sprite_index = spr_frankwurst_chase;
        }
        
        if (image_xscale != -sign(targetplayer.x - x) && x != targetplayer.x)
            image_xscale = -sign(targetplayer.x - x);
        
        if (place_meeting(x + 4, y, obj_player) && attackcooldown <= 0)
        {
            scr_soundeffect(choose(sfx_frankattack1, sfx_frankattack2, sfx_frankattack3));
            state = 4;
            sprite_index = spr_frankwurst_attack;
            image_index = 0;
            
            if (audio_is_playing(sfx_frankfootsteps))
                audio_stop_sound(sfx_frankfootsteps);
        }
        
        if (!audio_is_playing(sfx_frankfootsteps))
        {
            if (onground)
            {
                if (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
                    scr_soundeffect(sfx_frankfootsteps);
            }
            else if (audio_is_playing(sfx_frankfootsteps))
            {
                audio_stop_sound(sfx_frankfootsteps);
            }
        }
        
        break;
    
    case 3:
        if (abs(distance_to_object(obj_player)) < 575)
        {
            start = 1;
            movespeed = 5;
        }
        
        if (abs(distance_to_object(obj_player1)) < 380)
        {
            with (obj_player)
            {
                if (!place_meeting(x, y, obj_hidecrate))
                {
                    other.state = 2;
                    other.image_index = 0;
                    
                    with (obj_music)
                        mus = mus_frankchase;
                }
            }
        }
        
        if (!start)
            movespeed = 0;
        
        hsp = image_xscale * -movespeed;
        break;
    
    case 4:
        hsp = 0;
        
        if (floor(image_index) > 1)
        {
            if (!instance_exists(hitboxID))
            {
                with (instance_create_depth(x, y, 2, obj_forkhitbox))
                {
                    baddieID = other.id;
                    other.hitboxID = id;
                    frank = 1;
                    sprite_index = spr_frankwurst_hitmask;
                    mask_index = spr_frankwurst_hitmask;
                }
            }
        }
        
        if (floor(image_index) == (image_number - 1))
        {
            attackcooldown = 50;
            state = 2;
            image_index = 0;
            
            if (instance_exists(hitboxID))
                instance_destroy(hitboxID);
        }
        
        break;
}

if (abs(distance_to_object(obj_hidecrate)) < 100)
    depth = -8;
else
    depth = -5;

mask_index = spr_player_mask;
scr_collide_monster();

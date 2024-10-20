scr_getinput();
bgx -= 1;
bgy -= 1;
pausecooldown--;

if (pause)
{
    opt1y = lerp(opt1y, 150, 0.12);
    opt2y = lerp(opt2y, 200, 0.12);
    opt3y = lerp(opt3y, 250, 0.12);
    opt4y = lerp(opt4y, 300, 0.12);
    opt5y = lerp(opt5y, 350, 0.12);
    
    if (bgalpha < 1)
        bgalpha += 0.2;
    else
        bgalpha = 1;
}
else if (room != Init && room != Disclaimer && room != halloween_demoend && room != tutorialskip_1)
{
    opt1y = lerp(opt1y, 640, 0.12);
    opt2y = lerp(opt2y, 640, 0.12);
    opt3y = lerp(opt3y, 640, 0.12);
    opt4y = lerp(opt4y, 640, 0.12);
    opt5y = lerp(opt5y, 640, 0.12);
    
    if (bgalpha > 0)
        bgalpha -= 0.1;
    else
        bgalpha = 0;
    
    if (key_start && room != Titlescreen && !instance_exists(obj_fadeout) && obj_player1.sprite_index != spr_player_doorin)
    {
        if (pausecooldown <= 0)
        {
            pause = true;
            instance_deactivate_all(true);
            instance_activate_object(self);
            instance_activate_object(obj_music);
            alarm[0] = 50;
        }
    }
}

if (pause == true && selectable == 1 && !instance_exists(obj_options))
{
    if (keyboard_check_pressed(vk_up) && select != 0)
        select -= 1;
    
    if (keyboard_check_pressed(vk_down) && select != 4)
        select += 1;
    
    if (key_jump)
    {
        switch (select)
        {
            case 0:
                instance_activate_all();
                pause = false;
                
                with (obj_music)
                    muscontinue = 1;
                
                break;
            
            case 1:
                pause = false;
                
                switch (string_letters(room_get_name(room)))
                {
                    case "PP":
                        room_goto(PP_1);
                        break;
                    
                    case "butcher":
                        room_goto(butcher_1);
                        break;
                }
                
                if (room == afterdemo_playground)
                    room_goto(Titlescreen);
                
                pausecooldown = 25;
                instance_activate_all();
                scr_reset();
                break;
            
            case 2:
                room_goto(PP_1);
                pause = false;
                pausecooldown = 25;
                instance_activate_all();
                scr_reset();
                break;
            
            case 3:
                instance_create_depth(x, y, -6, obj_options);
                pausecooldown = 25;
                break;
            
            case 4:
                room_goto(Titlescreen);
                pause = false;
                pausecooldown = 25;
                instance_activate_all();
                scr_reset();
                break;
        }
    }
}

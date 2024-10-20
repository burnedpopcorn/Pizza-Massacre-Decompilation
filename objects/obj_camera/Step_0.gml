var tplayer, cwidth, cheight, camx, camy, _yview;

if (shake > 0)
    shake -= 5;
else
    shake = 0;

if (collectshake > 0)
    collectshake *= 0.5;
else
    collectshake = 0;

if (instance_exists(playerID))
{
    fullscreenID = global.fullscreen;
    speedrunID = global.speedruntimer;
    
    if (!lockinplace)
    {
        if (room != Titlescreen && room != Init && room != Disclaimer && room != tutorialskip_1)
        {
            tplayer = playerID;
            cwidth = camera_get_view_width(view_camera[0]);
            cheight = camera_get_view_height(view_camera[0]);
            camx = (tplayer.x - (cwidth / 2)) + irandom_range(-shake, shake);
            camy = (tplayer.y - (cheight / 2)) + irandom_range(-shake, shake);
            camera_set_view_pos(view_camera[0], clamp(camx, 0, room_width - cwidth), clamp(camy, 0, room_height - cheight));
        }
    }
    else
    {
        switch (state)
        {
            case 1:
                _yview = view_yport + yview;
                
                if (alarm[1] <= 0)
                    alarm[1] = 50;
                
                yview += 5;
                camera_set_view_pos(view_camera[0], view_xport[0], _yview);
                break;
        }
    }
}

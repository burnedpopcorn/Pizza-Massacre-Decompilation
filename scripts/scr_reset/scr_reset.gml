function scr_reset()
{
    ds_list_clear(global.saveroom);
    ds_list_clear(global.enemyroom);
    obj_music.musDarkness = 0;
    obj_music.musPitch = 1;
    obj_music.musSlowdown = 0;
    obj_player.state = states.normal;
    obj_player.targetDoor = "A";
    obj_player.inv_frames = 0;
    obj_player.hurted = 0;
    obj_player.alarm[0] = -1;
    obj_tutorialtimer.stop = 0;
    obj_tutorialtimer.off = 0;
    obj_tutorialtimer.alarm[0] = -1;
    obj_tutorialtimer.started = false;
    global.tutorial_minutes = 0;
    global.tutorial_seconds = 0;
    global.tutorial_milliseconds = 0;
    global.frank_attacked = 0;
    global.frank_spotted = 0;
    global.hide_notif = 0;
    global.collect = 0;
    global.p1_hp = 8;
    
    if (instance_exists(obj_followerparent))
        instance_destroy(obj_followerparent);
    
    audio_stop_all();
}

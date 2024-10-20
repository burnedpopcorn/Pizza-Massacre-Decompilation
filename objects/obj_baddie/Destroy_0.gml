if (ds_list_find_index(global.enemyroom, id) == -1)
{
    scr_sleep(50);
    
    if (object_index != obj_tutorialslime && object_index != obj_tutorialknight)
    {
        repeat (2)
            instance_create_depth(x, y, -5, obj_enemygibs);
        
        global.collect += 50;
    }
    
    repeat (2)
        instance_create_depth(x, y, -5, obj_star);
    
    instance_create_depth(x, y, -5, obj_bangeffect);
    scr_soundeffect(choose(sfx_kill, sfx_kill2));
    
    with (instance_create_depth(x, y, -6, obj_baddiedead))
        sprite_index = other.deadspr;
    
    ds_list_add(global.enemyroom, id);
}

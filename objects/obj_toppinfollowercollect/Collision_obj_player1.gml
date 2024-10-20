ds_list_add(global.saveroom, id);

with (instance_create_depth(x, y - 48, -4, obj_followerparent))
{
    ds_list_add(global.following_list, id);
    instance_create_depth(x, y, 4, obj_bangeffect);
    global.collect += 1000;
    idlespr = other.idlespr;
    walkspr = other.walkspr;
    
    switch (other.idlespr)
    {
        case spr_toppinshroom_idle:
            global.shroomcollect = 1;
            break;
        
        case spr_toppincheese_idle:
            global.cheesecollect = 1;
            break;
        
        case spr_toppintomato_idle:
            global.tomatocollect = 1;
            break;
        
        case spr_toppinsausage_idle:
            global.sausagecollect = 1;
            break;
        
        case spr_toppinpineapple_idle:
            global.pineapplecollect = 1;
            break;
    }
    
    followerpos = ds_list_find_index(global.following_list, id);
    followerid = ds_list_find_value(global.following_list, followerpos - 1);
}

scr_soundeffect(sfx_toppincollect);
instance_destroy();

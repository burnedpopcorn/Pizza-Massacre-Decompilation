var followind;

followind = ds_list_find_index(global.following_list, id);

if (followind != -1)
    ds_list_delete(global.following_list, followind);

ds_queue_destroy(followQueue);
instance_destroy();

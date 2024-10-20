function Scr_GameJolt_AsyncCall()
{
    var map;
    
    map = ds_map_create();
    ds_map_set(map, "listener", id);
    ds_map_set(map, "type", type);
    ds_map_set(map, "status", ds_map_find_value(async_load, "http_status"));
    
    if (!is_undefined(errorMessage))
        ds_map_set(map, "errorMessage", errorMessage);
    
    if (argument_count)
    {
        if (!is_undefined(argument[0]))
            ds_map_set(map, "value", argument[0]);
    }
    
    event_perform_async(ev_async_social, map);
}

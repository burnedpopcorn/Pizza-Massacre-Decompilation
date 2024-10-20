if (request == ds_map_find_value(async_load, "id"))
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
            GameJolt_DataStorage_Fetch(ds_map_find_value(async_load, "result"), function(argument0)
            {
                show_message_async(argument0);
            }, function(argument0)
            {
                show_message_async(argument0);
            });
        }
    }
}

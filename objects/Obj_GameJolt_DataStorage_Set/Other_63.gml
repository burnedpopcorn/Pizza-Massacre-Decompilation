if (request == ds_map_find_value(async_load, "id"))
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
            GameJolt_DataStorage_Set(ds_map_find_value(async_load, "result"), "YoYoGames");
    }
}
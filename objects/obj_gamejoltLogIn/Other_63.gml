/*
var user, token;

if (ds_map_find_value(async_load, "id") == request)
{
    user = ds_map_find_value(async_load, "username");
    token = ds_map_find_value(async_load, "password");
    GameJolt_User_LogIn(user, token, function()
    {
        instance_create_depth(200, 250, 0, Obj_GameJolt_User_Me);
    }, function(argument0)
    {
        show_message_async("Error: " + argument0);
    });
}

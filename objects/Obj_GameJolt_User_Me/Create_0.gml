event_inherited();
GameJolt_User_FetchMe(function(argument0)
{
    my_id = argument0.id;
    my_type = argument0.type;
    my_username = argument0.username;
    my_avatar_url = argument0.avatar_url;
    my_signed_up = argument0.signed_up;
    my_signed_up_timestamp = argument0.signed_up_timestamp;
    my_last_logged_in = argument0.last_logged_in;
    my_last_logged_in_timestamp = argument0.last_logged_in_timestamp;
    my_status = argument0.status;
    my_developer_name = argument0.developer_name;
    my_developer_website = argument0.developer_website;
    my_developer_description = argument0.developer_description;
    spr = sprite_add(my_avatar_url, 0, 0, 0, 0, 0);
}, function(argument0)
{
    show_message_async(argument0);
});

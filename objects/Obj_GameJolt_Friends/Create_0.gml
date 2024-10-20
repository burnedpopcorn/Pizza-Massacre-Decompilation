GameJolt_Friends(function(argument0)
{
    var a, ins;
    
    for (a = 0; a < array_length(argument0); a++)
    {
        ins = instance_create_depth(200 + (300 * a), 350, 0, Obj_GameJolt_User_FromUserId);
        ins.user_id = argument0[a];
    }
});

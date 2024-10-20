function Scr_GameJolt_Request(argument0, argument1, argument2, argument3, argument4)
{
    var request;
    
    request = instance_create_depth(0, 0, 0, Obj_GameJolt_Request);
    request.type = argument0;
    request.url = argument1;
    request.HTTP_Method = argument2;
    request.callback_success = argument3;
    request.callback_failed = argument4;
    return request;
}

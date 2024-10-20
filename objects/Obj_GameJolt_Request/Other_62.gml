var _status, _result, _struct, struct_response;

show_debug_message("ASYNC: " + json_encode(async_load));

if (ds_map_find_value(async_load, "id") != request)
    exit;

_status = ds_map_find_value(async_load, "status");

if (_status == 1)
    exit;

if (_status == 0)
{
    if (ds_map_find_value(async_load, "http_status") == 200)
    {
        _result = ds_map_find_value(async_load, "result");
        
        try
        {
            _struct = json_parse(_result);
        }
        catch (_ex)
        {
            show_debug_message("[ERROR] Obj_GameJolt_Request, invalid json response");
            exit;
        }
        
        struct_response = _struct.response;
        
        if (struct_response.success == "true")
            Scr_GameJolt_Success(struct_response);
        else if (!is_undefined(callback_failed))
            callback_failed(variable_struct_get(struct_response, "message"), async_load);
    }
}
else if (_status < 0)
{
    if (!is_undefined(callback_failed))
        callback_failed("Request Failed. Maybe No Internet", async_load);
}

instance_destroy();

event_inherited();
request = -4;
text = "Refresh Time";
server_time = "";

func_success = function(argument0)
{
    server_time = "====== Server Time ======\n";
    server_time += ("timestamp: " + string(argument0.timestamp) + "\n");
    server_time += ("timezone: " + argument0.timezone + "\n");
    server_time += ("YYYY/MM/DD: " + argument0.year + "/" + argument0.month + "/" + argument0.day + "\n");
    server_time += ("hour:min:sec: " + argument0.hour + ":" + argument0.minute + ":" + argument0.second);
};

func_failed = function(argument0)
{
    server_time = "";
    show_debug_message(argument0);
};

GameJolt_Time(func_success, func_failed);

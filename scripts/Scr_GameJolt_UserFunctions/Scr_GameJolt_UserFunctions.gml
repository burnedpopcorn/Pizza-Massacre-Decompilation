GameJolt_FakeExtOptionsInit();
global.GameJolt_Auth_Confirmed = false;
global.GameJolt_Username = "";
global.GameJolt_GameToken = "";

function GameJolt_User_IsLogged()
{
    return global.GameJolt_Auth_Confirmed;
}

function GameJolt_User_LogIn_FromCache()
{
    var map;
    
    if (file_exists("GameJolt_File_LogIn.dat"))
    {
        map = ds_map_secure_load("GameJolt_File_LogIn.dat");
        global.GameJolt_Username = ds_map_find_value(map, "username");
        global.GameJolt_GameToken = ds_map_find_value(map, "gametoken");
        global.GameJolt_Auth_Confirmed = true;
        ds_map_destroy(map);
        return true;
    }
    else
    {
        return false;
    }
}

function GameJolt_User_LogIn(argument0, argument1, argument2 = undefined, argument3 = undefined)
{
    var url, request;
    
    url = "https://api.gamejolt.com/api/game/v1_2/users/auth/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", argument0, "user_token", argument1);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    request = Scr_GameJolt_Request("GameJolt_User_LogIn", url, "GET", argument2, argument3);
    request.user_name = argument0;
    request.game_token = argument1;
    return request;
}

function GameJolt_User_LogOut()
{
    global.GameJolt_Auth_Confirmed = false;
    global.GameJolt_Username = "";
    global.GameJolt_GameToken = "";
    
    if (file_exists("GameJolt_File_LogIn.dat"))
        file_delete("GameJolt_File_LogIn.dat");
}

function GameJolt_User_FetchMe(argument0 = undefined, argument1 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/users/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_User_FetchMe", url, "GET", argument0, argument1);
}

function GameJolt_User_FetchWithUserID(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/users/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "user_id", string(argument0));
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_User_FetchWithUserID", url, "GET", argument1, argument2);
}

function GameJolt_User_FetchWithUserName(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/users/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", argument0);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_User_FetchWithUserName", url, "GET", argument1, argument2);
}

function GameJolt_Session_Open(argument0 = undefined, argument1 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/sessions/open";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Session_Open", url, "GET", argument0, argument1);
}

function GameJolt_Session_Ping_Active(argument0 = undefined, argument1 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/sessions/ping";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "status", "active");
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Session_Ping_Active", url, "GET", argument0, argument1);
}

function GameJolt_Session_Ping_IDLE(argument0 = undefined, argument1 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/sessions/ping";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "status", "idle");
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Session_Ping_IDLE", url, "GET", argument0, argument1);
}

function GameJolt_Session_Check(argument0 = undefined, argument1 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/sessions/check";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Session_Check", url, "GET", argument0, argument1);
}

function GameJolt_Session_Close(argument0 = undefined, argument1 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/sessions/close";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Session_Close", url, "GET", argument0, argument1);
}

function GameJolt_Scores_Add(argument0, argument1, argument2, argument3, argument4 = undefined, argument5 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/scores/add";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "table_id", string(argument0), "score", argument1, "sort", string(argument2));
    
    if (argument3 != "")
        url = Scr_GameJolt_Parameters("extra_data", argument3);
    
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Scores_Add", url, "GET", argument4, argument5);
}

function GameJolt_Scores_Add_Guest(argument0, argument1, argument2, argument3, argument4, argument5 = undefined, argument6 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/scores/add";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "guest", argument0, "table_id", string(argument1), "score", argument2, "sort", string(argument3));
    
    if (argument4 != "")
        url = Scr_GameJolt_Parameters("extra_data", argument4);
    
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Scores_Add_Guest", url, "GET", argument5, argument6);
}

function GameJolt_Scores_Fetch_Me(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/scores/fetch";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "table_id", string(argument0));
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Scores_Fetch_Me", url, "GET", argument1, argument2);
}

function GameJolt_Scores_Fetch_Guest(argument0, argument1, argument2 = undefined, argument3 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/scores/fetch";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "table_id", string(argument0), "guest", argument1);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Scores_Fetch_Guest", url, "GET", argument2, argument3);
}

function GameJolt_Scores_Fetch(argument0, argument1, argument2 = undefined, argument3 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/scores/fetch";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "table_id", string(argument0), "limit", string(argument1));
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Scores_Fetch", url, "GET", argument2, argument3);
}

function GameJolt_Scores_Fetch_BetterThan(argument0, argument1, argument2, argument3 = undefined, argument4 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/scores/fetch";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "table_id", string(argument0), "better_than", string(argument1), "limit", string(argument2));
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Scores_Fetch_BetterThan", url, "GET", argument3, argument4);
}

function GameJolt_Scores_Fetch_WorseThan(argument0, argument1, argument2, argument3 = undefined, argument4 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/scores/fetch";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "table_id", string(argument0), "worse_than", string(argument1), "limit", string(argument2));
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Scores_Fetch_WorseThan", url, "GET", argument3, argument4);
}

function GameJolt_Scores_Tables(argument0 = undefined, argument1 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/scores/tables";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"));
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Scores_Tables", url, "GET", argument0, argument1);
}

function GameJolt_Scores_Rank(argument0, argument1, argument2 = undefined, argument3 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/scores/get-rank";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "table_id", string(argument0), "sort", string(argument1));
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Scores_Rank", url, "GET", argument2, argument3);
}

function GameJolt_Trophies_Fetch_All(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/trophies/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "achieved", string(argument0));
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Trophies_Fetch_All", url, "GET", argument1, argument2);
}

function GameJolt_Trophies_Fetch(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/trophies/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "trophy_id", argument0);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Trophies_Fetch", url, "GET", argument1, argument2);
}

function GameJolt_Trophies_Update(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/trophies/add-achieved";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "trophy_id", argument0);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Trophies_Update", url, "GET", argument1, argument2);
}

function GameJolt_Trophies_Remove(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/trophies/remove-achieved";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "trophy_id", argument0);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Trophies_Remove", url, "GET", argument1, argument2);
}

function GameJolt_DataStorage_Fetch(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/data-store/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "key", argument0);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_DataStorage_Fetch", url, "GET", argument1, argument2);
}

function GameJolt_DataStorage_Fetch_Global(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/data-store/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "key", argument0);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_DataStorage_Fetch_Global", url, "GET", argument1, argument2);
}

function GameJolt_DataStorage_Set(argument0, argument1, argument2 = undefined, argument3 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/data-store/set/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "key", argument0, "data", argument1);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_DataStorage_Set", url, "GET", argument2, argument3);
}

function GameJolt_DataStorage_Set_Global(argument0, argument1, argument2 = undefined, argument3 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/data-store/set/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "key", argument0, "data", argument1);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_DataStorage_Set_Global", url, "GET", argument2, argument3);
}

function GameJolt_DataStorage_Remove(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/data-store/remove";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "key", argument0);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_DataStorage_Remove", url, "GET", argument1, argument2);
}

function GameJolt_DataStorage_Remove_Global(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/data-store/remove";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "key", argument0);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_DataStorage_Remove_Global", url, "GET", argument1, argument2);
}

function GameJolt_DataStorage_Update(argument0, argument1, argument2, argument3 = undefined, argument4 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/data-store/set/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken, "key", argument0, "data", argument1, "operation", argument2);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_DataStorage_Update", url, "GET", argument3, argument4);
}

function GameJolt_DataStorage_Update_Global(argument0, argument1, argument2, argument3 = undefined, argument4 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/data-store/set/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "key", argument0, "data", argument1, "operation", argument2);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_DataStorage_Update_Global", url, "GET", argument3, argument4);
}

function GameJolt_DataStorage_GetKeys(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/data-store/get-keys/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_DataStorage_GetKeys", url, "GET", argument1, argument2);
}

function GameJolt_DataStorage_GetKeys_Global(argument0, argument1 = undefined, argument2 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/data-store/get-keys/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"));
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_DataStorage_GetKeys_Global", url, "GET", argument1, argument2);
}

function GameJolt_Friends(argument0 = undefined, argument1 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/friends/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"), "username", global.GameJolt_Username, "user_token", global.GameJolt_GameToken);
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Friends", url, "GET", argument0, argument1);
}

function GameJolt_Time(argument0 = undefined, argument1 = undefined)
{
    var url;
    
    url = "https://api.gamejolt.com/api/game/v1_2/time/";
    url = Scr_GameJolt_Parameters(url, "game_id", extension_get_option_value("GameJolt", "GameID"));
    url = Scr_GameJolt_Parameters(url, "signature", md5_string_utf8(url + extension_get_option_value("GameJolt", "PrivateKey")));
    return Scr_GameJolt_Request("GameJolt_Time", url, "GET", argument0, argument1);
}

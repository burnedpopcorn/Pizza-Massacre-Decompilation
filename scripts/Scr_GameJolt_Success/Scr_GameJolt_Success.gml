function Scr_GameJolt_Success(argument0)
{
    var map, array_score, array, struct, array_return, a;
    
    if (type == "GameJolt_User_LogIn")
    {
        global.GameJolt_Auth_Confirmed = true;
        global.GameJolt_GameToken = game_token;
        global.GameJolt_Username = user_name;
        map = ds_map_create();
        ds_map_set(map, "username", global.GameJolt_Username);
        ds_map_set(map, "gametoken", global.GameJolt_GameToken);
        ds_map_secure_save(map, "GameJolt_File_LogIn.dat");
        ds_map_destroy(map);
    }
    
    if (is_undefined(callback_success))
        exit;
    
    switch (type)
    {
        default:
            callback_success();
            break;
        
        case "GameJolt_User_FetchMe":
        case "GameJolt_User_FetchWithUserID":
        case "GameJolt_User_FetchWithUserName":
            callback_success(argument0.users[0]);
            break;
        
        case "GameJolt_Scores_Fetch_Me":
        case "GameJolt_Scores_Fetch_Guest":
            array_score = argument0.scores;
            
            if (!is_undefined(array_score))
            {
                if (array_length(array_score))
                {
                    callback_success(array_score[0]);
                    exit;
                }
            }
            
            callback_success(undefined);
            break;
        
        case "GameJolt_Scores_Fetch":
        case "GameJolt_Scores_Fetch_BetterThan":
        case "GameJolt_Scores_Fetch_WorseThan":
            callback_success(argument0.scores);
            break;
        
        case "GameJolt_Scores_Tables":
            callback_success(argument0.tables);
            break;
        
        case "GameJolt_Scores_Rank":
            callback_success(argument0.rank);
            break;
        
        case "GameJolt_Trophies_Fetch":
            if (variable_struct_exists(argument0, "trophies"))
            {
                array = argument0.trophies;
                
                if (!array_length(array))
                {
                    callback_success(undefined);
                    exit;
                }
                
                struct = array[0];
                callback_success(array[0]);
            }
            
            break;
        
        case "GameJolt_Trophies_Fetch_All":
            if (variable_struct_exists(argument0, "trophies"))
                callback_success(argument0.trophies);
            
            break;
        
        case "GameJolt_DataStorage_Fetch":
        case "GameJolt_DataStorage_Fetch_Global":
            callback_success(argument0.data);
            break;
        
        case "GameJolt_DataStorage_GetKeys":
        case "GameJolt_DataStorage_GetKeys_Global":
            array_return = [];
            
            if (!is_undefined(argument0.keys))
            {
                array = argument0.keys;
                a = array_length(array) - 1;
                
                while (a >= 0)
                {
                    array_return[a] = array[a].key;
                    a--;
                }
            }
            
            callback_success(array);
            break;
        
        case "GameJolt_Friends":
            array_return = [];
            
            if (!is_undefined(argument0.friends))
            {
                array = argument0.friends;
                a = array_length(array) - 1;
                
                while (a >= 0)
                {
                    array_return[a] = array[a].friend_id;
                    a--;
                }
            }
            
            callback_success(array_return);
            break;
        
        case "GameJolt_Time":
            callback_success(argument0);
            break;
    }
}

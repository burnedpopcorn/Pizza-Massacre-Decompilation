function trophy_push(argument0, argument1, argument2)
{
    var _trophyvalue, _trophy, _trophyfailed;
    
    _trophyvalue = obj_trophies.trophyvalue;
    _trophy = argument2;
    _trophyfailed = 0;
	// calling GameJolt_Trophies_Update causes crashes
	// so no
    /*
    switch (argument0)
    {
        case states.normal:
            GameJolt_Trophies_Update("213482", function()
            {
            });
            trophy_give(spr_trophy_tutorial, 0, 0, _trophy);
            break;
        
        case states.jump:
            GameJolt_Trophies_Update("213483", function()
            {
            });
            trophy_give(spr_trophy_tutorial, 1, 0, _trophy);
            break;
        
        case states.hurt:
            if (global.tutorial_minutes < 1)
            {
                GameJolt_Trophies_Update("213484", function()
                {
                });
            }
            else
            {
                _trophyfailed = 1;
            }
            
            if (!_trophyfailed)
                trophy_give(spr_trophy_tutorial, 2, 0, _trophy);
            
            break;
        
        case states.walljump:
            if (!global.frank_spotted)
            {
                GameJolt_Trophies_Update("213485", function()
                {
                });
            }
            else
            {
                _trophyfailed = 1;
            }
            
            if (!_trophyfailed)
                trophy_give(spr_trophy_frank, 0, 0, _trophy);
            
            break;
        
        case states.bump:
            if (!global.frank_attacked)
            {
                GameJolt_Trophies_Update("213486", function()
                {
                });
            }
            else
            {
                _trophyfailed = 1;
            }
            
            if (!_trophyfailed)
                trophy_give(spr_trophy_frank, 1, 0, _trophy);
            
            break;
        
        case states.crouch:
            GameJolt_Trophies_Update("214349", function()
            {
            });
            trophy_give(spr_trophy_secret, 0, 1, _trophy);
            break;
        
        case states.crouchjump:
            GameJolt_Trophies_Update("213487", function()
            {
            });
            trophy_give(spr_trophy_frank, 2, 0, _trophy);
            break;
    }
	*/
}

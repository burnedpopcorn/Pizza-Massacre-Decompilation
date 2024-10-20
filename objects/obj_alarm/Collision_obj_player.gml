if (other.state == states.dash || other.state == states.slap || other.state == states.dashattack)
{
    if (room != butcher_12)
    {
        global.frank_spotted = 1;
        
        with (obj_frankwurst)
        {
            activate = 1;
            
            if (room != butcher_12)
            {
                sprite_index = spr_frankwurst_activate;
                image_index = 0;
            }
            else
            {
                sprite_index = spr_frankwurst_chase;
                image_index = 0;
                state = 2;
            }
        }
        
        with (obj_music)
            mus = mus_frankchase;
        
        instance_destroy();
    }
}

if (room == butcher_12)
{
    with (obj_frankwurst)
    {
        sprite_index = spr_frankwurst_chase;
        image_index = 0;
        state = 2;
        visible = true;
    }
    
    with (obj_music)
        mus = mus_frankchase;
    
    instance_destroy();
}

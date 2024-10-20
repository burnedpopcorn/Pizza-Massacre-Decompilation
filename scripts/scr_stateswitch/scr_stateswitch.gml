enum states
{
	normal,
	jump,
	hurt,
	bump,
	walljump,
	crouch,
	crouchjump,
	bodyslamstart,
	bodyslamfall,
	bodyslamland,
	slap,
	dash,
	dashskid,
	dashattack,
	climb,
	climbbackup,
	doorin,
	unknown_state,
	dead,
	debug,
}

function scr_stateswitch()
{
    switch (state)
    {
        case states.normal:
            scr_player_normal();
            break;
        
        case states.jump:
            scr_player_jump();
            break;
        
        case states.hurt:
            scr_player_hurt();
            break;
        
        case states.bump:
            scr_player_bump();
            break;
        
        case states.walljump:
            scr_player_walljump();
            break;
        
        case states.crouch:
            scr_player_crouch();
            break;
        
        case states.crouchjump:
            scr_player_crouchjump();
            break;
        
        case states.bodyslamstart:
            scr_player_bodyslamstart();
            break;
        
        case states.bodyslamfall:
            scr_player_bodyslamfall();
            break;
        
        case states.bodyslamland:
            scr_player_bodyslamland();
            break;
        
        case states.slap:
            scr_player_slap();
            break;
        
        case states.dash:
            scr_player_dash();
            break;
        
        case states.dashskid:
            scr_player_dashskid();
            break;
        
        case states.dashattack:
            scr_player_dashattack();
            break;
        
        case states.climb:
            scr_player_climb();
            break;
        
        case states.climbbackup:
            scr_player_climbbackup();
            break;
        
        case states.doorin:
            hsp = 0;
            movespeed = 0;
            
            if (sprite_index != spr_player_doorin)
                sprite_index = spr_idle;
            
            image_speed = 0.25;
            
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_doorin)
                image_index = image_number - 1;
            
            mask_index = spr_player_mask;
            break;
        
        case states.unknown_state:
            x = lerp(x, doorID.x + 42, 0.2);
            image_speed = 0.25;
            movespeed = 0;
            
            if (floor(image_index) == (image_number - 1))
                image_index = image_number - 1;
            
            mask_index = spr_player_mask;
            break;
        
        case states.dead:
            scr_player_dead();
            break;
        
        case states.debug:
            scr_player_debug();
            break;
    }
}

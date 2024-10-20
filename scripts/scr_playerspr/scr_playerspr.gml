function scr_playerspr()
{
    switch (character)
    {
        case "P":
            spr_idle = spr_player_idle;
            spr_walk = spr_player_move;
            spr_jump = spr_player_jump;
            spr_fall = spr_player_fall;
            spr_land = spr_player_land;
            spr_hurt = spr_player_hurt;
            spr_crouch = spr_player_crouchstart;
            spr_crouchend = spr_player_crouchend;
            spr_crouchidle = spr_player_crouchidle;
            spr_crouchwalk = spr_player_crouchwalk;
            spr_crouchjump = spr_player_crouchjump;
            spr_crouchfall = spr_player_crouchfall;
            spr_crouchland = spr_player_crouchland;
            spr_bodyslamstart = spr_player_bodyslamstart;
            spr_bodyslamfall = spr_player_bodyslamfall;
            spr_bodyslamland = spr_player_bodyslamland;
            spr_bodyslambounce = spr_player_bodyslambounce;
            spr_slap1 = spr_player_slap1;
            spr_slap2 = spr_player_slap2;
            spr_slap1walk = spr_player_slap1walk;
            spr_slap2walk = spr_player_slap2walk;
            spr_slap1air = spr_player_slap1air;
            spr_slap2air = spr_player_slap2air;
            spr_ladderidle = spr_player_ladderidle;
            spr_ladderclimb = spr_player_ladderclimb;
            spr_ladderdown = spr_player_ladderdown;
            spr_sprintstart = spr_player_sprintstart;
            spr_sprint = spr_player_sprint;
            spr_sprintjump = spr_player_sprintjump;
            spr_sprintslideboost = spr_player_sprintslideboost;
            spr_sprintslidebooststart = spr_player_sprintslidebooststart;
            spr_sprintend = spr_player_sprintend;
            spr_stairdownidle = spr_player_stairdownidle;
            spr_stairdown = spr_player_stairdown;
            spr_stairupidle = spr_player_stairupidle;
            spr_stairup = spr_player_stairup;
            spr_wallsplat = spr_player_wallsplat;
            break;
    }
}

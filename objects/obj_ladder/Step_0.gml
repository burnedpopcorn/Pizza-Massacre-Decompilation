if (place_meeting(x, y - 1, obj_player1))
{
    with (obj_player1)
    {
        if (key_down && state != states.climb && place_meeting(x, y + 1, obj_platform))
        {
            y += 5;
            state = states.climb;
            y = floor(y);
            stairsID = other.id;
        }
    }
}

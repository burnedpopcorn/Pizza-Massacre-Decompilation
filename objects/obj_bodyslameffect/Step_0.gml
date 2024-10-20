if (instance_exists(playerID))
{
    x = playerID.x;
    y = playerID.y + 65;
    
    if (playerID.state != states.bodyslamfall)
        instance_destroy();
}
else
{
    instance_destroy();
}

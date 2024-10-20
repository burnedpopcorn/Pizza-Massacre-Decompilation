with (other)
{
    if (other.frank)
    {
        global.frank_attacked = 1;
        hurtSpike();
    }
    else
    {
        hurtPlayer();
    }
}

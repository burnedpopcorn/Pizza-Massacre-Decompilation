if (cutscene && room == butcher_4)
{
    if (!alarmed)
    {
        with (obj_music)
            musSlowdown = 0;
        
        instance_destroy();
    }
}

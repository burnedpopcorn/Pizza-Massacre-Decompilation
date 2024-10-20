if (room == PP_1 || room == butcher_1)
{
    if (!started)
    {
        alarm[0] = 60;
        started = 1;
    }
}

if (room == halloween_demoend)
    stop = 1;

if (room == tutorialskip_1)
{
    alarm[1] = 25;
    alarm[3] = 25;
    alarm[2] = 50;
}

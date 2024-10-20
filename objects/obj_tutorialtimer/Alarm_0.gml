if (!stop)
{
    global.tutorial_seconds += 1;
    
    if (global.tutorial_seconds > 59)
    {
        global.tutorial_seconds = 0;
        global.tutorial_minutes += 1;
    }
    
    global.tutorial_milliseconds = 0;
}

alarm[0] = 60;

if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

global.tutorial_seconds = 0;
global.tutorial_minutes = 0;
global.tutorial_milliseconds = 0;
off = 0;
stop = 0;
started = 0;
glitch = 0;
glitchletter = 0;
glitchletter2 = 0;
letterdecrease = 0;
texty = 505;
depth = -9;

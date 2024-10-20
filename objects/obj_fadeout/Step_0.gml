if (fdin == 1)
    fdalpha -= 0.1;
else if (room != halloween_demoend)
    fdalpha += 0.1;
else
    fdalpha += 0.04;

if (fdin == 1 && fdalpha < 0)
{
    if (room != halloween_demoend && room != tutorialskip_1)
    {
        instance_destroy();
    }
    else if (!alarmo)
    {
        alarmo = 1;
        
        if (room == halloween_demoend)
            alarm[0] = 200;
        
        if (room == tutorialskip_1)
            alarm[2] = 400;
    }
}

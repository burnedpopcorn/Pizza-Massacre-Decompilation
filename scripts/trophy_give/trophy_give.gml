function trophy_give(argument0, argument1, argument2, argument3)
{
    if (argument2)
        exit;
    
    if (argument3 == undefined)
        argument3 = -4;
    
    ini_open("saveDataPM.ini");
    
    if (argument3 != -4)
    {
        if (ini_read_real("Trophies", argument3, 0))
        {
            ini_close();
        }
        else
        {
            ini_write_real("Trophies", argument3, 1);
            show_debug_message("Trophy added!");
        }
    }
    
    ini_close();
}

image_speed = 0.25;
scr_getinput();
optionselect = 0;
ini_open("saveDataPM.ini");
option_fs = ini_read_real("Options", "Fullscreen", 0);
option_st = ini_read_real("Options", "Speedrun Timer", 0);
ini_close();
saved = 0;

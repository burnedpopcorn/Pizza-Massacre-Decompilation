ini_open("saveDataPM.ini");
jumpkey = ini_read_string("KeyPress", "Jump", 90);
jumpkeyC = ini_read_string("ControllerPress", "Jump", 32769);
ini_close();
key_jump = 0;

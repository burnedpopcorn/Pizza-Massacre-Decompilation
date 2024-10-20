key_jump = keyboard_check_pressed(jumpkey) || gamepad_button_check_pressed(0, jumpkeyC);

if (key_jump)
    room_goto(Titlescreen);

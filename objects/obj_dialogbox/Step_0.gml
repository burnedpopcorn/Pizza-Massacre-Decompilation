var _len;

if (showdialog)
{
    dialogbox_y = lerp(dialogbox_y, 0, 0.12);
    dialogchar_y = lerp(dialogchar_y, 332, 0.12);
}
else
{
    dialogbox_y = lerp(dialogbox_y, 540, 0.18);
    dialogchar_y = lerp(dialogbox_y, 1280, 0.18);
    
    if (dialogbox_y >= 540)
        instance_destroy();
}

scr_getinput();

if (key_jump)
{
    _len = string_length(text[text_current]);
    
    if (char_current < _len)
    {
        char_current = _len;
    }
    else if (text_current >= text_last)
    {
        if (showdialog)
        {
            showdialog = 0;
            alarm[0] = 5;
        }
    }
    else
    {
        text_current += 1;
        text[text_current] = string_wrap(text[text_current], text_width);
        char_current = 0;
    }
}

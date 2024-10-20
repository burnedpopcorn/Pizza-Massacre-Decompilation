if (other.key_up && other.state != states.doorin)
{
    with (instance_create_depth(x, y, -9, obj_dialogbox))
    {
        text[0] = other.text[0];
        text_last = other.text_last;
        text_width = other.text_width;
        text[text_current] = string_wrap(text[text_current], text_width);
    }
    
    with (other)
        state = states.doorin;
}

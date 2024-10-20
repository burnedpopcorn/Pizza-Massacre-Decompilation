function string_wrap(argument0, argument1)
{
    var _text_wrapped, _space, _char_pos;
    
    _text_wrapped = "";
    _space = -1;
    
    for (_char_pos = 1; string_length(argument0) >= _char_pos; _char_pos += 1)
    {
        if (string_width(string_copy(argument0, 1, _char_pos)) > argument1)
        {
            if (_space != -1)
            {
                _text_wrapped += (string_copy(argument0, 1, _space) + "\n");
                argument0 = string_copy(argument0, _space + 1, string_length(argument0) - _space);
                _char_pos = 1;
                _space = -1;
            }
        }
        
        if (string_char_at(argument0, _char_pos) == " ")
            _space = _char_pos;
    }
    
    if (string_length(argument0) > 0)
        _text_wrapped += argument0;
    
    return _text_wrapped;
}

function Wave(argument0, argument1, argument2, argument3, argument4 = -4)
{
    var _wave, _time;
    
    _wave = (argument1 - argument0) * 0.5;
    _time = current_time;
    
    if (argument4 != -4)
        _time = argument4;
    
    return argument0 + _wave + (sin((((_time * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi)) * _wave);
}

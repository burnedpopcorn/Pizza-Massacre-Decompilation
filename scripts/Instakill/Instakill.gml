function Instakill()
{
    flash = 1;
    
    with (obj_camera)
        shake = 15;
    
    instance_destroy(other.baddieID);
}

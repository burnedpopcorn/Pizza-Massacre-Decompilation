if (!instance_exists(baddieID))
{
    instance_destroy();
}
else
{
    x = baddieID.x;
    y = baddieID.y;
    
    if (other.frank)
    {
        image_xscale = baddieID.image_xscale;
        image_yscale = baddieID.image_yscale;
    }
    else
    {
        image_xscale = baddieID.xscale;
        image_yscale = baddieID.yscale;
    }
}

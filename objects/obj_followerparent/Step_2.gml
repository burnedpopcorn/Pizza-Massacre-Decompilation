var targetx, followx, followy;

if (instance_exists(followid))
{
    image_xscale = followid.xscale;
    image_alpha = followid.image_alpha;
    
    if (followid.hsp != 0)
        sprite_index = walkspr;
    else
        sprite_index = idlespr;
    
    if (image_xscale == 1)
    {
        if (followerspace > -maxfollowspace)
            followerspace -= 0.12;
    }
    
    if (image_xscale == -1)
    {
        if (followerspace < maxfollowspace)
            followerspace += 0.12;
    }
    
    if (followerid != -4 && !instance_exists(followerid))
        followerid = -4;
    
    targetx = round(followerspace * x_offs);
    followx = (followerid == -4) ? followid.x : followerid.x;
    followy = (followerid == -4) ? followid.y : followerid.y;
    ds_queue_enqueue(followQueue, followx + targetx);
    ds_queue_enqueue(followQueue, followy);
    
    if (ds_queue_size(followQueue) > (LAG_STEPS * 2))
    {
        x = ds_queue_dequeue(followQueue) - image_xscale;
        y = ds_queue_dequeue(followQueue);
    }
}

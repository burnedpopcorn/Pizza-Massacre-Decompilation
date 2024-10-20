if (!hitboxcreate)
{
    if (object_index == obj_forknight || object_index == obj_tutorialknight || object_index == obj_olivefly)
    {
        with (instance_create_depth(x, y, -3, obj_forkhitbox))
        {
            baddieID = other.id;
            
            if (other.object_index == obj_olivefly)
            {
                sprite_index = other.sprite_index;
                mask_index = other.mask_index;
            }
        }
    }
    
    with (instance_create_depth(x, y, -3, obj_baddiehitbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.hitboxcreate = 1;
    }
}

if (flash && alarm[4] <= 0)
    alarm[4] = 0.04 * room_speed;

scr_enemystates();
scr_collide();

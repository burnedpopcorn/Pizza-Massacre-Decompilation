with (instance_place(x, y + 1, obj_player))
    hurtSpike();

with (instance_place(x, y - 1, obj_player))
    hurtSpike();

with (instance_place(x + 1, y, obj_player))
    hurtSpike();

with (instance_place(x - 1, y, obj_player))
    hurtSpike();

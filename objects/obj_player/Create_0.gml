scr_getinput();
hsp = 0;
hsp_carry = 0;
vsp = 0;
vsp_carry = 0;
on_stairs = 0;
input_buffer_walljump = 15;
grav = 0.5;
uparrow_ind = 0;
uparrow = false;
doorID = -4;
walljumptimer = 5;
platformid = -4;
yplus = 0;
climbindex = 0;
hurted = 0;
movespeed = 4;
inv_frames = 0;
wall_jumping = 0;
slaphand = 1;
state = states.normal;
targetDoor = "A";
dashAnim = 1;
vmovespeed = 0;
vmove = 0;
dashing = 0;
bodyslamefID = -4;
stairsID = -4;
xscale = 1;
yscale = 1;
move = 0;
onground = true;
flash = 0;
jumpAnim = 0;
jumpstop = 0;
weapon = 0;
depth = -6;
global.collect = 0;
global.p1_hp = 8;
global.shroomcollect = 0;
global.cheesecollect = 0;
global.tomatocollect = 0;
global.sausagecollect = 0;
global.pineapplecollect = 0;
global.firstfall = 0;
global.collectlist = ds_list_create();
global.followers_collected = 0;
global.following_list = ds_list_create();
global.instancelist = ds_list_create();
global.enemyroom = ds_list_create();
global.saveroom = ds_list_create();

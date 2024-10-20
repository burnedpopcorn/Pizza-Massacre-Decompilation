lockinplace = 0;
shake = 0;
playerID = obj_player1;
state = 0;
yview = 0;
alpha = 1;
fullscreenID = 0;
speedrunID = 0;
collectshake = 0;
dark_lighting = false;
image_speed = 0.2;
ini_open("saveDataPM.ini");

if (!ini_section_exists("KeyPress"))
{
    ini_write_string("KeyPress", "Up", 38);
    ini_write_string("KeyPress", "Down", 40);
    ini_write_string("KeyPress", "Left", 37);
    ini_write_string("KeyPress", "Right", 39);
    ini_write_string("KeyPress", "Jump", 90);
    ini_write_string("KeyPress", "Attack", 88);
    ini_write_string("KeyPress", "Dash", 16);
    ini_write_string("KeyPress", "Shoot", 67);
    ini_write_string("KeyPress", "Up2", 87);
    ini_write_string("KeyPress", "Down2", 83);
    ini_write_string("KeyPress", "Left2", 65);
    ini_write_string("KeyPress", "Right2", 68);
    ini_write_string("KeyPress", "Jump2", 81);
    ini_write_string("KeyPress", "Attack2", 84);
    ini_write_string("KeyPress", "Dash2", 82);
    ini_write_string("KeyPress", "Shoot2", 69);
}

global.key_up = ini_read_string("KeyPress", "Up", 38);
global.key_down = ini_read_string("KeyPress", "Down", 40);
global.key_left = ini_read_string("KeyPress", "Left", 37);
global.key_right = ini_read_string("KeyPress", "Right", 39);
global.key_dash = ini_read_string("KeyPress", "Dash", 16);
global.key_attack = ini_read_string("KeyPress", "Attack", 88);
global.key_jump = ini_read_string("KeyPress", "Jump", 90);
global.key_shoot = ini_read_string("KeyPress", "Shoot", 67);
global.key_start = 27;

if (!ini_section_exists("ControllerPress"))
{
    ini_write_string("ControllerPress", "Up", 32781);
    ini_write_string("ControllerPress", "Down", 32782);
    ini_write_string("ControllerPress", "Left", 32783);
    ini_write_string("ControllerPress", "Right", 32784);
    ini_write_string("ControllerPress", "Jump", 32769);
    ini_write_string("ControllerPress", "Attack", 32771);
    ini_write_string("ControllerPress", "Dash", 32774);
    ini_write_string("ControllerPress", "Shoot", 32770);
    ini_write_string("ControllerPress", "Up2", 32781);
    ini_write_string("ControllerPress", "Down2", 32782);
    ini_write_string("ControllerPress", "Left2", 32783);
    ini_write_string("ControllerPress", "Right2", 32784);
    ini_write_string("ControllerPress", "Jump2", 32769);
    ini_write_string("ControllerPress", "Attack2", 32771);
    ini_write_string("ControllerPress", "Dash2", 32774);
    ini_write_string("ControllerPress", "Shoot2", 32770);
}

global.key_startC = 32778;
global.key_upC = ini_read_string("ControllerPress", "Up", 32781);
global.key_downC = ini_read_string("ControllerPress", "Down", 32782);
global.key_leftC = ini_read_string("ControllerPress", "Left", 32783);
global.key_rightC = ini_read_string("ControllerPress", "Right", 32784);
global.key_dashC = ini_read_string("ControllerPress", "Dash", 32774);
global.key_attackC = ini_read_string("ControllerPress", "Attack", 32771);
global.key_jumpC = ini_read_string("ControllerPress", "Jump", 32769);
global.key_shootC = ini_read_string("ControllerPress", "Shoot", 32770);

if (!ini_section_exists("Options"))
{
    ini_write_real("Options", "Fullscreen", 0);
    ini_write_real("Options", "Speedrun Timer", 0);
}

global.fullscreen = ini_read_real("Options", "Fullscreen", 0);
global.speedruntimer = ini_read_real("Options", "Speedrun Timer", 0);
global.trophies_tut1 = ini_read_real("Trophies", "tutorial1", 0);
global.trophies_tut2 = ini_read_real("Trophies", "tutorial2", 0);
global.trophies_tut3 = ini_read_real("Trophies", "tutorial3", 0);
global.trophies_frank1 = ini_read_real("Trophies", "frank1", 0);
global.trophies_frank2 = ini_read_real("Trophies", "frank2", 0);
global.trophies_halloween = ini_read_real("Trophies", "halloween", 0);
global.trophies_secret = ini_read_real("Trophies", "secret", 0);
ini_close();

if (global.fullscreen == true)
    window_set_fullscreen(true);
else
    window_set_fullscreen(false);

global.hide_notif = 0;
global.frank_spotted = 0;
global.frank_attacked = 0;
global.pointfont = font_add_sprite_ext(spr_pointcollect, "0123456789", 1, 0);
global.font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!?,.:[]", 1, 0);

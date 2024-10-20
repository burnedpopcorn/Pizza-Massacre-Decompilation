audio_group_load(sfx_hidingalarm);
audio_group_load(mus_butcher);
mus = -4;
musPitch = 1;
musSlowdown = -1;
musDarkness = 0;
muscontinue = 0;
ambiencemus = -4;
fdoff = 0;
ini_open("saveDataPM.ini");
global.musicvolume = ini_read_real("Music", "Volume", 0.6);
global.sfxvolume = ini_read_real("SFX", "Volume", 0.8);
global.menuvolume = ini_read_real("Music", "Volume", 0.6);
ini_close();
global.backgroundmusic = 0;
music_array = [[Titlescreen, mus_menudark, 0], [PP_1, mus_tutorial, 0], [tutorialskip_1, mus_ambience, 0], [butcher_1, mus_butcher, 0], [halloween_demoend, mus_menudark, 0], [afterdemo_playground, mus_menu, 0]];
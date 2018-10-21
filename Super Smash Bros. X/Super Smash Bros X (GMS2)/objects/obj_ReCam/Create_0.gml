/// @description Insert description here
// You can write your code in this editor

zoomlvl = 1;

iw = 1280;
ih = 720;

surface_resize(application_surface,iw,ih);
display_set_gui_size(iw,ih);

window_set_size(iw,ih);
window_set_rectangle(0,0,iw,ih);
camera = camera_create();

camera_set_view_size(camera,iw,ih);
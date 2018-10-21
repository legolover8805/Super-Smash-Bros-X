/// @description Insert description here
// You can write your code in this editor

follow = obj_Player;
follow2 = obj_Sandbag;

camera = camera_create();

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(1280,720,1,10000);

camera_set_view_mat(camera,vm)
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

originalX = 1280;
originalY = 720;
xSize = 1280;
ySize = 720;
value = 0;
xVal = 0;
yVal =  0;
xCheck = 0;
xCheck2 = 0;
yCheck = 0;
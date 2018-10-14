/// @description Insert description here
// You can write your code in this editor

xTo = (follow.x+follow2.x)/2;
yTo = (follow.y+follow2.y)/2;
if (follow.x > follow2.x) {
	xDiff = (follow.x-follow2.x)/1280;
} else if (follow.x < follow2.x) {
	xDiff = (follow2.x -follow.x)/1280;
} else {
	xDiff = 0.01;
}
if (follow.y > follow2.y) {
	yDiff = (follow.y - follow2.y)/720;
} else if (follow.y < follow2.y) {
	yDiff = (follow2.y - follow.y)/720;
} else {
	yDiff = 0.01;
}

ySize = xDiff*originalY;
xSize = xDiff*originalX;

ySize = -1*(ySize-originalY);
xSize = -1*(xSize-originalX);

ySize = originalY*1.3 - ySize;
xSize = originalX*1.3 - xSize;

x += (xTo-x)/5;
y += (yTo-y)/5;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm)
var pm = matrix_build_projection_ortho(xSize,ySize,1,10000);
camera_set_proj_mat(camera,pm);
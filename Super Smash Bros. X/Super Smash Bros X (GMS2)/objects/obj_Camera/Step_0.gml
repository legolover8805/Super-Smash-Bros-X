/// @description Insert description here
// You can write your code in this editor
xTo = (follow.x+follow2.x)/2;
yTo = (follow.y+follow2.y)/2;

if (follow.x > follow2.x) {
	xDiff = (follow.x - follow2.x)/1280;
} else if (follow.x < follow2.x) {
	xDiff = (follow2.x - follow.x)/1280;
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

if (xDiff >= yDiff) {
	xSize = xDiff*originalX;
	value = round(originalX/xSize*100)/100;
	ySize = originalY/value;
	xSize = originalX/value;
} else if (yDiff > xDiff) {
	ySize = yDiff*originalY;
	value = round(originalY/ySize*100)/100;
	xSize = originalX/value;
	ySize = originalY/value;
}
x += (xTo-x);
y += (yTo-y);

xSize += 3*(originalX/10);
ySize += 3*(originalY/10);

if (xSize/ySize != originalX/originalY) {
	show_debug_message("woot");
}

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm)
var pm = matrix_build_projection_ortho(xSize,ySize,1,10000);
camera_set_proj_mat(camera,pm);


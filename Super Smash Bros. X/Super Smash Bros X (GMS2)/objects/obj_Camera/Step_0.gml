/// @description Insert description here
// You can write your code in this editor

xTo = (follow.x+follow2.x)/2;
yTo = (follow.y+follow2.y)/2;
/*if (follow.x > follow2.x) {
	xDiff = round((follow.x-follow2.x)/1280*100)/100;
} else if (follow.x < follow2.x) {
	xDiff = round((follow2.x -follow.x)/1280*100)/100;
} else {
	xDiff = 0.01;
}
if (follow.y > follow2.y) {
	yDiff = round((follow.y - follow2.y*100)/720)/100;
} else if (follow.y < follow2.y) {
	yDiff = round((follow2.y - follow.y*100)/720)/100;
} else {
	yDiff = 0.01;
}

if (xDiff >= yDiff) {
	xSize = round(xDiff*originalX*100)/100;
	value = round(originalX/xSize*100)/100;
	ySize = round(originalY/value*100)/100;
} else if (yDiff > xDiff) {
	ySize = round(yDiff*originalY*100)/100;
	value = round(originalY/ySize*100)/100;
	xSize = round(originalX/value*100)/100;
}

ySize = round(-1*(ySize-originalY)*100)/100;
xSize = round(-1*(xSize-originalX)*100)/100;

ySize = round((originalY*1.4 - ySize)*100)/100;
xSize = round((originalX*1.4 - xSize)*100)/100;*/

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

x += (xTo-x)/10;
y += (yTo-y)/10;


//show_debug_message(xSize);
//show_debug_message(ySize);

xSize += originalX/10;
ySize += originalY/10;
xSize += originalX/10;
ySize += originalY/10;
xSize += originalX/10;
ySize += originalY/10;

/*show_debug_message("x ");
show_debug_message(x);
show_debug_message("y ");
show_debug_message(y);*/

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm)
var pm = matrix_build_projection_ortho(xSize,ySize,1,10000);
camera_set_proj_mat(camera,pm);
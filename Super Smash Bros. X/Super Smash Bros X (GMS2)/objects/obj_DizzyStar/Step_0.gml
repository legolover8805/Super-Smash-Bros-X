/// @description Insert description here
// You can write your code in this editor
if (x >= rightEndPoint) {
	if (hsp > 0) {
		hsp *= -1;
		layer = layer_get_id("BGFrontEffects");
	}
} if (x <= leftEndPoint) {
	if (hsp < 0) {
		hsp *= -1;
		layer = layer_get_id("FrontPlayerEffect");
	}
}
x += hsp;

if (!isAlive) {
	instance_destroy();
}
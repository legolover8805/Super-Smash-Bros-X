/// @description Insert description here
// You can write your code in this editor


if (shielding) {
	hp -= .14;
	image_index = color;
} else if (!shielding) {
	image_index = 0;
	if  (hp < maxhp) {
		hp += .07;
	}
}

if (hp > maxhp) {
	hp = maxhp;
}

size = hp/maxhp;

image_xscale = size*direct;
image_yscale = size;
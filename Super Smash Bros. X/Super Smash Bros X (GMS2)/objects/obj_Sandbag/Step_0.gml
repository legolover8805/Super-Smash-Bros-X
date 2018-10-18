/// @description Insert description here
// You can write your code in this editor
dir = sign(image_xscale);
vsp += grav;

// Vertical Collision
if (place_meeting(x,y+vsp,obj_Wall)) {
	while (!place_meeting(x,y+sign(vsp),obj_Wall)) {
		y += sign(vsp);
	}
	vsp = 0;
}
if (knockbackY != 0) {
	vsp = percentMultiplier *percent * knockbackY * -1;
}

// Hitstun
if (isHit == 1) {
	image_index = 6;
	frames += 1;
	if (frames >= maxFrames) {
		isHit = 0;
	}
} else {
	image_index = 0;
	frames = 0;
}
show_debug_message(percent)

y = y + vsp;

// Knockback
if (knockbackX != 0) {
	knockValue = percentMultiplier * percent * knockbackX * dir;
	if (hsp < knockValue && dir == 1) {
		hsp += knockValue/15;
	} else if (dir == 1 && hsp >= knockValue) {
		hsp = 0;
		knockbackX = 0;
	} else if ( hsp > knockValue && dir == -1) {
		hsp += knockValue/15;
	} else if (dir == -1 && hsp <= knockValue) {
		hsp = 0;
		knockbackX = 0;
	}
}
x += hsp;

knockbackY = 0;
/*show_debug_message(maxFrames);
show_debug_message(frames);
*/

with hurtbox {
	x = other.x;
	y = other.y;
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
	image_index = other.image_index;
}

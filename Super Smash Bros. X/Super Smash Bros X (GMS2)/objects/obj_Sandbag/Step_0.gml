/// @description Insert description here
// You can write your code in this editor

vsp += grav;

// Vertical Collision
if (place_meeting(x,y+vsp,obj_Wall)) {
	while (!place_meeting(x,y+sign(vsp),obj_Wall)) {
		y += sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

// Hitstun

if (isHit == 1) {
	image_index = 6;
	frames += 1;
	if (frames == maxFrames) {
		isHit = 0;
	}
} else {
	image_index = 0;
	frames = 0;
}
show_debug_message(percent);

with hurtbox {
	x = other.x;
	y = other.y;
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
	image_index = other.image_index;
}
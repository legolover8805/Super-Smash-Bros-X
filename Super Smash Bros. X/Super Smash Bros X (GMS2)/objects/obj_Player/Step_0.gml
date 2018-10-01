/// @description 

// Keybinding
scr_Controls();

// Verticality
if(place_meeting(x,y+1,obj_Wall)) {
	onGround = true;
} else {
	onGround = false;
}
if (vsp >= -1.5) && (vsp <= 1.5) && (!onGround) && (key_downfall) {
	vsp += grav+7;
} else if (vsp > 1.5) && (!onGround) && (key_downfall) {
	vsp += grav+4;
} else {
	vsp += grav;
}

if (onGround) && (key_jump || key_jumpup) {
	jumps += 1;
	vsp = jsp;
} else if (!onGround) && (key_jump || key_jumpup) && (jumps < jmax) {
	jumps += 1;
	vsp = jsp;
	hasJump = 1;
} else if (onGround) {
	jumps = 0;
	hasJump = 0;
}
if (!onGround) && (hasJump = 0) {
	jumps = 1;
}

if (vsp < 0) && (!key_jumpheld) && (!key_jumpupheld) {
	vsp += grav;
}


// Vertical Collision
if (place_meeting(x,y+vsp,obj_Wall)) {
	while (!place_meeting(x,y+sign(vsp),obj_Wall)) {
		y += sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

// Walk Movement
var dir = key_right - key_left;
if (hsp > 0) && (dir == 0) && (isSkid == 0) && (vsp != 0) {
	hsp -= decel;
	if (hsp < .75) {
		hsp = 0;
	}
	if (hsp == 0) {
		isSkid = 1;
	}
} else if (hsp < 0) && (dir == 0) && (isSkid == 0) && (vsp != 0) {
	hsp += decel;
	if (hsp > -.75) {
		hsp = 0;
	}
	if (hsp == 0) {
		isSkid = 1;
	}
} else {
	if (vsp != 0) {
		hsp = dir * wasp;
	} else {
		hsp = dir * wsp;
	}
	isSkid = 0;
}

// Horizontal Collision
if (place_meeting(x+hsp,y,obj_Wall)) {
	while (!place_meeting(x+sign(hsp),y,obj_Wall)) {
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

// Animation
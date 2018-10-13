/// @description 

// Keybinding
scr_Controls();



// Verticality
if(place_meeting(x,y+1,obj_Wall)) {
	onGround = true;
} else {
	onGround = false;
}
if (vsp >= -.5) && (vsp <= .5) && (!onGround) && (key_downfall) {
	vsp += grav+7;
	animState = "quickFall";
} else if (vsp > 1.5) && (!onGround) && (key_downfall) {
	vsp += grav+4;
	animState = "quickFall";
} else {
	vsp += grav;
}

// Jab
if (onGround && key_normal && !key_left && !key_right && !key_down && !key_up && !key_jump && !key_grab && !key_shield) {
	if (animState == "jab") {
		if (jabCombo == 0 && playFrame <= 18) {
			jabCombo = 1;
		}
	} else if (animState == "jab2") {
		if (jabCombo == 1 && playFrame <= 18){
			jabCombo = 2;
		}
	} else if (animState != "jab" && animState != "jab2" && animState != "jab3") {
		playFrame = 0;
		animState = "jab";
	}
}

// Lag
if (!place_meeting(x,y+sign(vsp),obj_Wall)) && (place_meeting(x,y+vsp+4,obj_Wall)) {
	animState = "land";
}


if (animState == "land") || (animState == "jab") || (animState == "jab2") || (animState == "jab3") || (animState == "jabEnd") {
	lagging = true;
} else {
	lagging = false;
}


if (onGround) && (key_jump || key_jumpup) {
	if (!lagging) {
		jumps += 1;
		vsp = jsp;
		animState = "jumpUp";
	}
} else if (!onGround) && (key_jump || key_jumpup) && (jumps < jmax) {
	if (!lagging) {
		jumps += 1;
		vsp = jsp;
		//hasJump = 1;
		animState = "jumpUp";
	}
} else if (onGround) {
	jumps = 0;
	//hasJump = 0;
}
/* if (!onGround) && (hasJump = 0) {
	jumps = 1;
} */

if (vsp < 0) && (!key_jumpheld) && (!key_jumpupheld) {
	vsp += grav;
}

if (vsp >= 0) {
	if (!lagging) && (animState != "quickFall") {
		animState = "fall";
	}
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
var pastDir = dir;
dir = key_right - key_left;
if (jabbing == 1) {
	dir = pastDir;
}
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
		if (!key_jumpup && !key_jump) {
			dir = pastDir;
		}
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

if (hsp != 0 && vsp == 0) {
	if (!lagging) {
		animState = "walk";
	}
} else if (hsp == 0 && vsp == 0) {
	if (!lagging) {
		animState = "idle";
	}
}

if (animState == "land") || (animState == "jab") || (animState == "jab2") || (animState == "jab3") || (animState == "jabEnd") {
	hsp = 0;
}

x += hsp;



// Animation
sprite_index = spr_ZeroAnim;
image_speed = 0;
wasIdling = idling;
wasWalking = walking;
wasJumping = jumping;
wasJumpingUp = jumpingUp;
wasFalling = falling;
wasLanding = landing;
wasQuickFalling = quickFalling;
wasJabbing = jabbing;

framesGiven = 0;
scr_PAnimVars();
if (char == 0) {
	scr_ZeroAnims();
}



if (dir == 1) {
	image_xscale = 1;
} else if (dir == -1) {
	image_xscale = -1;
}

// Hitboxes
with hurtbox {
	x = other.x;
	y = other.y;
	image_xscale = other.image_xscale;
	image_index = other.image_index;
}
with hitbox {
	x = other.x;
	y = other.y;
	image_xscale = other.image_xscale;
	image_index = other.image_index;
	percentGiven = other.damageGiven;
	animState = other.animState;
	framesGiven = other.framesGiven;
	knockbackGivenX = other.knockbackGivenX;
	knockbackGivenY = other.knockbackGivenY;
	percentMultiplier = other.percentMultiplier;
}
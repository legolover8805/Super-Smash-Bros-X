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
		
	} else if (animState != "jab" && animState != "jab2") {
		playFrame = 0;
		animState = "jab";
	}
}

// Lag
if (!place_meeting(x,y+sign(vsp),obj_Wall)) && (place_meeting(x,y+vsp+4,obj_Wall)) {
	animState = "land";
}


if (animState == "land") || (animState == "jab") || (animState == "jab2") || (animState == "jabEnd") {
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

if (animState == "land") || (animState == "jab") || (animState == "jab2") || (animState == "jabEnd") {
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
if (animState == "idle") {
	scr_PAnimVars();
	damageGiven = 0;
	knockbackGiven = 0;
	idling = 1;
	image_index = idleFrame;
	if (playFrame == 40) {
		idleFrame = 1;
	} else if (playFrame == 50) {
		idleFrame = 2;
	} else if (playFrame == 90) {
		idleFrame = 1;
	} else if (playFrame == 100) {
		idleFrame = 0;
	} else if (playFrame == 140) {
		idleFrame = 1;
	} else if (playFrame == 150) {
		idleFrame = 2;
	} else if (playFrame == 190) {
		idleFrame = 1;
	} else if (playFrame == 200) {
		idleFrame = 0;
	} else if (playFrame == 210) {
		idleFrame = 3;
	} else if (playFrame == 215) {
		idleFrame = 4;
	} else if (playFrame == 220) {
		idleFrame = 3;
	} else if (playFrame == 225) {
		idleFrame = 0;
	}
	playFrame += 1;
	if (playFrame == 226) {
		playFrame = 0;
	} 
} else if (animState == "walk") {
	scr_PAnimVars();
	damageGiven = 0;
	knockbackGiven = 0;
	walking = 1;
	if (wasWalking == 0) {
		startWalking = 1;
	} 
	if (startWalking == 1) {
		if (playFrame == 0) {
			walkFrame = 5;
		} else if (playFrame == 2) {
			walkFrame = 6;
		} else if (playFrame == 4) {
			walkFrame = 7;
			startWalking = 0;
			playFrame = -1;
		}
	} else {
		if (playFrame == 2) {
			walkFrame += 1;
		} else if (playFrame == 4) {
			walkFrame += 1;
		} else if (playFrame == 6) {
			walkFrame += 1;
		} else if (playFrame == 8) {
			walkFrame += 1;
		} else if (playFrame == 10) {
			walkFrame += 1;
		} else if (playFrame == 12) {
			walkFrame += 1;
		} else if (playFrame == 14) {
			walkFrame += 1;
		} else if (playFrame == 16) {
			walkFrame += 1;
		} else if (playFrame == 18) {
			walkFrame += 1;
		} else if (playFrame == 20) {
			walkFrame += 1;
		} else if (playFrame == 22) {
			walkFrame += 1;
		} else if (playFrame == 24) {
			walkFrame += 1;
		} else if (playFrame == 26) {
			walkFrame += 1;
		} else if (playFrame == 28) {
			walkFrame = 7;
		}
	}
	image_index = walkFrame;
	playFrame += 1;
	if (playFrame == 29) {
		playFrame = 0;
	} 
} else if (animState == "jumpUp") {
	scr_PAnimVars();
	damageGiven = 0;
	knockbackGiven = 0;
	jumpingUp = 1;
	if (playFrame == 0) {
		jumpUpFrame = 22;
	} else if (playFrame == 6) {
		jumpUpFrame = 23;
		animState = "jump";
	}

	image_index = jumpUpFrame;
	playFrame += 1;
	if (playFrame == 7) {
		playFrame = 0;
	}
} else if (animState == "jump") {
	scr_PAnimVars();
	damageGiven = 0;
	knockbackGiven = 0;
	jumping = 1;
	if (playFrame == 0) {
		jumpFrame = 23;
	} else if (playFrame == 3) {
		jumpFrame = 24;
	} 
	image_index = jumpFrame;
	playFrame += 1;
	if (playFrame == 7) {
		playFrame = 0;
	}
} else if (animState == "fall") {
	scr_PAnimVars();
	damageGiven = 0;
	knockbackGiven = 0;
	falling = 1;
	if (wasFalling == 0) {
		startFalling = 1;
		playFrame = 0;
	} 
	if (startFalling == 1) {
		if (playFrame == 0) {
			fallFrame = 25;
		} else if (playFrame == 2) {
			fallFrame = 26;
		} else if (playFrame == 4) {
			fallFrame = 27;
		} else if (playFrame == 6) {
			fallFrame = 28;
		} else if (playFrame == 8) {
			fallFrame = 29;
		} else if (playFrame == 10) {
			fallFrame = 30;
			startFalling = 0;
			playFrame = 0;
		}
	} else {
		if (playFrame == 0) {
			fallFrame = 30;
		} else if (playFrame == 4) {
			fallFrame = 31;
		} else if (playFrame == 8) {
			fallFrame = 32;
		} else if (playFrame == 12) {
			fallFrame = 30;
		} /*else if (playFrame == 8) {
			fallFrame = 31;
		} else if (playFrame == 10) {
			fallFrame = 32;
		} else if (playFrame == 12) {
			fallFrame = 30;
		}*/
	}
	playFrame += 1;
	if (playFrame == 13) {
		playFrame = 0;
	}
	image_index = fallFrame;
} else if (animState == "land") {
	scr_PAnimVars();
	damageGiven = 0;
	knockbackGiven = 0;
	landing = 1;
	if (playFrame == 0) {
		landFrame = 33;
	} else if (playFrame == 1) {
		landFrame = 34;
	} 
	playFrame += 1;
	if (playFrame == 3) {
		playFrame = 0;
		if (key_right || key_left) {
			animState = "walk";
		} else {
			animState = "idle";
		}
	}
	image_index = landFrame;
} else if (animState == "quickFall") {
	scr_PAnimVars();
	damageGiven = 0;
	knockbackGiven = 0;
	quickFalling = 1;
	if (playFrame == 0) {
		quickFallFrame = 30;
	} else if (playFrame == 4) {
		quickFallFrame = 31;
	} else if (playFrame == 8) {
		quickFallFrame = 32;
	} else if (playFrame == 12) {
		quickFallFrame = 30;
	}
	playFrame += 1;
	if (playFrame == 13) {
		playFrame = 0;
	}
	image_index = quickFallFrame;
} else if (animState == "jab") {
	scr_PAnimVars();
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 37;
	} else if (playFrame == 1) {
		jabFrame = 38;
	} else if (playFrame == 2) {
		jabFrame = 39;
	} else if (playFrame == 3) {
		jabFrame = 40;
	} else if (playFrame == 5) {
		jabFrame = 41;
	} else if (playFrame == 6) {
		jabFrame = 42;
	} else if (playFrame == 7) {
		jabFrame = 43;
	} else if (playFrame == 8) {
		jabFrame = 44;
	} else if (playFrame == 10) {
		jabFrame = 45;
	} else if (playFrame == 12) {
		jabFrame = 46;
	} else if (playFrame == 14) {
		jabFrame = 47;
	} else if (playFrame == 16) {
		jabFrame = 48;
	} else if (playFrame == 18) {
		jabFrame = 60;
	} 
	if (jabFrame >= 39) && (jabFrame <= 49) {
		damageGiven = 3;
		knockbackGiven = 0;
		framesGiven = 12;
	}
	playFrame += 1;
	if (jabCombo == 1 && playFrame > 10) {
		playFrame = 0;
		animState = "jab2";
		jabFrame = 48;
	} 
	if (playFrame == 19) {
		playFrame = 0;
		animState = "jabEnd";
		jabFrame = 60;
	}
	image_index = jabFrame; 
} if (animState == "jab2") {
	scr_PAnimVars();
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 49;
	} else if (playFrame == 1) {
		jabFrame = 50;
	} else if (playFrame == 2) {
		jabFrame = 51;
	} else if (playFrame == 4) {
		jabFrame = 52;
	} else if (playFrame == 5) {
		jabFrame = 53;
	} else if (playFrame == 9) {
		jabFrame = 54;
	} else if (playFrame == 11) {
		jabFrame = 55;
	} else if (playFrame == 13) {
		jabFrame = 56;
	} else if (playFrame == 15) {
		jabFrame = 57;
	} else if (playFrame == 16) {
		jabFrame = 58;
	} else if (playFrame == 17) {
		jabFrame = 59;
	} else if (playFrame == 18) {
		jabFrame = 49;
	}
	if (jabFrame >= 50) && (jabFrame <= 57) {
		damageGiven = 3;
		knockbackGiven = 0;
		framesGiven = 12;
	}
	playFrame += 1;
	if (playFrame == 19) {
		playFrame = 0;
		jabCombo = 0;
		animState = "jabEnd";
	}
	image_index = jabFrame;
} if (animState == "jabEnd") {
	scr_PAnimVars();
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 61;
	} else if (playFrame == 3) {
		jabFrame = 62;
	} else if (playFrame == 6) {
		jabFrame = 63;
	} else if (playFrame == 9) {
		jabFrame = 64;
	} 
	playFrame += 1;
	if (playFrame == 13) {
		playFrame = 0;
		jabCombo = 0;
		animState = "idle";
	}
	image_index = jabFrame;
}
if (wasIdling == 1) && (idling == 0) {
	wasIdling = 0;
	playFrame = 0;
	idleFrame = 0;
} if (wasWalking == 1) && (walking == 0) {
	wasWalking = 0;
	playFrame = 0;
	walkFrame = 0;
} if (wasJumpingUp == 1) && (jumpingUp == 0) {
	wasJumpingUp = 0;
	playFrame = 0;
	jumpUpFrame = 22;
}
if (wasJumping == 1) && (jumping == 0) {
	wasJumping = 0;
	playFrame = 0;
	jumpFrame = 23;
}
if (wasFalling == 1) && (falling == 0) {
	wasFalling = 0;
	playFrame = 0;
	fallFrame = 25;
}
if (wasLanding == 1) && (landing == 0) {
	wasLanding = 0;
	playFrame = 0;
	landFrame = 33;
}
if (wasQuickFalling == 1) && (quickFalling == 0) {
	wasQuickFalling = 0;
	playFrame = 0;
	quickFallFrame = 30;
}
if (wasJabbing == 1) && (jabbing == 0) {
	wasJabbing = 0;
	playFrame = 0;
	jabFrame = 37;
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
}
/// @description 

// Keybinding
scr_Controls();

// Verticality
if(place_meeting(x,y+1,obj_Wall)) {
	onGround = true;
} else {
	onGround = false;
}

// Aerials
if (!onGround && !airLagging && animState != "quickFall"){
	if ((direct == 1) && ((key_right && key_normal) || (key_rsmashp))) {
		if (animState != "fair") {
			animState = "fair";
			playFrame = 0;
		}
	} if ((direct == -1) && ((key_left && key_normal) || (key_lsmashp))){
		if (animState != "fair") {
			animState = "fair";
			playFrame = 0;
		}
	} if (key_down && key_normal) || (key_dsmashp) { 
		if (animState != "dair") {
			animState = "dair";
			playFrame = 0;
		}
	} if (key_normal && !key_left && !key_right && !key_down && !key_up) {
		if (animState != "nair") {
			animState = "nair";
			playFrame = 0;
		}
	}
} 

if (vsp >= -.5) && (vsp <= .5) && (!onGround) && (animState != "dair") && (key_downfall) {
	if (!airLagging) {
		vsp += grav+6;
		animState = "quickFall";
	}
} else if (vsp > 1.5) && (!onGround) && (key_downfall) {
	if (!airLagging) {
		vsp += grav+3;
		animState = "quickFall";
	}
} else {
	vsp += grav;
}

// Jab
if (onGround && key_normal && !key_left && !key_right && !key_down && !key_up && !key_jump && !key_grab && !key_shield && animState != "FCharge" && animState != "FSmash") {
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
	if (animState == "fair") {
		playFrame = 0;
		animState = "fairland";
	} else if (animState == "dair" && !isDairLanding) {
		playFrame = 14;
		isDairLanding = true;
	} else if (isDairLanding) {
		if (playFrame < 14) {
			playFrame = 14;
		}
		isDairLanding = true;
	} else {
		animState = "land";
	}
} else if (!place_meeting(x,y+sign(vsp),obj_Wall)) && (place_meeting(x,y+vsp-4,obj_Wall)) {
	animState = "fall";
}


if (animState == "land") || isDairLanding || (animState == "dtilt") || (animState == "crouch") || (animState == "GroundNSpecial") || (animState == "GroundSSpecial") || (animState == "FSmashEnd") || (animState == "FCharge") || (animState == "FSmash") || (animState == "jab") || (animState == "jab2") || (animState == "jab3") || (animState == "fairland") || (animState == "jabEnd") {
	lagging = true;
} else {
	lagging = false;
}



if (onGround) && (key_jump) { // || key_jumpup
	if (!lagging) {
		jumps += 1;
		vsp = jsp;
		animState = "jumpUp";
	}
} else if (!onGround) && (key_jump) && (!airLagging) && (jumps < jmax) {
	if (!lagging && animState != "dair") {
		jumps += 1;
		vsp = jsp;
		hasJump = 1;
		animState = "jumpUp";
	}	
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

if (vsp >= 0) {
	if (!lagging) && !airLagging && (animState != "UpSpecial") && (animState != "quickFall") && (animState != "dair") && (animState != "nair") && (animState != "AirNSpecial") && (animState != "fair") {
		animState = "fall";
	}
	if (animState == "fair") {
		if (playFrame == 19) {
			animState = "fall";
		}
	}
}

// Vertical Collision
if (place_meeting(x,y+vsp,obj_Wall)) {
	while (!place_meeting(x,y+sign(vsp),obj_Wall)) {
		y += sign(vsp);
	}
	if (sign(vsp) == -1) {
		onGround = false;
		animState = "fall";
	}
	vsp = 0;
}

y = y + vsp;

// Walk Movement
var pastDir = dir;
dir = key_right - key_left;
/*if (dir == 0 && pastDir != 0 && onGround) {
	direct = pastDir;
} else if (dir != 0 && onGround) {
	direct = dir;
}
if (jabbing == 1) {
	dir = pastDir;
}*/

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
	if (!lagging && !isDairLanding) {
		animState = "idle";
	}
}

if (animState == "land") || (animState == "jab") || (animState == "jab2") || (animState == "jab3")  || (animState == "fairland") || (animState == "jabEnd") || lagging {
	hsp = 0;
	dir = pastDir;
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
wasFCharging = FCharging;
wasFSmashing = FSmashing;

direct = sign(image_xscale);

// Crouching
if (onGround && key_down && !lagging && animState != "crouch" && animState != "dtilt") {
	animState = "crouch";
} 
if (animState == "crouch" && !key_down) {
	crouchFirst = true;
	animState = "idle";
	playFrame = 0;
}
// Tilts
if (onGround && key_down && key_normal && animState != "dtilt") {
	playFrame = 0;
	animState = "dtilt";
}


// Smash Attacks
if (onGround && direct == -1 && key_rsmash) {
	dir = 1;
} else if (onGround && direct == 1 && key_lsmash) {
	dir = -1;
}
// F-Smash
if (onGround && key_normal && direct == 1 && key_forward && !key_left && !key_down && !key_up && !key_jump && !key_grab && !key_shield) || (onGround && direct == -1 && key_backward && !key_right && !key_down && !key_up && !key_jump && !key_grab && !key_shield && key_normal) || (onGround && !key_grab && !key_shield && key_rsmash) || (onGround && !key_grab && !key_shield && key_lsmash){
	if (!lagging) {
		animState = "FCharge";
		FChargeCount = 0;
	}
	lagging = true;
} if (onGround && direct == 1 && !key_left && !key_down && !key_up && !key_jump && !key_grab && !key_shield && animState == "FCharge" && key_normHeld) || (onGround && direct == -1 && !key_right && !key_down && !key_up && !key_jump && !key_grab && !key_shield && animState == "FCharge" && key_normHeld) || (onGround && direct == 1 && !key_down && !key_up && !key_jump && !key_grab && !key_shield && animState == "FCharge" && key_rsmash) || (onGround && direct == -1 && !key_down && !key_up && !key_jump && !key_grab && !key_shield && animState == "FCharge" && key_lsmash) {
	if (FChargeCount < 120) {
		FChargeCount += 1;
	} else {
		animState = "FSmash";
		playFrame = 0;
	}
} if (animState == "FCharge" && !key_normHeld && !key_rsmash && !key_lsmash) {
	animState = "FSmash";
	playFrame = 0;
} if (animState == "FSmash" && FCharge == 0) {
	if (FChargeCount <= 60) {
		FCharge = 1/3;
	} else if (FChargeCount <= 80) {
		FCharge = 1/2;
	} else if (FChargeCount <= 100) {
		FCharge = 2/3
	} else if (FChargeCount < 120) {
		FCharge = 5/6;
	} else if (FChargeCount == 120) {
		FCharge = 1;
	}
}  if (animState != "FSmash") {
	FCharge = 0;
}

// Specials
if (key_special && !lagging && onGround && !key_up && !key_down && !key_right && !key_left && canShoot == true) {
	animState = "GroundNSpecial";
} else if (!onGround && !key_normal && !airLagging && !key_left && !key_right && !key_down && !key_up && key_special && canShoot == true) {
	animState = "AirNSpecial";
}

// Down
if (key_special && !key_up && key_down && !key_right && !key_left && canShoot == true) {
	if (char == 0) {
		proj = scr_ProjectileSpawn(char,2,0,0,0,0,player,0,0,0,direct)
		canShoot = false;
		shotDelay = 40;
	}
}

if (canShoot == false) {
	shotTimer += 1;
	if (shotTimer == shotDelay) {
		shotTimer = 0;
		shotDelay = 30;
		canShoot = true;
	}
} 

if (key_special && !lagging && onGround && !key_up && !key_down && (key_right || key_left)) {
	animState = "GroundSSpecial";
}

if (key_special && key_up && !airLagging && !isFreeFalling) {
	if (animState != "UpSpecial") {
		animState = "UpSpecial";
		isFreeFalling = true;
		vsp = -5;
	}
}
if (animState == "nair") || (animState == "dair") || (animState == "fair") || (animState == "AirNSpecial") || (isFreeFalling) || (animState == "UpSpecial") {
	airLagging = true;
} else {
	airLagging = false;
}
if (onGround) && (isFreeFalling) {
	isFreeFalling = false;
}

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
	attack = other.animState;
	image_xscale = other.image_xscale;
	image_index = other.image_index;
	percentGiven = other.damageGiven;
	animState = other.animState;
	framesGiven = other.framesGiven;
	knockbackGivenX = other.knockbackGivenX;
	knockbackGivenY = other.knockbackGivenY;
	percentMultiplier = other.percentMultiplier;
	maxPauseFrames = other.maxPauseFrames;
}
with proj {
	proj = other.proj;
}

// Fixing
if (animState != "dair") {
	isDairLanding = false;
}


//show_debug_message(animState);
//show_debug_message(onGround);
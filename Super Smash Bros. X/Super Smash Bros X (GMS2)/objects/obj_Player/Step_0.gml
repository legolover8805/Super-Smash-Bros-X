/// @description 

// Keybinding
scr_Controls();

// Verticality
if(place_meeting(x,y+1,obj_Wall)) {
	airLag = false;
	onGround = true;
} else {
	onGround = false;
}

// Aerials
if (!onGround && !airLagging && animState != "quickFall"){
	if ((direct == 1) && !airLag && ((key_right && key_normal) || (key_rsmashp))) {
		if (animState != "fair") {
			animState = "fair";
			playFrame = 0;
		}
	} if ((direct == -1) && !airLag && ((key_left && key_normal) || (key_lsmashp))){
		if (animState != "fair") {
			animState = "fair";
			playFrame = 0;
		}
	} if ((direct == -1) && !airLag && ((key_right && key_normal) || (key_rsmashp))) {
		if (animState != "bair") {
			animState = "bair";
			playFrame = 0;
		}
	} if ((direct == 1) && !airLag && ((key_left && key_normal) || (key_lsmashp))){
		if (animState != "bair") {
			animState = "bair";
			playFrame = 0;
		}
	} if ((!airLag) && (key_down && key_normal)) || ((key_dsmash) && !airLag){ 
		if (animState != "dair") {
			animState = "dair";
			playFrame = 0;
		}
	} if (key_normal && !airLag && !key_left && !key_right && !key_down && !key_up) {
		if (animState != "nair") {
			animState = "nair";
			playFrame = 0;
		}
	}
} 


if (airLag) {
	if (airLagCounter < airLagMax) {
		airLagCounter += 1;
	} else {
		airLagCounter = 0;
		airLag = false;
	}
} 

if (vsp >= -.5) && (!onGround) && (animState != "dair") && (key_downfall) {
	if (!airLagging) {
		vsp += grav+6;
		animState = "quickFall";
	}
} else {
	vsp += grav;
}

// Jab
if (onGround && key_normal && !key_left && !key_right && !key_down && !key_up && !key_jump && !key_grab && !key_shield && !jabLagging && animState != "FCharge" && animState != "DCharge" && animState != "FSmash" && animState != "DSmash") {
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
	if (!airStopped) {
		if (animState == "fair") {
			playFrame = 0;
			animState = "fairland";
		} else if (animState == "dair" && !isDairLanding) {
			playFrame = 20;
			isDairLanding = true;
		} else if (isDairLanding) {
			if (playFrame < 20) {
				playFrame = 20;
			}
			isDairLanding = true;
		} else {
			animState = "land";
		}
	}
} else if (!place_meeting(x,y+sign(vsp),obj_Wall)) && (place_meeting(x,y+vsp-4,obj_Wall)) {
	if (!airStopped) {
		animState = "fall";
	}
}


if (animState == "land") || (animState == "ledgeGrab") || (animState == "ledgeClimbJump") || (animState == "ledgeClimbAttack") || (animState == "ledgeClimb") || (animState == "spotDodge") || (animState == "fRoll") || (animState = "bRoll") ||  (animState == "dizzyWake") || (animState == "dizzy") || (animState == "shielding") || isDairLanding || (animState == "dtilt") || (animState == "crouch") || (animState == "GroundNSpecial") || (animState == "GroundSSpecial") || (animState == "FSmashEnd") || (animState == "FCharge") || (animState == "FSmash") ||  (animState == "DCharge") || (animState == "DSmash") || (animState == "jab") || (animState == "jab2") || (animState == "jab3") || (animState == "fairland") || (animState == "jabEnd") {
	lagging = true;
} else {
	lagging = false;
}

if (animState == "land") || (animState == "dashAttack") || (animState == "dashLoop") || (animState == "dashStart") || (animState == "dashLag") || (animState == "ledgeGrab") || (animState == "ledgeClimbJump") || (animState == "ledgeClimbAttack") || (animState == "ledgeClimb") || (animState == "spotDodge") || (animState == "fRoll") || (animState = "bRoll") || (animState == "dizzyWake") || (animState == "dizzy") || (animState == "shielding") || isDairLanding || (animState == "dtilt") || (animState == "GroundNSpecial") || (animState == "GroundSSpecial") || (animState == "FSmashEnd") || (animState == "FCharge") || (animState == "FSmash") ||  (animState == "DCharge") || (animState == "DSmash") || (animState == "jab") || (animState == "jab2") || (animState == "jab3") || (animState == "fairland") || (animState == "jabEnd") {
	crouchLagging = true;
} else {
	crouchLagging = false;
}

if (animState == "land") || (animState == "dashAttack") || (animState == "dashLoop") || (animState == "dashStart") || (animState == "dashLag") || (animState == "ledgeGrab") || (animState == "ledgeClimbJump") || (animState == "ledgeClimbAttack") || (animState == "ledgeClimb") || (animState == "spotDodge") || (animState == "fRoll") || (animState = "bRoll") || (animState == "dizzy") || (animState == "dizzyWake") || (animState == "shielding") || isDairLanding || (animState == "dtilt") || (animState == "crouch") || (animState == "GroundNSpecial") || (animState == "GroundSSpecial") || (animState == "FSmashEnd") || (animState == "FCharge") || (animState == "FSmash") ||  (animState == "DCharge") || (animState == "DSmash") || (animState == "fairland") || (animState == "jabEnd") {
	jabLagging = true;
} else {
	jabLagging = false;
}


if (!onGround && animState == "shield") {
	animState = "jumpUp";
}

if (onGround) && (key_jump) { // || key_jumpup
	if (!lagging) {
		jumps += 1;
		vsp = jsp;
		animState = "jumpUp";
	}
} else if (!onGround) && (key_jump) && (!airLagging) && (jumps < jmax) {
	if (!lagging && !airLag && animState != "UpSpecial" && animState != "dair") {
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
	if (!lagging) && !airLagging && !stuckGround && (animState != "bair") && (animState != "UpSpecial") && (animState != "quickFall") && (animState != "dair") && (animState != "nair") && (animState != "AirNSpecial") && (animState != "fair") {
		animState = "fall";
	}
	/*if (animState == "fair") {
		if (playFrame == 19) {
			animState = "fall";
		}
	}*/
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

if (hangLedge) {
	animState = "ledgeGrab";
	airLag = false;
	isFreeFalling = false;
	onGround = false;
	airStopped = true;
	dir = ledge.side;
	if (ledge.side == -1) {
		x = ledge.x - ledge.sprite_width + ledgeDist;
	} else {
		x = ledge.x - ledgeDist;
	}
	y = ledge.y + ledgeHeight;
	hsp = 0;
	vsp = 0;
	if (canClimb) {
		if (key_jump || key_jumpup) {
			animState = "ledgeClimbJump";
			playFrame = 0;
			hangLedge = false;
			x += ledgeHor*direct;
			y -= ledgeTop;
			notLedgeMax = 60;
			jumps = 0;
		}
		if (key_normal) {
			animState = "ledgeClimbAttack";
			playFrame = 0;
			hangLedge = false;
			x += ledgeHor*direct;
			y -= ledgeTop;
			notLedgeMax = 60;
			jumps = 0;
		}
		if (direct == 1 && key_backward) || (direct == -1 && key_forward) {
			hsp = 5*direct;
			dir *= -1;
			notLedgeMax = 40;
			hangLedge = false;
			playFrame = 0;
			animState = "fall";
			jumps = 1;
		} else if (direct == 1 && key_forward) || (direct == -1 && key_backward) {
			hangLedge = false;
			playFrame = 0;
			animState = "ledgeClimb";
			x += ledgeHor*direct;
			y -= ledgeTop;
			notLedgeMax = 60;
			jumps = 0;
		}
	}
} else {
	canClimb = false;
	airStopped = false;
}

y = y + vsp;

if (notLedgeMax > 0) {
	notLedge += 1;
	if (notLedge == notLedgeMax) {
		notLedgeMax = 0;
	}
} else {
	notLedge = 0;
}


/*if (dir == 0 && pastDir != 0 && onGround) {
	direct = pastDir;
} else if (dir != 0 && onGround) {
	direct = dir;
}
if (jabbing == 1) {
	dir = pastDir;
}*/


// Walk Movement
pastDir = dir;
dir = key_right - key_left;
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
		if (!key_jumpup && !key_jump) || (airLagging) || (airLag) || (animState == "UpSpecial") {
			dir = pastDir;
		}
	} else {
		hsp = dir * wsp;
	}
	isSkid = 0;
}

if (isDashing) {
	vsp = 0;
	stuckGround = true;
	if (animState == "dashLoop") {
		totalFrames += 1;
		if (dir != direct && totalFrames >= 9) {
			animState = "dashLag";
		}
		hsp = dsp*direct;
	} else if (animState == "dashStart") {
		hsp = dssp *direct;
		if (key_forward || key_backward) {
			dance = true;
		} else {
			dance = false;
		}
	} else if (animState == "dashLag") {
		hsp = dlag * direct;
	} else if (animState == "dashAttack") {
		if (playFrame <= 21) {
			dattsp = 2;
		} else if (playFrame < 33) {
			dattsp = 0.5;
		} else {
			dattsp = 0.1;
		}
		hsp = dattsp * direct;
	} else {
		isDashing = false;
	}
	if (hangLedge) {
		isDashing = false;
	}
	if (key_jump) { // || key_jumpup
		if (animState != "dashLag") {
			jumps += 1;
			vsp = jsp;
			animState = "jumpUp";
			isDashing = false;
			hsp = dasp*direct;
		}
	}
	if (key_normal && animState != "dashAttack") {
		animState = "dashAttack";
	}
	if (!onGround) {
		isDashing = false;
		hsp = dasp*direct;
	}
} else {
	totalFrames = 0;
	stuckGround = false;
}

if (dashCheck) {
	dashCount += 1;
	if (onGround && !lagging && (key_right || key_left)) {
		animState = "dashStart";
		hsp = dssp*direct;
		stuckGround = true;
		dashCount = dashCountMax;
		isDashing = true;
	}
	if (dashCount == dashCountMax) {
		dashCheck = false;
		dashCount = 0;
	}
}
print(isDashing);

// Horizontal Collision
if (place_meeting(x+hsp,y,obj_Wall)) {
	while (!place_meeting(x+sign(hsp),y,obj_Wall)) {
		x += sign(hsp);
	}
	hsp = 0;
}

if (hsp != 0 && !hangLedge && !isDashing && vsp == 0) {
	if (!lagging) {
		animState = "walk";
	}
} else if (hsp == 0 && vsp == 0) {
	if (!lagging && !hangLedge && !isDairLanding) {
		animState = "idle";
	}
}

if (!lagging && onGround && !isDashing && key_shield) {
	animState = "shield";
	shield.shielding = true;
}

if (animState != "shield") {
	shield.shielding = false;
}

if (shield.hp <= 0) {
	animState = "dizzy";
}

if (animState == "dizzy") {
	if (dizzyCount == 0 && direct == 1) {
		star1 = scr_StarCreate(x+starRight,x-starLeft,.5,.25,.25);
		star2 = scr_StarCreate(x+starRight,x-starLeft,.5,.25,.25);
		star3 = scr_StarCreate(x+starRight,x-starLeft,.5,.25,.25);
		star4 = scr_StarCreateBG(x+starRight,x-starLeft,-.5,.25,.25);
		star5 = scr_StarCreateBG(x+starRight,x-starLeft,-.5,.25,.25);
		star2.x -= 9;
		star3.x -= 18;
		star4.x -= 9;
	} else if (dizzyCount == 0 && direct = -1) {
		star1 = scr_StarCreate(x+starLeft,x-starRight,.5,.25,.25);
		star2 = scr_StarCreate(x+starLeft,x-starRight,.5,.25,.25);
		star3 = scr_StarCreate(x+starLeft,x-starRight,.5,.25,.25);
		star4 = scr_StarCreateBG(x+starLeft,x-starRight,-.5,.25,.25);
		star5 = scr_StarCreateBG(x+starLeft,x-starRight,-.5,.25,.25);
		star2.x += 9;
		star3.x += 18;
		star4.x += 9;
	}
	dizzyCount += 1;
	lagging = true;
	if (key_mash) {
		dizzyCount += 2;
	}
	if (dizzyCount >= dizzyMax) {
		animState = "dizzyWake";
		playFrame = 0;
		dizzyCount = 0;
		shield.hp = 30;
		star1.isAlive = false;
		star2.isAlive = false;
		star3.isAlive = false;
		star4.isAlive = false;
		star5.isAlive = false;
	}
}

if (animState == "land") || (animState = "fRoll") || (animState = "bRoll") || (animState == "dizzy") || (animState == "shield") || (animState == "jab") || (animState == "jab2") || (animState == "jab3")  || (animState == "fairland") || (animState == "jabEnd") || lagging {
	hsp = 0;
	dir = pastDir;
}

if (animState != "fRoll") {
	if (animState == "shield" && direct == 1 && key_forward) {
		animState = "fRoll";
		playFrame = 0;
		fRollSpd = fRollSpeed;
	} else if (animState == "shield" && direct == -1 && key_backward) {
		animState = "fRoll";
		playFrame = 0;
		fRollSpd = fRollSpeed * -1;
	}
	fRollCount = 0;
}

if (animState != "bRoll") {
	if (animState == "shield" && direct == -1 && key_forward) {
		animState = "bRoll";
		playFrame = 0;
		bRollSpd = bRollSpeed;
	} else if (animState == "shield" && direct == 1 && key_backward) {
		animState = "bRoll";
		playFrame = 0;
		bRollSpd = bRollSpeed * -1;
	}
	bRollCount = 0;
}

if (animState == "fRoll") {
	if (fRollCount >= fRSpeedStart && fRollCount <= fRSpeedEnd && !onLedge) {
		hsp = fRollSpd;
	} else {
		hsp = 0;	
	} if (fRollCount == fRSwap) {
		dir *= -1;
		image_xscale *= -1;
	}
	fRollCount += 1;
} else {
	fRollCount = 0;
}

if (animState == "bRoll") {
	if (bRollCount >= bRSpeedStart && bRollCount <= bRSpeedEnd && !onLedge) {
		hsp = bRollSpd;
	} else {
		hsp = 0;
	}
	bRollCount += 1;
} else {
	bRollCount = 0;
}

if (animState != "spotDodge" && animState == "shield" && key_downfall) {
	animState = "spotDodge";
}



x += hsp;


// Animation
sprite_index = spr_ZeroAnim;
image_speed = 0;
wasIdling = idling;
wasWalking = walking;
wasDashStarting = dashStarting;
wasDashing = dashing;
wasDashLagging = dashLagging;
wasDashAttacking = dashAttacking;
wasJumping = jumping;
wasJumpingUp = jumpingUp;
wasFalling = falling;
wasLanding = landing;
wasQuickFalling = quickFalling;
wasJabbing = jabbing;
wasFCharging = FCharging;
wasFSmashing = FSmashing;
wasCrouching = crouching
wasDownTilting = downTilting;
wasFairing = fairing;
wasNairing = nairing;
wasBairing = bairing;
wasDairing = dairing;
wasFairLanding = fairLanding;
wasDCharging = DCharging;
wasDSmashing = DSmashing;
wasGNSpecialing = GNSpecialing;
wasANSpecialing = ANSpecialing;
wasGSSpecialing = GSSpecialing;
wasUpSpecialing = upSpecialing;
wasShielding = shielding;
wasDizzy = isDizzy;
wasFRolling = fRolling;
wasBRolling = bRolling;
wasSpotDodging = spotDodging;
wasLedgeGrabbing = ledgeGrabbing;
wasLedgeClimbing = ledgeClimbing;
wasLedgeClimbJumping = ledgeClimbJumping;
wasLedgeClimbAttacking = ledgeClimbAttacking;

direct = sign(image_xscale);

// Crouching
if (onGround && key_down && !crouchLagging && animState != "crouch" && animState != "shield" && animState != "spotDodge" && animState != "dtilt") {
	animState = "crouch";
} 
if (animState == "crouch" && !key_down) {
	crouchFirst = true;
	animState = "idle";
	playFrame = 0;
}

// Tilts
if (onGround && key_down && key_normal && !crouchLagging && animState != "dtilt") {
	playFrame = 0;
	animState = "dtilt";
}


// Smash Attacks
if (onGround && !lagging && !key_shield && direct == -1 && key_rsmash) {
	dir = 1;
} else if (onGround && !lagging && !key_shield && direct == 1 && key_lsmash) {
	dir = -1;
}

// F-Smash
if (onGround && key_normal && direct == 1 && key_forward && !key_left && !key_down && !key_up && !key_jump && !key_grab && !key_shield) || (onGround && direct == -1 && key_backward && !key_right && !key_down && !key_up && !key_jump && !key_grab && !key_shield && key_normal) || (onGround && !key_grab && !key_shield && key_rsmash) || (onGround && !key_grab && !key_shield && key_lsmash){
	if (!lagging) {
		animState = "FCharge";
		FChargeCount = 0;
	}
	lagging = true;
} if (onGround && animState == "FCharge" && key_normHeld) ||  (onGround && direct == 1 && animState == "FCharge" && key_rsmash) || (onGround && direct == -1 && animState == "FCharge" && key_lsmash) {
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

// D-Smash
if (onGround && key_normal && !key_right && !key_left && key_down && !key_up && !key_jump && !key_grab && !key_shield) || (onGround && !key_grab && !key_shield && key_dsmash){
	if (!lagging) {
		animState = "DCharge";
		DChargeCount = 0;
	}
	lagging = true;
} if (onGround && animState == "DCharge" && key_normHeld) || (onGround && animState == "DCharge" && key_dsmash) {
	if (DChargeCount < 120) {
		DChargeCount += 1;
	} else {
		animState = "DSmash";
		playFrame = 0;
	}
} if (animState == "DCharge" && !key_normHeld && !key_dsmash) {
	animState = "DSmash";
	playFrame = 0;
} if (animState == "DSmash" && DCharge == 0) {
	if (DChargeCount <= 60) {
		DCharge = 1/3;
	} else if (DChargeCount <= 80) {
		DCharge = 1/2;
	} else if (DChargeCount <= 100) {
		DCharge = 2/3
	} else if (DChargeCount < 120) {
		DCharge = 5/6;
	} else if (DChargeCount == 120) {
		DCharge = 1;
	}
}  if (animState != "DSmash") {
	DCharge = 0;
}

// Specials
if (key_special && !lagging && onGround && !key_up && !key_shield && !key_down && !key_right && !key_left && canShoot == true) {
	animState = "GroundNSpecial";
} else if (!onGround && !key_normal && !airLagging && !key_shield && !key_left && !key_right && !key_down && !key_up && key_special && canShoot == true) {
	animState = "AirNSpecial";
}

// Down
if (key_special && !key_shield && !crouchLagging && key_down && canShoot == true) {
	if (char == 0) {
		proj = scr_ProjectileSpawn(char,2,10,10,6,0.01,player,13,0,0,direct)
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

if (key_special && !lagging && onGround && !key_shield && !key_up && !key_down && (key_right || key_left)) {
	animState = "GroundSSpecial";
}

if (key_special && key_up && !lagging && !key_shield && !airLagging && !isFreeFalling) {
	if (animState != "UpSpecial") {
		animState = "UpSpecial";
		isFreeFalling = true;
		vsp = -5;
	}
}
if (animState == "nair") || (animState == "bair") || (animState == "ledgeGrab") || (animState == "dair") || (animState == "fair") || (animState == "AirNSpecial") || (isFreeFalling) || (animState == "UpSpecial") {
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
	isMeteor = other.isMeteor;
}
with proj {
	proj = other.proj;
}
with shield {
	direct = other.direct;
	x = other.x-5*other.direct;
	y = other.y+2;
}

floorDistance = distance_to_object(obj_Wall)+yHalfSize;
heightDistance = distance_to_object(obj_StageLength)+yHalfSize;

with shadow {
	x = other.x-other.xDisjoint*other.direct;
	floorDistance = other.floorDistance;
	heightDistance = other.heightDistance;
	if (other.onGround) {
		y = other.y+floorDistance;
		isVisible = true;
	} else {
		isVisible = false;
	}
	if (heightDistance < 0) {
		isVisible = false;
		image_alpha = 0;
	}
}

// Fixing
if (animState != "dair") {
	isDairLanding = false;
}
if (animState == "dair" && onGround == true && playFrame < 20) {
	playFrame = 20;
}
onLedge = false;
//print(dashCheck);
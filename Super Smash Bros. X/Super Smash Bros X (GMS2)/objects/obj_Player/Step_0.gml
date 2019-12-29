/// @description 

// Keybinding
scr_Controls();

if (x > room_width) || (x < 0) || (y > room_height) || (y < 0 && !isFreeFalling) {
	x = reviveX;
	y = reviveY;
	hsp = 0;
	isPaused = false;
	airLag = false;
	onGround = false;
	hitConCount = 0;
	lagging = false;
	isFreeFalling = true;
	playFrame = 0;
	isHit = 0;
	vsp = 0;
	percent = 0;
	knockbackX = 0;
	knockbackY = 0;
	knockValueX = 0;
	knockValueY = 0;
}

// Verticality
if(place_meeting(x,y+1,obj_Wall) || ledgeAction) {
	airLag = false;
	onGround = true;
	hitConCount = 0;
} else {
	onGround = false;
	lagging = false;
}
terminateProj = false;


if (animState == "AirDSpecial") || (animState = "AirUSpecial") || (animState == "nair") || (animState == "bair") || (animState == "ledgeGrab") || (animState == "dair") || (animState == "uair") || (animState == "fair") || (animState == "AirNSpecial") || (animState == "AirSSpecial") || (isFreeFalling) || (animState == "UpSpecial") {
	airLagging = true;
} else {
	airLagging = false;
}

// Aerials
if (!onGround && !airLagging && !ledgeAction && !onLedge && !lagging && animState != "quickFall"){
	if (animState != "jump" && animState != "jumpUp") {
		animState = "fall";
	}
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
	} if ((!airLag) && (key_up && key_normal)) || ((key_usmash) && !airLag){ 
		if (animState != "uair") {
			animState = "uair";
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

if (vsp >= -.5) && (!onGround) && !ledgeAction && (animState != "dair") && (key_downfall) {
	if (!airLagging) {
		vsp += grav+6;
		animState = "quickFall";
	}
} else {
	vsp += grav;
}

// Jab
if (onGround && key_normal && !key_left && !key_right && !key_down && !key_up && !key_jump && !key_grab && !key_shield && !jabLagging && animState != "FCharge" && animState != "DCharge" && animState != "UCharge" && animState != "FSmash" && animState != "DSmash" && animState != "USmash") {
	if (animState == "jab") {
		if (jabCombo == 0 && playFrame <= jabFrameEnd) {
			jabCombo = 1;
		}
	} else if (animState == "jab2") {
		if (jabCombo == 1 && playFrame <= jab2FrameEnd){
			jabCombo = 2;
		}
	} else if (animState != "jab" && animState != "jab2" && animState != "jab3") {
		playFrame = 0;
		animState = "jab";
	}
} 



// Lag
if (!place_meeting(x,y+sign(vsp),obj_Wall)) && (place_meeting(x,y+vsp+4,obj_Wall)) {
	if (!airStopped && !ledgeAction) {
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
		} else if (animState == "AirNSpecial") {
			ANSpecialing = 0;
			wasANSpecialing = 0;
			GNSpecialing = 1;
			wasGNSpecialing = 1;
			animState = "GroundNSpecial";
			shiftNSpecial = true;
			lagging = true;
			ANSpecialFrame = 263;
		} else if (animState == "AirSSpecial") {
			ASSpecialing = 0;
			wasASSpecialing = 0;
			GSSpecialing = 1;
			wasGSSpecialing = 1;
			animState = "GroundSSpecial";
			shiftSSpecial = true;
			lagging = true;
			ASSpecialFrame = 297;
		} else if (animState == "AirDSpecial") {
			ADSpecialing = 0;
			wasADSpecialing = 0;
			GDSpecialing = 1;
			wasGDSpecialing = 1;
			animState = "GroundDSpecial";
			shiftDSpecial = true;
			lagging = true;
			ADSpecialFrame = 319;
		} else if (animState == "AirUSpecial") {
			AUSpecialing = 0;
			wasAUSpecialing = 0;
			upSpecialing = 1;
			wasUpSpecialing = 1;
			animState = "UpSpecial";
			shiftUSpecial = true;
			lagging = true;
			AUSpecialFrame = 159;
		} else {
			animState = "land";
		}
	}
} else if (!place_meeting(x,y+sign(vsp),obj_Wall)) && (place_meeting(x,y+vsp-4,obj_Wall)) {
	if (!airStopped && !ledgeAction) {
		animState = "fall";
	} if (animState == "AirUSpecial") || isFreeFalling || (animState == "UpSpecial") {
		isFreeFalling = true;
	}
}



if (animState == "grab") || (animState == "sideTaunt") || (animState == "downTaunt") || (animState == "upTaunt") || (ledgeAction) || (animState == "downThrow") || (animState == "upThrow") || (animState == "forwardThrow") || (animState == "backThrow") || (animState == "GroundDSpecial") || (animState == "UpSpecial") || (animState == "utilt") || (animState == "ftilt") || (animState == "dashGrab") || (animState == "pummel") || (animState == "hold") || (animState == "land") || (animState == "ledgeGrab") || (animState == "ledgeClimbJump") || (animState == "ledgeClimbAttack") || (animState == "ledgeClimb") || (animState == "spotDodge") || (animState == "fRoll") || (animState = "bRoll") ||  (animState == "dizzyWake") || (animState == "dizzy") || (animState == "shielding") || isDairLanding || (animState == "dtilt") || (animState == "crouch") || (animState == "GroundNSpecial") || (animState == "GroundSSpecial") || (animState == "FSmashEnd") || (animState == "FCharge") || (animState == "FSmash") ||  (animState == "DCharge") || (animState == "DSmash") ||  (animState == "UCharge") || (animState == "USmash") || (animState == "jab") || (animState == "jab2") || (animState == "jab3") || (animState == "fairland") || (animState == "jabEnd") || (animState == "jab2End") || (animState == "jab3End") {
	lagging = true;
} else {
	lagging = false;
}

if (animState == "grab") || (animState == "sideTaunt") || (animState == "downTaunt") || (animState == "upTaunt") || (ledgeAction) || (animState == "downThrow") || (animState == "upThrow") || (animState == "forwardThrow") || (animState == "backThrow") || (animState == "UpSpecial") || (animState == "utilt") || (animState == "ftilt") || (animState == "dashGrab") || (animState == "pummel") || (animState == "hold") || (animState == "land") || (animState == "dashAttack") || (animState == "dashLoop") || (animState == "dashStart") || (animState == "dashLag") || (animState == "ledgeGrab") || (animState == "ledgeClimbJump") || (animState == "ledgeClimbAttack") || (animState == "ledgeClimb") || (animState == "spotDodge") || (animState == "fRoll") || (animState = "bRoll") || (animState == "dizzyWake") || (animState == "dizzy") || (animState == "shielding") || isDairLanding || (animState == "dtilt") || (animState == "GroundNSpecial") || (animState == "GroundSSpecial") || (animState == "FSmashEnd") || (animState == "FCharge") || (animState == "FSmash") ||  (animState == "DCharge") || (animState == "DSmash") || (animState == "UCharge") || (animState == "USmash") || (animState == "jab") || (animState == "jab2") || (animState == "jab3") || (animState == "fairland") || (animState == "jabEnd") || (animState == "jab2End") || (animState == "jab3End") {
	crouchLagging = true;
} else {
	crouchLagging = false;
}

if (animState == "grab") || (animState == "sideTaunt") || (animState == "downTaunt") || (animState == "upTaunt") || (ledgeAction) || (animState == "downThrow") || (animState == "upThrow") || (animState == "forwardThrow") || (animState == "backThrow") || (animState == "GroundDSpecial") || (animState == "UpSpecial") || (animState == "utilt") || (animState == "ftilt") || (animState == "dashGrab") || (animState == "pummel") || (animState == "hold") || (animState == "land") || (animState == "dashAttack") || (animState == "dashLoop") || (animState == "dashStart") || (animState == "dashLag") || (animState == "ledgeGrab") || (animState == "ledgeClimbJump") || (animState == "ledgeClimbAttack") || (animState == "ledgeClimb") || (animState == "spotDodge") || (animState == "fRoll") || (animState = "bRoll") || (animState == "dizzy") || (animState == "dizzyWake") || (animState == "shielding") || isDairLanding || (animState == "dtilt") || (animState == "crouch") || (animState == "GroundNSpecial") || (animState == "GroundSSpecial") || (animState == "FSmashEnd") || (animState == "FCharge") || (animState == "FSmash") ||  (animState == "DCharge") || (animState == "DSmash") || (animState == "UCharge") || (animState == "USmash") || (animState == "fairland") || (animState == "jabEnd") || (animState == "jab2End") || (animState == "jab3End") {
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
	if (!lagging) && !airLagging && !stuckGround && !ledgeAction && (animState != "bair") && (animState != "UpSpecial") && (animState != "quickFall") && (animState != "dair") && (animState != "nair") && (animState != "AirNSpecial") && (animState != "fair")  && (animState != "uair") {
		animState = "fall";
	}
	/*if (animState == "fair") {
		if (playFrame == 19) {
			animState = "fall";
		}
	}*/
} if (isFreeFalling) {
	animState = "fall";
}

// Vertical Collision
if (place_meeting(x,y+vsp,obj_Wall)) {
	while (!place_meeting(x,y+sign(vsp),obj_Wall)) {
		y += sign(vsp);
	}
	if (sign(vsp) == -1) {
		onGround = false;
		if (wasUpSpecialing || wasAUSpecialing) {
			isFreeFalling = true;
		}
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
	image_xscale = ledge.side;
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
			ledgeAction = true;
			lagging = true;
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
			ledgeAction = true;
			lagging = true;
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
			ledgeAction = true;
			lagging = true;
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
if (animState != "UpSpecial" && animState != "AirUSpecial") {
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
			if (isDashing) {
				hsp = dir * dasp;
			} else {
				hsp = dir * wasp;
			}
			if (!key_jump) || (airLagging) || (airLag) || (animState == "AirUSpecial") || (animState == "AirNSpecial") || (animState == "AirSSpecial") || (animState == "AirDSpecial") || (animState == "UpSpecial") {
				dir = pastDir;
			}
		} else {
			hsp = dir * wsp;
		}
		isSkid = 0;
	}
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
	if (animState != "dashAttack") {
		if (key_normal) {
			animState = "dashAttack";
		}
		if (!onGround) {
			isDashing = false;
			hsp = dasp*direct;
		}
		if (key_special) {
			isDashing = false;
			animState = "idle";
		}
		if (key_shield) {
			if (animState != "dashLagShield" && animState != "dashLag") {
				dashShield = true;
			}
		}
	}
	if (dashShield) {
		animState = "dashLagShield";
	}
} else {
	totalFrames = 0;
	dashShield = false;
	stuckGround = false;
}

if (dashCheck) {
	dashCount += 1;
	if (onGround && !lagging && ((key_forward && dashDirect == 1) || (key_backward && dashDirect == -1))) {
		animState = "dashStart";
		hsp = dssp*dashDirect;
		stuckGround = true;
		dashCount = dashCountMax;
		isDashing = true;
	}
	if (dashCount == dashCountMax) {
		dashCheck = false;
		dashCount = 0;
	}
	if (key_right && key_left && !key_normal && !key_special) {
		animState = "idle";
		dashCheck = false;
		dashCount = 0;
	}
}
//print(isDashing);

// Horizontal Collision
if (place_meeting(x+hsp,y,obj_Wall)) {
	while (!place_meeting(x+sign(hsp),y,obj_Wall)) {
		x += sign(hsp);
	}
	hsp = 0;
}

if (hsp != 0 && !hangLedge && onGround && !isDashing && vsp == 0) {
	if (!lagging) {
		animState = "walk";
	}
} else if (hsp == 0 && onGround && vsp == 0) {
	if (!lagging && !hangLedge && !ledgeAction && !key_normal && animState != "UpSpecial" && !key_special && !isDairLanding) {
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
		star2.x -= starDist;
		star3.x -= starDist*2;
		star4.x -= starDist;
	} else if (dizzyCount == 0 && direct = -1) {
		star1 = scr_StarCreate(x+starLeft,x-starRight,.5,.25,.25);
		star2 = scr_StarCreate(x+starLeft,x-starRight,.5,.25,.25);
		star3 = scr_StarCreate(x+starLeft,x-starRight,.5,.25,.25);
		star4 = scr_StarCreateBG(x+starLeft,x-starRight,-.5,.25,.25);
		star5 = scr_StarCreateBG(x+starLeft,x-starRight,-.5,.25,.25);
		star2.x += starDist;
		star3.x += starDist*2;
		star4.x += starDist;
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

if (!lagging && onGround && !isDashing && !isGrab && key_grabp) {
	animState = "grab";
	playFrame = 0;
	isGrab = true;
}
if (animState == "hold") {
	if (key_normal || key_grabp || key_special) {
		playFrame = 0;
		animState = "pummel";
	}
	if (key_downfall) {
		playFrame = 0;
		animState = "downThrow"
	} else if (key_jumpup) {
		playFrame = 0;
		animState = "upThrow";
	} else if (direct == 1 && key_forward) || (direct == -1 && key_backward) {
		playFrame = 0;
		animState = "forwardThrow";
	} else if (direct == -1 && key_forward) || (direct == 1 && key_backward) {
		playFrame = 0;
		animState = "backThrow";
	}
}

if (!lagging && onGround && (key_ltaunt || key_rtaunt)) {
	playFrame = 0;
	animState = "sideTaunt";
} else if (!lagging && onGround && key_dtaunt) {
	playFrame = 0;
	animState = "downTaunt";
} else if (!lagging && onGround && key_utaunt) {
	playFrame = 0;
	animState = "upTaunt";
}


//print(isGrab);


if (animState == "land") || (animState = "fRoll") || (animState = "bRoll") || (animState == "dizzy") || (animState == "shield") || (animState == "jab") || (animState == "jab2") || (animState == "jab3")  || (animState == "fairland") || (animState == "jabEnd") || (animState == "jab2End") || (animState == "jab3End") || lagging {
	if (animState != "UpSpecial" && animState != "AUSpecial") {
		hsp = 0;
		dir = pastDir;
	}
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

if (shiftNSpecial) {
	dir = pastDir;
	animState = "GroundNSpecial";
	scr_PAnimVars();
	wasGNSpecialing = 1;
	GNSpecialing = 1;
	wasANSpecialing = 0;
	ANSpecialing = 0;
} else if (shiftSSpecial) {
	dir = pastDir;
	animState = "GroundSSpecial";
	scr_PAnimVars();
	wasGSSpecialing = 1;
	GSSpecialing = 1;
	wasASSpecialing = 0;
	ASSpecialing = 0;
} else if (shiftDSpecial) {
	dir = pastDir;
	animState = "GroundDSpecial";
	scr_PAnimVars();
	wasGDSpecialing = 1;
	GDSpecialing = 1;
	wasADSpecialing = 0;
	ADSpecialing = 0;
} else if (shiftUSpecial) {
	dir = pastDir;
	animState = "UpSpecial";
	scr_PAnimVars();
	wasUpSpecialing = 1;
	upSpecialing = 1;
	wasAUSpecialing = 0;
	AUSpecialing = 0;
} 

// sprite_index = spr_ZeroAnim;
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
wasDCharging = DCharging;
wasDSmashing = DSmashing;
wasUCharging = UCharging;
wasUSmashing = USmashing;
wasCrouching = crouching
wasDownTilting = downTilting;
wasForwardTilting = forwardTilting;
wasUpTilting = upTilting;
wasFairing = fairing;
wasNairing = nairing;
wasBairing = bairing;
wasDairing = dairing;
wasUairing = uairing;
wasFairLanding = fairLanding;
wasGNSpecialing = GNSpecialing;
wasANSpecialing = ANSpecialing;
wasASSpecialing = ASSpecialing;
wasGSSpecialing = GSSpecialing;
wasGDSpecialing = GDSpecialing;
wasADSpecialing = ADSpecialing;
wasUpSpecialing = upSpecialing;
wasAUSpecialing = AUSpecialing;
wasShielding = shielding;
wasDizzy = isDizzy;
wasFRolling = fRolling;
wasBRolling = bRolling;
wasSpotDodging = spotDodging;
wasLedgeGrabbing = ledgeGrabbing;
wasLedgeClimbing = ledgeClimbing;
wasLedgeClimbJumping = ledgeClimbJumping;
wasLedgeClimbAttacking = ledgeClimbAttacking;
wasGrabbing = grabbing;
wasDashGrabbing = dashGrabbing;
wasHolding = holding;
wasPummelling = pummelling;
wasLettingGo = lettingGo;
wasDownThrowing = downThrowing;
wasUpThrowing = upThrowing;
wasForwardThrowing = forwardThrowing;
wasBackThrowing = backThrowing;
wasSideTaunting = sideTaunting;
wasDownTaunting = downTaunting;
wasUpTaunting = upTaunting;


direct = sign(image_xscale);

// Crouching
if (onGround && key_down && !crouchLagging && animState != "crouch" && animState != "shield" && animState != "spotDodge" && animState != "GroundDSpecial" && animState != "dtilt") {
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
} else if (onGround && key_up && key_normal && !isDashing && !lagging) {
	playFrame = 0;
	animState = "utilt";
} else if (onGround && !isDashing && key_normal && !lagging && ((key_left && direct==-1) || (key_right && direct==1))) {
	playFrame = 0;
	animState = "ftilt";
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
	if (key_jump) {
		vsp = 0;
		onGround = true
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

// Up Smash
if (onGround && key_normal && !key_right && !key_left && key_up && key_down && !key_jump && !key_grab && !key_shield) || (onGround && !key_grab && !key_shield && key_usmash){
	if (!lagging) {
		animState = "UCharge";
		UChargeCount = 0;
	}
	lagging = true;
} if (onGround && animState == "UCharge" && key_normHeld) || (onGround && animState == "UCharge" && key_usmash) {
	if (UChargeCount < 120) {
		UChargeCount += 1;
	} else {
		animState = "USmash";
		playFrame = 0;
	}
} if (animState == "UCharge" && !key_normHeld && !key_usmash) {
	animState = "USmash";
	playFrame = 0;
} if (animState == "USmash" && UCharge == 0) {
	if (UChargeCount <= 60) {
		UCharge = 1/3;
	} else if (UChargeCount <= 80) {
		UCharge = 1/2;
	} else if (UChargeCount <= 100) {
		UCharge = 2/3
	} else if (UChargeCount < 120) {
		UCharge = 5/6;
	} else if (UChargeCount == 120) {
		UCharge = 1;
	}
}  if (animState != "USmash") {
	UCharge = 0;
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
		proj = scr_ProjectileSpawn(char,2,10,10,6,0.01,player,13,0,0,direct,0,false)
		canShoot = false;
		shotDelay = 40;
	} else {
		if (onGround) {
			animState = "GroundDSpecial";
		} else {
			animState = "AirDSpecial";
		}
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
} else if (key_special && !lagging && !airLagging && !onGround && !key_shield && !key_up && !key_down && (key_right || key_left)) {
	animState = "AirSSpecial";
	if (direct == 1 && key_left) || (direct == -1 && key_right) {
		image_xscale*=-1;
	} 
}

if (key_special && key_up && !lagging && !airLagging && !isFreeFalling) {
	if (animState != "UpSpecial") {
		animState = "UpSpecial";
		//vsp = -5;
	}
	if (!onGround) {
		animState = "AirUSpecial";
	}
}


// Old Airlag
if (onGround) && (isFreeFalling) {
	isFreeFalling = false;
}



framesGiven = 0;
scr_PAnimVars();
if (char == 0) {
	scr_ZeroAnims();
} else if (char == 1) {
	scr_GenoAnims();
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
	knockbackDirGiven = other.knockbackDirGiven;
	baseKnockbackGivenX = other.baseKnockbackGivenX;
	baseKnockbackGivenY = other.baseKnockbackGivenY;
	capKnockbackGivenX = other.capKnockbackGivenX;
	capKnockbackGivenY = other.capKnockbackGivenY;
	knockbackGivenX = other.knockbackGivenX;
	knockbackGivenY = other.knockbackGivenY;
	percentMultiplier = other.percentMultiplier;
	maxPauseFrames = other.maxPauseFrames;
	isMeteor = other.isMeteor;
	isGrab = other.isGrab;
	isJabbed = other.isJabbed;
	grabSpotX = other.grabSpotX;
	grabSpotY = other.grabSpotY;
}
with proj {
	proj = other.proj;
	if (other.terminateProj) {
		instance_destroy();
	}
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
if (char == 0) {
	if (animState == "dair" && onGround == true && playFrame < 20) {
		playFrame = 20;
	}
}

// Sounds
if (hitConnect) {
	if (!isMeteor) {
		/*if (damageGiven >= 3) {
			if (damageGiven <= 6) {
				playSound(snd_LaunchSmall,1,false);
			} else if (damageGiven <= 9) {
				playSound(snd_LaunchMed,1,false);
			} else {
				playSound(snd_LaunchBig,1,false)
			}
		}*/
	} else if (isMeteor) {
		playSound(snd_Meteor1,1,false);
	}
}

/*if (onGround && key_jump && (key_dsmash || key_lsmash || key_rsmash || key_usmash)) {
	vsp = 0;
}*/
onLedge = false;
//print(airLag)
//print(playFrame);
//print(canClimb);
//print(animState);
//print(isFreeFalling)
//print(onGround);
//print(dir);
//print(dashCheck);
//print(char);
//print(player);


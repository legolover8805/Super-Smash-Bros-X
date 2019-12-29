isMeteor = false;
damageGiven = 0;
knockbackGivenX = 0;
knockbackGivenY = 0;
knockbackDirGiven = 1;
baseKnockbackGivenX = 0;
baseKnockbackGivenY = 0;
capKnockbackGivenX = 1000;
capKnockbackGivenY = 1000;
percentMultiplier = 0;
framesGiven = 0;
maxPauseFrames = 0;
isJabbed = false;

if (playFrame == 0) {
	hitConnect = false;
}

if (animState == "idle") {
	idling = 1;
	if (crouchFirst) {
		if (playFrame == 0) {
			idleFrame = 35;
		} else {
			idleFrame = 0;
			crouchFirst = false;
		}
	}
	image_index = idleFrame;
	if (playFrame == 40) {
		idleFrame = 1;
	} else if (playFrame == 50) {
		idleFrame = 2;
	} else if (playFrame == 65) {
		idleFrame = 3;
	} else if (playFrame == 75) {
		idleFrame = 0;
	}
	playFrame += 1;
	if (playFrame == 86) {
		playFrame = 0;
	} 
} else if (animState == "walk") {
	walking = 1;
	dashDirect = direct;
	if (wasWalking == 0) {
		startWalking = 1;
	} 
	if (startWalking == 1) {
		if (playFrame == 0) {
			walkFrame = 4;
		} else if (playFrame == 1) {
			walkFrame = 4;
			startWalking = 0;
			playFrame = -1;
		}
	} else {
		if (playFrame == 4) {
			walkFrame = 6;
		} else if (playFrame == 8) {
			walkFrame = 7;
		} else if (playFrame == 12) {
			walkFrame = 8;
		} else if (playFrame == 16) {
			walkFrame = 9;
		} else if (playFrame == 20) {
			walkFrame = 10;
		}
	}
	image_index = walkFrame;
	playFrame += 1;
	if (playFrame == 25) {
		walkFrame = 5
		playFrame = 0;
	} 
} else if (animState == "dashStart") {
	dashStarting = 1;
	if (playFrame == 0) {
		dashStartFrame = 4;
	} if (playFrame == 2) {
		dashStartFrame = 5;
	}
	image_index = dashStartFrame;
	playFrame += 1;
	if (playFrame == 4) {
		if (!dance) {
			animState = "dashLoop";
		}
		playFrame = 0;
	}
} else if (animState == "dashLoop") {
	dashing = 1;
	if (playFrame == 0) {
		dashFrame = 11;
	} else if (playFrame == 3) {
		dashFrame = 12;
	} else if (playFrame == 6) {
		dashFrame = 13;
	} else if (playFrame == 9) {
		dashFrame = 14;
	} else if (playFrame == 12) {
		dashFrame = 15;
	} else if (playFrame == 15) {
		dashFrame = 16;
	} else if (playFrame == 18) {
		dashFrame = 17;
	} else if (playFrame == 21) {
		dashFrame = 18;
	}
	image_index = dashFrame;
	playFrame += 1;
	if (playFrame == 25) {
		playFrame = 0;
	}
} else if (animState == "dashLag") {
	dashLagging = 1;
	if (playFrame == 0) {
		dashLagFrame = 19;
	}
	image_index = dashLagFrame;
	playFrame += 1;
	if (playFrame == 10) {
		isDashing = false;
		animState = "idle";
		playFrame = 0;
	}
} else if (animState == "dashLagShield") {
	dashLagging = 1;
	if (playFrame == 0) {
		dashLagFrame = 19;
	}
	image_index = dashLagFrame;
	playFrame += 1;
	if (playFrame == 20) {
		isDashing = false;
		animState = "shield";
		playFrame = 0;
	}
} else if (animState == "dashAttack") {
	dashAttacking = 1;
	if (playFrame == 0) {
		dashAttackFrame = 20;
	} else if (playFrame == 5) {
		dashAttackFrame = 21;
	} else if (playFrame == 10) {
		dashAttackFrame = 22;
	} else if (playFrame == 15) {
		dashAttackFrame = 23;
	} else if (playFrame == 25) {
		dashAttackFrame = 24;
	} 
	
	if (playFrame >= 5 && playFrame <= 8) {
		damageGiven = 8;
		knockbackGivenX = 20;
		baseKnockbackGivenX = 13;
		knockbackGivenY = 10;
		percentMultiplier = 0.01;
		framesGiven = 40;
	} else  if (playFrame > 8){
		damageGiven = 4;
		knockbackGivenX = 12;
		baseKnockbackGivenX = 13;
		knockbackGivenY = 5;
		percentMultiplier = 0.01;
		framesGiven = 20;
	}
	
	image_index = dashAttackFrame;
	playFrame += 1;
	if (playFrame == 35) {
		isDashing = false;
		animState = "idle";
		playFrame = 0;
	}
}

else if (animState == "jumpUp") {
	jumpingUp = 1;
	if (playFrame == 0) {
		jumpUpFrame = 25;
	} else if (playFrame == 6) {
		jumpUpFrame = 26;
		animState = "jump";
	}

	image_index = jumpUpFrame;
	playFrame += 1;
	if (playFrame == 7) {
		playFrame = 0;
	}
} else if (animState == "jump") {
	jumping = 1;
	if (playFrame == 0) {
		jumpFrame = 26;
	}
	image_index = jumpFrame;
	playFrame += 1;
	if (playFrame == 7) {
		playFrame = 0;
	}
} else if (animState == "fall") {
	falling = 1;
	if (wasFalling == 0) {
		startFalling = 1;
		playFrame = 0;
	} 
	if (startFalling == 1) {
		if (playFrame == 0) {
			fallFrame = 31;
		} else if (playFrame == 2) {
			fallFrame = 32;
			playFrame = 0;
		}
	} else {
		if (playFrame == 0) {
			fallFrame = 31;
		} else if (playFrame == 4) {
			fallFrame = 32;
		}
	}
	playFrame += 1;
	if (playFrame == 9) {
		playFrame = 0;
	}
	image_index = fallFrame;
} else if (animState == "land") {
	landing = 1;
	if (playFrame == 0) {
		landFrame = 33;
	} else if (playFrame == 2) {
		landFrame = 34;
	} 
	playFrame += 1;
	if (playFrame >= 4) {
		playFrame = 0;
		if (key_right || key_left) {
			animState = "walk";
		} else {
			animState = "idle";
		}
	}
	image_index = landFrame;
} else if (animState == "fairland") {
	fairLanding = 1;
	animState = "land";
	image_index = fairLandFrame;
} else if (animState == "quickFall") {
	quickFalling = 1;
	if (playFrame == 0) {
		quickFallFrame = 31;
	} else if (playFrame == 3) {
		quickFallFrame = 32;
	}
	playFrame += 1;
	if (playFrame == 7) {
		playFrame = 0;
	}
	image_index = quickFallFrame;
} else if (animState == "nair") {
	nairing = 1;
	if (playFrame == 0) {
		nairFrame = 31;
	} else if (playFrame == 5) {
		nairFrame = 221;
	} else if (playFrame == 9) {
		nairFrame = 222;
	} else if (playFrame == 12) {
		nairFrame = 223;
	} else if (playFrame == 15) {
		nairFrame = 224;
	} else if (playFrame == 18) {
		nairFrame = 31;
	} 
	
	if (playFrame >= 5 && playFrame <= 13) {
		damageGiven = 6;
		knockbackGivenX = 14;
		baseKnockbackGivenX = 13;
		baseKnockbackGivenY = 8;
		knockbackGivenY = 12;
		percentMultiplier = 0.01;
		framesGiven = 30;
	} else {
		damageGiven = 2;
		knockbackGivenX = 10;
		baseKnockbackGivenX = 13;
		baseKnockbackGivenY = 8;
		knockbackGivenY = 8;
		percentMultiplier = 0.01;
		framesGiven = 30;
	}
	playFrame += 1;
	if (playFrame == 23) {
		playFrame = 0;
		animState = "fall";
		airLag = true;
		airLagMax = 60;
	}
	image_index = nairFrame;
} else if (animState == "fair") {
	fairing = 1;
	if (playFrame == 0) {
		fairFrame = 31;
	} else if (playFrame == 5) {
		fairFrame = 225;
	} else if (playFrame == 10) {
		fairFrame = 226;
	} else if (playFrame == 13) {
		fairFrame = 227;
	} else if (playFrame == 16) {
		fairFrame = 228;
	} else if (playFrame == 19) {
		fairFrame = 229;
	} else if (playFrame == 22) {
		fairFrame = 230;
	} else if (playFrame == 24) {
		fairFrame = 231;
	} else if (playFrame == 26) {
		fairFrame = 232;
	} else if (playFrame == 28) {
		fairFrame = 233;
	} else if (playFrame == 31) {
		fairFrame = 234;
	} else if (playFrame == 34) {
		fairFrame = 235;
	}
	playFrame += 1;
	if (fairFrame <= 229) {
		damageGiven = 8;
		knockbackGivenX = 20;
		knockbackGivenY = 10;
		baseKnockbackGivenX = 15;
		percentMultiplier = 0.01;
		framesGiven = 30;
	} else {
		damageGiven = 1;
		knockbackGivenX = 15;
		knockbackGivenY = 10;
		percentMultiplier = 0.01;
		framesGiven = 20;
	}
	if (playFrame == 39) {
		playFrame = 0;
		airLag = true;
		airLagMax = 20;
		animState = "fall";
	}
	image_index = fairFrame;
	
} else if (animState == "bair") {
	bairing = 1;
	if (playFrame == 0) {
		bairFrame = 32;
	} else if (playFrame == 5) {
		bairFrame = 236;
	} else if (playFrame == 8) {
		bairFrame = 237;
	} else if (playFrame == 11) {
		bairFrame = 238;
	} else if (playFrame == 13) {
		bairFrame = 239;
	} else if (playFrame == 16) {
		bairFrame = 240;
	} else if (playFrame == 20) {
		bairFrame = 241;
	} else if (playFrame == 24) {
		bairFrame = 242;
	} else if (playFrame == 28) {
		bairFrame = 243;
	}
	playFrame += 1;
	if (bairFrame >= 238) && (bairFrame <= 240) {
		damageGiven = 7;
		knockbackGivenX = 12;
		knockbackGivenY = 5;
		baseKnockbackGivenY = 2.5;
		if (hitConnect && bairFrame <= 238) {
			hitConCount = 1;
		}  if (bairFrame > 238 && !hitConCount) {
			isMeteor = true;
		}
		percentMultiplier = 0.01;
		framesGiven = 30;
	}
	if (playFrame == 35) {
		playFrame = 0;
		airLag = true;
		airLagMax = 15;
		animState = "fall";
		hitConCount = 0;
	}
	image_index = bairFrame;
	
} else if (animState == "dair") {
	dairing = 1;
	if (playFrame == 0) {
		dairFrame = 252;
	} else if (playFrame == 4) {
		dairFrame = 253;
	} else if (playFrame == 7) {
		dairFrame = 254;
	} else if (playFrame == 9) {
		dairFrame = 255;
	} else if (playFrame == 11) {
		dairFrame = 256;
	} else if (playFrame == 13) {
		dairFrame = 257;
	} else if (playFrame == 15) {
		dairFrame = 258;
	} else if (playFrame == 17) {
		dairFrame = 259;
	} else if (playFrame == 20) {
		dairFrame = 260;
	} else if (playFrame == 23) {
		dairFrame = 261;
	} else if (playFrame == 26) {
		dairFrame = 262;
	} 
	playFrame += 1;
	if (playFrame >= 9 && playFrame <= 17) {
		damageGiven = 10;
		knockbackGivenX = 8;
		knockbackGivenY = 5;
		baseKnockbackGivenY = 2.5;
		if (hitConnect) {
			if (dairFrame != 257) {
				hitConCount = 1;
			}
		}  if (dairFrame == 257 && !hitConCount) {
			isMeteor = true;
		}
		percentMultiplier = 0.01;
		framesGiven = 30;
	} else {
		damageGiven = 8;
		knockbackGivenX = 7;
		knockbackGivenY = 4;
		baseKnockbackGivenY = 2.5;
		percentMultiplier = 0.01;
		framesGiven = 30;
	}
	if (playFrame == 29) {
		playFrame = 0;
		airLag = true;
		hitConCount = 0;
		airLagMax = 50;
		animState = "fall";
	}
	image_index = dairFrame;
} else if (animState == "uair") {
	uairing = 1;
	if (playFrame == 0) {
		uairFrame = 244;
	} else if (playFrame == 4) {
		uairFrame = 245;
	} else if (playFrame == 7) {
		uairFrame = 246;
	} else if (playFrame == 10) {
		uairFrame = 247;
	} else if (playFrame == 13) {
		uairFrame = 248;
	} else if (playFrame == 16) {
		uairFrame = 249;
	} else if (playFrame == 19) {
		uairFrame = 250;
	} else if (playFrame == 22) {
		uairFrame = 251;
	}
	playFrame += 1;
	if (playFrame >= 7 && playFrame < 19) {
		damageGiven = 7;
		knockbackGivenX = 7;
		knockbackGivenY = 20;
		baseKnockbackGivenY = 10;
		percentMultiplier = 0.01;
		framesGiven = 30;
	}
	if (playFrame == 26) {
		playFrame = 0;
		airLag = true;
		airLagMax = 35;
		animState = "fall";
	}
	image_index = uairFrame;
} else if (animState == "jab") {
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 117;
	} else if (playFrame == 3) {
		jabFrame = 118;
	} else if (playFrame == 6) {
		jabFrame = 119;
	} else if (playFrame == 9) {
		jabFrame = 120;
	} else if (playFrame == 13) {
		jabFrame = 121;
	} else if (playFrame == 17) {
		jabFrame = 122;
	}
	playFrame += 1;
	if (playFrame >= 17) { 
		damageGiven = 3;
		knockbackGivenX = 1;
		knockbackGivenY = 2;
		percentMultiplier = 0.01;
		framesGiven = 5;
		isJabbed = true;
	}
	if (playFrame > 21) {
		if (jabCombo == 1) {
			playFrame = 0;
			animState = "jab2";
		} else if (jabCombo != 1) {
			playFrame = 0;
			animState = "jabEnd";
		}
	}
	image_index = jabFrame; 
} if (animState == "jab2") {
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 123;
	} else if (playFrame == 3) {
		jabFrame = 124;
	} else if (playFrame == 6) {
		jabFrame = 125;
	} else if (playFrame == 10) {
		jabFrame = 126;
	} else if (playFrame == 14) {
		jabFrame = 127;
	} else if (playFrame == 18) {
		jabFrame = 128;
	}
	if (playFrame >= 3 && playFrame< 18) { 
		damageGiven = 3;
		knockbackGivenX = 2;
		knockbackGivenY = 2;
		percentMultiplier = 0.01;
		framesGiven = 20;
		isJabbed = true;
	}
	playFrame += 1;
	if (playFrame > 22){
		if (jabCombo == 2) {
			playFrame = 0;
			animState = "jab3";
		} else {
			playFrame = 0;
			jabCombo = 0;
			animState = "jab2End";
		}
	} 
	image_index = jabFrame;
} if (animState == "jab3") {
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 132;
	} else if (playFrame == 3) {
		jabFrame = 133;
	} else if (playFrame == 6) {
		jabFrame = 134;
	} else if (playFrame == 9) {
		jabFrame = 135;
	} else if (playFrame == 13) {
		jabFrame = 136;
	} else if (playFrame == 17) {
		jabFrame = 137;
	} else if (playFrame == 21) {
		jabFrame = 138;
	}
	if (playFrame >= 6 && playFrame < 21) { 
		damageGiven = 4;
		knockbackGivenX = 15;
		knockbackGivenY = 15;
		percentMultiplier = 0.01;
		framesGiven = 30;
		isJabbed = true;
	}
	playFrame += 1;
	if (playFrame == 25) {
		playFrame = 0;
		jabCombo = 0;
		animState = "jab3End";
	}
	image_index = jabFrame;
} if (animState == "jabEnd") {
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 139;
	} else if (playFrame == 5) {
		jabFrame = 140;
	} 
	playFrame += 1;
	if (playFrame == 11) {
		playFrame = 0;
		jabCombo = 0;
		animState = "idle";
	}
	image_index = jabFrame;
} if (animState == "jab2End") {
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 129;
	} else if (playFrame == 5) {
		jabFrame = 130;
	} else if (playFrame == 10) {
		jabFrame = 131;
	}
	playFrame += 1;
	if (playFrame == 16) {
		playFrame = 0;
		jabCombo = 0;
		animState = "idle";
	}
	image_index = jabFrame;
} if (animState == "jab3End") {
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 139;
	} else if (playFrame == 5) {
		jabFrame = 140;
	}
	playFrame += 1;
	if (playFrame == 11) {
		playFrame = 0;
		jabCombo = 0;
		animState = "idle";
	}
	image_index = jabFrame;
} if (animState == "FCharge") {
	FCharging = 1;
	if (playFrame == 0) {
		FChargeFrame = 168;
	} else if (playFrame == 3) {
		FChargeFrame = 169;
	} else if (playFrame == 6) {
		FChargeFrame = 170;
	} else if (playFrame == 9) {
		FChargeFrame = 171;
	} else if (playFrame == 12) {
		FChargeFrame = 172;
	} else if (playFrame == 15) {
		FChargeFrame = 171;
	} else if (playFrame == 18) {
		FChargeFrame = 170;
	}
	playFrame += 1;
	if (playFrame == 21) {
		playFrame = 3;
	}
	image_index = FChargeFrame;
} if (animState == "FSmash") {
	FSmashing = 1;
	if (playFrame == 0) {
		FSmashFrame = 173;
	} else if (playFrame == 2) {
		FSmashFrame = 173;
		proj = scr_ProjectileSpawnBack(char,0,11+(15*FCharge),11+(5*FCharge),18*FCharge,0.01,player,30,1+3*FCharge,0,direct,4,true);
	} else if (playFrame == 4) {
		FSmashFrame = 174;
	} else if (playFrame == 8) {
		FSmashFrame = 175;
	} else if (playFrame == 16) {
		FSmashFrame = 176;
	} else if (playFrame == 30) {
		FSmashFrame = 178;
	} 
	/*if (FSmashFrame == 173) {
		if (hitConnect) {
			terminateProj = true;
		}
		damageGiven = 21*FCharge;
		knockbackGivenX = 12+(15*FCharge);
		knockbackGivenY = 12+(15*FCharge);
		framesGiven = 30;
		percentMultiplier = 0.01;
		maxPauseFrames = 1;
	}*/
	playFrame += 1;
	image_index = FSmashFrame;
	if (playFrame == 45) {
		playFrame = 0;
		animState = "idle";
	}
} if (animState == "AirNSpecial") {
	ANSpecialing = 1;
	if (playFrame == 0) {
		ANSpecialFrame = 263;
	} else if (playFrame == 3) {
		ANSpecialFrame = 264;
	} else if (playFrame == 6) {
		ANSpecialFrame = 265;
	} else if (playFrame == 9) {
		ANSpecialFrame = 266;
	} else if (playFrame == 12) {
		ANSpecialFrame = 267;
	} else if (playFrame == 15) {
		ANSpecialFrame = 268;
	} else if (playFrame == 18) {
		ANSpecialFrame = 269;
	} else if (playFrame == 21) {
		ANSpecialFrame = 270;
	} else if (playFrame == 24) {
		ANSpecialFrame = 271;
	} else if (playFrame == 27) {
		ANSpecialFrame = 272;
	} else if (playFrame == 30) {
		ANSpecialFrame = 273;
	} else if (playFrame == 33) {
		ANSpecialFrame = 274;
	} else if (playFrame == 36) {
		ANSpecialFrame = 275;
	} else if (playFrame == 39) {
		ANSpecialFrame = 276;
	} else if (playFrame == 42) {
		ANSpecialFrame = 277;
	} else if (playFrame == 45) {
		ANSpecialFrame = 278;
	} else if (playFrame == 48) {
		ANSpecialFrame = 279;
	} else if (playFrame == 51) {
		ANSpecialFrame = 280;
	} else if (playFrame == 53) {
		ANSpecialFrame = 281;
	} else if (playFrame == 55) {
		ANSpecialFrame = 282;
	} else if (playFrame == 57) {
		ANSpecialFrame = 283;
	} else if (playFrame == 59) {
		ANSpecialFrame = 284;
	} else if (playFrame == 61) {
		ANSpecialFrame = 285;
	} else if (playFrame == 63) {
		ANSpecialFrame = 286;
	} else if (playFrame == 65) {
		ANSpecialFrame = 287;
	} else if (playFrame == 66) {
		ANSpecialFrame = 288;
	} else if (playFrame == 68) {
		ANSpecialFrame = 289;
	} else if (playFrame == 70) {
		ANSpecialFrame = 290;
	} else if (playFrame == 72) {
		ANSpecialFrame = 291;
	} else if (playFrame == 74) {
		ANSpecialFrame = 292;
	} else if (playFrame == 75) {
		ANSpecialFrame = 293;
	} else if (playFrame == 77) {
		ANSpecialFrame = 294;
	} else if (playFrame == 79) {
		ANSpecialFrame = 295;
	} else if (playFrame == 81) {
		ANSpecialFrame = 296;
	}
	if (ANSpecialFrame >= 279 && ANSpecialFrame <= 290) {
		damageGiven = 20;
		knockbackGivenX = 25;
		knockbackGivenY = 25;
		framesGiven = 30;
		percentMultiplier = 0.01;
		maxPauseFrames = 5;
	} else {
		damageGiven = 13;
		knockbackGivenX = 15;
		knockbackGivenY = 15;
		framesGiven = 30;
		percentMultiplier = 0.01;
		maxPauseFrames = 5;
	}
	playFrame += 1;
	if (playFrame == 83) {
		playFrame = 0;
		animState = "fall";
	}
	image_index = ANSpecialFrame;
}  if (animState == "GroundNSpecial") {
	GNSpecialing = 1;
	if (playFrame == 0) {
		GNSpecialFrame = 263;
	} else if (playFrame == 3) {
		GNSpecialFrame = 264;
	} else if (playFrame == 6) {
		GNSpecialFrame = 265;
	} else if (playFrame == 9) {
		GNSpecialFrame = 266;
	} else if (playFrame == 12) {
		GNSpecialFrame = 267;
	} else if (playFrame == 15) {
		GNSpecialFrame = 268;
	} else if (playFrame == 18) {
		GNSpecialFrame = 269;
	} else if (playFrame == 21) {
		GNSpecialFrame = 270;
	} else if (playFrame == 24) {
		GNSpecialFrame = 271;
	} else if (playFrame == 27) {
		GNSpecialFrame = 272;
	} else if (playFrame == 30) {
		GNSpecialFrame = 273;
	} else if (playFrame == 33) {
		GNSpecialFrame = 274;
	} else if (playFrame == 36) {
		GNSpecialFrame = 275;
	} else if (playFrame == 39) {
		GNSpecialFrame = 276;
	} else if (playFrame == 42) {
		GNSpecialFrame = 277;
	} else if (playFrame == 45) {
		GNSpecialFrame = 278;
	} else if (playFrame == 48) {
		GNSpecialFrame = 279;
	} else if (playFrame == 51) {
		GNSpecialFrame = 280;
	} else if (playFrame == 53) {
		GNSpecialFrame = 281;
	} else if (playFrame == 55) {
		GNSpecialFrame = 282;
	} else if (playFrame == 57) {
		GNSpecialFrame = 283;
	} else if (playFrame == 59) {
		GNSpecialFrame = 284;
	} else if (playFrame == 61) {
		GNSpecialFrame = 285;
	} else if (playFrame == 63) {
		GNSpecialFrame = 286;
	} else if (playFrame == 65) {
		GNSpecialFrame = 287;
	} else if (playFrame == 66) {
		GNSpecialFrame = 288;
	} else if (playFrame == 68) {
		GNSpecialFrame = 289;
	} else if (playFrame == 70) {
		GNSpecialFrame = 290;
	} else if (playFrame == 72) {
		GNSpecialFrame = 291;
	} else if (playFrame == 74) {
		GNSpecialFrame = 292;
	} else if (playFrame == 75) {
		GNSpecialFrame = 293;
	} else if (playFrame == 77) {
		GNSpecialFrame = 294;
	} else if (playFrame == 79) {
		GNSpecialFrame = 295;
	} else if (playFrame == 81) {
		GNSpecialFrame = 296;
	}
	if (GNSpecialFrame >= 279 && GNSpecialFrame <= 290) {
		damageGiven = 15;
		knockbackGivenX = 18;
		baseKnockbackGivenX = 7;
		baseKnockbackGivenY = 7;
		knockbackGivenY = 18;
		framesGiven = 30;
		percentMultiplier = 0.01;
		maxPauseFrames = 5;
	} else {
		damageGiven = 8;
		knockbackGivenX = 15;
		knockbackGivenY = 15;
		framesGiven = 30;
		percentMultiplier = 0.01;
		maxPauseFrames = 5;
	}
	playFrame += 1;
	if (playFrame == 83) {
		playFrame = 0;
		animState = "idle";
		shiftNSpecial = false;
	}
	image_index = GNSpecialFrame;
} if (animState == "GroundSSpecial") {
	GSSpecialing = 1;
	if (playFrame == 0) {
		GSSpecialFrame = 297;
	} else if (playFrame == 6) {
		GSSpecialFrame = 298;
	} else if (playFrame == 12) {
		GSSpecialFrame = 299;
	} else if (playFrame == 17) {
		GSSpecialFrame = 300;
		proj = scr_ProjectileSpawn(char,1,15,12,6,.01,player,20,4,0,direct,6,true);
	} else if (playFrame == 22) {
		GSSpecialFrame = 301;
	} else if (playFrame == 32) {
		GSSpecialFrame = 302;
	} else if (playFrame == 50) {
		GSSpecialFrame = 303;;
	} 
	playFrame += 1;
	if (playFrame == 56) {
		playFrame = 0;
		animState = "idle";
		shiftSSpecial = false;
	}
	image_index = GSSpecialFrame;
} if (animState == "AirSSpecial") {
	ASSpecialing = 1;
	if (playFrame == 0) {
		ASSpecialFrame = 297;
	} else if (playFrame == 6) {
		ASSpecialFrame = 298;
	} else if (playFrame == 12) {
		ASSpecialFrame = 299;
	} else if (playFrame == 17) {
		ASSpecialFrame = 300;
		proj = scr_ProjectileSpawn(char,1,15,12,6,.01,player,20,4,0,direct,6,true);
	} else if (playFrame == 22) {
		ASSpecialFrame = 301;
	} else if (playFrame == 32) {
		ASSpecialFrame = 302;
	} else if (playFrame == 50) {
		ASSpecialFrame = 303;;
	} 
	playFrame += 1;
	if (playFrame == 56) {
		playFrame = 0;
		animState = "idle";
	}
	image_index = ASSpecialFrame;
} if (animState == "AirDSpecial") {
	ADSpecialing = 1;
	if (playFrame == 0) {
		ADSpecialFrame = 319;
	} else if (playFrame == 6) {
		ADSpecialFrame = 320;
	} else if (playFrame == 10) {
		ADSpecialFrame = 321;
		proj = scr_ProjectileSpawn(char,3,3,3,4,.01,player,30,4,4,direct,6,true);
	} else if (playFrame == 40) {
		ADSpecialFrame = 322;
	}
	playFrame += 1;
	if (playFrame == 50) {
		playFrame = 0;
		animState = "fall";
	}
	image_index = ADSpecialFrame;
} if (animState == "GroundDSpecial") {
	GDSpecialing = 1;
	if (playFrame == 0) {
		GDSpecialFrame = 319;
	} else if (playFrame == 6) {
		GDSpecialFrame = 320;
	} else if (playFrame == 10) {
		GDSpecialFrame = 321;
		proj = scr_ProjectileSpawn(char,3,3,3,4,.01,player,30,4,4,direct,6,true);
	} else if (playFrame == 40) {
		GDSpecialFrame = 322;
	}
	playFrame += 1;
	if (playFrame == 50) {
		playFrame = 0;
		animState = "idle";
		shiftDSpecial = false;
	}
	image_index = GDSpecialFrame;
} if (animState == "AirUSpecial") {
	AUSpecialing = 1;
	if (playFrame == 0) {
		AUSpecialFrame = 304;
		airLag = true;
		airLagMax = 40;
	} else if (playFrame == 3) {
		AUSpecialFrame = 305;
	} else if (playFrame == 6) {
		AUSpecialFrame = 306;
	} else if (playFrame == 7) {
		AUSpecialFrame = 307;
	} else if (playFrame == 10) {
		AUSpecialFrame = 308;
	} else if (playFrame == 12) {
		AUSpecialFrame = 309;
	} else if (playFrame == 14) {
		AUSpecialFrame = 310;
	} else if (playFrame == 16) {
		AUSpecialFrame = 311;
		proj = scr_ProjectileSpawnBack(char,2,2,2,4,0.01,player,10,0,0,direct,5,true)
	} else if (playFrame == 18) {
		AUSpecialFrame = 312;
	} else if (playFrame == 20) {
		AUSpecialFrame = 313;
	} else if (playFrame == 22) {
		AUSpecialFrame = 314;
	} else if (playFrame == 24) {
		AUSpecialFrame = 315;
	} else if (playFrame == 26) {
		AUSpecialFrame = 316;
	} else if (playFrame == 28) {
		AUSpecialFrame = 317;
	} else if (playFrame == 30) {
		AUSpecialFrame = 318;
	} 
	playFrame += 1;
	if (playFrame == 16) {
		onGround = false;
		vsp = -14;
	} else if (playFrame == 17) {
		hsp = 14*direct;
	} else if (playFrame == 34) {
		playFrame = 0;
		animState = "fall";
		isFreeFalling = true;
	}
	image_index = AUSpecialFrame;
} if (animState == "UpSpecial") {
	upSpecialing = 1;
	if (playFrame == 0) {
		upSpecialFrame = 304;
		airLag = true;
		airLagMax = 40;
	} else if (playFrame == 3) {
		upSpecialFrame = 305;
	} else if (playFrame == 6) {
		upSpecialFrame = 306;
	} else if (playFrame == 7) {
		upSpecialFrame = 307;
	} else if (playFrame == 10) {
		upSpecialFrame = 308;
	} else if (playFrame == 12) {
		upSpecialFrame = 309;
	} else if (playFrame == 14) {
		upSpecialFrame = 310;
	} else if (playFrame == 16) {
		upSpecialFrame = 311;
		proj = scr_ProjectileSpawnBack(char,2,2,2,4,0.01,player,10,0,0,direct,5,true)
	} else if (playFrame == 18) {
		upSpecialFrame = 312;
	} else if (playFrame == 20) {
		upSpecialFrame = 313;
	} else if (playFrame == 22) {
		upSpecialFrame = 314;
	} else if (playFrame == 24) {
		upSpecialFrame = 315;
	} else if (playFrame == 26) {
		upSpecialFrame = 316;
	} else if (playFrame == 28) {
		upSpecialFrame = 317;
	} else if (playFrame == 30) {
		upSpecialFrame = 318;
	} 
	playFrame += 1;
	if (playFrame == 16) {
		onGround = false;
		vsp = -14;
	} else if (playFrame == 17) {
		hsp = 14*direct;
	} else if (playFrame == 34) {
		playFrame = 0;
		shiftUSpecial = false;
		animState = "fall";
		isFreeFalling = true;
	}
	image_index = upSpecialFrame;
} if (animState == "crouch") {
	crouching = 1;
	if (playFrame == 0) {
		crouchFrame = 35;
	} else if (playFrame == 1) {
		crouchFrame = 36;
	}
	playFrame += 1;
	image_index = crouchFrame;
} if (animState == "dtilt") {
	downTilting = 1;
	if (playFrame == 0) {
		downTiltFrame = 157;
	} else if (playFrame == 2) {
		downTiltFrame = 158;
	} else if (playFrame == 4) {
		downTiltFrame = 159;
	} else if (playFrame == 6) {
		downTiltFrame = 160;
	} else if (playFrame == 8) {
		downTiltFrame = 161;
	} else if (playFrame == 11) {
		downTiltFrame = 162;
	} else if (playFrame == 14) {
		downTiltFrame = 163;
	} else if (playFrame == 17) {
		downTiltFrame = 164;
	} else if (playFrame == 20) {
		downTiltFrame = 165;
	} else if (playFrame == 23) {
		downTiltFrame = 166;
	} else if (playFrame == 26) {
		downTiltFrame = 167;
	}
	damageGiven = 6;
	knockbackGivenX = 8;
	knockbackGivenY = 11;
	baseKnockbackGivenX = 3;
	baseKnockbackGivenY = 7;
	percentMultiplier = 0.01;
	framesGiven = 30;
	maxPauseFrames = 2;
	playFrame += 1;
	if (playFrame == 30) {
		playFrame = 0;
		animState = "idle";
	} 
	image_index = downTiltFrame;
} if (animState == "utilt") {
	upTilting = 1;
	if (playFrame == 0) {
		upTiltFrame = 149;
	} else if (playFrame == 3) {
		upTiltFrame = 150;
	} else if (playFrame == 6) {
		upTiltFrame = 151;
	} else if (playFrame == 9) {
		upTiltFrame = 152;
	} else if (playFrame == 12) {
		upTiltFrame = 153;
	} else if (playFrame == 15) {
		upTiltFrame = 154;
	} else if (playFrame == 18) {
		upTiltFrame = 155;
	} else if (playFrame == 21) {
		upTiltFrame = 156;
	} else if (playFrame == 24) {
		upTiltFrame = 150;
	} else if (playFrame == 27) {
		upTiltFrame = 149;
	}
	damageGiven = 5;
	knockbackGivenX = 3;
	knockbackGivenY = 14;
	baseKnockbackGivenX = 1;
	baseKnockbackGivenY = 8;
	percentMultiplier = 0.01;
	framesGiven = 30;
	maxPauseFrames = 3;
	playFrame += 1;
	if (playFrame == 31) {
		playFrame = 0;
		animState = "idle";
	} 
	image_index = upTiltFrame;
} if (animState == "ftilt") {
	forwardTilting = 1;
	if (playFrame == 0) {
		forwardTiltFrame = 141;
	} else if (playFrame == 3) {
		forwardTiltFrame = 142;
	} else if (playFrame == 6) {
		forwardTiltFrame = 143;
	} else if (playFrame == 9) {
		forwardTiltFrame = 144;
	} else if (playFrame == 12) {
		forwardTiltFrame = 145;
	} else if (playFrame == 15) {
		forwardTiltFrame = 146;
	} else if (playFrame == 19) {
		forwardTiltFrame = 147;
	} else if (playFrame == 24) {
		forwardTiltFrame = 148;
	}
	damageGiven = 7;
	knockbackGivenX = 15;
	knockbackGivenY = 5;
	baseKnockbackGivenX = 12;
	baseKnockbackGivenY = 3;
	percentMultiplier = 0.01;
	framesGiven = 30;
	maxPauseFrames = 3;
	playFrame += 1;
	if (playFrame == 30) {
		playFrame = 0;
		animState = "idle";
	} 
	image_index = forwardTiltFrame;
} if (animState == "DCharge") {
	DCharging = 1;
	if (playFrame == 0) {
		DChargeFrame = 195;
	} else if (playFrame == 3) {
		DChargeFrame = 196;
	} else if (playFrame == 6) {
		DChargeFrame = 197;
	} else if (playFrame == 9) {
		DChargeFrame = 198;
	} else if (playFrame == 12) {
		DChargeFrame = 199;
	} else if (playFrame == 15) {
		DChargeFrame = 200;
	} else if (playFrame == 19) {
		DChargeFrame = 201;
	} else if (playFrame == 23) {
		DChargeFrame = 202;
	} else if (playFrame == 27) {
		DChargeFrame = 203;
	}
	playFrame += 1;
	if (playFrame == 32) {
		playFrame = 15;
	}
	image_index = DChargeFrame;
} if (animState == "DSmash") {
	DSmashing = 1;
	if (playFrame == 0) {
		DSmashFrame = 204;
	} else if (playFrame == 2) {
		DSmashFrame = 205;
	} else if (playFrame == 4) {
		DSmashFrame = 206;
	} else if (playFrame == 6) {
		DSmashFrame = 207;
	} else if (playFrame == 9) {
		DSmashFrame = 208;
	} else if (playFrame == 12) {
		DSmashFrame = 209;
	} else if (playFrame == 15) {
		DSmashFrame = 210;
	} else if (playFrame == 18) {
		DSmashFrame = 211;
	} else if (playFrame == 21) {
		DSmashFrame = 212;
	} else if (playFrame == 24) {
		DSmashFrame = 213;
	} else if (playFrame == 27) {
		DSmashFrame = 214;
	} else if (playFrame == 30) {
		DSmashFrame = 215;
	} else if (playFrame == 33) {
		DSmashFrame = 216;
	} else if (playFrame == 36) {
		DSmashFrame = 217;
	} else if (playFrame == 39) {
		DSmashFrame = 218;
	} else if (playFrame == 42) {
		DSmashFrame = 219;
	} else if (playFrame == 45) {
		DSmashFrame = 220;
	} 
	playFrame += 1;
	if (DSmashFrame >= 212) && (DSmashFrame <= 215) {
		damageGiven = 4 + (18*DCharge);
		knockbackGivenX = 8+(15*DCharge);
		knockbackGivenY = 7+(9*DCharge);
		percentMultiplier = 0.01;
		framesGiven = 30;
		maxPauseFrames = 12;
	} else {
		damageGiven = 2 + (12*DCharge);
		knockbackGivenX = 2+(12*DCharge);
		knockbackGivenY = 2+(9*DCharge);
		percentMultiplier = 0.01;
		framesGiven = 30;
		maxPauseFrames = 6;
	}
	image_index = DSmashFrame;
	if (playFrame == 49) {
		playFrame = 0;
		animState = "idle";
		DSmashFrame = 204;
	}
} if (animState == "UCharge") {
	UCharging = 1;
	if (playFrame == 0) {
		UChargeFrame = 179;
	} else if (playFrame == 3) {
		UChargeFrame = 180;
	} else if (playFrame == 6) {
		UChargeFrame = 181;
	} else if (playFrame == 9) {
		UChargeFrame = 182;
	} else if (playFrame == 13) {
		UChargeFrame = 183;
	} else if (playFrame == 17) {
		UChargeFrame = 184;
	} 
	playFrame += 1;
	image_index = UChargeFrame;
	if (playFrame == 22) {
		playFrame = 6;
	}
} if (animState == "USmash") {
	USmashing = 1;
	if (playFrame == 0) {
		USmashFrame = 185;
	} else if (playFrame == 4) {
		USmashFrame = 186;
	} else if (playFrame == 8) {
		USmashFrame = 187;
	} else if (playFrame == 12) {
		USmashFrame = 188;
	} else if (playFrame == 16) {
		USmashFrame = 189;
	} else if (playFrame == 20) {
		USmashFrame = 190;
	} else if (playFrame == 24) {
		USmashFrame = 191;
	} else if (playFrame == 28) {
		USmashFrame = 192;
	} else if (playFrame == 32) {
		USmashFrame = 193;
	} else if (playFrame == 36) {
		USmashFrame = 194;
	}
	if (USmashFrame == 185) {
		damageGiven = 1 + (18*UCharge);
		knockbackGivenX = 6+(6*UCharge);
		knockbackGivenY = 6+(12*UCharge);
		percentMultiplier = 0.01;
		framesGiven = 30;
		maxPauseFrames = 12;
	} else if (USmashFrame <= 188) {
		damageGiven = 1 + (18*UCharge);
		knockbackGivenX = 6+(6*UCharge);
		knockbackGivenY = 9+(15*UCharge);
		percentMultiplier = 0.01;
		framesGiven = 30;
		maxPauseFrames = 12;
	} else {
		damageGiven = 1 + (18*UCharge);
		knockbackGivenX = 6+(6*UCharge);
		knockbackGivenY = 6+(12*UCharge);
		percentMultiplier = 0.01;
		framesGiven = 30;
		maxPauseFrames = 12;
	}
	playFrame += 1;
	image_index = USmashFrame;
	if (playFrame = 41) {
		playFrame = 0;
		USmashFrame = 185;
		animState = "idle";
	}
} if (animState == "shield") {
	shielding = 1;
	shieldFrame = 50;
	image_index = shieldFrame;
} if (animState == "dizzy") {
	isDizzy = 1;
	if (playFrame == 0) {
		dizzyFrame = 51;
	} else if (playFrame == 4) {
		dizzyFrame = 52;
	} 
	playFrame += 1;
	image_index = dizzyFrame;
} if (animState == "dizzyWake") {
	isDizzy = 1;
	if (playFrame == 0) {
		dizzyFrame = 53;
	} else if (playFrame == 8) {
		dizzyFrame = 54;
	} else if (playFrame == 16) {
		dizzyFrame = 55;
	}
	playFrame += 1;
	if (playFrame == 25) {
		playFrame = 0;
		animState = "idle";
	}
	image_index = dizzyFrame;
} if (animState == "fRoll") {
	fRolling = 1;
	if (playFrame == 0) {
		fRollFrame = 68;
	} else if (playFrame == 3) {
		fRollFrame = 69;
	} else if (playFrame == 7) {
		fRollFrame = 70;
	} else if (playFrame == 9) {
		fRollFrame = 71;
	} else if (playFrame == 12) {
		fRollFrame = 72;
	} else if (playFrame == 16) {
		fRollFrame = 73;
	} else if (playFrame == 22) {
		fRollFrame = 74;
	}
	playFrame += 1;
	if (playFrame == 29) {
		playFrame = 0;
		animState = "shield";
	}
	image_index = fRollFrame;
} if (animState == "bRoll") {
	bRolling = 1;
	if (playFrame == 0) {
		bRollFrame = 62;
	} else if (playFrame == 3) {
		bRollFrame = 63;
	} else if (playFrame == 6) {
		bRollFrame = 64;
	} else if (playFrame == 9) {
		bRollFrame = 65;
	} else if (playFrame == 12) {
		bRollFrame = 66;
	} else if (playFrame == 18) {
		bRollFrame = 67
	}
	playFrame += 1;
	if (playFrame == 31) {
		playFrame = 0;
		animState = "shield";
	}
	image_index = bRollFrame;
} if (animState == "spotDodge") {
	spotDodging = 1;
	if (playFrame == 0) {
		spotDodgeFrame = 56;
	} else if (playFrame == 3) {
		spotDodgeFrame = 57;
	} else if (playFrame == 6) {
		spotDodgeFrame = 58;
	} else if (playFrame == 9) {
		spotDodgeFrame = 59;
	} else if (playFrame == 12) {
		spotDodgeFrame = 60;
	} else if (playFrame == 18) {
		spotDodgeFrame = 61;
	}
	playFrame += 1;
	if (playFrame == 24) {
		playFrame = 0;
		animState = "shield";
	}
	image_index = spotDodgeFrame;
} if (animState == "ledgeGrab") {
	ledgeGrabbing = 1;
	if (playFrame == 0) {
		ledgeGrabFrame = 37;
	} else if (playFrame == 5) {
		ledgeGrabFrame = 38;
	} else if (playFrame >= 18) {
		ledgeGrabFrame = 38;
		canClimb = true;
	} 
	playFrame += 1;
	image_index = ledgeGrabFrame;
} if (animState == "ledgeClimb") {
	ledgeClimbing = 1;
	if (playFrame == 0) {
		ledgeClimbFrame = 39;
	} else if (playFrame == 3) {
		ledgeClimbFrame = 40;
	} else if (playFrame == 6) {
		ledgeClimbFrame = 41;
	} else if (playFrame == 9) {
		ledgeClimbFrame = 42;
	} else if (playFrame == 12) {
		ledgeClimbFrame = 43;
	}
	playFrame += 1;
	if (playFrame == 17) {
		playFrame = 0;
		animState = "idle";
		ledgeAction = false;
	}
	image_index = ledgeClimbFrame;
} if (animState == "ledgeClimbJump") {
	ledgeClimbJumping = 1;
	if (playFrame == 0) {
		ledgeClimbJumpFrame = 39;
	} else if (playFrame == 3) {
		ledgeClimbJumpFrame = 40;
	} else if (playFrame == 6) {
		ledgeClimbJumpFrame = 41;
	}
	playFrame += 1;
	if (playFrame == 9) {
		playFrame = 0;
		jumps += 1;
		vsp = jsp;
		animState = "jumpUp";
		ledgeAction = false;
	}
	image_index = ledgeClimbJumpFrame;
} if (animState == "ledgeClimbAttack") {
	ledgeClimbAttacking = 1;
	if (playFrame == 0) {
		ledgeClimbAttackFrame = 44;
	} else if (playFrame == 3) {
		ledgeClimbAttackFrame = 45;
	} else if (playFrame == 6) {
		ledgeClimbAttackFrame = 46;
	} else if (playFrame == 9) {
		ledgeClimbAttackFrame = 47;
	} else if (playFrame == 13) {
		ledgeClimbAttackFrame = 48;
	} else if (playFrame == 18) {
		ledgeClimbAttackFrame = 49;
	}
	damageGiven = 8;
	knockbackGivenX = 20;
	baseKnockbackGivenX = 13;
	knockbackGivenY = 10;
	percentMultiplier = 0.01;
	framesGiven = 40;
	playFrame += 1;
	if (playFrame == 25) {
		playFrame = 0;
		animState = "idle";
		ledgeAction = false;
	}
	image_index = ledgeClimbAttackFrame;
} else if (animState == "grab") {
	grabbing = 1;
	grabSpotX = 20;
	grabSpotY = 0;
	if (playFrame == 0) {
		grabFrame = 75;
	} else if (playFrame == 4) {
		grabFrame = 76;
	} else if (playFrame == 8) {
		grabFrame = 77;
	} else if (playFrame == 12) {
		grabFrame = 78;
	} else if (playFrame == 18) {
		grabFrame = 79;
	} else if (playFrame == 24) {
		grabFrame = 80;
	} else if (playFrame == 34) {
		grabFrame = 81;
	}
	if (hitConnect) {
		animState = "hold";
		playFrame = 0;
	}
	if (playFrame == 40) {
		animState = "idle";
		isGrab = 0;
		playFrame = 0;
	}
	playFrame += 1;
	image_index = grabFrame;
} else if (animState == "dashGrab") {
	dashGrabbing = 1;
	image_index = dashGrabFrame;
} else if (animState == "hold") {
	holding = 1;
	holdFrame = 82;
	image_index = holdFrame;
} else if (animState == "pummel") {
	pummelling = 1;
	if (playFrame == 0) {
		pummelFrame = 83;
	} else if (playFrame == 3) {
		pummelFrame = 84;
		damageGiven = 2;
		framesGiven = 5;
	} else if (playFrame == 6) {
		pummelFrame = 85;
	} else if (playFrame == 9) {
		pummelFrame = 86;
	}
	playFrame += 1;
	if (playFrame == 14) {
		playFrame = 0;
		animState = "hold";
	}
	image_index = pummelFrame;
} else if (animState == "downThrow") {
	downThrowing = 1;
	if (playFrame < 10) {
		grabSpotX -=1;
	}
	if (playFrame == 0) {
		downThrowFrame = 87;
		//grabSpotX = 15;
	} else if (playFrame == 3) {
		//grabSpotX = 10;
		downThrowFrame = 88;
	} else if (playFrame == 6) {
		//grabSpotX = 5;
		downThrowFrame = 89;
	} else if (playFrame == 9) {
		//grabSpotX = 0;
		downThrowFrame = 90;
	} else if (playFrame == 12) {
		downThrowFrame = 91;
		damageGiven = 3
	} else if (playFrame == 15) {
		downThrowFrame = 92;
		damageGiven = 3
	} else if (playFrame == 18) {
		downThrowFrame = 93;
		isGrab = false;
		damageGiven = 4;
		knockbackGivenX = 17;
		knockbackGivenY = 20;
		knockbackDirGiven = -1;
		baseKnockbackGivenX = 15;
		baseKnockbackGivenY = 8;
		capKnockbackGivenY = 14;
		percentMultiplier = 0.01;
		framesGiven = 30;
	} else if (playFrame == 21) {
		downThrowFrame = 94;
	}
	if (playFrame == 24) {
		playFrame = 0;
		animState = "idle";
	}
	playFrame += 1;
	image_index = downThrowFrame;
} else if (animState == "upThrow") {
	upThrowing = 1;
	if (playFrame <= 9) {
		grabSpotX -= 1;
	}
	if (playFrame == 0) {
		upThrowFrame = 95;
	} else if (playFrame == 3) {
		upThrowFrame = 96;
	} else if (playFrame == 6) {
		upThrowFrame = 97;
	} else if (playFrame == 9) {
		upThrowFrame = 98;
		damageGiven = 2
	} else if (playFrame == 12) {
		upThrowFrame = 99;
		damageGiven = 2
	} else if (playFrame == 15) {
		upThrowFrame = 100;
		damageGiven = 4;
		isGrab = false;
		knockbackGivenX = 0;
		baseKnockbackGivenX = 2;
		knockbackGivenY = 18;
		baseKnockbackGivenY = 8;
		capKnockbackGivenY = 16.5;
		percentMultiplier = 0.01;
		framesGiven = 30;
	} else if (playFrame == 18) {
		upThrowFrame = 101;
	} else if (playFrame == 21) {
		upThrowFrame = 102;
	} else if (playFrame == 24) {
		upThrowFrame = 103;
	} 
	playFrame += 1;
	if (playFrame == 28) {
		playFrame = 0;
		animState = "idle";
		isGrab = false;
	}
	image_index = upThrowFrame;
} else if (animState == "forwardThrow") {
	forwardThrowing = true;
	if (playFrame <= 9) {
		grabSpotX -= 1;
	}
	if (playFrame == 0) {
		forwardThrowFrame = 104;
	} else if (playFrame == 3) {
		forwardThrowFrame = 105;
	} else if (playFrame == 6) {
		forwardThrowFrame = 106;
	} else if (playFrame == 9) {
		forwardThrowFrame = 107;
		damageGiven = 6;
		isGrab = false;
		knockbackGivenX = 20;
		knockbackGivenY = 8;
		baseKnockbackGivenY = 5;
		capKnockbackGivenY = 14;
		baseKnockbackGivenX = 13;
		capKnockbackGivenX = 30;
		percentMultiplier = 0.01;
		framesGiven = 30;
	} else if (playFrame == 12) {
		forwardThrowFrame = 108;
	} else if (playFrame == 15) {
		forwardThrowFrame = 109; 
	} else if (playFrame == 18) {
		forwardThrowFrame = 110;
	}
	playFrame += 1;
	if (playFrame == 22) {
		playFrame = 0;
		animState = "idle";
		isGrab = false;
	}
	image_index = forwardThrowFrame;
} else if (animState == "backThrow") {
	backThrowing = true;
	if (playFrame <= 6) {
		grabSpotX -= 5;
	}
	if (playFrame == 0) {
		backThrowFrame = 111;
	} else if (playFrame == 3) {
		backThrowFrame = 112;
		damageGiven = 2;
	} else if (playFrame == 6) {
		backThrowFrame = 113;
		damageGiven = 2;
	} else if (playFrame == 9) {
		backThrowFrame = 114;
		damageGiven = 4;
		isGrab = false;
		knockbackGivenX = 25;
		knockbackGivenY = 8;
		knockbackDirGiven = 1;
		baseKnockbackGivenY = 5;
		capKnockbackGivenY = 14;
		baseKnockbackGivenX = 13;
		percentMultiplier = 0.01;
		framesGiven = 30;
	} else if (playFrame == 12) {
		backThrowFrame = 115;
	} else if (playFrame == 15) {
		backThrowFrame = 116; 
	} else if (playFrame == 18) {
		backThrowFrame = 117;
	}
	playFrame += 1;
	if (playFrame == 22) {
		playFrame = 0;
		animState = "idle";
		isGrab = false;
	}
	image_index = backThrowFrame;
} else if (animState == "sideTaunt") { 
	sideTaunting = 1;
	
	if (dir != 1) {
		dir = 1;
	}
	
	if (playFrame == 0) {
		sideTauntFrame =  323;
	} else if (playFrame % 2 == 0) {
		sideTauntFrame += 1;
	} 
	playFrame += 1;
	if (playFrame == 57) {
		playFrame = 0;
		animState = "idle";
	}	
	image_index = sideTauntFrame;
} else if (animState == "downTaunt") {
	downTaunting = 1;
	
	if (playFrame == 0) {
		downTauntFrame = 357;
	} else if (playFrame % 3 == 0 && downTauntFrame < 368) {
		downTauntFrame += 1;
	} 
	playFrame += 1;	
	if (playFrame % 3 == 0 && downTauntFrame == 368) {
		playFrame = 0;
		animState = "idle";
	}
	image_index = downTauntFrame;
} else if (animState == "upTaunt") {
	upTaunting = 1;
	if (playFrame == 0) {
		upTauntFrame = 352;
	} else if (playFrame % 5 == 0 && upTauntFrame < 356) {
		upTauntFrame += 1;
	} 
	playFrame += 1;
	if (playFrame % 5 == 0 && upTauntFrame == 356) {
		playFrame = 0;
		animState = "idle";
	}
	image_index = upTauntFrame;
}

if (wasIdling == 1) && (idling == 0) {
	wasIdling = 0;
	playFrame = 0;
	idleFrame = 0;
} if (wasWalking == 1) && (walking == 0) {
	wasWalking = 0;
	playFrame = 0;
	walkFrame = 4;
	dashDirect = direct;
	dashCheck = true;
} if (wasDashStarting == 1) && (dashStarting == 0) {
	wasDashStarting = 0;
	playFrame = 0;
	dashStartFrame = 11;
} if (wasDashing == 1) && (dashing == 0) {
	wasDashing = 0;
	playFrame = 0;
	dashFrame = 11;
} if (wasDashLagging == 1) && (dashLagging == 0) {
	wasDashLagging = 0;
	playFrame = 0;
	dashLagFrame = 19;
} if (wasDashAttacking == 1) && (dashAttacking == 0) {
	wasDashAttacking = 0;
	playFrame = 0;
	dashAttackFrame = 20;
} if (wasJumpingUp == 1) && (jumpingUp == 0) {
	wasJumpingUp = 0;
	playFrame = 0;
	jumpUpFrame = 25;
}
if (wasJumping == 1) && (jumping == 0) {
	wasJumping = 0;
	playFrame = 0;
	jumpFrame = 26;
}
if (wasFalling == 1) && (falling == 0) {
	wasFalling = 0;
	playFrame = 0;
	fallFrame = 31;
}
if (wasQuickFalling == 1) && (quickFalling == 0) {
	wasQuickFalling = 0;
	playFrame = 0;
	quickFallFrame = 31;
}
if (wasLanding == 1) && (landing == 0) {
	wasLanding = 0;
	playFrame = 0;
	landFrame = 33;
}
if (wasCrouching == 1) && (crouching == 0) {
	wasCrouching = 0;
	playFrame = 0;
	crouchFrame = 36;
}
if (wasJabbing == 1) && (jabbing == 0) {
	wasJabbing = 0;
	playFrame = 0;
	jabFrame = 37;
}
if (wasDownTilting == 1) && (downTilting == 0) {
	wasDownTilting = 0;
	playFrame = 0;
	downTiltFrame = 186;
}
if (wasUpTilting == 1) && (upTilting == 0) {
	wasUpTilting = 0;
	playFrame = 0;
	upTiltFrame = 186;
}
if (wasForwardTilting == 1) && (forwardTilting == 0) {
	wasForwardTilting = 0;
	playFrame = 0;
	forwardTiltFrame = 186;
}
if (wasFairing == 1) && (fairing == 0) {
	wasFairing = 0;
	playFrame = 0;
	fairFrame = 79;
}
if (wasNairing == 1) && (nairing == 0) {
	wasNairing = 0;
	playFrame = 0;
	nairFrame = 142;
}
if (wasBairing == 1) && (bairing == 0) {
	wasBairing = 0;
	playFrame = 0;
	bairFrame = 262;
	hitConCount = 0;
}
if (wasDairing == 1) && (dairing == 0) {
	wasDairing = 0;
	playFrame = 0;
	dairFrame = 175;
	hitConCount = 0;
}
if (wasUairing == 1) && (uairing == 0) {
	wasUairing = 0;
	playFrame = 0;
	uairFrame = 244;
}
if (wasFairLanding == 1) && (fairLanding == 0) {
	wasFairLanding = 0;
	playFrame = 0;
	fairLandFrame = 88;
}
if (wasFCharging == 1) && (FCharging == 0) {
	wasFCharging = 0;
	playFrame = 0;
	FChargeFrame = 88;
}
if (wasFSmashing == 1) && (FSmashing == 0) {
	wasFSmashing = 0;
	playFrame = 0;
	FSmashFrame = 99;
}
if (wasDCharging == 1) && (DCharging == 0) {
	wasDCharging = 0;
	playFrame = 0;
	DChargeFrame = 197;
}
if (wasDSmashing == 1) && (DSmashing == 0) {
	wasDSmashing = 0;
	playFrame = 0;
	DSmashFrame = 200;
}
if (wasUCharging == 1) && (UCharging == 0) {
	wasUCharging = 0;
	playFrame = 0;
	UChargeFrame = 179;
}
if (wasUSmashing == 1) && (USmashing == 0) {
	wasUSmashing = 0;
	playFrame = 0;
	USmashFrame = 185;
}
if (wasGNSpecialing == 1) && (GNSpecialing == 0) {
	wasGNSpecialing = 0;
	playFrame = 0;
	GNSpecialFrame = 263;
}
if (wasANSpecialing == 1) && (ANSpecialing == 0) {
	wasANSpecialing = 0;
	playFrame = 0;
	ANSpecialFrame = 263;
} if (wasGSSpecialing == 1) && (GSSpecialing == 0) {
	wasGSSpecialing = 0;
	playFrame = 0;
	GSSpecialFrame = 297;
} if (wasASSpecialing == 1) && (ASSpecialing == 0) {
	wasASSpecialing = 0;
	playFrame = 0;
	ASSpecialFrame = 297;
} if (wasUpSpecialing == 1) && (upSpecialing == 0) {
	wasUpSpecialing = 0;
	playFrame = 0;
	upSpecialFrame = 159;
} 
if (wasGDSpecialing == 1) && (GDSpecialing == 0) {
	wasGDSpecialing = 0;
	playFrame = 0;
	GDSpecialFrame = 319;
}
if (wasADSpecialing == 1) && (ADSpecialing == 0) {
	wasADSpecialing = 0;
	playFrame = 0;
	ADSpecialFrame = 319;
} if (wasShielding == 1) && (shielding == 0) {
	wasShielding = 0;
	playFrame = 0;
	shieldFrame = 50;
} if (wasDizzy == 1) && (isDizzy == 0) {
	wasDizzy = 0;
	playFrame = 0;
	dizzyFrame = 51;
} if (wasFRolling == 1) && (fRolling == 0) {
	wasFRolling = 0;
	playFrame = 0;
	fRollFrame = 68;
} if (wasBRolling == 1) && (bRolling == 0) {
	wasBRolling = 0;
	playFrame = 0;
	bRollFrame = 62;
} if (wasSpotDodging == 1) && (spotDodging == 0) {
	wasSpotDodging = 0;
	playFrame = 0;
	spotDodgeFrame = 56;
} if (wasLedgeGrabbing == 1) && (ledgeGrabbing == 0) {
	wasLedgeGrabbing = 0;
	playFrame = 0;
	ledgeGrabFrame = 37;
} if (wasLedgeClimbing == 1) && (ledgeClimbing == 0) {
	wasLedgeClimbing= 0;
	playFrame = 0;
	ledgeClimbFrame = 39;
} if (wasLedgeClimbJumping == 1) && (ledgeClimbJumping == 0) {
	wasLedgeClimbJumping= 0;
	playFrame = 0;
	ledgeClimbJumpFrame = 39;
} if (wasLedgeClimbAttacking == 1) && (ledgeClimbAttacking == 0) {
	wasLedgeClimbAttacking= 0;
	playFrame = 0;
	ledgeClimbAttackFrame = 44;
} if (wasGrabbing == 1) && (grabbing == 0) {
	wasGrabbing = 0;
	playFrame = 0;
	grabFrame = 283;
} if (wasDashGrabbing == 1) && (dashGrabbing == 0) {
	wasDashGrabbing = 0;
	playFrame = 0;
	dashGrabFrame = 283;
} if (wasHolding == 1) && (holding == 0) {
	wasHolding = 0;
	playFrame = 0;
	holdFrame = 283;
} if (wasPummelling == 1) && (pummelling == 0) {
	wasPummelling = 0;
	playFrame = 0;
	pummelFrame = 37;
} if (wasDownThrowing == 1) && (downThrowing == 0) {
	wasDownThrowing = 0;
	playFrame = 0;
	downThrowFrame = 87;
} if (wasUpThrowing == 1) && (upThrowing == 0) {
	wasUpThrowing = 0;
	playFrame = 0; 
	upThrowFrame = 95;
} if (wasForwardThrowing == 1) && (forwardThrowing == 0) {
	wasForwardThrowing = 0;
	playFrame = 0;
	forwardThrowFrame = 104;
} if (wasBackThrowing == 1) && (backThrowing == 0) {
	wasBackThrowing = 0;
	playFrame = 0;
	backThrowFrame = 111;
} if (wasLettingGo = 1) && (lettingGo = 0) {
	wasLettingGo = 0;
	playFrame = 0;
	letGoFrame = 283;
} if (wasSideTaunting = 1) && (sideTaunting = 0) {
	wasSideTaunting = 0;
	playFrame = 0;
	sideTauntFrame = 323;
} else if (wasDownTaunting = 1) && (downTaunting = 0) {
	wasDownTaunting = 0;
	playFrame = 0;
	downTauntFrame = 357;
} else if (wasUpTaunting = 1) && (upTaunting = 0) {
	wasUpTaunting = 0;
	playFrame = 0;
	upTauntFrame = 352;
}
isMeteor = false;
damageGiven = 0;
knockbackGivenX = 0;
knockbackGivenY = 0;
percentMultiplier = 0;
framesGiven = 0;
maxPauseFrames = 0;

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
	if (playFrame == 0) {
		fairLandFrame = 88;
	} else if (playFrame == 3) {
		fairLandFrame = 89;
	} else if (playFrame == 6) {
		fairLandFrame = 90;
	} else if (playFrame == 9) {
		fairLandFrame = 91;
	} 
	playFrame += 1;
	if (playFrame >= 13) {
		playFrame = 0;
		if (key_right || key_left) {
			animState = "walk";
		} else {
			animState = "idle";
		}
	}
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
} else if (animState == "fair") {
	fairing = 1;
	if (playFrame == 0) {
		fairFrame = 79;
	} else if (playFrame == 2) {
		fairFrame = 80;
	} else if (playFrame == 4) {
		fairFrame = 81;
	} else if (playFrame == 6) {
		fairFrame = 82;
	} else if (playFrame == 8) {
		fairFrame = 83;
	} else if (playFrame == 10) {
		fairFrame = 84;
	} else if (playFrame == 12) {
		fairFrame = 85;
	} else if (playFrame == 15) {
		fairFrame = 86;
	} else if (playFrame == 18) {
		fairFrame = 87;
	}
	playFrame += 1;
	if (fairFrame >= 80) && (fairFrame <= 84) {
		damageGiven = 9;
		knockbackGivenX = 22;
		knockbackGivenY = 6;
		percentMultiplier = 0.01;
		framesGiven = 20;
	}
	if (playFrame == 21) {
		playFrame = 0;
		airLag = true;
		airLagMax = 40;
		animState = "fall";
	}
	image_index = fairFrame;
	
}else if (animState == "jab") {
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
		knockbackGivenX = 2;
		knockbackGivenY = 1;
		percentMultiplier = 0.01;
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
		knockbackGivenX = 2;
		knockbackGivenY = 2;
		percentMultiplier = 0.01;
		framesGiven = 12;
	}
	playFrame += 1;
	if (playFrame > 13 && jabCombo == 2) {
		playFrame = 0;
		animState = "jab3";
		jabFrame = 59;
	} 
	if (playFrame == 19) {
		playFrame = 0;
		jabCombo = 0;
		animState = "jabEnd";
	}
	image_index = jabFrame;
} if (animState == "jab3") {
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 59;
	} else if (playFrame == 1) {
		jabFrame = 65;
	} else if (playFrame == 2) {
		jabFrame = 66;
	} else if (playFrame == 4) {
		jabFrame = 67;
	} else if (playFrame == 6) {
		jabFrame = 68;
	} else if (playFrame == 8) {
		jabFrame = 69;
	} else if (playFrame == 10) {
		jabFrame = 70;
	} else if (playFrame == 12) {
		jabFrame = 71;
	} else if (playFrame == 14) {
		jabFrame = 72;
	} else if (playFrame == 17) {
		jabFrame = 73;
	} else if (playFrame == 20) {
		jabFrame = 74;
	} else if (playFrame == 23) {
		jabFrame = 75;
	} else if (playFrame == 25) {
		jabFrame = 76;
	} else if (playFrame == 27) {
		jabFrame = 77;
	} else if (playFrame == 28) {
		jabFrame = 78;
	}
	if (jabFrame >= 65) && (jabFrame <= 74) {
		damageGiven = 6;
		knockbackGivenX = 12;
		knockbackGivenY = 8;
		percentMultiplier = 0.01;
		framesGiven = 30;
	}
	playFrame += 1;
	if (playFrame == 30) {
		playFrame = 0;
		jabCombo = 0;
		animState = "jabEnd";
	}
	image_index = jabFrame;
} if (animState == "jabEnd") {
	jabbing = 1;
	if (playFrame == 0) {
		jabFrame = 61;
	} else if (playFrame == 2) {
		jabFrame = 62;
	} else if (playFrame == 4) {
		jabFrame = 63;
	} else if (playFrame == 6) {
		jabFrame = 64;
	} 
	playFrame += 1;
	if (playFrame == 9) {
		playFrame = 0;
		jabCombo = 0;
		animState = "idle";
	}
	image_index = jabFrame;
} if (animState == "FCharge") {
	FCharging = 1;
	image_index = 92;
	if (playFrame == 0) {
		FChargeFrame = 92;
	} else if (playFrame == 3) {
		FChargeFrame = 93;
	} else if (playFrame == 6) {
		FChargeFrame = 94;
	} else if (playFrame == 9) {
		FChargeFrame = 95;
	} else if (playFrame == 12) {
		FChargeFrame = 96;
	} else if (playFrame == 15) {
		FChargeFrame = 97;
	} else if (playFrame == 18) {
		FChargeFrame = 98;
	}
	playFrame += 1;
	if (playFrame == 21) {
		playFrame = 6;
	}
	image_index = FChargeFrame;
} if (animState == "FSmash") {
	FSmashing = 1;
	if (playFrame == 0) {
		FSmashFrame = 99;
	} else if (playFrame == 2) {
		FSmashFrame = 100;
	} else if (playFrame == 4) {
		FSmashFrame = 101;
	} else if (playFrame == 6) {
		FSmashFrame = 102;
	} else if (playFrame == 8) {
		FSmashFrame = 103;
	} else if (playFrame == 10) {
		FSmashFrame = 104;
	} else if (playFrame == 12) {
		FSmashFrame = 105;
	} else if (playFrame == 14) {
		FSmashFrame = 106;
	} else if (playFrame == 16) {
		FSmashFrame = 107;
	} else if (playFrame == 19) {
		FSmashFrame = 108;
	} else if (playFrame == 23) {
		FSmashFrame = 109;
	} else if (playFrame == 26) {
		FSmashFrame = 110;
	} else if (playFrame == 29) {
		FSmashFrame = 111;
	} else if (playFrame == 32) {
		FSmashFrame = 112;
	} else if (playFrame == 35) {
		FSmashFrame = 113;
	} else if (playFrame == 39) {
		FSmashFrame = 114;
	} else if (playFrame == 46) {
		FSmashFrame = 115;
	} else if (playFrame == 49) {
		FSmashFrame = 61;
	} else if (playFrame == 53) {
		FSmashFrame = 62;
	} else if (playFrame == 57) {
		FSmashFrame = 63;
	} else if (playFrame == 61) {
		FSmashFrame = 64;
	}
	playFrame += 1;
	if (FSmashFrame >= 104) && (FSmashFrame <= 112) {
		damageGiven = 18*FCharge;
		knockbackGivenX = 15+(15*FCharge);
		knockbackGivenY = 15+(5*FCharge);
		percentMultiplier = 0.01;
		framesGiven = 30;
		maxPauseFrames = 12;
	}
	image_index = FSmashFrame;
	if (playFrame == 65) {
		playFrame = 0;
		animState = "idle";
		FSmashFrame = 99;
	}
} if (animState == "GroundNSpecial") {
	GNSpecialing = 1;
	if (playFrame == 0) {
		GNSpecialFrame = 131;
	} else if (playFrame == 2) {
		GNSpecialFrame = 132;
	} else if (playFrame == 4) {
		GNSpecialFrame = 133;
	} else if (playFrame == 6) {
		GNSpecialFrame = 134;
	} else if (playFrame == 8) {
		GNSpecialFrame = 135;
	} else if (playFrame == 10) {
		GNSpecialFrame = 136;
	} else if (playFrame == 12) {
		GNSpecialFrame = 137;
	} else if (playFrame == 14) {
		GNSpecialFrame = 138;
	} else if (playFrame == 16) {
		GNSpecialFrame = 139;
		proj = scr_ProjectileSpawn(char,0,1,1,5,0.01,player,15,5,0,direct);
		canShoot = false;
		shotTimer = 0;
		shotDelay = 30;
	} else if (playFrame == 18) {
		GNSpecialFrame = 140;
	} else if (playFrame == 20) {
		GNSpecialFrame = 141;
	}
	playFrame += 1;
	if (playFrame == 23) {
		playFrame = 0;
		animState = "idle";
	}
	image_index = GNSpecialFrame;
} if (animState == "GroundSSpecial") {
	GSSpecialing = 1;
	if (playFrame == 0) {
		GSSpecialFrame = 116;
	} else if (playFrame == 2) {
		GSSpecialFrame = 117;
	} else if (playFrame == 4) {
		GSSpecialFrame = 118;
	} else if (playFrame == 6) {
		GSSpecialFrame = 119;
	} else if (playFrame == 8) {
		GSSpecialFrame = 120;
	} else if (playFrame == 11) {
		GSSpecialFrame = 121;
		proj = scr_ProjectileSpawn(char,1,10,3,7,0.01,player,40,7,0,direct)
		canShoot = false;
		shotDelay = 50;
	} else if (playFrame == 14) {
		GSSpecialFrame = 122;
	} else if (playFrame == 17) {
		GSSpecialFrame = 123;
	} else if (playFrame == 20) {
		GSSpecialFrame = 124;
	} else if (playFrame == 28) {
		GSSpecialFrame = 61;
	} else if (playFrame == 32) {
		GSSpecialFrame = 62;
	} else if (playFrame == 36) {
		GSSpecialFrame = 63;
	} else if (playFrame == 40) {
		GSSpecialFrame = 64;
	}
	playFrame += 1;
	if (playFrame == 45) {
		playFrame = 0;
		animState = "idle";
	}
	if (GSSpecialFrame >= 119 && GSSpecialFrame <= 121) {
		damageGiven = 9;
		knockbackGivenX = 2
		knockbackGivenY = 5
		percentMultiplier = 0.01;
		framesGiven = 20;
	} else if (GSSpecialFrame > 121 && GSSpecialFrame <= 124) {
		damageGiven = 3;
		knockbackGivenX = 0;
		knockbackGivenY = 0;
		percentMultiplier = 0.01;
		framesGiven = 5;
	}
	image_index = GSSpecialFrame;
} if (animState == "nair") {
	nairing = 1;
	if (playFrame == 0) {
		nairFrame = 142;
	} else if (playFrame == 2) {
		nairFrame = 143;
	} else if (playFrame == 4) {
		nairFrame = 144;
	} else if (playFrame == 6) {
		nairFrame = 145;
	} else if (playFrame == 8) {
		nairFrame = 146;
	} else if (playFrame == 10) {
		nairFrame = 147;
	} else if (playFrame == 12) {
		nairFrame = 148;
	} else if (playFrame == 14) {
		nairFrame = 149;
	}
	playFrame += 1;
	if (playFrame == 17) {
		playFrame = 0;
		animState = "fall";
		airLag = true;
		airLagMax = 60;
	}
	if (nairFrame < 147) {
		damageGiven = 12;
		knockbackGivenX = 7;
		knockbackGivenY = 2;
		percentMultiplier = 0.01;
		framesGiven = 16;
	} else {
		damageGiven = 6;
		knockbackGivenX = 10;
		knockbackGivenY = 0;
		percentMultiplier = 0.01;
		framesGiven = 5;
	}
	image_index = nairFrame;
} if (animState == "AirNSpecial") {
	ANSpecialing = 1;
	if (playFrame == 0) {
		ANSpecialFrame = 150;
	} else if (playFrame == 4) {
		ANSpecialFrame = 151;
	} else if (playFrame == 6) {
		ANSpecialFrame = 152;
	} else if (playFrame == 8) {
		ANSpecialFrame = 153;
	} else if (playFrame == 10) {
		ANSpecialFrame = 154;
	} else if (playFrame == 12) {
		ANSpecialFrame = 155;
	} else if (playFrame == 14) {
		ANSpecialFrame = 156;
	} else if (playFrame == 16) {
		ANSpecialFrame = 157;
		proj = scr_ProjectileSpawn(char,0,1,1,5,0.01,player,15,5,0,direct);
		canShoot = false;
	} else if (playFrame == 18) {
		ANSpecialFrame = 158;
	} 
	playFrame += 1;
	if (playFrame == 23) {
		playFrame = 0;
		animState = "fall";
	}
	image_index = ANSpecialFrame;
} if (animState == "UpSpecial") {
	upSpecialing = 1;
	if (playFrame == 0) {
		upSpecialFrame = 159;
	} else if (playFrame == 3) {
		upSpecialFrame = 160;
	} else if (playFrame == 6) {
		upSpecialFrame = 161;
	} else if (playFrame == 7) {
		upSpecialFrame = 162;
	} else if (playFrame == 10) {
		upSpecialFrame = 163;
	} else if (playFrame == 12) {
		upSpecialFrame = 164;
	} else if (playFrame == 14) {
		upSpecialFrame = 165;
	} else if (playFrame == 16) {
		upSpecialFrame = 166;
	} else if (playFrame == 18) {
		upSpecialFrame = 167;
	} else if (playFrame == 20) {
		upSpecialFrame = 168;
	} else if (playFrame == 22) {
		upSpecialFrame = 169;
	} else if (playFrame == 24) {
		upSpecialFrame = 170;
	} else if (playFrame == 26) {
		upSpecialFrame = 171;
	} else if (playFrame == 28) {
		upSpecialFrame = 172;
	} else if (playFrame == 30) {
		upSpecialFrame = 173;
	} else if (playFrame == 32) {
		upSpecialFrame = 174;
	} else if (playFrame == 34) {
		upSpecialFrame = 175;
	} 
	playFrame += 1;
	if (playFrame == 6) {
		vsp = -8;
		hsp = 3*direct;
	} else if (playFrame == 37) {
		if (vsp < 0) {
			playFrame = 8;
		} else {
			playFrame = 0;
			animState = "fall";
			isFreeFalling = true;
		}
	}
	if (vsp >= 0 && playFrame >= 7) {
		playFrame = 0;
		animState = "fall";
		isFreeFalling = true;
	}
	if (upSpecialFrame <= 162) {
		damageGiven = 5;
		knockbackGivenX = 0;
		knockbackGivenY = 8;
		percentMultiplier = 0;
		framesGiven = 3;
	} else if (upSpecialFrame <= 169) {
		damageGiven = 3;
		knockbackGivenX = 2;
		knockbackGivenY = 2;
		percentMultiplier = 0;
		framesGiven = 3;
	} else if (upSpecialFrame <= 172) {
		damageGiven = 2;
		knockbackGivenX = 7;
		knockbackGivenY = 4;
		percentMultiplier = 0.01;
		framesGiven = 15;	
	}
	image_index = upSpecialFrame;
}if (animState == "dair") {
	dairing = 1;
	if (playFrame == 0) {
		dairFrame = 175;
	} else if (playFrame == 4) {
		dairFrame = 176;
	} else if (playFrame == 7) {
		dairFrame = 177;
	} else if (playFrame == 10) {
		dairFrame = 178;
	} else if (playFrame == 13) {
		dairFrame = 177;
	} else if (playFrame == 16) {
		dairFrame = 178;
	} else if (playFrame == 20) {
		dairFrame = 179;
	} else if (playFrame == 24) {
		dairFrame = 180;
	} else if (playFrame == 28) {
		dairFrame = 181;
	} else if (playFrame == 31) {
		dairFrame = 182;
	} else if (playFrame == 34) {
		dairFrame = 183;
	} else if (playFrame == 37) {
		dairFrame = 60;
	}else if (playFrame == 41) {
		dairFrame = 61;
	} else if (playFrame == 45) {
		dairFrame = 62;
	} else if (playFrame == 49) {
		dairFrame = 63;
	} else if (playFrame == 53) {
		dairFrame = 64;
	} 
	if (playFrame <= 12 && playFrame >= 7) {
		damageGiven = 9;
		knockbackGivenX = 2;
		knockbackGivenY = 5.5;
		isMeteor = true;
		percentMultiplier = 0.01;
		framesGiven = 25;
	} else if ((dairFrame == 177 || dairFrame == 178)) {
		damageGiven = 9;
		knockbackGivenX = 3;
		knockbackGivenY = 2;
		isMeteor = true;
		percentMultiplier = 0.01;
		framesGiven = 12;
	}
	if (hitConnect == true) {
		vsp = -2;
		playFrame = 0;
		animState = "fall";
		hitConnect = false;
		airLag = true;
		airLagMax = 20;
	}
	playFrame += 1;
	if (playFrame == 20) {
		playFrame = 13;
	} if (playFrame == 58) {
		playFrame = 0;
		hitConnect = false;
		animState = "idle";
		isDairLanding = false;
	}
	image_index = dairFrame;
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
		downTiltFrame = 186;
	} else if (playFrame == 2) {
		downTiltFrame = 187;
	} else if (playFrame == 4) {
		downTiltFrame = 188;
	} else if (playFrame == 6) {
		downTiltFrame = 189;
	} else if (playFrame == 8) {
		downTiltFrame = 190;
	} else if (playFrame == 10) {
		downTiltFrame = 191;
	} else if (playFrame == 12) {
		downTiltFrame = 192;
	} else if (playFrame == 14) {
		downTiltFrame = 193;
	} else if (playFrame == 16) {
		downTiltFrame = 194;
	} else if (playFrame == 18) {
		downTiltFrame = 195;
	} else if (playFrame == 20) {
		downTiltFrame = 196;
	}
	if (downTiltFrame <= 190 && downTiltFrame >= 188) {
		damageGiven = 6;
		knockbackGivenX = 11;
		knockbackGivenY = 8;
		percentMultiplier = 0.01;
		framesGiven = 15;
		maxPauseFrames = 6;
	} 
	playFrame += 1;
	if (playFrame == 23) {
		playFrame = 0;
		animState = "crouch";
	} 
	image_index = downTiltFrame;
} if (animState == "DCharge") {
	DCharging = 1;
	if (playFrame == 0) {
		DChargeFrame = 197;
	} else if (playFrame == 4) {
		DChargeFrame = 198;
	} else if (playFrame == 8) {
		DChargeFrame = 199;
	} else if (playFrame == 12) {
		DChargeFrame = 219;
	} else if (playFrame == 16) {
		DChargeFrame = 220;
	} else if (playFrame == 20) {
		DChargeFrame = 219;
	}
	playFrame += 1;
	if (playFrame == 25) {
		playFrame = 8;
	}
	image_index = DChargeFrame;
} 

if (animState == "DSmash") {
	DSmashing = 1;
	if (playFrame == 0) {
		DSmashFrame = 200;
	} else if (playFrame == 2) {
		DSmashFrame = 201;
	} else if (playFrame == 4) {
		DSmashFrame = 202;
	} else if (playFrame == 6) {
		DSmashFrame = 203;
	} else if (playFrame == 9) {
		DSmashFrame = 204;
	} else if (playFrame == 12) {
		DSmashFrame = 205;
	} else if (playFrame == 15) {
		DSmashFrame = 206;
	} else if (playFrame == 18) {
		DSmashFrame = 207;
	} else if (playFrame == 21) {
		DSmashFrame = 208;
	} else if (playFrame == 24) {
		DSmashFrame = 209;
	} else if (playFrame == 27) {
		DSmashFrame = 210;
	} else if (playFrame == 30) {
		DSmashFrame = 211;
	} else if (playFrame == 33) {
		DSmashFrame = 212;
	} else if (playFrame == 36) {
		DSmashFrame = 213;
	} else if (playFrame == 39) {
		DSmashFrame = 214;
	} else if (playFrame == 42) {
		DSmashFrame = 215;
	} else if (playFrame == 45) {
		DSmashFrame = 216;
	} else if (playFrame == 48) {
		DSmashFrame = 217;
	} else if (playFrame == 51) {
		DSmashFrame = 218;
	}
	playFrame += 1;
	if (DSmashFrame >= 203) && (DSmashFrame <= 208) {
		damageGiven = 2 + (18*DCharge);
		knockbackGivenX = 10+(15*DCharge);
		knockbackGivenY = 10+(9*DCharge);
		percentMultiplier = 0.01;
		framesGiven = 30;
		maxPauseFrames = 12;
	}
	image_index = DSmashFrame;
	if (playFrame == 54) {
		playFrame = 0;
		animState = "idle";
		DSmashFrame = 200;
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
	} else if (playFrame == 18) {
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
	playFrame += 1;
	if (playFrame == 25) {
		playFrame = 0;
		animState = "idle";
	}
	image_index = ledgeClimbAttackFrame;
} if (animState == "bair") {
	bairing = 1;
	if (playFrame == 0) {
		bairFrame = 262;
	} else if (playFrame == 2) {
		bairFrame = 263;
	} else if (playFrame == 4) {
		bairFrame = 264;
	} else if (playFrame == 6) {
		bairFrame = 265;
	} else if (playFrame == 8) {
		bairFrame = 266;
	} else if (playFrame == 10) {
		bairFrame = 267;
	} else if (playFrame == 12) {
		bairFrame = 268;
	} else if (playFrame == 14) {
		bairFrame = 269;
	} else if (playFrame == 16) {
		bairFrame = 270;
	} else if (playFrame == 18) {
		bairFrame = 271;
	}
	playFrame += 1;
	if (playFrame == 21) {
		playFrame = 0;
		animState = "fall";
		airLag = true;
		airLagMax = 60;
	}
	if (bairFrame == 264) {
		damageGiven = 10;
		knockbackGivenX = 25;
		knockbackGivenY = 8;
		percentMultiplier = 0.01;
		framesGiven = 30;
	} else if (bairFrame == 265) || (bairFrame == 266) {
		damageGiven = 8;
		knockbackGivenX = 18;
		knockbackGivenY = 5;
		percentMultiplier = 0.01;
		framesGiven = 20;
	} else if (bairFrame == 267) || (bairFrame == 268) {
		damageGiven = 6;
		knockbackGivenX = 12;
		knockbackGivenY = 4;
		percentMultiplier = 0.01;
		framesGiven = 20;
	} 
	image_index = bairFrame;
} else if (animState == "grab") {
	grabbing = 1;
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
	image_index = holdFrame;
} else if (animState == "pummel") {
	pummelling = 1;
	if (playFrame == 0) {
		pummelFrame = 37;
	} if (playFrame == 3) {
		pummelFrame = 38;
	} if (playFrame == 6) {
		pummelFrame = 39;
	} if (playFrame == 9) {
		pummelFrame = 40;
	} if (playFrame == 12) {
		pummelFrame = 41;
	} if (playFrame == 15) {
		pummelFrame = 42;
	} if (playFrame == 18) {
		pummelFrame = 43;
	} if (playFrame == 21) {
		pummelFrame = 44;
	} if (playFrame == 24) {
		pummelFrame = 45;
	} if (playFrame == 27) {
		pummelFrame = 46;
	} if (playFrame == 30) {
		pummelFrame = 47;
	} if (playFrame == 33) {
		pummelFrame = 48;
	}
	if (playFrame == 20) {
		damageGiven = 2;
	}
	playFrame += 1;
	if (playFrame == 37) {
		playFrame = 0;
		animState = "hold";
	}
	image_index = pummelFrame;
} else if (animState == "uThrow") {
	image_index = pummelFrame;
} else if (animState == "letGo") {
	lettingGo = 1;
	isGrab = false;
	if (playFrame == 1) {
		damageGiven = 0;
		knockbackGivenX = 20;
		knockbackGivenY = 500;
		percentMultiplier = 0;
		framesGiven = 10;
	}
	playFrame += 1;
	if (playFrame == 5) {
		animState = "idle";
		playFrame = 0;
	}
	image_index = grabFrame;
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
}
if (wasDairing == 1) && (dairing == 0) {
	wasDairing = 0;
	playFrame = 0;
	dairFrame = 175;
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
	FChargeFrame = 197;
}
if (wasDSmashing == 1) && (DSmashing == 0) {
	wasDSmashing = 0;
	playFrame = 0;
	DSmashFrame = 200;
}
if (wasGNSpecialing == 1) && (GNSpecialing == 0) {
	wasGNSpecialing = 0;
	playFrame = 0;
	GNSpecialFrame = 131;
}if (wasANSpecialing == 1) && (ANSpecialing == 0) {
	wasANSpecialing = 0;
	playFrame = 0;
	ANSpecialFrame = 150;
}if (wasGSSpecialing == 1) && (GSSpecialing == 0) {
	wasGSSpecialing = 0;
	playFrame = 0;
	GSSpecialFrame = 116;
} if (wasUpSpecialing == 1) && (upSpecialing == 0) {
	wasUpSpecialing = 0;
	playFrame = 0;
	upSpecialFrame = 159;
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
} if (wasLettingGo = 1) && (lettingGo = 0) {
	wasLettingGo = 0;
	playFrame = 0;
	letGoFrame = 283;
}
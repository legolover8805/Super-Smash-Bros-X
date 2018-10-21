
damageGiven = 0;
knockbackGivenX = 0;
knockbackGivenY = 0;
percentMultiplier = 0;
framesGiven = 0;
maxPauseFrames = 0;
if (animState == "idle") {
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
	landing = 1;
	if (playFrame == 0) {
		landFrame = 33;
	} else if (playFrame == 1) {
		landFrame = 34;
	} 
	playFrame += 1;
	if (playFrame >= 2) {
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
		animState = "quickfall";
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
		knockbackGivenX = 4;
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
	if (playFrame == 65) {
		playFrame = 0;
		animState = "idle";
		FSmashFrame = 99;
	}
	if (FSmashFrame >= 104) && (FSmashFrame <= 112) {
		damageGiven = 18*FCharge;
		knockbackGivenX = 30*FCharge;
		knockbackGivenY = 20*FCharge;
		percentMultiplier = 0.01;
		framesGiven = 30;
		maxPauseFrames = 10;
	}
	image_index = FSmashFrame;
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
		/* _projectile.char = argument0;
_projectile.projectile = argument1;
_projectile.knockbackX = argument2;
_projectile.knockbackY = argument3;
_projectile.damage = argument4;
_projectile.percentMultiplier = argument5;
_projectile.owner = argument6;
_projectile.framesGiven = argument7;
_projectile.hsp = argument8;
_projectile.vsp = argument9;
_projectile.dir = argument10;*/
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
	}
	if (nairFrame < 147) {
		damageGiven = 12;
		knockbackGivenX = 2;
		knockbackGivenY = 2;
		percentMultiplier = 0.01;
		framesGiven = 16;
	} else {
		damageGiven = 6;
		knockbackGivenX = 0;
		knockbackGivenY = 0;
		percentMultiplier = 0.01;
		framesGiven = 5;
	}
	image_index = nairFrame;
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
if (wasGNSpecialing == 1) && (GNSpecialing == 0) {
	wasGNSpecialing = 0;
	playFrame = 0;
	GNSpecialFrame = 131;
}if (wasGSSpecialing == 1) && (GSSpecialing == 0) {
	wasGSSpecialing = 0;
	playFrame = 0;
	GSSpecialFrame = 116;
}
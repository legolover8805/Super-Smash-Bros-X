/// @description Insert description here
// You can write your code in this editor
image_xscale = dir;
if (place_meeting(x,y+sign(vsp)*4,obj_Wall)) {
	grounded = true;
} else {
	grounded = false;
}
if (place_meeting(x+dir*4,y,obj_Wall)) {
	walled = true;
} else {
	walled = false;
}
if (place_meeting(x+dir*4,y,obj_InvWall)) {
	forceDestroy = true;
} else {
	forceDestroy = false;
}


if (framesExisted == 0) {
	if (char == 0 ) {
		if (projectile == 0) {
			alarm[0] = room_speed;
			sprite_index = spr_ZeroShot;
			hitbox = scr_HitboxCreate(char,owner);
			with hitbox {
				projectile = 0;
			}
		} else if (projectile == 1) {
			alarm[0] = room_speed;
			sprite_index = spr_ZeroSideSpecial;
			hitbox = scr_HitboxCreate(char,owner);
			with hitbox {
				projectile = 1;
			}
		} else if (projectile == 2) {
			alarm[0] = 36;
			sprite_index = spr_ZeroCloneAnim;
			hitbox = scr_HitboxCreate(char,owner);
			moveStarted = true;
			with hitbox {
				projectile = 2;
			}
		}
	} else if (char == 1) {
		if (projectile == 0) {
			alarm[0] = 32;
			sprite_index = spr_GenoFSmash;
			hitbox = scr_HitboxCreate(char,owner);
			moveStarted = true;
			with hitbox {
				projectile = 0;
			}
			wallDie = true;
			groundDie = false;
		} else if (projectile == 1) {
			alarm[0] = 60;
			image_alpha = 0;
			sprite_index = spr_GenoWhirl;
			hitbox = scr_HitboxCreate(char,owner);
			moveStarted = true;
			with hitbox {
				projectile = 1;
			}
			wallDie = false;
			groundDie = false;
		} else if (projectile == 2) {
			alarm[0] = 60;
			sprite_index = spr_GenoCannonAnim;
			image_speed = 0;
			hitbox = scr_HitboxCreate(char,owner);
			moveStarted = true;
			with hitbox {
				projectile = 2;
			}
			wallDie = false;
		} else if (projectile == 3) {
			alarm[0] = 90;
			sprite_index = spr_GenoBlast;
			image_speed = 0;
			hitbox = scr_HitboxCreate(char,owner)
			starType = 5*irandom(2)
			moveStarted = true;
			//bounceTimer = 3;
			with hitbox {
				projectile = 3;
			}
			wallDie = false;
			groundDie = false;
		}
	}
}

if (char == 0) {
	if (projectile == 0) {
		if (playFrames == 0) {
			image_index = 0;
		} if (playFrames == 2) {
			image_index = 1;
		} if (playFrames == 4) {
			image_index = 2;
		} if (playFrames == 6) {
			image_index = 3;
		} if (playFrames == 8) {
			image_index = 4;
		} if (playFrames == 10) {
			image_index = 5;
		} if (playFrames == 12) {
			image_index = 6;
		} if (playFrames == 15) {
			image_index = 7;
		} if (playFrames == 18) {
			image_index = 8;
		} if (playFrames == 21) {
			image_index = 9;
		} 
		if (playFrames == 24) {
			playFrames = 11;
		}
		if (framesExisted == 12) {
			moveStarted = true;
		}
		if (framesExisted == 51) {
			image_index = 10;
		} if (framesExisted == 54) {
			image_index = 11;
		} if (framesExisted == 57) {
			image_index = 12;
		}
	} else if (projectile == 1) {
		image_index = 0;
		moveStarted = true;
		if (framesExisted >= 50) {
			image_alpha -= 0.1;
		}
	} else if (projectile == 2) {
		if (playFrames == 0) {
			image_index = 0;
		} else if (playFrames == 2) {
			image_index = 1;
		} else if (playFrames == 4) {
			image_index = 2;
		} else if (playFrames == 6) {
			image_index = 3;
		} else if (playFrames == 8) {
			image_index = 4;
		} else if (playFrames == 10) {
			image_index = 5;
		} else if (playFrames == 12) {
			image_index = 6;
		} else if (playFrames == 14) {
			image_index = 7;
		} else if (playFrames == 16) {
			image_index = 8;
		} else if (playFrames == 18) {
			image_index = 9;
		} else if (playFrames == 20) {
			image_index = 10;
		} else if (playFrames == 22) {
			image_index = 11;
		} else if (playFrames == 24) {
			image_index = 12;
		} else if (playFrames == 26) {
			image_index = 13;
		} else if (playFrames == 28) {
			image_index = 14;
		} else if (playFrames == 30) {
			image_index = 15;
		} else if (playFrames == 32) {
			image_index = 16;
		} else if (playFrames == 34) {
			image_index = 17;
		} 
		if (playFrames < 20) {
			hsp = 5;
		} else {
			hsp = 0;
		}
	}
} else if (char == 1) {
	if (projectile == 0) {
		if (playFrames == 0) {
			image_index = 0;
		} if (playFrames == 2) {
			image_index = 1;
		} if (playFrames == 4) {
			image_index = 2;
		} if (playFrames == 6) {
			image_index = 3;
		}
		if (playFrames == 9) {
			playFrames = 0;
		}
		if (framesExisted >= 24) {
			image_alpha -= 0.1;
		}
	} else if (projectile == 1) {
		image_speed = 5;
		if (framesExisted < 5) {
			image_alpha += 0.2;
		}
		if (framesExisted >= 50) {
			image_alpha -= 0.1;
		}
	} else if (projectile == 2) {
		if (playFrames == 0) {
			image_index = 0;
		} else if (playFrames == 2) {
			image_index = 1;
		} else if (playFrames == 4) {
			image_index = 2;
		} else if (playFrames == 6) {
			image_index = 3;
		} else if (playFrames == 8) {
			image_index = 4;
		}
		if (playFrames >= 8) {
			if (!grounded) {
				image_angle += 1*genoCannonAcc;
			} else {
				image_angle = 0;
			}
			genoCannonAcc += .25;
			useGrav = true;
			gravNum = 1.4;
		}if (framesExisted >= 50) {
			image_alpha -= 0.1;
		}
	} else if (projectile == 3) {
		if (playFrames == 0) {
			image_index = 0+starType;
		} else if (playFrames == 2) {
			image_index = 1+starType;
		} else if (playFrames == 4) {
			image_index = 2+starType;
		} else if (playFrames == 6) {
			image_index = 3+starType;
		} else if (playFrames == 8) {
			image_index = 4+starType;
		} 
		if (playFrames == 10) {
			playFrames = 0;
		} if (framesExisted >= 70) {
			image_alpha -= 0.1;
		}
		if grounded {
			vsp *= -1;
			bounceTimer = 0;
		} else if (walled) {
			hsp *= -1;
			bounceTimer = 0;
		}
		/*if (bounceTimer < 3) {
			bounceTimer += 1;
		}*/
	}
}

if (moveStarted) {
	if (dir == 1) {
		x += hsp;
	} else {
		x -= hsp;
	}
	y += vsp;
}
if (useGrav) {
	if (!place_meeting(x,y+sign(vsp),obj_Wall)) {
		y += gravNum;
	}
}
with hitbox {
	x = other.x;
	y = other.y;
	attack = "Projectile";
	image_angle = other.image_angle
	image_xscale = other.image_xscale;
	image_index = other.image_index;
	percentGiven = other.damage;
	knockbackGivenX = other.knockbackX;
	knockbackGivenY = other.knockbackY;
	baseKnockbackGivenX = other.baseKnockbackX;
	baseKnockbackGivenY = other.baseKnockbackY;
	capKnockbackGivenX = other.capKnockbackX;
	capKnockbackGivenY = other.capKnockbackY;
	percentMultiplier = other.percentMultiplier;
	knockbackDirGiven = other.knockbackDirGiven;
	isMeteor = false;
	isGrab = false;
	isJabbed = false;
	grabSpot = 0;
	isHit = 1;
	frames = 0;
	framesGiven = other.framesGiven;
	maxPauseFrames = other.maxPauseFrames;
	isPaused = other.isPaused;
	proj = other.proj;
}

if (walled && wallDie) {
	alarm[0] = 1;
} if (grounded && groundDie) {
	alarm[0] = 1;
} 
if (forceDestroy) {
	alarm[0] = 1;
}

playFrames += 1;
framesExisted += 1;
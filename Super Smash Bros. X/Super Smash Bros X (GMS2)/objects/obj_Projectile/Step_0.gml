/// @description Insert description here
// You can write your code in this editor
image_xscale = dir;

if (framesExisted == 0) {
	if (char == 0 && projectile == 0) {
		alarm[0] = room_speed;
		sprite_index = spr_ZeroShot;
		hitbox = scr_HitboxCreate(char,owner);
		with hitbox {
			projectile = 0;
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
with hitbox {
	x = other.x;
	y = other.y;
	image_xscale = other.image_xscale;
	percentGiven = other.damage;
	knockbackGivenX = other.knockbackX;
	knockbackGivenY = other.knockbackY;
	percentMultiplier = other.percentMultiplier;
	isHit = 1;
	frames = 0;
	framesGiven = other.framesGiven;
	maxPauseFrames = 0;
}
playFrames += 1;
framesExisted += 1;
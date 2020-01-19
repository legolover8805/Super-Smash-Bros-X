/// @description Insert description here
// You can write your code in this editor
dir = sign(image_xscale);
vsp += grav;

// Vertical Collision
if (place_meeting(x,y+vsp,obj_Wall)) {
	while (!place_meeting(x,y+sign(vsp),obj_Wall)) {
		y += sign(vsp);
	}
	if (stayMeteor == false) {
		vsp = 0;
	} else {
		stayMeteor = false;
		vsp = -(savedBackY-weight);
	}
	savedBackY = 0;
	onGround = true;
}  else {
	onGround = false;
}
if (place_meeting(x,y+1,obj_Wall)) {
	image_index = 0;
} else {
	image_index = 6;
}

// Horizontal Collision
if (place_meeting(x+4*dir,y,obj_Wall)) {
	wallSwitchDir = true;
	image_xscale *= -1;
}


// Hitstun
if (maxPauseFrames != 0) {
	isPaused = true;
	image_index = 6;
	hsp = 0;
	vsp = 0;
	maxPauseFrames -= 1;
} else {
	isPaused = false;
}
if (isHit == 1 && !isPaused) {
	image_index = 6;
	if (frames == 0) {
		percentMultiplied *= percent;
		if (percentMultiplied == 0) {
			percentMultiplied = .01;
		}
	}
	frames += 1;
	if (frames >= maxFrames) {
		percentMultiplied = 0;
		isHit = 0;
	}
} else if (!isPaused) {
	frames = 0;
}




if (knockbackY != 0 && !isPaused) {
	knockValueY = knockbackY * percentMultiplied
	if (knockValueY > 0 && !isMeteorSmashed) {
		if (knockValueY > capKnockbackY) {
			knockValueY = capKnockbackY;
		} else if (knockValueY < baseKnockbackY) {
			knockValueY = baseKnockbackY;
		}
	} else if (knockValueY < 0 && !isMeteorSmashed) {
		if (knockValueY < -capKnockbackY) {
			knockValueY = -capKnockbackY;
		} else if (knockValueY > -baseKnockbackY) {
			knockValueY = -baseKnockbackY;
		}
	} else {
		if (!isMeteorSmashed && !stayMeteor) {
			vsp = 0;
		}
	}
	if (knockbackYCount < 4) {
		if (!isMeteorSmashed) {
			vsp -= (knockValueY)/4;
			savedBackY = knockValueY/percentMultiplied;
			knockbackYCount+=1;
		} else {
			if (onGround == false) {
				stayMeteor = true;
				vsp += (knockValueY)/4;
				knockbackYCount+=1;
				savedBackY = knockValueY/percentMultiplied;
			} else {
				vsp -= (knockValueY)/4;
				knockbackYCount = 4;
				savedBackY = knockValueY/percentMultiplied;
			}
		}
	} else { 
		knockbackY = 0;
		knockbackYCount = 0;
	}
}  else {
	knockValueY = 0;
}

if (isGrabbed) {
	hsp = 0;
	vsp = 0;
}
y = y + vsp;

// Knockback
if (knockbackX != 0 && !wallSwitchDir && !isPaused) {

	if (knockValueX == 0) {
		knockValueX = percentMultiplied * knockbackX * dir;	
		//hsp = 0;
	}
	
	if (sign(dir)*sign(knockbackDir) != sign(knockValueX)) {
		knockValueX *= -1;
		
	}
	if (hsp < knockValueX && knockValueX > 0) {
		if (knockValueX > capKnockbackX) {
			knockValueX = capKnockbackX;
		} else if (knockValueX < baseKnockbackX) {
		knockValueX = baseKnockbackX;
		} 
		hsp += knockValueX/20;
	} else if (knockValueX >= 0 && hsp >= knockValueX) {
		hsp = 0;
		knockbackX = 0;
		
	} else if ( hsp > knockValueX && knockValueX < 0) {
		if (knockValueX < -capKnockbackX) {
			knockValueX = -capKnockbackX;
		} else if (knockValueX > -baseKnockbackX) {
			knockValueX = -baseKnockbackX;
		} 
		hsp += knockValueX/20;
	} else if (hsp <= knockValueX && knockValueX <= 0) {
		hsp = 0;
		knockbackX = 0;
	}
} else {
	knockValueX = 0;
}
if (hsp < 0) && (hsp > -.01) {
	hsp = 0;
	wallSwitchDir = false;
} else if (hsp > 0) && (hsp < .01) {
	hsp = 0;
	wallSwitchDir = false;
}
if (hsp == 0) {
	wallSwitchDir = false;
}

if (isGrabbed) {
	hsp = 0;
	vsp = 0;
}

if (wallSwitchDir) {
	if (sign(hsp) != sign(image_xscale)) {
		hsp *= -1;
	} 
	hsp *= .5;
	knockValueX = 0;
	knockbackX = 0;
}

x += hsp;

if (x > room_width) || (x < 0) || (y > room_height) || (y < 0) {
	x = reviveX;
	y = reviveY;
	hsp = 0;
	isPaused = false;
	isHit = 0;
	vsp = 0;
	percent = 0;
	knockbackX = 0;
	knockbackY = 0;
	knockValueX = 0;
	knockValueY = 0;
}

/*show_debug_message(maxFrames);
show_debug_message(frames);
*/
//print(percent);
x = round(x);
y = round(y);

with hurtbox {
	x = other.x;
	y = other.y;
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
	image_index = other.image_index;
}
floorDistance = distance_to_object(obj_Wall)+yHalfSize;
heightDistance = distance_to_object(obj_StageLength)+yHalfSize;

with shadow {
	x = other.x;
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
//print(hsp)
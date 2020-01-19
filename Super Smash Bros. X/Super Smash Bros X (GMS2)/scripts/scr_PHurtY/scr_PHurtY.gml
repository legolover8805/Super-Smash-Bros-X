if (maxPauseFrames != 0 && hasBeenHit) {
	isPaused = true;
	animState = "hurt";
	airLagging = true;
	hsp = 0;
	vsp = 0;
	maxPauseFrames -= 1;
} else {
	isPaused = false;
}
if (isHit == 1 && !isPaused) {
	animState = "hurt"
	airLagging = true;
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
	airLagging = true;
	animState = "hurt";
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
	airLagging = true;
	animState = "hurt";
	hsp = 0;
	vsp = 0;
}
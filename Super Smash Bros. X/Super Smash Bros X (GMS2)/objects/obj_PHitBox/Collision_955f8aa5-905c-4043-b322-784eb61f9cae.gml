/// @description Insert description here

if (owner != other.owner) {
	with fighters[other.owner] {
		if (other.char == 0 && other.projectile != 2 && other.projectile != -1) {
			with other {
				instance_destroy();
			}
			with other.proj {
				instance_destroy();
			}
		}
		if (isHit == 0) {
			other.fighters[other.owner].hitConnect = true;
			percent += other.percentGiven;
			knockbackX = other.knockbackGivenX;
			knockbackY = other.knockbackGivenY;
			percentMultiplier = other.percentMultiplier;
			isMeteorSmashed = other.isMeteor;
			isHit = 1;
			frames = 0;
			maxFrames = other.framesGiven;
			maxPauseFrames = other.maxPauseFrames;
			if (x < other.x) {
				if (sign(image_xscale) != -1) {
					image_xscale *= -1;
				}
			} else if (x > other.x) {
				if (sign(image_xscale) == -1) {
					image_xscale *= -1;
				}
			}
			if (other.attack == other.prevAttack) {
				other.staleCounter += 1;
				if (other.staleCounter > 3) {
					other.staleCounter = 3;
				}
				if (other.staleCounter>=other.percentGiven) {
					other.staleCounter -= 1;
				}
				percent -= other.staleCounter;
			} else {
				other.staleCounter = 0;
			}
			other.prevAttack = other.attack;
		} 
	}
}
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
		} else if (other.char == 1 && other.projectile != -1) {
			//if (other.projectile == 0) {
				with other {
					instance_destroy();
				}
				with other.proj {
					instance_destroy();
				}
			//}
		}
		if (isHit == 0) {
			other.fighters[other.owner].hitConnect = true;
			percent += other.percentGiven;
			knockbackX = other.knockbackGivenX;
			knockbackY = other.knockbackGivenY;
			baseKnockbackX = other.baseKnockbackGivenX;
			baseKnockbackY = other.baseKnockbackGivenY;
			capKnockbackX = other.capKnockbackGivenX;
			capKnockbackY = other.capKnockbackGivenY;
			knockbackDir = other.knockbackDirGiven;
			percentMultiplied = other.percentMultiplier;
			isMeteorSmashed = other.isMeteor;
			isGrabbed = other.isGrab;
			isJabbed = other.isJabbed;
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
			//print(isGrabbed);
			if (!isGrabbed && !isJabbed) {
				if (other.attack == other.prevAttack) {
					other.staleCounter += 1;
					if (other.staleCounter > 9) {
						other.staleCounter = 9;
					}
					if (other.staleCounter>=other.percentGiven) {
						other.staleCounter -= 1;
					} if (other.staleCounter <= 0 && other.percentGiven != 0) {
						other.staleCounter = other.percentGiven - 1;
					}
					percent -= other.staleCounter;
				} else {
					other.staleCounter = 0;
				}
				other.prevAttack = other.attack;
			} else if (isGrabbed) {
				if (other.fighters[other.owner].direct == 1) {
					while (x < other.x+other.grabSpotX) {
						x+= 1;
					} 
					while (x > other.x+other.grabSpotX) {
						x-= 1;
					}
				} else {
					while (x < other.x-other.grabSpotX) {
						x+= 1;
					} 
					while (x > other.x-other.grabSpotX) {
						x-= 1;
					}
				}
				if (other.grabSpotY != 0) {
					y = round(y);
					while (y < other.y+other.grabSpotY) {
						y-= 1;
					} 
					while (y > other.y+other.grabSpotY) {
						y+= 1;
					}
				}
			}
		} 
	}
}
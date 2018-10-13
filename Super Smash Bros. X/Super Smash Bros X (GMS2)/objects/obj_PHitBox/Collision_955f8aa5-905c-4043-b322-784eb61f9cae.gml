/// @description Insert description here

if (owner != other.owner) {
	with fighters[other.owner] {
		if (isHit == 0) {
			percent += other.percentGiven;
			knockbackX = other.knockbackGivenX;
			knockbackY = other.knockbackGivenY;
			percentMultiplier = other.percentMultiplier;
			isHit = 1;
			frames = 0;
			maxFrames = other.framesGiven;
			if (x < other.x) {
				if (sign(image_xscale) != -1) {
					image_xscale *= -1;
				}
			} else if (x > other.x) {
				if (sign(image_xscale) == -1) {
					image_xscale *= -1;
				}
			}
		} 
	}
}
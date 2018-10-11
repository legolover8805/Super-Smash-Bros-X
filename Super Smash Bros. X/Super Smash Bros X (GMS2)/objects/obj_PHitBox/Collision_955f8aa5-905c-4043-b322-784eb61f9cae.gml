/// @description Insert description here

if (owner != other.owner) {
	with fighters[other.owner] {
		if (isHit == 0) {
			percent += other.percentGiven;
			isHit = 1;
			frames = 0;
			maxFrames = other.framesGiven;
			show_debug_message(maxFrames);
		} 
	}
}
print(animState);
if (knockbackX != 0 && !wallSwitchDir && !isPaused) {
	animState = "hurt";
	if (knockValueX == 0) {
		knockValueX = percentMultiplied * knockbackX * image_xscale;	
		//hsp = 0;
	}
	
	if (sign(image_xscale)*sign(knockbackDir) != sign(knockValueX)) {
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

/// @description Insert description here
// You can write your code in this editor
if (animState == "fRoll" && direct == 1) {
	if (other.side = 1) {
		onLedge = true;
	} 
} else if (animState == "fRoll" && direct == -1) {
	if (other.side == -1) {
		onLedge = true;
	}
} else if (animState == "bRoll" && direct == 1) {
	if (other.side == -1) {
		onLedge = true;
	}
} else if (animState == "bRoll" && direct == -1) {
	if (other.side == 1) {
		onLedge = true;
	}
} else if (animState == "shield") {
	onLedge = true;
}
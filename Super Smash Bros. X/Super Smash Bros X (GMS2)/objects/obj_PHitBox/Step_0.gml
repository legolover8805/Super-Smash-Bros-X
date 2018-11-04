/// @description Insert description here
// You can write your code in this editor
if (char == 0) {
	sprite_index = spr_ZeroHit;
	if (projectile == 0) {
		sprite_index = spr_ZeroShotHit;
	} else if (projectile == 1) {
		sprite_index = spr_ZeroSideSpecialHit;
	} else if (projectile == 1) {
		sprite_index = spr_ZeroCloneHit;
	}
} else if (char == -1) {
	sprite_index = spr_SandbagHurt;
}
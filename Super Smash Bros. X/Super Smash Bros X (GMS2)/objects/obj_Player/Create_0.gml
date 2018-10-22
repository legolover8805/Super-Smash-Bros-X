/// @description Variables
hsp = 0;
vsp = 0;
grav = 0.3;
dir = 1;
wsp = 3;
wasp = 2;
dsp = 6;
jumps = 0;
hasJump = 0;
jmax = 2;
jsp = -6.5;
decel = .125;
isSkid = 0;
onGround = true;
landCount = 0;
direct = 0;
proj = noone;

// Definition
char = 0;
if (char == 0) {
	sprite_index = spr_ZeroAnim;
}
player = 1;

// Attacks
jabCombo = 0;
FChargeCount = 0;
FCharge = 0;
shotDelay = 30;
shotTimer = 0;
maxShot = 3;
shots = 0;
canShoot = true;

// Damage
percent = 0;
damageGiven = 0;
knockbackGivenX = 0;
knockbackGivenY = 0;
percentMultiplier = 0;
framesGiven = 0;
maxPauseFrames = 0;

// Animation variables
animState = "idle";
lagging = false;
airLagging = false;
isFreeFalling = false;

// Start
startWalking = 0;
startFalling = 0;

// Was
wasIdling = 0;
wasWalking = 0;
wasJumping = 0;
wasJumpingUp = 0;
wasFalling = 0;
wasLanding = 0;
wasQuickFalling = 0;
wasJabbing = 0;
wasFairing = 0;
wasNairing = 0;
wasFairLanding = 0;
wasFCharging = 0;
wasFSmashing = 0;
wasGNSpecialing = 0;
wasANSpecialing = 0;
wasGSSpecialing = 0;
wasUpSpecialing = 0;

// Is
walking = 0
idling = 0;
jumping = 0;
jumpingUp = 0;
falling = 0;
landing = 0;
quickFalling = 0;
jabbing = 0;
fairing = 0;
nairing = 0;
fairLanding = 0;
FCharging = 0;
FSmashing = 0;
GNSpecialing = 0;
ANSpecialing = 0;
GSSpecialing = 0;
upSpecialing = 0;

// Frame Counts
idleFrame = 0;
walkFrame = 0;
jumpFrame = 23;
jumpUpFrame = 22;
fallFrame = 25;
landFrame = 33;
quickFallFrame = 30;
jabFrame = 37;
fairFrame = 0;
nairFrame = 0;
fairLandFrame = 0;
FChargeFrame = 88;
FSmashFrame = 99;
GNSpecialFrame = 131;
ANSpecialFrame = 150;
GSSpecialFrame = 116;
upSpecialFrame = 159;

playFrame = 0;

// Boxes

hurtbox = scr_HurtboxCreate(char,player);
hitbox = scr_HitboxCreate(char,player);
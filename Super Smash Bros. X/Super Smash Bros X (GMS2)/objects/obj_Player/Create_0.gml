/// @description Variables
hsp = 0;
vsp = 0;
grav = 0.3;
dir = 1;
wsp = 3;
wasp = 2;
dsp = 4;
dssp = 6;
dlag = .2;
dasp = 3;
dattsp = 2;
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
onLedge = false;
floorDistance = 0;
airStopped = false;
ledge = noone;
hangLedge = false;
ledgeHeight = 30;
ledgeDist = 28;
notLedge = 0;
notLedgeMax = 0;
ledgeTop = 58;
ledgeHor = 48;
canClimb = false;
dashCheck = false;
dashCountMax = 10;
dashCount = 0;
isDashing = false;
stuckGround = false;
totalFrames = 0;
dance = true;

// Definition
char = 0;
if (char == 0) {
	sprite_index = spr_ZeroAnim;
}
player = 1;

// Attacks
jabCombo = 0;
jabLagging = false;
crouchLagging = false;
FChargeCount = 0;
FCharge = 0;
DChargeCount = 0;
DCharge = 0;
shotDelay = 30;
shotTimer = 0;
maxShot = 3;
shots = 0;
canShoot = true;
isMeteor = false;
hitConnect = false;
airLag = false;
airLagCounter = 0;
airLagMax = 0;
dizzyCount = 0;
dizzyMax = 600;

// Dodges
fRollCount = 0;
fRSpeedStart = 12;
fRSpeedEnd = 20;
fRSwap = 12;
fRollMax = 29;
bRollCount = 0;
bRSpeedStart = 7;
bRSpeedEnd = 20;
bRollMax = 29;
fRollSpeed = 3;
fRollSpd = 3;
bRollSpeed = 3;
bRollSpd = 3;

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
isDairLanding = false;
crouchFirst = false;

// Start
startWalking = 0;
startFalling = 0;

// Was
wasIdling = 0;
wasWalking = 0;
wasDashStarting = 0;
wasDashing = 0;
wasDashLagging = 0;
wasDashAttacking = 0;
wasJumping = 0;
wasJumpingUp = 0;
wasFalling = 0;
wasQuickFalling = 0;
wasLanding = 0;
wasCrouching = 0;
wasJabbing = 0;
wasDownTilting = 0;
wasFairing = 0;
wasNairing = 0;
wasBairing = 0;
wasDairing = 0;
wasFairLanding = 0;
wasFCharging = 0;
wasFSmashing = 0;
wasDCharging = 0;
wasDSmashing = 0;
wasGNSpecialing = 0;
wasANSpecialing = 0;
wasGSSpecialing = 0;
wasUpSpecialing = 0;
wasShielding = 0;
wasDizzy = 0;
wasFRolling = 0;
wasBRolling = 0;
wasSpotDodging = 0;
wasLedgeGrabbing = 0;
wasLedgeClimbing = 0;
wasLedgeClimbJumping = 0;
wasLedgeClimbAttacking = 0;

// Is
walking = 0
dashStarting = 0;
dashing = 0;
dashLagging = 0;
dashAttacking = 0;
idling = 0;
jumping = 0;
jumpingUp = 0;
falling = 0;
quickFalling = 0;
landing = 0;
crouching = 0;
jabbing = 0;
downTilting = 0;
fairing = 0;
nairing = 0;
bairing = 0;
dairing = 0;
fairLanding = 0;
FCharging = 0;
FSmashing = 0;
DCharging = 0;
DSmashing = 0;
GNSpecialing = 0;
ANSpecialing = 0;
GSSpecialing = 0;
upSpecialing = 0;
shielding = 0;
isDizzy = 0;
fRolling = 0;
bRolling = 0;
spotDodging = 0;
ledgeGrabbing = 0;
ledgeClimbing = 0;
ledgeClimbJumping = 0;
ledgeClimbAttacking = 0;


// Frame Counts
idleFrame = 0;
walkFrame = 0;
dashStartFrame = 221;
dashFrame = 225;
dashLagFrame = 228;
dashAttackFrame = 272;
jumpFrame = 23;
jumpUpFrame = 22;
fallFrame = 25;
quickFallFrame = 30;
landFrame = 33;
crouchFrame = 184;
jabFrame = 37;
downTiltFrame = 186;
fairFrame = 0;
nairFrame = 0;
bairFrame = 262;
dairFrame = 175;
fairLandFrame = 0;
FChargeFrame = 88;
FSmashFrame = 99;
DChargeFrame = 197;
DSmashFrame = 200;
GNSpecialFrame = 131;
ANSpecialFrame = 150;
GSSpecialFrame = 116;
upSpecialFrame = 159;
shieldFrame = 240;
dizzyFrame = 241;
fRollFrame = 245;
bRollFrame = 253;
spotDodgeFrame = 258;
ledgeGrabFrame = 232;
ledgeClimbFrame = 237;
ledgeClimbJumpFrame = 237;
ledgeClimbAttackFrame = 237;

playFrame = 0;

// Boxes
hurtbox = scr_HurtboxCreate(char,player);
hitbox = scr_HitboxCreate(char,player);

// Effects
shield = scr_ShieldCreate(player);
shadow = scr_ShadowCreate(.75,.1);
yHalfSize = 25;
xDisjoint = 2;
headHeight = 16;
starRight = 7;
starLeft = 20;
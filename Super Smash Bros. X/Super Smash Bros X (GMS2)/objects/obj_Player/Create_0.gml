// Variables
hsp = 0;
vsp = 0;
dir = 1;
jumps = 0;
hasJump = 0;
onGround = true;

// Definition
char = 1;
if (char == 0) {
	sprite_index = spr_ZeroAnim;
	scr_ZeroTraits()
} else if (char == 1) {
	sprite_index = spr_GenoAnim;
	scr_GenoTraits()
}
player = 1;


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
wasGrabbing = 0;
wasHolding = 0;
wasDashGrabbing = 0;
wasPummelling = 0;
wasLettingGo = 0;

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
grabbing = 0;
dashGrabbing = 0;
holding = 0;
pummelling = 0;
lettingGo = 0;


playFrame = 0;

// Boxes
hurtbox = scr_HurtboxCreate(char,player);
hitbox = scr_HitboxCreate(char,player);

// Effects
shield = scr_ShieldCreate(player);
shadow = scr_ShadowCreate(.75,.1);

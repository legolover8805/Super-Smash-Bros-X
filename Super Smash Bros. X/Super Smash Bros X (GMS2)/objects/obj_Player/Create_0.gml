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

// Animation variables
animState = "idle";
lagging = false;

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

// Is
walking = 0
idling = 0;
jumping = 0;
jumpingUp = 0;
falling = 0;
landing = 0;
quickFalling = 0;

// Frame Counts
idleFrame = 0;
walkFrame = 0;
jumpFrame = 0;
jumpUpFrame = 22;
fallFrame = 0;
landFrame = 0;
quickFallFrame = 0;
playFrame = 0;
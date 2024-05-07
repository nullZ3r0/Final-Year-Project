// Player physics
HorSpeed = 0;
VerSpeed = 0;
WalkSpeed = 6;
WalkAcc = 1.5;
HorFrictionGround = 0.5;
HorFrictionAir = 0.1;
JumpSpeed = 10;
Gravity = 0.4;
HorSpeedFraction = 0.0;
VerSpeedFraction = 0.0;

// Grappling hook physics
GrappleX = 0;
GrappleY = 0;
RopeX = 0;
RopeY = 0;
RopeAngleVelocity = 0;
RopeAngle = 0;
RopeLength = 0;

// Player states
Pstate = PlayerState.Normal;
enum PlayerState
{
	Normal,
	Swing
}
Grounded = true;

// Player weapon states 
WeaponEquipped = "Empty"

// Checkpoint
Checkpoint = [0,0]
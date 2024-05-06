// Pre calculations
Grounded = (place_meeting(x,y+1,TestWall));



// Key set up
var LeftKey = keyboard_check(ord("A"));
var RightKey = keyboard_check(ord("D"));

var UpKey = keyboard_check(ord("W"))
var DownKey = keyboard_check(ord("S"));

var JumpKey = keyboard_check(vk_space);


// State of the player
switch (Pstate)
{
	// Normal movement state
	case PlayerState.Normal:
	{
		var Direction = RightKey - LeftKey;
		HorSpeed += Direction * WalkAcc;
		
		if(Direction == 0)
		{
			var HorFriction = HorFrictionGround;
			if (!Grounded) {HorFriction = HorFrictionAir};
			HorSpeed = Approach(HorSpeed,0,HorFriction)
		}
		
		HorSpeed = clamp(HorSpeed,-WalkSpeed,WalkSpeed);
		
		VerSpeed += Gravity;
		
		if(JumpKey) and (Grounded) 
		{
			Grounded = false;
			VerSpeedFraction = 0;
			VerSpeed = -JumpSpeed;
		}
		
		if(mouse_check_button_pressed(mb_right) and 
		collision_point(mouse_x,mouse_y,TestWallGH,true,false) and
		(point_distance(mouse_x,mouse_y,x,y)<= 250) and
		WeaponEquipped == "Grapple"
		)
		{

			GrappleX = mouse_x;
			GrappleY = mouse_y;
			RopeX = x;
			RopeY = y;
			RopeAngleVelocity = 0;
			RopeAngle = point_direction(GrappleX,GrappleY,x,y);
			RopeLength = point_distance(GrappleX,GrappleY,x,y);
			Pstate = PlayerState.Swing;
		}
		
		
	}
	break;
	
	// Grapple hook state
	case PlayerState.Swing:
	{
		var RopeAngleAcc = -0.2 * dcos(RopeAngle);
		RopeAngleAcc += (RightKey - LeftKey) * 0.08
		RopeLength += (DownKey - UpKey) * 2;
		RopeLength = max(RopeLength, 60)
		RopeLength = min(RopeLength, 250)
		
		RopeAngleVelocity += RopeAngleAcc;
		RopeAngle += RopeAngleVelocity;
		RopeAngleVelocity *= 0.99;
		
		RopeX = GrappleX + lengthdir_x(RopeLength, RopeAngle);
		RopeY = GrappleY + lengthdir_y(RopeLength, RopeAngle);
		
		HorSpeed = RopeX - x;
		VerSpeed = RopeY - y;
		
		if (JumpKey)
		{
			Pstate = PlayerState.Normal
			VerSpeedFraction = 0;
			VerSpeed = -JumpSpeed;
		}
		
	}
	break;
}



// Calculations
HorSpeed += HorSpeedFraction;
VerSpeed += VerSpeedFraction;
HorSpeedFraction = frac(HorSpeed);
VerSpeedFraction = frac(VerSpeed);
HorSpeed -= HorSpeedFraction;
VerSpeed -= VerSpeedFraction;



// Collsion Detection

// > Horizontal
if(place_meeting(x+HorSpeed, y, TestWall))
{
	var HorStep = sign(HorSpeed);
	HorSpeed = 0;
	HorSpeedFraction = 0;
	while(!place_meeting(x+HorStep, y, TestWall)) x += HorStep;
	if(Pstate = PlayerState.Swing)
	{
		RopeAngle = point_direction(GrappleX,GrappleY,x,y);
		RopeAngleVelocity = 0;
	}
}
x += HorSpeed;

// > Vertical
if(place_meeting(x, y+VerSpeed, TestWall))
{
	var VerStep = sign(VerSpeed);
	VerSpeed = 0;
	VerSpeedFraction = 0;
	while(!place_meeting(x, y+VerStep, TestWall)) y += VerStep;
	if(Pstate = PlayerState.Swing)
	{
		RopeAngle = point_direction(GrappleX,GrappleY,x,y);
		RopeAngleVelocity = 0;
	}
}
y += VerSpeed;

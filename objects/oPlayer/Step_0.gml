// Player input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

// Player movement
var move = key_right - key_left;
hsp = move * walksp;

// Gravity
vsp = vsp + grv;

// Jumping
if (place_meeting(x,y+1,oWall)) and (key_jump)
{
	vsp = -15;
}

// Wall Jump
if (place_meeting(x+1,y,oWallJump)) and (key_jump)
{
	vsp = -15;
	hsp = -100
}

if (place_meeting(x-1,y,oWallJump)) and (key_jump)
{
	vsp = -15;
	hsp = 100;
}

// X axis movement
if (place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
	
}

if (place_meeting(x+hsp,y,oWallJump))
{
	while(!place_meeting(x+sign(hsp),y,oWallJump))
	{
		x += sign(hsp);
	}
	hsp = 0;
	
}

x += hsp;

// Y axis movement
if (place_meeting(x,y+vsp,oWall))
{
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
	
}

if (place_meeting(x,y+vsp,oWallJump))
{
	while(!place_meeting(x,y+sign(vsp),oWallJump))
	{
		y += sign(vsp);
	}
	vsp = 0;
	
}

y += vsp;
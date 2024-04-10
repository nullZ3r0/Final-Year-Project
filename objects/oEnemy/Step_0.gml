// Gravity
vsp = vsp + grv;

// X axis movement
if (place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
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
y += vsp;

// Dead?
if (hp <= 0)
{
	instance_destroy();
}

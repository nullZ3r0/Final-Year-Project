y = Player.y;

if (image_angle > 90) and (image_angle < 270)
{
	x = Player.x - 10;
	image_yscale = -1;
}
else
{
	x = Player.x + 10;
	image_yscale = 1;
}
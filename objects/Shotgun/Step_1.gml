y = Player.y;

firingdelay -= 1;
recoil = max(0,recoil - 1);


if (mouse_check_button(mb_left)) and 
(firingdelay < 0)
{
	recoil = 20;
	firingdelay = 100;
	with (instance_create_layer(x,y,"Bullets",Buckshot))
	{
		speed = 50;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}

x -= lengthdir_x(recoil,image_angle);
y -= lengthdir_x(recoil,image_angle);

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
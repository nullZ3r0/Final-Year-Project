draw_self();

if (flash > 0)
{
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}


if (oEnemy.hp >= 0)
{	
	draw_text(x+10,y-35,hp);
}
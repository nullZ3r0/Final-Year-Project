var switch_key = keyboard_check_pressed(ord("E"));

if (distance_to_object(Player) < 10)
{
	if (switch_key)
	{
		room_goto(new_room)
	}
}
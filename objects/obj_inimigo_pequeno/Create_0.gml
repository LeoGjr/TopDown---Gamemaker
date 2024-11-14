/// @description Insert description here
// You can write your code in this editor

event_inherited();

timer_movimento = room_speed * random_range(1,2);

distancia = 200;

vida = 2;
shake = 10;

vel_max = 2;
ped_min = 5;
ped_max = 10;
temp_min = 5;
temp_max = 10;

define_movimento();



seguir_player = function()
{
	if(instance_exists(obj_player))
	{
		var _dist_player = point_distance(x, y, obj_player.x, obj_player.y);
		
		if(_dist_player < distancia)
		{
			var _dir = point_direction(x, y, obj_player.x, obj_player.y);
			direction = _dir;
			speed = 1;
		}
	}
}





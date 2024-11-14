/// @description Insert description here
// You can write your code in this editor

event_inherited();

vida = 10;
shake = 20;
vel_max = 2;
ped_min = 15
ped_max = 20;
temp_min = 10;
temp_max = 20;
ped_vel_min = 20;
ped_vel_max = 30;
dar_dano = true;

timer_ovo = room_speed * random_range(temp_min, temp_max);

timer_movimento = room_speed * random_range(temp_min, temp_max);


define_movimento();

bota_ovo = function()
{
	timer_ovo--;
	
	if(timer_ovo <= 0)
	{
		var _ovo = instance_create_layer(x, y, "Inimigos", obj_ovo);
		_ovo.speed = random(1);
		_ovo.direction = direction + 180;
		timer_ovo = room_speed * random_range(temp_min, temp_max);
	}
}

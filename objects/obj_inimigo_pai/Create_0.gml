/// @description Insert description here
// You can write your code in this editor

vida = 1;
shake = 1;
vel_max = 1;
ped_min = 1;
ped_max = 2;
temp_min = 1;
temp_max = 2;
ped_vel_min = 8;
ped_vel_max = 12;
dano = 1;
dar_dano = false;

ficar_room = function()
{
	image_alpha = direction;
	if(x - sprite_width/2 < 0 or x + sprite_width/2 > room_width)
	{
		hspeed *= -1;
	}
	
	if(y - sprite_height/2 < 0) vspeed *= -1;
	if(y + sprite_height/2 > room_height) vspeed *= -1;
}

levar_dano = function(_dano)
{
	if(_dano == undefined)
	{
		_dano = 1;
	}
	vida -= _dano;
	
	if(vida <= 0)
	{
		instance_destroy();
		
		explodir();
		
		if(global.shake < shake) global.shake = shake;
	}
}

explodir = function()
{
	var _rastro = instance_create_layer(x, y, "Tiros", obj_vestigio);
	
	_rastro.image_angle = irandom(359);
	
	var _qtd = irandom_range(ped_min, ped_max);
	
	repeat(_qtd)
	{
		var _pedaco = instance_create_layer(x, y, layer, obj_pedaco);
		
		_pedaco.speed = random_range(ped_vel_min, ped_vel_max);
		
		_pedaco.direction = irandom(359);
		
		_pedaco.image_angle = _pedaco.direction;
		
		_pedaco.dar_dano = dar_dano;
	}
}

mudar_movimento = function()
{
	timer_movimento--;
	
	if(timer_movimento <= 0)
	{
		define_movimento();
		
		timer_movimento = room_speed * random_range(temp_min,temp_max);
	}
}

define_movimento = function()
{
	direction = irandom(359);
	
	speed = random(vel_max);
	
	image_angle = direction;
}

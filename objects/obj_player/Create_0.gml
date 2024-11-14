/// @description Insert description here
// You can write your code in this editor

velocidade = 5;
velh = 0;
velv = 0;
vel_tiro = 10;
inv = false;
inv_tempo = room_speed * 3;
inv_timer = 0;
alpha_val = 0.05;
espera_tiro = 0;
demora_tiro = room_speed * 0.2;
movimentacao = function()
{
	var _up, _down, _left, _right;
	
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	velv = (_down - _up) * velocidade;
	
	y += velv;
	
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	
	velh = (_right - _left) * velocidade;
	x += velh;
	
	if(_up or _down or _left or _right)
	{
		image_speed = 1;
	}
	else
	{
		image_speed = 0;
	}
	
	fica_room();
}

fica_room = function()
{
	if(x - sprite_width/2 < 0)
	{
		x = 0 + sprite_width/2;
	}
	
	if(x + sprite_width/2 > room_width)
	{
		x = room_width - sprite_width/2;
	}
	
	y = clamp(y, sprite_height/2, room_height - sprite_height/2);
}

atirando = function()
{
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	
	image_angle = _dir;
	
	var _fire = mouse_check_button(mb_left);
	if(espera_tiro <= 0)
	{
		sprite_index = spr_player;
		
		if(_fire)
		{
			var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro);
			_tiro.speed = vel_tiro;
			_tiro.direction = _dir;
			
			espera_tiro = demora_tiro;
			
		}
	}
	else
	{
		espera_tiro--;
		
		sprite_index = spr_tiro_player;
	}
}

levar_dano = function()
{
	var _inimigo = instance_place(x, y, obj_inimigo_pai);
	
	if(_inimigo && inv == false)
	{
		global.vida -= _inimigo.dano;
		
		inv_timer = inv_tempo;
		
		if(global.vida < 0)
		{
			instance_destroy();
			
			game_restart();
		}
	}
}

invencivel = function()
{
	
	if(inv_timer <= 0)
	{
		inv = false;
		
		image_alpha = 1;
	}
	else
	{
		inv_timer--;
		inv = true;
		
		image_alpha += alpha_val;
		
		if(image_alpha > 1 or image_alpha < 0)
		{
			alpha_val *= -1;
		}
	}
}

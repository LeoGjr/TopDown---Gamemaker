/// @description Insert description here
// You can write your code in this editor

randomize();

global.level = 1;
global.vida = 3;
reinicia_timer = room_speed;

inicia_room = function()
{
	var _width = irandom_range(2000, 5000);
	var _heigth = irandom_range(2000, 5000);
	room_width = _width;
	room_height = _heigth;
	
	var bg = choose(spr_bg01, spr_bg02, spr_bg03);
	var lay_id = layer_get_id("Background");
	var lay_bg = layer_background_get_id(lay_id);
	layer_background_sprite(lay_bg, bg);
	
	instance_create_layer(0, 0, layer, obj_screenshake);
	
	var _x = irandom_range(0 + 100, room_width - 100);
	var _y = irandom_range(0 + 100, room_height - 100);
	instance_create_layer(_x, _y, "Player", obj_player);
	
	gera_inimigos();
}

gera_inimigos = function()
{
	var _qtd = irandom_range(3, 7) * global.level;
	
	repeat(_qtd)
	{
		var _x = irandom_range(100, room_width - 100);
		var _y = irandom_range(100, room_height - 100);
		
		var inimigo = instance_create_layer(_x, _y, "Inimigos", obj_inimigo_grande);
		
		if(instance_exists(obj_player))
		{
			var _dist = point_distance(inimigo.x, inimigo.y, obj_player.x, obj_player.y);
			
			if(_dist < 300)
			{
				instance_destroy(inimigo, false);
			}
		}
	}
}

passa_level = function()
{
	var _qtd_inimigos = instance_number(obj_inimigo_grande);
	
	if(_qtd_inimigos <= 0)
	{
		reinicia_timer--;
		if(reinicia_timer <= 0)
		{
			global.level++;
			room_restart();
			reinicia_timer = room_speed;
		}	
	} 
}

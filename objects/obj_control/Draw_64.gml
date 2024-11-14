/// @description Insert description here
// You can write your code in this editor


draw_text(20, 20, "Vida: " + string(global.vida));
draw_text(20, 40, "Level: " + string(global.level));

if(instance_exists(obj_inimigo_grande) && instance_exists(obj_player))
{
	with(obj_player)
	{
		var _inimigo_prox = instance_nearest(x, y, obj_inimigo_grande);
		
		var _dir = point_direction(x, y, _inimigo_prox.x, _inimigo_prox.y);
		
		var width = camera_get_view_width(view_camera[0]);
		
		draw_sprite_ext(spr_seta, 0, width/2, 100, 1, 1, _dir, c_white, 1);
	}
}

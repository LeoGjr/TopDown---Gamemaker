/// @description Insert description here
// You can write your code in this editor

image_xscale = 2;
image_yscale = image_xscale;

demora_morte = room_speed * 6;
dano = 1;
shake = 3;

morrendo = function()
{
	demora_morte--;
	
	if(demora_morte <= 0) instance_destroy();
}


efeito_tamanho = function()
{
	image_xscale = lerp(image_xscale, 1, 0.2);
	image_yscale = image_xscale;
}

efeito_tiro = function()
{
	draw_self();
	
	gpu_set_blendmode(bm_add);
	
	draw_sprite_ext(spr_efeito_tiro, 0, x, y, image_xscale * 1.1, image_yscale * 1.1, image_angle, c_fuchsia, 0.7);
	
	gpu_set_blendmode(bm_normal);
}

colide_inimigo = function()
{
	var _inimigo = instance_place(x, y, obj_inimigo_pai);
	
	if(_inimigo)
	{
		_inimigo.levar_dano(dano);
		
		instance_destroy();
		
		instance_create_layer(x, y, layer, obj_impacto_tiro);
		
		if(global.shake < shake) global.shake = shake;
	}
}

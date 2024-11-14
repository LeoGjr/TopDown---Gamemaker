/// @description Insert description here
// You can write your code in this editor

dar_dano = false;

colidindo = function()
{
	if(dar_dano)
	{
		var _inimigo = instance_place(x, y, obj_inimigo_pai);
		if(_inimigo)
		{
			_inimigo.levar_dano(1);
			
			_inimigo.dar_dano = true;
			
			instance_destroy();
		}
	}
}

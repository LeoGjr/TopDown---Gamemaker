/// @description Insert description here
// You can write your code in this editor

speed *= .9;

image_alpha -= 0.005;

if(image_alpha <= 0)
{
	instance_destroy();
}

colidindo();

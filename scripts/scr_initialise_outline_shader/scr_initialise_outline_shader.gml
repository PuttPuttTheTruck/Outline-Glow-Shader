//Function to initialise the shader BEFORE drawing.
//This shader does not draw anything.

//Call this function.
//Draw your sprite.
//Call "shader_reset()"
function scr_initialise_outline_shader(_sprite_to_draw, _index_of_sprite_to_draw, 
_time_variable, _length_of_wave, _sprite_brighten_multiplier, _glow_size, _glow_intensity_divisor) {
	
	//Set all undefined to their defaults
	//(Defaults are stored in the shader itself)
	if is_undefined(_time_variable) _time_variable = current_time/100;
	if is_undefined(_length_of_wave) _length_of_wave = 0;
	if is_undefined(_sprite_brighten_multiplier) _sprite_brighten_multiplier = 0;
	if is_undefined(_glow_size) _glow_size = 0;
	if is_undefined(_glow_intensity_divisor) _glow_intensity_divisor = 0;

	
	
	
	shader_set(sh_outline);
	texel_w = texture_get_texel_width(sprite_get_texture(_sprite_to_draw, _index_of_sprite_to_draw));
	texel_h = texture_get_texel_height(sprite_get_texture(_sprite_to_draw, _index_of_sprite_to_draw));
	
	shader_set_uniform_f(u_pixel_w, texel_w);
	shader_set_uniform_f(u_pixel_h, texel_h);
	shader_set_uniform_f(u_time, _time_variable);
	shader_set_uniform_f(u_wave_length_custom, _length_of_wave);
	shader_set_uniform_f(u_sprite_brighten_multiplier_custom, _sprite_brighten_multiplier);
	shader_set_uniform_f(u_wave_time_offset_custom, _length_of_wave*texel_h);
	shader_set_uniform_i(u_glow_size_custom, _glow_size);
	shader_set_uniform_f(u_glow_intensity_exponent_divisor_custom, _glow_intensity_divisor);
}
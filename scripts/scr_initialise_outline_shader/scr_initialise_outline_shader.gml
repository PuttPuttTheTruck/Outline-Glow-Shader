//Function to initialise the shader BEFORE drawing.
//This shader does not draw anything.

//		HOW TO USE THIS FUNCTION:
//Call this function.
//Draw your sprite.
//Call "shader_reset()"

function scr_initialise_outline_shader(_sprite_to_draw, _index_of_sprite_to_draw, 
_time_variable, _length_of_wave, _sprite_brighten_multiplier, _glow_size, _glow_intensity_divisor) {
	
	#region //Retrieve all uniforms.
	u_pixel_h = shader_get_uniform(sh_outline, "pixelH");
	u_pixel_w = shader_get_uniform(sh_outline, "pixelW");
	u_time = shader_get_uniform(sh_outline, "time");
	u_wave_length_custom = shader_get_uniform(sh_outline, "wave_length_custom");
	u_sprite_brighten_multiplier_custom = shader_get_uniform(sh_outline, "sprite_brighten_multiplier_custom");
	u_wave_time_offset_custom = shader_get_uniform(sh_outline, "wave_time_offset_custom");
	u_glow_size_custom = shader_get_uniform(sh_outline, "glow_size_custom");
	u_glow_intensity_exponent_divisor_custom = shader_get_uniform(sh_outline, "glow_intensity_exponent_divisor_custom");
	#endregion
	
	#region //Set all undefined to zero.
	//(Defaults are stored in the shader itself)
	if is_undefined(_time_variable) _time_variable = current_time/100;
	if is_undefined(_length_of_wave) _length_of_wave = 0;
	if is_undefined(_sprite_brighten_multiplier) _sprite_brighten_multiplier = 0;
	if is_undefined(_glow_size) _glow_size = 0;
	if is_undefined(_glow_intensity_divisor) _glow_intensity_divisor = 0;
	#endregion
	
	shader_set(sh_outline);
	
	//Get texel width and height from given sprite.
	texel_w = texture_get_texel_width(sprite_get_texture(_sprite_to_draw, _index_of_sprite_to_draw));
	texel_h = texture_get_texel_height(sprite_get_texture(_sprite_to_draw, _index_of_sprite_to_draw));
	
	#region //Set all uniforms.
	shader_set_uniform_f(u_pixel_w, texel_w);
	shader_set_uniform_f(u_pixel_h, texel_h);
	shader_set_uniform_f(u_time, _time_variable);
	shader_set_uniform_f(u_wave_length_custom, _length_of_wave);
	shader_set_uniform_f(u_sprite_brighten_multiplier_custom, _sprite_brighten_multiplier);
	shader_set_uniform_f(u_wave_time_offset_custom, _length_of_wave*texel_h);
	shader_set_uniform_i(u_glow_size_custom, _glow_size);
	shader_set_uniform_f(u_glow_intensity_exponent_divisor_custom, _glow_intensity_divisor);
	#endregion
}
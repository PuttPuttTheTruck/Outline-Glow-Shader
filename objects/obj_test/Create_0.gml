y_offset = 0;

u_pixel_h = shader_get_uniform(sh_outline, "pixelH");
u_pixel_w = shader_get_uniform(sh_outline, "pixelW");
u_time = shader_get_uniform(sh_outline, "time");
u_wave_length_custom = shader_get_uniform(sh_outline, "wave_length_custom");
u_sprite_brighten_multiplier_custom = shader_get_uniform(sh_outline, "sprite_brighten_multiplier_custom");
u_wave_time_offset_custom = shader_get_uniform(sh_outline, "wave_time_offset_custom");
u_glow_size_custom = shader_get_uniform(sh_outline, "glow_size_custom");
u_glow_intensity_exponent_divisor_custom = shader_get_uniform(sh_outline, "glow_intensity_exponent_divisor_custom");





texel_w = 0;
texel_h = 0;

show_debug_message(texel_h);
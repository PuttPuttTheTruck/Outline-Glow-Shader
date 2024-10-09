
scr_initialise_outline_shader(spr_baseball, 0, current_time/50, 25, 0.3, 4, 2);
draw_sprite(spr_baseball, 0, room_width*0.25, room_height/3);


scr_initialise_outline_shader(spr_pump, 0, current_time/50, 15, 0.5, 15, 1.5);
draw_sprite(spr_pump, 0, room_width*0.75, room_height/3);

/*
texel_w = texture_get_texel_width(sprite_get_texture(spr_puffin, current_time/500));
texel_h = texture_get_texel_height(sprite_get_texture(spr_puffin, current_time/500));

shader_set_uniform_f(u_pixel_w, texel_w);
shader_set_uniform_f(u_pixel_h, texel_h);
shader_set_uniform_f(u_time, current_time/100);
shader_set_uniform_f(u_wave_length_custom, 5);
shader_set_uniform_f(u_sprite_brighten_multiplier_custom, 0.5);
shader_set_uniform_f(u_wave_time_offset_custom, 5*texel_h);
shader_set_uniform_i(u_glow_size_custom, 7);
shader_set_uniform_f(u_glow_intensity_exponent_divisor_custom, 2.5);
*/

scr_initialise_outline_shader(spr_puffin, 0);

draw_sprite(spr_puffin, current_time/500, room_width*0.5, room_height*0.75);


shader_reset();

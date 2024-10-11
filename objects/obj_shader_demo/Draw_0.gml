scr_initialise_outline_shader(spr_baseball, 0, current_time/50, 25, 0.3, 4, 2, 255, 0, 0);
draw_sprite(spr_baseball, 0, room_width*0.25, room_height/3);


scr_initialise_outline_shader(spr_pump, 0, current_time/50, 15, 0.2, 9, 2.5);
draw_sprite(spr_pump, 0, room_width*0.75, room_height/3);


scr_initialise_outline_shader(spr_puffin, 0, current_time/100, 5.0, 0.5, 7, 2.5, 176, 254, 255);
draw_sprite(spr_puffin, current_time/500, room_width*0.5, room_height*0.75);


shader_reset();

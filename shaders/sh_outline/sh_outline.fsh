//
// Outline highlight shader with glow
//

//DECLARATION AREA
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelH;
uniform float pixelW;
uniform float time;
uniform float wave_length_custom;
uniform float sprite_brighten_multiplier_custom;
uniform float wave_time_offset_custom; //FORMULA (Inside of initialiastion script): (Wave Length)*(PixelH)
uniform int glow_size_custom;
uniform float glow_intensity_exponent_divisor_custom;

void main() {
	#region //Initialise vectors for checking pixel positions.
	vec2 offsetx;
	offsetx.x = pixelW;
	vec2 offsety;
	offsety.y = pixelH;
	#endregion
	
	#region //Setting Variable Defaults & Uniform Overrides.
	
	//Here I am setting the different variables to their defaults.
	//If an override is provided via uniform, the variable will be set to the uniform.
	//Feel free to change any defaults you want!
	
	float speed = 2.0; //This acts as a global speed. Feel free to change.
	//Speed should normally be controlled by adjusting the time variable inputted.
	
	float wave_length = 5.0; 
	if (wave_length_custom != 0.0) {wave_length = wave_length_custom;}
	
	float wave_time_offset = 0.0; 
	if (wave_time_offset_custom != 0.0) {wave_time_offset = wave_time_offset_custom;} //This should really always be set to custom as it is a formula.
	
	int glow_size = 7; 
	if (glow_size_custom != 0) {glow_size = glow_size_custom;}
	
	float glow_intensity_exponent_divisor = 2.5; //(This controls the falloff of the glow around the outline) (Lower = More Glow)
	if (glow_intensity_exponent_divisor_custom != 0.0) {glow_intensity_exponent_divisor = glow_intensity_exponent_divisor_custom;}
	
	float sprite_brighten_multiplier = 0.5;
	if (sprite_brighten_multiplier_custom != 0.0) {sprite_brighten_multiplier = sprite_brighten_multiplier_custom;} 
	#endregion
	
	#region //Calculate outline.
	float outline_alpha = 0.0; //Do Not Modify.
	for(int i=1; i<glow_size; i++) {
		float increment = float(i); //Converting int to float so it can be used to multiply vectors.
		outline_alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetx * increment).a) / pow(increment, glow_intensity_exponent_divisor);
		outline_alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetx * increment).a) / pow(increment, glow_intensity_exponent_divisor);
		outline_alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsety * increment).a) / pow(increment, glow_intensity_exponent_divisor);
		outline_alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsety * increment).a) /	pow(increment, glow_intensity_exponent_divisor);
	}
	#endregion
	
	#region //Calculate time and make adjustments.
	float modified_time = time*speed;
	while(modified_time > (1.0+wave_time_offset)/pixelH) {
		modified_time -= (1.0+wave_time_offset*2.0)/pixelH;
	}
	#endregion
	
	#region //Calculate this pixel relative to the wave. (If it is within it.)
	float dist = abs(floor(modified_time) - floor(v_vTexcoord.y/pixelH));
	dist = clamp(dist, 0.0, wave_length);
	dist *= -1.0;
	dist += wave_length;
	float within_wave_amount = dist/wave_length;
	#endregion
	
	#region //Brighten the area of the sprite within the wave. (Not outline.)
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor.rgb += within_wave_amount * sprite_brighten_multiplier;
	#endregion
	
	#region //Draw outline and surrounding glow.
	if (gl_FragColor.a == 0.0 && outline_alpha > 0.0) {
		gl_FragColor.rgb = vec3(1.0, 1.0, 1.0);
		gl_FragColor.a = within_wave_amount * outline_alpha;
	}
	#endregion
	
}
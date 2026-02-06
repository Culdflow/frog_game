shader_type canvas_item;

uniform float curvature : hint_range(0.0, 1.5) = 0.6;
uniform float time_scale = 0.1;

void fragment() {
	vec2 center = vec2(0.5, SCREEN_UV.y);
    vec2 uv = UV;

    // Move UVs so (0,0) is the center
    vec2 p = uv - center;
	p.x *= 1.2; // before computing r
    float r = length(p);

    // Reverse fisheye (barrel distortion)
    // Higher powers = stronger edge pull, stable center
    float distortion = 1.0 + curvature * r * r * (1.0 + sin(TIME * time_scale) * 0.05);

    p /= distortion;

    uv = p + center;

    COLOR = texture(TEXTURE, uv);
}










//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

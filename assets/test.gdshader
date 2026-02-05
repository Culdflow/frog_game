shader_type canvas_item;

uniform float depth : hint_range(0.0, 0.2) = 0.05;  // Depth of the curve (how much the center bends inward)
uniform float width : hint_range(0.0, 1.0) = 0.3;   // Width of the curve effect (how wide the effect is)

void fragment() {
    // Get the UV coordinates of the sprite (normalized)
    vec2 uv = UV;

    // Calculate the distance from the vertical center of the sprite (0.5 is the center in UV space)
    float y_dist = abs(uv.y - 0.5);

    // Apply a smooth curve (sinusoidal effect) for the inward curvature
    // The effect should be strongest at the top and bottom edges and weaker toward the center
    float curve_factor = (1.0 - y_dist) * depth * sin(y_dist * 3.14159);  // Sine curve for smooth falloff

    // Apply the curve effect to the Y-coordinate (this simulates the inward curve)
    if (uv.y < 0.5)
        uv.y -= curve_factor;  // Apply upward curvature for the top (pull inward)
    else
        uv.y += curve_factor;  // Apply downward curvature for the bottom (push inward)

    // Ensure the UVs stay within the bounds of the texture (0 to 1)
    uv.x = clamp(uv.x, 0.0, 1.0);
    uv.y = clamp(uv.y, 0.0, 1.0);

    // Fetch the texture color using the modified UV coordinates
    COLOR = texture(TEXTURE, uv);
}






//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

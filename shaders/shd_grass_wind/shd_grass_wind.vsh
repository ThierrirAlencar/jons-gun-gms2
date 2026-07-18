attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord0;
attribute vec2 in_TextureCoord1; // x = sway weight (0 base, 1 tip), y = per-blade phase

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_windSpeed;
uniform float u_windStrength;
uniform float u_windScale;

void main()
{
    vec3 pos = in_Position;
    
    float sway_weight = in_TextureCoord1.x;
    float phase = in_TextureCoord1.y;
    
    // ripple across space + oscillate over time + per-blade offset
    float wind = sin(u_time * u_windSpeed + phase + pos.x * u_windScale) * u_windStrength;
    
    pos.x += wind * sway_weight;
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(pos, 1.0);
    
    v_vTexcoord = in_TextureCoord0;
    v_vColour = in_Colour;
}
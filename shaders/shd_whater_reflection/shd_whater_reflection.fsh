varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_reflectionTex; // the captured "above water" surface
uniform float u_time;
uniform float u_waveSpeed;      // how fast ripples scroll
uniform float u_waveStrength;   // how far pixels get distorted (in UV units, keep small e.g 0.01-0.03)
uniform float u_waveScale;      // how many ripples fit across the surface
uniform float u_pixelSize;      // snap distortion to this many texels for a crisp pixel-art look
uniform vec4  u_waterColor;     // tint blended into the reflection, e.g. dark teal
uniform float u_waterMix;       // 0 = pure reflection, 1 = pure flat color

void main()
{
    vec4 base = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    if (base.a < 0.01) discard;
    
    // Flip Y to mirror what's above the water
    vec2 reflectUV = vec2(v_vTexcoord.x, 1.0 - v_vTexcoord.y);
    
    // Distort with a couple of overlapping sine waves so it doesn't look perfectly uniform
    float wave1 = sin(reflectUV.x * u_waveScale + u_time * u_waveSpeed) * u_waveStrength;
    float wave2 = sin(reflectUV.y * u_waveScale * 1.7 + u_time * u_waveSpeed * 0.8) * u_waveStrength * 0.5;
    
    reflectUV.x += wave1 + wave2;
    reflectUV.y += wave2 * 0.5;
    
    // Snap distortion to a pixel grid so ripples don't sub-pixel blur -- keeps it pixel-art crisp
    if(u_pixelSize > 0.0){
        reflectUV = floor(reflectUV * u_pixelSize) / u_pixelSize;
    }
    
    reflectUV = clamp(reflectUV, 0.0, 1.0);
    
    vec4 reflection = texture2D(u_reflectionTex, reflectUV);
    
    // Blend the reflection with a flat water tint so it reads as water, not just a mirror
    vec3 finalColor = mix(reflection.rgb, u_waterColor.rgb, u_waterMix);
    
    gl_FragColor = vec4(finalColor, base.a * u_waterColor.a);
}
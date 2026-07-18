varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform vec4  u_uvRect;       // xmin, ymin, xmax, ymax of the sprite's region in the atlas
uniform vec2  u_spriteSize;   // sprite width/height IN PIXELS (e.g. 32, 16)
uniform float u_interval;     // full cycle length in seconds
uniform float u_sweepWidth;   // thickness of band, in PIXELS now (e.g. 2.0, 3.0)
uniform float u_sweepAngle;   // tilt, in radians
uniform float u_stepSpeed;    // how many discrete steps per second (e.g. 12 = chunky, 30 = smoother)

void main()
{
    vec4 base = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    if (base.a < 0.01) discard;
    
    // Normalize atlas texcoord into local 0-1 sprite space
    vec2 uv;
    uv.x = (v_vTexcoord.x - u_uvRect.x) / (u_uvRect.z - u_uvRect.x);
    uv.y = (v_vTexcoord.y - u_uvRect.y) / (u_uvRect.w - u_uvRect.y);
    
    // Snap uv to the sprite's actual pixel grid so the band aligns with real pixels
    vec2 pixelUV = floor(uv * u_spriteSize) / u_spriteSize;
    
    // Work in pixel-space units instead of 0-1 for the diagonal, so width is in real pixels
    vec2 pixelPos = pixelUV * u_spriteSize;
    float diag = pixelPos.x * cos(u_sweepAngle) + pixelPos.y * sin(u_sweepAngle);
    
    float maxDiag = (u_spriteSize.x + u_spriteSize.y); // rough max span
    
    // Quantize time itself into discrete steps -> band jumps pixel-to-pixel, not smooth slide
    float rawT = mod(u_time, u_interval) / u_interval;
    float steppedT = floor(rawT * u_interval * u_stepSpeed) / (u_interval * u_stepSpeed);
    
    float travel = maxDiag * 1.6;
    float sweepPos = steppedT * travel - maxDiag * 0.3;
    
    float dist = abs(diag - sweepPos);
    
    // Hard cutoff instead of smoothstep -> crisp pixel-art edge, no soft gradient
    float band = step(dist, u_sweepWidth);
    
    vec3 finalColor = mix(base.rgb, vec3(1.0), band);
    gl_FragColor = vec4(finalColor, base.a);
}
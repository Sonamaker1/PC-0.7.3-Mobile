#pragma header
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

// https://www.shadertoy.com/view/Ms3XWH

uniform float range;
uniform float noiseQuality;
uniform float noiseIntensity;
uniform float offsetIntensity;
uniform float colorR;
uniform float colorB;
uniform float colorG;

float rand(vec2 co)
{
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

float verticalBar(float pos, float uvY, float offset)
{
    float edge0 = (pos - range);
    float edge1 = (pos + range);

    float x = smoothstep(edge0, pos, uvY) * offset;
    x -= smoothstep(pos, edge1, uvY) * offset;
    return x;
}

void mainImage()
{

vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;

vec2 iResolution = openfl_TextureSize;
	vec2 uv = fragCoord.xy / iResolution.xy;
    
    for (float i = 0.0; i < 0.71; i += 0.1313)
    {
        float d = mod(iTime * i, 1.7);
        float o = sin(1.0 - tan(iTime * 0.24 * i));
    	o *= offsetIntensity;
        uv.x += verticalBar(d, uv.y, o);
    }
    
    float uvY = uv.y;
    uvY *= noiseQuality;
    uvY = float(int(uvY)) * (1.0 / noiseQuality);
    float noise = rand(vec2(iTime * 0.00001, uvY));
    uv.x += noise * noiseIntensity;


    vec2 offsetR = vec2(0.0073 * (cos(iTime * 0.97)), 0.0) * colorR;
    vec2 offsetG = vec2(0.0073 * (cos(iTime * 0.97)), 0.0) * colorG;
    vec2 offsetB = vec2(0.0073 * (cos(iTime * 0.97)), 0.0) * colorB;
    
    float r = texture(iChannel0, uv + offsetR).r;
    float g = texture(iChannel0, uv + offsetG).g;
    float b = texture(iChannel0, uv + offsetB).b;

    vec4 tex = vec4(r, g, b, 1.0);
    fragColor = tex;

gl_FragColor.a = flixel_texture2D(bitmap, openfl_TextureCoordv).a;
}
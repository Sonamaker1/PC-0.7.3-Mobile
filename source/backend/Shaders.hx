package backend;

enum abstract Shaders(String) to String from String 
{
    var invert = 
    "
        #pragma header
        
        void main()
        {
            vec2 p = openfl_TextureCoordv*openfl_TextureSize.xy/openfl_TextureSize.xy;
            
            vec4 col = flixel_texture2D(bitmap, p);
            
            col = vec4(1.) - col; // invert the color
            
            col.a = 1.0 - col.a; // invert the alpha value
            
            col.rgb *= col.a; // multiply color by alpha
            
            gl_FragColor = col;
        }
    ";   

    var pixel = 
    "#pragma header
	vec2 uv = openfl_TextureCoordv.xy;
	vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
	vec2 iResolution = openfl_TextureSize;
	uniform float iTime;
	#define iChannel0 bitmap
	#define texture flixel_texture2D
	#define fragColor gl_FragColor
	#define mainImage main

	uniform float size = 10.0;

	void mainImage() {
		vec2 coordinates = fragCoord.xy/iResolution.xy;
		vec2 pixelSize = vec2(size/iResolution.x, size/iResolution.y);
		vec2 position = floor(coordinates/pixelSize)*pixelSize;
		vec4 finalColor = texture(iChannel0, position);
		fragColor = finalColor;
	}";
}
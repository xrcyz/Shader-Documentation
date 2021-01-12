#ifdef GL_ES
precision highp float;
precision highp int;
#endif

uniform vec2 dimensions;
uniform float userHueSelection;

/*
  [Iñigo Quiles](https://www.shadertoy.com/view/MsS3Wc)
  via [Book of Shaders](https://thebookofshaders.com/06/)
*/
vec3 hsb2rgb( in vec3 c ){
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                             6.0)-3.0)-1.0,
                     0.0,
                     1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void main()
{
  vec2 pos = gl_FragCoord.xy / dimensions;

  float hue = 1 - userHueSelection; //processing has inverted y direction to opengl
  float sat = pos.x;
  float bright = pos.y;

  vec3 rgb = hsb2rgb(vec3(hue, sat, bright));
  gl_FragColor = vec4(rgb, 1.0);
}

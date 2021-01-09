#ifdef GL_ES
precision highp float;
precision highp int;
#endif

uniform float myFloat;

void main()
{
  gl_FragColor = vec4(myFloat, 0.0, 0.0, 1.0);
}

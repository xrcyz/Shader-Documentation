# [Example 1](Examples/1_ColouredCube/Coloured-Cube.pde)

Processing has a PShader object. This class encapsulates a GLSL shader program, including a vertex and a fragment shader. 

| Code        | Description |
|-------------|-------------|
| `myShader = loadShader("frag.glsl");`   | Loads the shader file from the sketch's data folder.  |
| `myShader.set("myFloat", 0.5);`         | Sends some data to the shader.                        |
| `shader(myShader);`                     | Applies the shader.                                   |
| `resetShader(TRIANGLES);`               | Resets the shader                                     |

This sketch uses a single fragment shader. A fragment shader returns a color and a depth value for each intersected object at each pixel. 
```
#ifdef GL_ES
precision highp float;
precision highp int;
#endif

uniform float myFloat;

void main()
{
  gl_FragColor = vec4(myFloat, 0.0, 0.0, 1.0);
}
```

| Code        | Description |
|-------------|-------------|
| `#ifdef GL_ES`            | Preprocessor macro. |
| `precision highp float;`  | Default floating point precision |
| `uniform`                 | Read only variables that are written from outside the shader.  |
| `main()`                  | Entry point into the shader. |
| `gl_FragColor`            | Reserved global variable for output color*.  |

Ok so apparently `gl_FragColor` is [deprecated](https://stackoverflow.com/questions/51459596/using-gl-fragcolor-vs-out-vec4-color), which would explain why I can't find it in the [docs](https://www.khronos.org/registry/OpenGL-Refpages/gl4/). Instead we define our own [outputs](https://www.khronos.org/opengl/wiki/Fragment_Shader#Outputs). 

```
out vec4 FragColor;

void main()
{
  FragColor = vec4(myFloat, 0.0, 0.0, 1.0);
}
```

To do:
- [in/out variables](https://learnopengl.com/Getting-started/Shaders)
- [Built-in variables](https://www.khronos.org/opengl/wiki/Built-in_Variable_(GLSL)).
- [Data Types](https://www.khronos.org/opengl/wiki/Data_Type_(GLSL))
- [Vertex Buffer Objects](https://stackoverflow.com/a/65372213)

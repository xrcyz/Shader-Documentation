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
| `uniform`                 | Read only variables that are uniform across all threads.  |
| `main()`                  | The function that does the work? |
| `gl_FragColor`            | Reserved global variable for output color*.  |

From [learnopengl.com](https://learnopengl.com/Getting-started/Hello-Triangle), 
> The fragment shader only requires one output variable and that is a vector of size 4 that defines the final color output.

OK so apparently `gl_FragColor` is [deprecated](https://stackoverflow.com/questions/51459596/using-gl-fragcolor-vs-out-vec4-color), which is why I can't find it in the [docs](https://www.khronos.org/registry/OpenGL-Refpages/gl4/). 

According to [learnopengl.com](https://learnopengl.com/Getting-started/Hello-Triangle) we should be doing this:
```
out vec4 FragColor;

void main()
{
  FragColor = vec4(myFloat, 0.0, 0.0, 1.0);
}
```

Where user-defined [outputs](https://www.khronos.org/opengl/wiki/Fragment_Shader#Outputs) can be floats, ints, vectors, and arrays. These represent a series of colors. I'm not clear on why we can output multiple colours, but I guess we'll find out as we go. 



These inputs are called uniform and come in most of the supported types: float, vec2, vec3, vec4, mat2, mat3, mat4, sampler2D and samplerCube. 
gl_Position, gl_FragCoord, gl_ModelViewProjectionMatrix 

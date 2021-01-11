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
| `main()`                  | Entry point into the shader, called once per pixel. |
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
- Attribute variables contain an attribute for a single vertex, they only appear in vertex shaders.

# Example 2

A vertex shader tells the rest of the pipeline where on screen each vertex of a mesh should be positioned. It can also output user-defined inputs to the fragment shader.

When rendering, OpenGL pulls vertex data from arrays stored in buffer objects. The line `layout(location = 0) in vec3 position` calls out to the Vertex Array Object (VAO), gets the Vertex Buffer Object (VBO) at index zero, casts the current vertex to a `vec3`, and gives it the name `position`. This index gets set [somewhere](https://github.com/processing/processing/tree/master/core/src/processing/opengl) CPU-side with `glVertexAttribPointer()`.

```
//use OpenGL version 4.1
#version 410

//read the vertex attribute index [0], cast it to a vec3, and call it 'position'
layout(location = 0) in vec3 position;

void main()
{
    gl_Position = vec4(position, 1.0);
}
```




Links: 
- [Practical Shader Development](https://www.amazon.com/Practical-Shader-Development-Fragment-Developers/dp/1484244567)
- [https://www.khronos.org/files/opengl42-quick-reference-card.pdf](https://www.khronos.org/files/opengl42-quick-reference-card.pdf)
- [https://nicolbolas.github.io/oldtut/Basics/Intro%20What%20is%20OpenGL.html](https://nicolbolas.github.io/oldtut/Basics/Intro%20What%20is%20OpenGL.html)

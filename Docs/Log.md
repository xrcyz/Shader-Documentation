# [Example 1](Examples/1_ColouredCube/Coloured-Cube.pde)

Processing has a PShader object. 
> This class encapsulates a GLSL shader program, including a vertex and a fragment shader. 
> Use the loadShader() function to load your shader code. 

| Command     | Effect      |
|-------------|-------------|
| `myShader = loadShader("frag.glsl");`   | Loads the shader file from the sketch's data folder.  |
| `myShader.set("myFloat", 0.5);`         | Sends some data to the shader.                        |
| `shader(myShader);`                     | Applies the shader.                                   |
| `resetShader(TRIANGLES);`               | Resets the shader                                     |



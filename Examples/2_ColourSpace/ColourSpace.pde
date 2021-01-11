PShader myShader; 

void settings()
{
  size(600, 600, P2D);
}

void setup()
{
  colorMode(HSB, 360, 1, 1, 1); 
  initShaders();
  noStroke();
  
}

void initShaders()
{
  myShader = loadShader("frag.glsl", "vert.glsl"); //initialise shaders
  myShader.set("dimensions", (float)width, (float)height); //must cast to float or fail
  shader(myShader);
}

void updateShaders()
{
  myShader.set("mousePos", (float)mouseX, (float)mouseY);  
}

void draw()
{
  background(0, 0, 0.8);  
  
  updateShaders();
  
  //shader(myShader);
  rect(0, 0, width, height);
  //resetShader(TRIANGLES);
}

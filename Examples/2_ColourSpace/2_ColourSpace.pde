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
  myShader = loadShader("frag.glsl"); //initialise shaders
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
  float border = 10;
  rect(border, border, width - 2*border, height - 2*border);
  //resetShader(TRIANGLES);
}

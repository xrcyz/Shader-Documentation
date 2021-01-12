PShader shadeSatBright; 
PShader shadeHue;

float userSelectedHue = 0;

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
  shadeSatBright = loadShader("frag.glsl"); //initialise shaders
  shadeSatBright.set("dimensions", (float)width, (float)height); //cast to float or fail
  
  shadeHue = loadShader("frag2.glsl"); 
  shadeHue.set("dimensions", (float)width, (float)height);
}

void updateShaders()
{
  shadeSatBright.set("userHueSelection", userSelectedHue / (float)height);
}

void draw()
{
  background(0, 0, 0.8);  
  
  updateShaders();
  
  shader(shadeSatBright);
  float border = 0;
  rect(border, border, width - 2*border, height - 2*border);
  
  shader(shadeHue);
  float rainbowWidth = 10;
  rect(width - rainbowWidth, border, rainbowWidth, height - 2 * border);
  
  resetShader(TRIANGLES);
   
  fill(0, 0, 0.2);
  ellipse(width - rainbowWidth/2, userSelectedHue, 20, 20);
  
  fill(get(mouseX, mouseY));
  rect(0, height - 10, width - rainbowWidth, 10); 
}

void mouseClicked()
{
  userSelectedHue = mouseY;
}

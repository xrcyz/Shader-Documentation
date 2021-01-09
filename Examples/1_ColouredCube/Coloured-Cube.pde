PShader myShader; 

//8 vertices of a cube (centered on 0, edge length 2)
float[][] cubeVerts = new float[][]
{
  { -1,  1,  1 }, //A-0
  {  1,  1,  1 }, //B-1
  {  1, -1,  1 }, //C-2
  { -1, -1,  1 }, //D-3
  { -1,  1, -1 }, //E-4
  {  1,  1, -1 }, //F-5
  {  1, -1, -1 }, //G-6
  { -1, -1, -1 }  //H-7
};

//6 faces of a cube, each face is 4 verts (indexed to cubeVerts)
int[][] quadVerts = new int[][]
{
  { 0, 1, 2, 3}, //ABCD
  { 1, 5, 6, 2}, //BFGC
  { 5, 4, 7, 6}, //FEHG
  { 4, 0, 3, 7}, //EADH
  { 4, 5, 1, 0}, //EFBA
  { 7, 6, 2, 3}  //HGCD
};

//rotations
float rx = PI/4;
float ry = PI/4;
float rz = PI/4;

void settings()
{
  size(400, 400, P3D);
}

void setup()
{
  colorMode(HSB, 360, 1, 1, 1); 
  initShaders();
  noStroke();
}

void initShaders()
{
  myShader = loadShader("frag.glsl"); //initialise shader object
  myShader.set("myFloat", 0.5);       //send some data to shader
}

void draw()
{
  background(0, 0, 0.8);  
  
  //directionalLight(126, 126, 126, 0, 0, -1);
  //ambientLight(102, 102, 102);
  
  pushMatrix();
  {
    translate(200,200);
    
    rx += 0.01;
    ry += 0.01;
    
    rotateX(rx); 
    rotateY(ry); 
    rotateZ(rz); 
    
    scale(90);
    
    shader(myShader); //apply shader to mesh
    beginShape(QUADS); //groups every 4 points into a quad
    for(int i = 0; i < quadVerts.length; i++) //for every quad
    {
      for(int j = 0; j < quadVerts[i].length; j++) //for every vertex in quad
      {
        int k = quadVerts[i][j];
        vertex(cubeVerts[k][0], cubeVerts[k][1], cubeVerts[k][2] ); //add vertex
      }
    }
    endShape();
    resetShader(TRIANGLES); //reset to default shader
  }
  popMatrix();
}

ArrayList<Tower> towers;
int round;
float angle;
float radius;
float size;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  
  angle = 0;
  radius = 512;
  size = 10;
  round = 1;
  
  towers = new ArrayList<Tower>();  
  towers.add(new Tower(new PVector(0, height, 0), 0, size));
}

void draw()
{
  background(255);
  translate(width / 2, height / 2, 0);
  
  angle = (angle + 0.5) % 360;
  float x = radius * cos(radians(angle));
  float z = radius * sin(radians(angle));
  radius += 1;

  camera(z, -500 - frameCount, x, 
         0.0, 0.0, 0.0, 
         0.0, 1.0, 0.0);
  
  if(frameCount % 10 == 0 && round < 52)
  {
    for(int i = -round; i <= round; i++)
    {
      towers.add(new Tower(new PVector(size * round, height, size * i), random(10), size));
      towers.add(new Tower(new PVector(-size * round, height, size * i), random(10), size));
    }
    
    for(int i = -round + 1; i <= round - 1; i++)
    {
      towers.add(new Tower(new PVector(size * i, height, size * round), random(10), size));
      towers.add(new Tower(new PVector(size * i, height, -size * round), random(10), size));
    }
    
    round += 1;
  }
  
  for(Tower t : towers)
  {
    t.update();
    t.display();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}
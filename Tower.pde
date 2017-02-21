class Tower
{
  PVector location;
  float h; // height
  float w; // width
  float d; // depth
  float speed;
  float angle;
  float direction;
  color bodyColor;
  
  Tower(PVector l, float _h, float size)
  {
    location = l.copy();
    h = _h;
    w = size;
    d = size;
    bodyColor = color(frameCount % 255, 255, 255);
    speed = random(2, 4);
   }
    
  void update()
  {
    if(h < 1024)
    {
      h += speed;
    }
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y - h / 2, location.z);
    fill(bodyColor);
    noStroke();
    box(w, h, d);
    popMatrix();
  }
}
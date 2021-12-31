float zoom = 3;

float xPos = -2;
float yPos = -1.5;
boolean update = true;
float maxIterations = 300;

int red = 1;
int green = 1;
int blue = 1;

void setup() {
  size(700, 700);
  background(255);
  //noLoop();
}

void draw() {
  loadPixels();
  if (update == true) {
    update = false;
    for (int x = 0; x < width; x++)  {
    float a = get_a( x );
  
    for (int y = 0; y < height; y++)  {
      float b = get_b( y );
      ComplexNumber c = new ComplexNumber(a, b);
    
  
      ComplexNumber z = c;   
      int n = 0;
  
      while (z.absoluteValue() < 2 && n < maxIterations) {
        z = (z.square());
        z = z.add(c);  
        n++;   
      }
      
      if(n == maxIterations) {
        pixels[y * width + x] = color(0);
       }
       else if (n < maxIterations) {
         float gs = (n/(float)maxIterations)*255;
         pixels[y * width + x] = color(red*gs, green*gs, blue*gs);
       }
       
      }
      updatePixels();
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      yPos -= zoom/20; //move up
    }
    else if (keyCode == DOWN) {
      yPos += zoom/20; // move down
    }
    else if (keyCode == LEFT) {
      xPos -= zoom/20; // move left
    }
    else if (keyCode == RIGHT) {
      xPos += zoom/20; // move right
    }
  }
  if (key == '-') {
    zoom = zoom*2; // zoom in
  }
  if (key == '=') {
    zoom = zoom/2; // zoom out
  }
  if (key == 'i') {
    maxIterations += 200; // increase clarity (decreases performance)
  }
  if (key == 'l') {
    maxIterations -= 200; // decrease clarity (increases performance)
  }
  if (key == 'r') {
    red += 1; // increases red value
  }
  if (key == 'g') {
    green += 1; // increases green value
  }
  if (key == 'b') {
    blue += 1; // increases blue value
  }
  if (key == 'w') { // resets colour to white
    red = 1;
    green = 1;
    blue = 1;
  }
  update = true;
}

float get_a( float x ) { 
  return((zoom/width)*x+xPos);
}

float get_b( float y ) { 
  return((zoom/height)*y+yPos);
}

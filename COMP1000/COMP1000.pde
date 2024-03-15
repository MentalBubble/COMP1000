int pacPosX;
int pacPosY;
int pacMouth;
int direction;
int speed;
//comment

void setup() {
  background(0);
  size(800, 300);
  pacPosX = width/2;
  pacPosY = height/2;
  pacMouth = 0;
  direction = 1;
  speed = 3;
}

void draw() {
  background(0);
  fill(0, 0, 255);
  rect(0, height/3, 800, 10);
  rect(0, 2 * height/3, 800, -10);
  fill(0, 255, 0);
  ellipse(pacPosX, pacPosY, 30, 30);
  fill(0);
  triangle(pacPosX + direction, pacPosY, pacPosX + 20 * direction, pacPosY + pacMouth, pacPosX + 20 * direction, pacPosY - pacMouth);
  pacPosX = pacPosX + direction * speed;
  pacMouth = pacMouth + 1;
  if (pacMouth == 20) {
    pacMouth = 0;
  }
  if (pacPosX >= width) {
    pacPosX = 0;
  } else if (pacPosX <= 0) {
    pacPosX = width;
  }
}

void keyPressed() {
  fill(255, 0, 0); 
  if (keyCode == ' ') {
    direction = direction * -1;
  }
}

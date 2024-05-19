// Variables
int pacPosX;
int pacPosY;
int pacMouth;
int direction;
int speed;
int pacSize;
int pellet[];
int score;
int ghostPosX;
int ghostDirection;
int directionChance;
boolean gameover;

// Setup
void setup() {
  background(0);
  size(800, 200);
  startGame();
}

//Draw
void draw() {
  background(0);
  pacPosX = pacPosX + direction * speed;
  pacMaker();
  pelletMaker();
  ghostMaker();
  gameover();
}

void keyPressed() {
  fill(255, 0, 0);
  if (keyCode == ' ') {
    direction = direction * -1;
  }
  if (key == 'r') {
    startGame();
    gameover = false;
  }
}














void startGame() {
  pacMouth = 0;
  direction = 1;
  speed = 2;
  pacSize = 20;
  pellet = new int [20];
  score = 0;
  ghostPosX = 50;
  ghostDirection = 1;
  directionChance = 1;
  gameover = false;
  pacPosX = width/2;
  pacPosY = height/2;
  for (int i = 0; i < 20; i++) {
    pellet[i] = i;
  }
}



// Makes Pacman
void pacMaker() {
  fill(0, 0, 255);
  rect(0, height/3, 800, 10);
  rect(0, 2 * height/3, 800, -10);
  fill(0, 255, 0);
  circle(pacPosX, pacPosY, 20);
  pacMouthMaker();
}

// Makes Pacman's Mouth
void pacMouthMaker() {
  fill(0);
  triangle(pacPosX, pacPosY, pacPosX + 10 * direction, pacPosY + pacMouth, pacPosX + 10 * direction, pacPosY - pacMouth);
  pacMouth++;
  if (pacMouth == 12) {
    pacMouth = 0;
  }
  if (pacPosX >= width) {
    pacPosX = 0;
  } else if (pacPosX <= 0) {
    pacPosX = width;
  }
}

// Makes Pellets
void pelletMaker() {
  fill(255);
  textSize(16);
  text("Score: " + score, 10, 20);
  fill(255);
  strokeWeight(0);
  for (int i = 0; i < 20; i++) {
    circle(pellet[i] * 40 + 20, pacPosY, 6);
    if (pacPosX == pellet[i] * 40 + 20) {
      pellet[i] = -3;
      score++;
    }
  }
}

//Makes Ghost
void ghostMaker() {
  noStroke();
  fill(200, 50, 50);
  square(ghostPosX - pacSize/2, pacPosY - pacSize/2, pacSize);
  //circle(ghostPosX, pacPosY - pacSize/2, pacSize);
  //fill(255);
  //ellipse(ghostPosX - pacSize/2 + 5 + ghostDirection, pacPosY - pacSize/2 + 3, 4, 8);
  //ellipse(ghostPosX - pacSize/2 + 15 + ghostDirection, pacPosY - pacSize/2 + 3, 4, 8);
  //fill(0);
  //ellipse(ghostPosX - pacSize/2 + 5 + ghostDirection * 2, pacPosY - pacSize/2 + 3, 2, 3);
  //ellipse(ghostPosX - pacSize/2 + 15 + ghostDirection * 2, pacPosY - pacSize/2 + 3, 2, 3);
  ghostPosX = ghostPosX + ghostDirection * 2;
  directionChance = (int(random(100)));
  if (directionChance == 1) {
    ghostDirection *= -1;
  }
  if (ghostPosX >= width) {
    ghostPosX = 0;
  } else if (ghostPosX <= 0) {
    ghostPosX = width;
  }
}

void gameover() {
  if (dist(ghostPosX, 0, pacPosX, 0) <= 2) {
    gameover = true;
  }
  if (gameover == true) {
    background(200, 50, 50);
    fill(255);
    textSize(16);
    String c = "U stinky";
    String d = "Press R to restart";
    text(c, width/2 - c.length() * 3, height/2);
    text(d, width/2 - d.length() * 3, height/2 + 20);
    //circle(width/2, height/2, 10);
  }
}

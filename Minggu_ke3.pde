void setup() {
  size(400, 600);
}

void draw() {
  background(255);
  float secondAngle = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float minuteAngle = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float hourAngle = map(hour() + norm(minute(), 0, 60), 0, 12, 0, TWO_PI) - HALF_PI;
  
  drawName();
  drawNumber();
  drawClockFrame();
  drawClockFace();
  drawClockNumbers();
  drawClockHand(secondAngle, 140, 2);
  drawClockHand(minuteAngle, 120, 4);
  drawClockHand(hourAngle, 100, 8);
  drawSecondDots();
  drawDigitalClock();
}

void drawName() {
  String name = "Muhammad Rezzha Riamrizal Arsya";
  fill(0);
  textSize(24);
  textAlign(CENTER, BOTTOM);
  text(name, width/2, height/2 - 185);
}

void drawNumber() {
  String number = "22.21.1545";
  fill(0);
  textSize(24);
  textAlign(CENTER, TOP);
  text(number, width/2, height/2 - 180);
}


void drawClockHand(float angle, float handLength, float handWidth) {
  float x = width/2 + cos(angle) * handLength;
  float y = height/2 + sin(angle) * handLength;
  strokeWeight(handWidth);
  line(width/2, height/2, x, y);
}

void drawClockFace() {
  noFill();
  stroke(0);
  ellipse(width/2, height/2, 300, 300);
}

void drawClockNumbers() {
  fill(0);
  textSize(24);
  textAlign(CENTER, CENTER);
  for (int i = 1; i <= 12; i++) {
    float angle = map(i, 0, 12, 0, TWO_PI) - HALF_PI;
    float x = width/2 + cos(angle) * 130; 
    float y = height/2 + sin(angle) * 130; 
    text(i, x, y);
  }
}

void drawSecondDots() {
  fill(0, 0, 0); 
  noStroke(); 
  for (int i = 0; i < 60; i++) {
    float angle = map(i, 0, 60, 0, TWO_PI) - HALF_PI;
    float x = width/2 + cos(angle) * 140; 
    float y = height/2 + sin(angle) * 140; 
    ellipse(x, y, 4, 4); 
  }
}

void drawClockFrame() {
  noFill();
  stroke(0);
  strokeWeight(8);
  ellipse(width/2, height/2, 300, 300);
}

void drawDigitalClock() {
  String timeString = nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2);
  fill(0);
  textSize(32);
  textAlign(CENTER, TOP);
  text(timeString, width/2, height/2 + 200); 
}

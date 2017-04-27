int hour = hour();
int minute = minute();
int sec = second();
long timer;
int interval = 1000;
float angle;
PFont font;
String seca = nf(sec,2);
String minutea = nf(minute,2);
String houra = nf(hour,2);

void setup() {
  size(500,500);

  timer = millis();
}

void draw() {
  background(hour+150,minute+150,sec+150);
  font = loadFont("AdobeFanHeitiStd-Bold-40.vlw");
  textFont(font,40);
  textSize(40);
  ellipseMode(CENTER);
  noStroke();
  ellipse(250,250,275,275);
  // hour
  fill(0);
  text(houra,101,451);
  text(":",181,451);
  fill(255);
  text(houra,100,450);
  text(":",180,450);
  // minute
  fill(0);
  text(minutea,226,451);
  text(":",306,451);
  fill(255);
  text(minutea,225,450);
  text(":",305,450);
  // second
  fill(0);
  text(seca,351,451);
  fill(255);
  text(seca,350,450);
  if ((millis() - timer) > interval) {
    timer = millis();
    sec = sec + 1;
    seca = nf(sec,2);
  }
  if (sec > 59) {
    sec = 0;
    seca = nf(0,2);
    minute = minute + 1;
    minutea = nf(minute,2);
  }
  if (minute > 59) {
    minute = 0;
    hour = hour + 1;
    houra = nf(hour,2);
  }
  if (hour > 12) {
  hour = 0;
  }

  
  pushMatrix();
  angle = -(TWO_PI*(60 -minute)/60);
  translate(250,250);
  rotate(angle);
  rectMode(CENTER);
  stroke(0);
  //noStroke();
  //rect(0,0,5,150);
  line(0,0,0,-125);
  popMatrix();
  
  pushMatrix();
  angle = -(TWO_PI*((24 -hour)/2)/12);
  translate(250,250);
  rotate(angle);
  rectMode(CENTER);
  //noStroke();
  line(0,0,0,-90);
  popMatrix();
  
  pushMatrix();
  angle = -(TWO_PI*(60 -sec)/60);
  translate(250,250);
  rotate(angle);
  //rectMode(CENTER);
  //noStroke();
  //rect(0,0,5,200);
  stroke(255,0,0);
  strokeWeight(5);
  line(0,0,0,-125);
  popMatrix();
}

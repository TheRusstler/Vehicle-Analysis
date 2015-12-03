import java.awt.geom.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.awt.geom.RectangularShape;
import processing.serial.*;

PApplet applet;
Scene scene;
Vehicle vehicle;

boolean isUITest = false;

PImage logo;
String port = "/dev/tty.usbserial-AI02KH63";

void setup() {
  size(1000, 600);
  //fullScreen();
  applet = this;

  loadResources();
  scene = new Menu();
}

void draw() {
  background(0);
  scene.paint();
}

void mouseReleased() {
  scene.onClick();
}

void loadResources() {
  imageMode(CENTER); 
  logo = loadImage("resources/logo/logo_large_transparent.png");
}

void drawRPM(int value) {
  background(0);
  fill(255, 0, 0);
  rectMode(CENTER);
  float h = value/4;
  rect(width/2, height-(h/2), 60, h);
}
import java.awt.geom.*;
import java.awt.*;
import java.util.*;
import java.awt.geom.RectangularShape;
import processing.serial.*;

PApplet applet;
Scene scene;
Vehicle vehicle;
Graph graph;

boolean isUITest = true;

PImage logo;
String port = "/dev/tty.usbserial-AI02KH63";

void setup() {
  //size(1000, 600);
  fullScreen();
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
  logo = loadImage("resources/logo/logo_large_transparent.png");
}
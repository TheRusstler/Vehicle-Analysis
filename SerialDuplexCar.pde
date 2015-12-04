import java.awt.geom.*;
import java.awt.*;
import java.util.*;
import java.awt.geom.RectangularShape;
import processing.serial.*;

PApplet applet;
Scene scene;
Vehicle vehicle;
Graph graph;

final int RPM = 0, SPEED = 1, OIL = 2;

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

void loadGraph(int type) {
  // Clean up old thread.
  if (graph != null) {
    graph.dataSource.interrupt();
  }

  switch(type) {
    case(RPM):
    graph = new Graph(RPM, "RPM", 1000, 5);
    break;
    case(SPEED):
    graph = new Graph(SPEED, "SPEED", 5000, 5);
    break;
    case(OIL):
    graph = new Graph(OIL, "OIL TEMP", 50, 10);
    break;
  }
}
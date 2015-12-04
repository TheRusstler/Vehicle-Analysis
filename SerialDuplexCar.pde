import java.awt.geom.*;
import java.awt.*;
import java.util.*;
import java.awt.geom.RectangularShape;
import processing.serial.*;

PApplet applet;
Scene scene;
Vehicle vehicle;
Graph graph;

final int RPM = 0, SPEED = 1, COOLANT = 2;

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
  logo = loadImage("resources/logo/logo_large_transparent.png");
}

void loadGraph(int type) {
  
  // Terminate old thread.
  if (graph != null) {
    graph.dataSource.terminate();

    try {
      graph.dataSource.join();
    }
    catch(Exception e) {
    }
  }
  
  // Create new graph
  switch(type) {
    case(RPM):
    graph = new Graph(RPM, "RPM", 3000, 10);
    break;
    case(SPEED):
    graph = new Graph(SPEED, "SPEED (Km/h)", 100, 10);
    break;
    case(COOLANT):
    graph = new Graph(COOLANT, "COOLANT (°C)", 250, 10);
    break;
  }
}
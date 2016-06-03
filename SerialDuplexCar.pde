import java.awt.geom.*;
import java.awt.*;
import java.util.*;
import java.awt.geom.RectangularShape;
import processing.serial.*;

PApplet applet;
Scene scene;
Vehicle vehicle;
Graph graph;

final int RPM = 0, SPEED = 1, COOLANT = 2, INTAKE_AIR = 3, THROTTLE = 4, ENGINE_LOAD = 5;

boolean isUITest = true;

PImage logo;
String port = "/dev/tty.usbserial-AI02KH63";

void setup() {
  //size(1400, 800);
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

void disposeGraph() {
  // Terminate old thread.
  if (graph != null) {
    graph.dataSource.terminate();

    try {
      graph.dataSource.join();
    }
    catch(Exception e) {
    }
  }
}

void loadGraph(int type) {
  disposeGraph();
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
    case(INTAKE_AIR):
    graph = new Graph(INTAKE_AIR, "INTAKE AIR (°C)", 100, 10);
    break;
    case(THROTTLE):
    graph = new Graph(THROTTLE, "THROTTLE %", 100, 10);
    break;
    case(ENGINE_LOAD):
    graph = new Graph(ENGINE_LOAD, "ENGINE LOAD %", 100, 10);
    break;
  }
}
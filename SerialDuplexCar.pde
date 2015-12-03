import java.awt.geom.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.awt.geom.RectangularShape;
import processing.serial.*;

Scene scene;

Serial car;      // The serial port
int inByte = -1;    // Incoming serial data

void setup() {
  size(800, 600);

  printArray(Serial.list());

  String portName = "/dev/tty.usbserial-AI02KH63";
  car = new Serial(this, portName, 9600);

  car.clear();

  delay(2000);
  car.write("ATZ\r\n");
  delay(5000);

  car.clear();
}

void draw() {
  car.clear();
  delay(500);
  car.write("010c\r\n");
  delay(500);

  String s = "";
  while (car.available() > 0) {
    char in = car.readChar();

    if (in != '>') {
      s += in;
    } else {
      println(s);

      // If car not ready.
      if (s.contains("SEARCHING") || s.contains("STOPPED")) {
        car.clear();
        println("Car not ready");
        delay(1000);
        break;
      }

      // otherwise get result;
      if (s.length() > 5) {
        String data = s.substring(s.length() - 8);
        String clean = data.replaceAll("\\s+", "");
        int value = Integer.parseInt(clean, 16)/4;
        println("RPM: " + value);
        drawRPM(value);
      }

      // Reset s.
      s = "";
    }
  }
}

void drawRPM(int value) {
  background(0);
  fill(255, 0, 0);
  rectMode(CENTER);
  float h = value/4;
  rect(width/2, height-(h/2), 60, h);
}

//String hex = "ff"
//int value = Integer.parseInt(hex, 16); 

void keyPressed() {
  // Send the keystroke out:
  //myPort.write(key);
  //whichKey = key;
}
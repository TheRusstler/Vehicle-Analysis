class Vehicle {

  Serial channel;

  public Vehicle(String portName) {
    channel = new Serial(applet, portName, 9600);
  }

  String[] getSerialDevices() {
    return Serial.list();
  }

  // Reset takes 3 seconds.
  void reset() {
    channel.clear();

    delay(1000);
    channel.write("ATZ\r\n");
    delay(2000);

    channel.clear();
  }

  int getRPM() {
    int rpm = 0;

    channel.clear();
    channel.write("010C\r\n");
    delay(500);

    String raw, line = "";

    while (channel.available() > 0) {
      char in = channel.readChar();

      // Read characters into result.
      if (in != '>') {
        line += in;
      } 

      // We have the full string.
      else {
        println(line);

        // If car not ready.
        if (line.contains("SEARCHING") || line.contains("STOPPED")) {
          println("Car not ready. Engine off or reading too fast?");
          channel.clear();
          break;
        }

        // RPM is in the last 8 characters (currently in hex).
        raw = line.substring(line.length() - 8);

        // Clean out whitespace.
        raw = raw.replaceAll("\\s+", "");

        // Convert hex to int.
        rpm = Integer.parseInt(raw, 16)/4;

        println("RPM: " + rpm);
        break;
      }
    }
    
    return rpm;
  }
}
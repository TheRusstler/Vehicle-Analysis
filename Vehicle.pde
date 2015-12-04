class Vehicle {

  Serial channel;

  public Vehicle(String portName) {
    channel = new Serial(applet, portName, 9600);
  }

  String[] getSerialDevices() {
    return Serial.list();
  }

  void reset() {
    channel.clear();

    delay(200);
    channel.write("ATZ\r\n");
    delay(1000);
    
    // Wait for idle prompt to appear.
    readLine();

    channel.clear();
  }

  int getRPM() {
    channel.clear();
 
    String raw, line;
    int rpm = 0;

    channel.write("010C\r\n");
    line = readLine();
    
    println(line);

    // If car not ready.
    if (line.contains("SEARCHING") || line.contains("STOPPED")) {
      println("Error: " + line);
      // Maybe reset here?
      return 0;
    }

    // RPM is in the last 8 characters (currently in hex).
    raw = line.substring(line.length() - 8);

    // Clean out whitespace.
    raw = raw.replaceAll("\\s+", "");

    // Convert hex to int.
    rpm = Integer.parseInt(raw, 16)/4;

    println("RPM: " + rpm);

    return rpm;
  }

  String readLine() {
    String line = "";

    while (channel.available() > 0) {
      char in = channel.readChar();

      // Read characters unitl new prompt
      if (in != '>') {
        line += in;
      } else {
        break;
      }
    }

    return line;
  }

  void dispose() {
    try {
      channel.stop();
    }
    catch(Exception e) {
      println("Error stopping serial connection with vehicle:");
      println(e);
    }
  }
}
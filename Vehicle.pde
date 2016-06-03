class Vehicle { //<>//

  Serial channel;

  public Vehicle(String portName) {
    channel = new Serial(applet, portName, 9600);
  }

  String[] getSerialDevices() {
    return Serial.list();
  }

  void reset() {
    channel.clear();

    delay(2000);
    channel.write("ATZ\r\n");

    // Wait for the board to reset before sending commands.
    delay(2000);

    channel.clear();
  }

  int getRPM() {
    // Result is in quarters of rpm.
    return getValue("010C\r\n", 4)/4; // rpm
  }

  int getCoolant() {
    // Result is temp + 40.
    return getValue("0105\r\n", 2) - 40; // °C
  }

  int getSpeed() {
    return getValue("010D\r\n", 2); // km/h
  }

  int getIntakeAirTemp() {
    // Result is temp + 40.
    return getValue("010F\r\n", 2) - 40; // °C
  }

  int getThrottlePosition() {
    return getValue("0111\r\n", 2) *100/255; // %
  }

  int getEngineLoad() {
    return getValue("0104\r\n", 2) *100/255; // %
  }

  int getValue(String command, int numberOfChars) {
    channel.clear();

    String raw, line;
    int result = 0;

    try {
      channel.write(command);
      line = readLine();

      // If an error response.
      if (line.isEmpty() || 
        line.contains("SEARCHING") || 
        line.contains("STOPPED") || 
        line.contains("NO DATA")) {
        throw new Exception("Line: " + line);
      }

      // Clean out whitespace.
      line = line.replaceAll("\\s+", "");

      println("In: " + line);

      raw = line.substring(line.length() - numberOfChars);

      println("substring: " + raw);



      // Convert hex to int.
      result = Integer.parseInt(raw, 16);

      println("Result: " + result);
    }
    catch(Exception e) {
      println("Error: " + e);
      exit();
    }

    return result;
  }

  String readLine() {
    String line = "";

    delay(350);
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
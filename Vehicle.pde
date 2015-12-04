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

    delay(2000);
    channel.write("ATZ\r\n");

    // Wait for the board to reset before sending commands.
    delay(2000);

    channel.clear();
  }

  int getRPM() {
    // Result is in quarters of rpm.
    return getValue("010C\r\n", 8)/4;
  }

  int getCoolant() {
    // Result is temp + 40.
    return getValue("0105\r\n", 6) - 40;
  }

  int getValue(String command, int numberOfChars) {
    channel.clear();

    String raw, line;
    int result = 0;

    try {
      channel.write(command);
      line = readLine();
      println("In: " + line);

      // If an error response.
      if (line.isEmpty() || 
        line.contains("SEARCHING") || 
        line.contains("STOPPED") || 
        line.contains("NO DATA")) {
        throw new Exception("Line: " + line);
      }

      raw = line.substring(line.length() - numberOfChars);

      // Clean out whitespace.
      raw = raw.replaceAll("\\s+", "");

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

    delay(300);
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
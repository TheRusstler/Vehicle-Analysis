class VehicleDataSource extends Thread {

  java.util.List data;
  int type;

  public VehicleDataSource(java.util.List data, int type) {
    this.data = data;
    this.type = type;
  }

  public void run() {
    while (true) {
      // If thread is interrupted, clean up!
      if (Thread.currentThread().isInterrupted()) {
        break;
      }

      updateData();
      delay(100);
    }
  }

  void updateData() {
    if (!isUITest) {

      int result = 0;
      switch(type) {
        case(RPM):
        result = vehicle.getRPM();
        break;
        case(SPEED):
        result = vehicle.getRPM(); // TODO: Change to the appropriate requests
        break;
        case(OIL):
        result = vehicle.getRPM();
        break;
      }

      data.add(result);
      data.remove(0);
    } else {
      data.add((int)random(0, graph.maxValue));
      data.remove(0);
    }
  }
}
class VehicleDataSource extends Thread {

  java.util.List data;
  int type;

  public VehicleDataSource(java.util.List data, int type) {
    this.data = data;
    this.type = type;
  }

  private volatile boolean running = true;

  public void run() {
    while (running) {
      updateData();
    }
  }
 
  public void terminate() {
    running = false;
  }

  void updateData() {
    if (!isUITest) {

      int result = 0;
      switch(type) {
        case(RPM):
        result = vehicle.getRPM();
        break;
        case(SPEED):
        result = vehicle.getSpeed();
        break;
        case(COOLANT):
        result = vehicle.getCoolant();
        break;
      }

      data.add(result);
      data.remove(0);
    } else {
      delay(100);
      data.add((int)random(0, graph.maxValue));
      data.remove(0);
    }
  }
}
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
        case(INTAKE_AIR):
        result = vehicle.getIntakeAirTemp();
        break;
        case(THROTTLE):
        result = vehicle.getThrottlePosition();
        break;
        case(FUEL):
        result = vehicle.getFuelLevel();
        break;
        case(AMBIENT_AIR):
        result = vehicle.getAmbientAirTemp();
        break;
        case(ENGINE_LOAD):
        result = vehicle.getEngineLoad();
        break;
        case(OIL_TEMP):
        result = vehicle.getEngineOilTemp();
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
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
      data.add(vehicle.getRPM());
      data.remove(0);
    } else {
      data.add((int)random(0, graph.maxValue));
      data.remove(0);
    }
  }
}
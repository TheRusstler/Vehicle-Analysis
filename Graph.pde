class Graph extends Scene { //<>// //<>//
  final float max = 4000;
  final int DATA_POINTS = 20;

  int value = 0;
  int x = 0;
  int y = 45;
  int graph_width = width;
  int graph_height = height - y; // 100px top, 100px bottom margin.

  // Bottom of the graph
  float y_base = y + graph_height;
  
  // Vertical scaling according to max value
  float y_scale_factor = graph_height/max;

  // DATA
  //Integer[] data = new Integer[] { 1349, 1330, 1304, 1306, 1300, 1289, 1294, 1290, 1288, 1289, 1284, 1269, 1254, 1259, 1556, 1752, 2344, 2554, 2655, 2675, 2452, 2223, 2009, 1648, 1401, 1273, 1229, 1213, 1204 };

  ArrayList<Integer> dataPoints = new ArrayList<Integer>();

  public Graph() {
    Integer[] startData = new Integer[DATA_POINTS];
    Arrays.fill(startData, 0);
    Collections.addAll(dataPoints, startData);
  }

  void paint() {

    noStroke();
    fill(40);
    rectMode(CORNER);
    rect(x, y, graph_width, graph_height);

    updateData();
    lineGraph(dataPoints);
    drawLabels();
  }

  void updateData() {
    if (!isUITest) {
      dataPoints.add(vehicle.getRPM());
      dataPoints.remove(0);
    } else if (frameCount % 30 == 0) {
      dataPoints.add((int)random(0, max));
      dataPoints.remove(0);
    }
  }

  void drawLabels() {
    textSize(12);
    
    // BOTTOM
    textAlign(LEFT, BOTTOM);
    fill(255);
    text("0", 2, height);

    // TOP
    textAlign(LEFT, TOP);
    text((int)max, 2, y);

    textAlign(LEFT, CENTER);
    // INTERMEDIATE
    for (int i=1000; i<max; i+=1000) {
      text(i, 2, y_base - i * y_scale_factor);
    }
  }

  void lineGraph(ArrayList<Integer> values ) {

    strokeWeight(3);
    stroke(43, 130, 58);

    float x1, y1, x2, y2;

    for (int i=0; i<values.size()-1; i++) {

      x1 = x + i*(graph_width/(values.size()-1));
      y1 = y_base - (values.get(i) * y_scale_factor);

      x2 = x + (i+1)*(graph_width/(values.size()-1));
      y2 = y_base - (values.get(i+1) * y_scale_factor);

      line(x1, y1, x2, y2);

      println("\n\nx1: " + x1 + "\ny1: " + y1, "\nx2: " + x2 + "\ny2: " + y2);
    }
  }


  void onClick() {
  }
}
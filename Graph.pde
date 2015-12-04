class Graph extends Scene { //<>// //<>//
  float max = 5000;

  int value = 0;
  int x = 0;
  int y = 45;
  int graph_width = width;
  int graph_height = height - y; // 100px top, 100px bottom margin.

  // Bottom of the graph
  float y_base = y + graph_height;

  // DATA
  Integer[] data = new Integer[] { 1349, 1330, 1304, 1306, 1300, 1289, 1294, 1290, 1288, 1289, 1284, 1269, 1254, 1259, 1556, 1752, 2344, 2554, 2655, 2675, 2452, 2223, 2009, 1648, 1401, 1273, 1229, 1213, 1204 };
  ArrayList<Integer> dataPoints = new ArrayList<Integer>();

  public Graph() {
    Collections.addAll(dataPoints, data);
  }

  void paint() {
    noStroke();
    fill(40);
    rectMode(CORNER);
    rect(x, y, graph_width, graph_height);

    lineGraph(dataPoints);
  }

  void lineGraph(ArrayList<Integer> values ) {

    strokeWeight(3);
    stroke(43, 130, 58);

    float x1, y1, x2, y2;

    for (int i=0; i<values.size()-1; i++) {

      float y_scale_factor = graph_height/max;

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
class Graph extends Scene { //<>//

  final int DATA_POINTS = 20;
  final int BACKGROUND_COLOR = 25;
  final int HORIZONTAL_LINE_COLOR = 35;

  int x = 0;
  int y = 45;
  int graph_width = width;
  int graph_height = height - y;
  float y_base = y + graph_height;       // Bottom of the graph

  // Data
  java.util.List dataPoints = Collections.synchronizedList(new ArrayList<Integer>());
  VehicleDataSource dataSource;

  int type;
  String title;
  float maxValue;
  int numberOfLabels;
  int labelSpacing;
  float y_scale_factor;

  public Graph(int type, String title, float maxValue, int numberOfLabels) {
    this.type = type;
    this.title = title;
    this.maxValue = maxValue;
    this.numberOfLabels = numberOfLabels;
    this.labelSpacing = (int)maxValue / numberOfLabels;
    this.y_scale_factor = graph_height/maxValue;
    
    // Start reading data from the data source.
    dataSource = new VehicleDataSource(dataPoints, type);
    dataSource.start();
    
    initialiseData();
  }

  // Fills the data with zeros
  void initialiseData() {
    Integer[] startData = new Integer[DATA_POINTS];
    Arrays.fill(startData, 0);
    Collections.addAll(dataPoints, startData);
  }

  void paint() {
    noStroke();
    fill(BACKGROUND_COLOR);
    rectMode(CORNER);
    rect(x, y, graph_width, graph_height);
    
    // Graph title
    fill(HORIZONTAL_LINE_COLOR);
    textSize(150);
    textAlign(CENTER, CENTER);
    text(title, width/2, height/2);

    drawLabels();
    lineGraph(dataPoints);
  }

  void drawLabels() {
    textSize(12);

    // BOTTOM
    textAlign(LEFT, BOTTOM);
    fill(150);
    text("0", 2, height);

    // TOP
    textAlign(LEFT, TOP);
    text((int)maxValue, 2, y);

    // INTERMEDIATE
    textAlign(LEFT, CENTER);
    for (int i=labelSpacing; i<maxValue; i+=labelSpacing) {
      float y_pos = y_base - i * y_scale_factor;

      // Lines
      stroke(HORIZONTAL_LINE_COLOR);
      strokeWeight(1);
      line(0, y_pos, width, y_pos);

      // Label
      text(i, 2, y_pos);
    }
  }

  void lineGraph(java.util.List values ) {

    strokeWeight(3);
    stroke(43, 130, 58);

    float x1, y1, x2, y2;

    for (int i=0; i<values.size()-1; i++) {

      x1 = x + i*(graph_width/(values.size()-1));
      y1 = y_base - ((int)values.get(i) * y_scale_factor);

      x2 = x + (i+1)*(graph_width/(values.size()-1));
      y2 = y_base - ((int)values.get(i+1) * y_scale_factor);

      line(x1, y1, x2, y2);
    }
  }


  void onClick() {
  }
}
class Graph extends Scene {
  
  int value = 0;
  int x = 400;
  int graph_width = width - x - 100; // 100px right margin
  int graph_height = height - 200; // 100px top, 100px bottom margin.
  int y = height/2 - graph_height/2;
  
  int graph_center_x = x + graph_width/2;
  int graph_center_y = y + graph_height/2;
  
  void paint() {
    fill(255);
    rectMode(CORNER);
    rect(x, y, graph_width, graph_height);
    
    textAlign(CENTER);
    fill(0);
    text("RPM: " + value, graph_center_x, graph_center_y);
  }
  
  void onClick() {}
}
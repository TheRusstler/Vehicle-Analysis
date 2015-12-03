class Graph extends Scene {
  
  int value = 0;
  int x = 400;
  int graph_width = width - x - 100; // 100px right margin
  int graph_height = height - 200; // 100px top, 100px bottom margin.
  int y = height/2 - graph_height/2;
  
  //int[] data = new int[] { 1349,1330,1304,1306,1300,1289,1294,1290,1288,1289,1284,1269,1254,1259,1556,1752,2344,2554,2655,2675,2452,2223,2009,1648,1401,1273,1229,1213,1204 };
  int[] data = new int[] { 100, 150, 125, 125 };
  
  void paint() {
    fill(255);
    rectMode(CORNER);
    rect(x, y, graph_width, graph_height);
    
    lineGraph(data);
  }
  
  void lineGraph(int[] values ) {
    
    strokeWeight(3);
    stroke(0); //<>//
    
    int x1, y1, x2, y2;
    
    for(int i=0; i<values.length-1; i++) {
      
      x1 = x + i*(graph_width/(values.length-1)); //<>//
      y1 = y + graph_height - values[i];
      
      x2 = x + (i+1)*(graph_width/(values.length-1));
      y2 = y + graph_height - values[i+1];
      
      println("\n\nx1: " + x1 + "\ny1: " + y1,  "\nx2: " + x2 + "\ny2: " + y2);
      line(x1, y1, x2, y2);
    } 
  }
  
  
  void onClick() {}
}
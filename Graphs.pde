class Graphs extends Scene {
  
  int[] data = new int[] { 1349,1330,1304,1306,1300,1289,1294,1290,1288,1289,1284,1269,1254,1259,1556,1752,2344,2554,2655,2675,2452,2223,2009,1648,1401,1273,1229,1213,1204 };

  StatusBar statusBar = new StatusBar();
  Graph graph;
  ArrayList<Button> buttons = new ArrayList<Button>();

  public Graphs() {
    graph = new Graph();
    
    int buttonWidth = 200, buttonHeight = 60;
    buttons.add(new Button("RESET", 
      new Rectangle(100, height/2 -buttonHeight/2 -50, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        vehicle.reset();
      }
    }
    ));

    buttons.add(new Button("UPDATE", 
      new Rectangle(100, height/2 -buttonHeight/2 +50, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        graph.value = vehicle.getRPM();
      }
    }
    ));
  }

  void paint() {
    statusBar.paint();
    graph.paint();

    for (Button b : buttons) {
      b.paint();
    }
  }

  void onClick() {
    statusBar.onClick();
    for (Button b : buttons) {
      b.onClick();
    }
  }
}
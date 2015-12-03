class Graphs extends Scene {

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
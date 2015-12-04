class Graphs extends Scene {

  StatusBar statusBar = new StatusBar();
  ArrayList<Button> buttons = new ArrayList<Button>();

  public Graphs() {
    loadGraph(COOLANT);
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
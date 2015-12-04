class StatusBar extends Scene {

  final int HEIGHT = 45;
  final int buttonWidth = 100, buttonHeight = 30;

  ArrayList<Button> buttons = new ArrayList<Button>();

  public StatusBar() {
    buttons.add(new Button("Menu", 
      new Rectangle(5, HEIGHT/2 - buttonHeight/2, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {

        // Detatch from vehicle
        if (!isUITest) {
          disposeGraph();
          vehicle.dispose();
        }

        scene = new Menu();
      }
    }
    , 14));

    addButton("SPEED", SPEED, 4*(-buttonWidth - 10));
    addButton("RPM", RPM, 3*(-buttonWidth - 10));
    addButton("COOLANT", COOLANT, 2*(-buttonWidth - 10));
    addButton("AIR INTAKE", INTAKE_AIR, 1*(-buttonWidth - 10));
    addButton("THROTTLE", THROTTLE, 0);
    addButton("FUEL", FUEL, 1*(buttonWidth + 10));
    addButton("AMBIENT AIR", AMBIENT_AIR, 2*(buttonWidth + 10));
    addButton("ENGINE_LOAD", ENGINE_LOAD, 3*(buttonWidth + 10));
    addButton("OIL TEMP", OIL_TEMP, 4*(buttonWidth + 10));
  }

  void addButton(String name, final int type, int x) {
    buttons.add(new Button(name, 
      new Rectangle(width/2 - buttonWidth/2 + x, HEIGHT/2 - buttonHeight/2, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        loadGraph(type);
      }
    }
    , 14));
  }

  void paint() {
    noStroke();
    fill(0);
    rect(0, 0, width, HEIGHT);

    for (Button b : buttons) {
      b.paint();
    }

    textAlign(CENTER, CENTER);
    textSize(16);
    fill(255);

    //textAlign(RIGHT, CENTER);
    //text(port, width-20, HEIGHT/2);
  }

  void onClick() {
    for (Button b : buttons) {
      b.onClick();
    }
  }
}
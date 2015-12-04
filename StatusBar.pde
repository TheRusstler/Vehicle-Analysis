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
          vehicle.dispose();
        }

        scene = new Menu();
      }
    }
    , 14));

    // Graph options.
    buttons.add(new Button("SPEED", 
      new Rectangle(width/2 - buttonWidth/2 - buttonWidth - 10, HEIGHT/2 - buttonHeight/2, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        graph = new Graph("SPEED", 5000, 5);
      }
    }
    , 14));

    buttons.add(new Button("RPM", 
      new Rectangle(width/2 - buttonWidth/2, HEIGHT/2 - buttonHeight/2, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        graph = new Graph("RPM", 1000, 5);
      }
    }
    , 14));

    buttons.add(new Button("OIL TEMP", 
      new Rectangle(width/2 - buttonWidth/2 + buttonWidth + 10, HEIGHT/2 - buttonHeight/2, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        graph = new Graph("OIL TEMP", 50, 10);
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

    textAlign(RIGHT, CENTER);
    text(port, width-20, HEIGHT/2);
  }

  void onClick() {
    for (Button b : buttons) {
      b.onClick();
    }
  }
}
class StatusBar extends Scene {

  final int HEIGHT = 45;
  Button menu;
  public StatusBar() {

    int buttonWidth = 100, buttonHeight = 30;
    menu = new Button("Menu", 
      new Rectangle(5, HEIGHT/2 - buttonHeight/2, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        scene = new Menu();
      }
    }, 14);
  }

  void paint() {
    noStroke();
    fill(0);
    rect(0, 0, width, HEIGHT);
    
    menu.paint();
    
    textAlign(CENTER, CENTER);
    textSize(16);
    fill(255);
    
    //text(String.format("%s POINTS", game.points), width/4, 10);
    //text(String.format("CAPTAIN %s", game.player), width/2, 10);
    //text(game.health + "% HEALTH", width * 3/4, 10);
    text(String.format("PORT %s", port), width/2, HEIGHT/2);
  }


  void onClick() {
    menu.onClick();
  }
}
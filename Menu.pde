public class Menu extends Scene {

  ArrayList<Button> buttons = new ArrayList<Button>();
  String warning = "";

  int buttonWidth = 300, buttonHeight = 60;

  public Menu() {
    buttons.add(new Button("CONNECT", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +50, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        try {
          if (!isUITest) {
            vehicle = new Vehicle(port);
          }

          scene = new Graphs();
        }
        catch (Exception e) {
          //println(e);
          warning = "Could not connect to port: " + port;
          println(warning);
        }
      }
    }
    ));

    buttons.add(new Button("QUIT", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +130, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        exit();
      }
    }
    ));
  }

  void paint() {
    drawLogo();

    for (Button b : buttons) {
      b.paint();
    }

    textSize(16);
    textAlign(CENTER);
    text(warning, width/2, height/2 -buttonHeight/2 +250);
  }

  void drawLogo() {
    imageMode(CENTER); 
    image(logo, width/2, height/2 - 100);
  }

  void onClick() {
    for (Button b : buttons) {
      b.onClick();
    }
  }
}
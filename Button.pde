class Button extends Scene {

  private Rectangle rect;
  private String title;
  private Runnable onClicked;
  private int fontSize = 22;

  public Button(String title, Rectangle dimensions, Runnable onClicked) {
    this.rect = dimensions;
    this.title = title;
    this.onClicked = onClicked;
  }

  public Button(String title, Rectangle dimensions, Runnable onClicked, int fontSize) {
    this.rect = dimensions;
    this.title = title;
    this.onClicked = onClicked;
    this.fontSize = fontSize;
  }

  void paint() {
    if (rect.contains(mouseX, mouseY)) {
      fill(255, 100);
    } else {
      fill(255, 40);
    }

    stroke(255);
    strokeWeight(2);
    rectMode(CORNER);
    rect((float)rect.getX(), (float)rect.getY(), (float)rect.getWidth(), (float)rect.getHeight());

    fill(255);
    textSize(fontSize);
    textAlign(CENTER, CENTER);
    text(title, (float)rect.getCenterX(), (float)rect.getCenterY()-2);
  }

  void onClick() {
    if (rect.contains(mouseX, mouseY)) {
      if (onClicked != null) {
        onClicked.run();
      }
    }
  }
}
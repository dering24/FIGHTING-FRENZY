class Bullett {
  //THIS CLASS IS FOR THE BULLETS OF THE ENEMY PLAYER.
  //VARIABLES:
  int bullett_X;
  int bullett_Y;
  int bullett_D;
  color bullett_color;
  int bullett_speed;

  boolean is_touched;


  //BOUNDARY VARIABLES:

  int top_bound;
  int bottom_bound;
  int left_bound;
  int right_bound;

  //CONSTRUCTOR:
  Bullett (int x, int y ) {
    rectMode(CENTER);

    bullett_X = x;
    bullett_Y = y;
    bullett_D = 50;
    bullett_color = color(255);
    bullett_speed = 10;
    is_touched = false;
    //BULLET BOUNDARIES:
    top_bound = bullett_Y - bullett_D/2;
    bottom_bound = bullett_Y + bullett_D/2;
    left_bound = bullett_X - bullett_D/2;
    right_bound = bullett_X + bullett_D/2;
  }

  void render() {
    //RENDERS THE CIRCLE ON SCREEN.
    fill(bullett_color);
    circle(bullett_X, bullett_Y, bullett_D);
  }

  void move() {
    //MAKES THE BULLET MOVE
    bullett_X = bullett_X + bullett_speed;
  }


  void reset_boundaries() {
    //BOUNDARIES ARE RESET FOR EVERY FRAME.
    rectMode(CENTER);

    top_bound = bullett_Y - bullett_D/2;
    bottom_bound = bullett_Y + bullett_D/2;
    left_bound = bullett_X - bullett_D/2;
    right_bound = bullett_X + bullett_D/2;
  }
}

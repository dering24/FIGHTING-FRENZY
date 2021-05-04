class Bullet {
  //THIS CLASS IS FOR THE BULLETS OF THE MAIN PLAYER
  //VARIABLES:
  int bullet_X;
  int bullet_Y;
  int bullet_D;
  color bullet_color;
  int bullet_speed;


  //BOUNDARY VARIABLES:

  int top_bound;
  int bottom_bound;
  int left_bound;
  int right_bound;
  boolean is_touched;
  //CONSTRUCTOR:
  Bullet (int x, int y) {
    rectMode(CENTER);

    bullet_X = x;
    bullet_Y = y;
    bullet_D = 50;
    bullet_color = color(0);
    bullet_speed = 10;

    //BULLET BOUNDARIES:
    top_bound = bullet_Y - bullet_D/2;
    bottom_bound = bullet_Y + bullet_D/2;
    left_bound = bullet_X - bullet_D/2;
    right_bound = bullet_X + bullet_D/2;
    is_touched = false;
  }

  void render() {
    //RENDERS THE CIRCLE ON SCREEN.
    fill(bullet_color);
    circle(bullet_X, bullet_Y, bullet_D);
  }

  void move() {
    //MAKES THE BULLET MOVE
    bullet_X = bullet_X - bullet_speed;
  }


  void reset_boundaries() {
    //BOUNDARIES ARE RESET FOR EVERY FRAME.
    rectMode(CENTER);

    top_bound = bullet_Y - bullet_D/2;
    bottom_bound = bullet_Y + bullet_D/2;
    left_bound = bullet_X - bullet_D/2;
    right_bound = bullet_X + bullet_D/2;
  }
}

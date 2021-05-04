class Button {
  //THIS IS FOR THE CASE 0 WINDOW

  //VARIABLES:
  int button_X;
  int button_Y;
  int button_width;
  int button_height;
  color button_color;

  //VARIABLES FOR COLLISION DETECTION:
  int button_top;
  int button_bottom;
  int button_left;
  int button_right;

  boolean is_in_between;
  boolean is_pressed;

  color when_pressed_color;


  Button(int x, int y, int w, int h) {
    rectMode(CENTER);
    button_X = x;
    button_Y = y;
    button_width = w;
    button_height = h;
    button_color = color(255, 255, 255);
    ;
    when_pressed_color  = color(0, 0, 0);
    //BALL BOUNDARIES FOR COLLISION DETECTION:
    button_top = button_Y - button_height/2;
    button_bottom = button_Y + button_height/2;    
    button_left = button_X - button_width/2;
    button_right = button_X + button_width/2;


    is_in_between = false;
    is_pressed = false;
  }


  void render() {
    fill(button_color);
    rect(button_X, button_Y, button_width, button_height);
  }


  void reset_boundaries() {
    //resets boundaries (if necessary)
    button_top = button_Y - button_height/2;
    button_bottom = button_Y + button_height/2;    
    button_left = button_X - button_width/2;
    button_right = button_X + button_width/2;
  }

  boolean is_between(int val, int first_bound, int second_bound) {
    //CHECKS WHETHER A VALUE IS IN BETWEEN TWO BOUNDS AND RETURNS TRUE IF IT IS.

    if (val > first_bound && val < second_bound) {
      return true;
    } else {
      return false;
    }
  }

  boolean is_in_between() {
    // USES THE "IN_BETWEEN" FUNCTION AND CHECKS WHETHER THE MOUSE POSITION IS WITHIN THE BOUNDS OF THE BUTTON.
    //I.E., CHECKS WHETHER THE MOSUE IS IN BETWEEN THE WIDTH AND THE HEIGH OF THE BUTTON AND RETURNS TRUE IF SO.
    //TAKES AN X-POSITION, A Y-POSITION, AND IT'S WIDTH.
    if (is_between(mouseX, button_X-button_width/2, button_X+button_width/2) && is_between(mouseY, button_Y-button_height/2, button_Y+button_height/2)) {

      return true;
    } else {
      return false;
    }
  }

  boolean is_pressed() {
    //THIS FUNCTION RETURN TRUE IF THE MOUSE IS IN BETWEEN THE BUTTON BOUNDARIES AND IF I CLICK THE MOUSE IN THE INSIDE THE BUTTON.
    if (is_in_between() && mousePressed == true) {
      return true;
    } else {
      return false;
    }
  }
}

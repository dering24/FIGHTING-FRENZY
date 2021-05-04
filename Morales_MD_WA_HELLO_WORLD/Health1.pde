class Health1 {

  //VARIABLES FOR HEALTH OUTER BAR:
  int health1_X1;
  int health1_Y1;
  int health1_width1;
  int health1_height1;
  color health1_color1;

  int health1_X2;
  int health1_Y2;
  int health1_width2;
  int health1_height2;
  color health1_color2;

  int health1_X3;
  int health1_Y3;
  int health1_width3;
  int health1_height3;
  color health1_color3;

  int health1_X4;
  int health1_Y4;
  int health1_width4;
  int health1_height4;
  color health1_color4;

  boolean render_rect;

  Health1(int x) {
    //CONSTRUCTOR: 
    rectMode(CENTER);
    health1_X1 = x;
    health1_Y1 = 50;
    health1_width1 = 100;
    health1_height1 = 20;
    health1_color1 = color(0, 0, 0);

    render_rect = true;

    health1_X2 = health1_X1-health1_width1/3;
    health1_Y2 = health1_Y1;
    health1_width2 =  health1_width1/3;
    health1_height2 = health1_height1 - 5;
    health1_color2 = color(255);

    health1_X3 =  health1_X2 + health1_width1/3 ;
    health1_Y3 = health1_Y1;
    health1_width3 =  health1_width2;
    health1_height3 = health1_height1 - 5;
    health1_color3 = color(255);


    health1_X4 =  health1_X3 + health1_width1/3 ;
    health1_Y4 = health1_Y1;
    health1_width4 =  health1_width2;
    health1_height4 = health1_height1 - 5;
    health1_color4 = color(255);
  }



  void draw_3_healths() {
    fill(health1_color2);
    rect(health1_X2, health1_Y2, health1_width2, health1_height2);
    rect(health1_X3, health1_Y3, health1_width3, health1_height3);
    rect(health1_X4, health1_Y4, health1_width4, health1_height4);
  }

  void draw_2_healths() {
    fill(health1_color2);
    rect(health1_X2, health1_Y2, health1_width2, health1_height2);
    rect(health1_X3, health1_Y3, health1_width3, health1_height3);
  }

  void draw_1_healths() {
    fill(health1_color2);
    rect(health1_X2, health1_Y2, health1_width2, health1_height2);
  }
}

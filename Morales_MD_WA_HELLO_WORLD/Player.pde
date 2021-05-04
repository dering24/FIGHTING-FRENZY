class Player {

  int player_X;
  int player_Y;
  int player_width;
  int player_height;
  color player_color;

  //SPEED VARIBALES:
  int player_speed;
  int jump_speed;
  int fall_speed;

  //PLAYER BOUNDARIES FOR COLLISION DETECTION:
  int top_bound;
  int bottom_bound;
  int left_bound;
  int right_bound;

  //MOVEMENT VARIABLES:
  boolean moving_left;
  boolean moving_right;
  boolean is_jumping;
  boolean is_falling;

  int jump_height;
  int peak_Y;

  int life;
  boolean is_dead;


  Player() {
    rectMode(CENTER);
    //PLAYER DIMENSIONS AND POSITION:    
    player_X = width-100;
    player_Y = 530;
    player_width = 50;
    player_height = 100;
    player_color = color(0, 0, 255);

    //PLAYER SPEEDS:

    player_speed = 10;
    jump_speed = 10;
    fall_speed = 10;

    //PLAYER BOUNDARIES:
    top_bound = player_Y - player_height/2;
    bottom_bound = player_Y + player_height/2;
    left_bound = player_X - player_width/2;
    right_bound = player_X + player_width;

    //BOOLEANS:
    moving_left = false;
    moving_right = false;
    is_jumping = false;
    is_falling = false;

    //JUMP POSITIONS:
    jump_height = 300;  
    peak_Y = player_Y - jump_height;

    life = 3;
  }

  void render() {
    fill(player_color);
    rect(player_X, player_Y, player_width, player_height);
  }


  void reset_boundaries() {
    rectMode(CENTER);
    //PLAYER BOUNDARIES:
    top_bound = player_Y - player_height/2;
    bottom_bound = player_Y + player_height/2;
    left_bound = player_X - player_width/2;
    right_bound = player_X - player_width/2;
  }




  void move_left() {
    if (moving_left == true) {
      player_X = player_X - player_speed;
    }
    if (player1.player_X <= (width/2)+player1.player_width/2) {
      player1.moving_left = false;
      player1.player_X = (width/2)+player1.player_width/2;
    }
  }



  void move_right() {
    if (moving_right == true) {
      player_X = player_X + player_speed;
    }
    if (player1.player_X >= width-player_width) {
      player1.moving_right = false;
      //this portions makes the player to move half the size to the right if reaches half the width
      player1.player_X = width - player1.player_width;
    }
  }


  void jump() {
    if (is_jumping == true && is_falling == false) {
      player_Y = player_Y - jump_speed;
    }
  }

  void reached_top_of_jump() {
    if (player_Y == peak_Y) {
      is_jumping = false;
      is_falling = true;
    }
  }

  void fall() {
    if (is_jumping == false && is_falling == true) {
      player_Y = player_Y + jump_speed;
    }
  }

  void land() {
    if (player_Y >= 530) {
      is_falling = false;
    }
  }



  void is_hit(Bullett bullett) {
    if (bullett.right_bound >= left_bound && bullett.left_bound <= right_bound && bullett.top_bound <= bottom_bound && bullett.bottom_bound >= top_bound) {
      life = life -1;
      if (life == 0) {
        is_dead = true;
      }
      bullett.is_touched = true;
    }
  }
}

class Enemy {

  //VARIABLES:

  int enemy_X;
  int enemy_Y;
  int enemy_width;
  int enemy_height;
  color enemy_color;

  // TIME VARS

  int start_time;
  int end_time;
  int interval;

  int start_time_1;
  int end_time_1;
  int interval_1;

  int start_time_2;
  int end_time_2;
  int interval_2;

  //VARIABLES FOR BOUNDARIES:
  int top_bound;
  int bottom_bound;
  int left_bound;
  int right_bound;

  //BOOLEANS:
  boolean is_touched;


  //SPEED VARIBALES:
  int enemy_speed;
  int jump_speed;
  int fall_speed;


  //MOVEMENT VARIABLES:
  boolean moving_left;
  boolean moving_right;
  boolean is_jumping;
  boolean is_falling;
  boolean is_attacking;

  int jump_height;
  int peak_Y;

  boolean is_dead;
  int life;


  Enemy() {
    rectMode(CENTER);
    enemy_X = 50;
    enemy_Y = 530;
    enemy_width = 50;
    enemy_height = 130;
    enemy_color = color(255, 0, 0);

    top_bound = enemy_Y - enemy_height/2;
    bottom_bound = enemy_Y + enemy_height/2;
    left_bound = enemy_X - enemy_width/2;
    right_bound = enemy_X + enemy_width/2;
    is_dead = false;
    life = 3;
    start_time = millis();
    start_time_1 = millis();
    start_time_2 = millis();
    interval = 2000;  //2000 milliseconds=  2 seconds
    interval_1 = 800;  //1000 milliseconds=  2 seconds
    interval_2 = 200;  //600 milliseconds=  2 seconds
    enemy_speed = 10;
    jump_speed = 10;
    fall_speed = 10;
    jump_height = 300;
    peak_Y = enemy_Y - jump_height;
  }


  void render() {
    fill(enemy_color);
    rect(enemy_X, enemy_Y, enemy_width, enemy_height);
  }


  void reset_boundaries() {
    top_bound = enemy_Y - enemy_height/2;
    bottom_bound = enemy_Y + enemy_height/2;
    left_bound = enemy_X - enemy_width/2;
    right_bound = enemy_X + enemy_width/2;
  }



  void move_left() {
    if (moving_left == true) {
      enemy_X = enemy_X - enemy_speed;
    }
    if (enemy1.enemy_X >= (width/2)-enemy_width/2) {
      player1.moving_right = false;
      //this portions makes the player to move half the size to the right if reaches half the width
      enemy1.enemy_X = (width/2) - enemy1.enemy_width;
    }

    if (enemy2.enemy_X >= (width/2)-enemy_width/2) {
      player1.moving_right = false;
      //this portions makes the player to move half the size to the right if reaches half the width
      enemy2.enemy_X = (width/2) - enemy2.enemy_width;
    }

    if (enemy3.enemy_X >= (width/2)-enemy_width/2) {
      player1.moving_right = false;
      //this portions makes the player to move half the size to the right if reaches half the width
      enemy3.enemy_X = (width/2) - enemy1.enemy_width;
    }
  }


  void move_right() {
    if (moving_right == true) {
      enemy_X = enemy_X + enemy_speed;
    }
    if (enemy1.enemy_X <= 0+enemy_width/2) {
      player1.moving_left = false;
      //this portions makes the player to move half the size to the right if reaches half the width
      enemy1.enemy_X = 0 + enemy1.enemy_width;
    }
    if (enemy2.enemy_X <= 0+enemy_width/2) {
      player1.moving_left = false;
      //this portions makes the player to move half the size to the right if reaches half the width
      enemy2.enemy_X = 0 + enemy2.enemy_width;
    }

    if (enemy3.enemy_X <= 0+enemy_width/2) {
      player1.moving_left = false;
      //this portions makes the player to move half the size to the right if reaches half the width
      enemy3.enemy_X = 0 + enemy3.enemy_width;
    }
  }


  void jump() {
    if (is_jumping == true && is_falling == false) {
      enemy_Y = enemy_Y - jump_speed;
    }
  }

  void reached_top_of_jump() {
    if (enemy_Y == peak_Y) {
      is_jumping = false;
      is_falling = true;
    }
  }

  void fall() {
    if (is_jumping == false && is_falling == true) {
      enemy_Y = enemy_Y + jump_speed;
    }
  }

  void land() {
    if (enemy_Y >= 530) {
      is_falling = false;
    }
  }

  void random_move() {

    end_time = millis();
    if (end_time - start_time >interval) {
      enemy_X = int(random(20, width/3));
      enemy_Y = int(random(300, 530));
      bullet_list1.add(new Bullett(enemy1.enemy_X, enemy1.enemy_Y));

      start_time = millis();
    }
  }

  void random_move_2() {

    end_time_1 = millis();
    if (end_time_1 - start_time_1 >interval_1) {
      enemy_X = int(random(20, width/3));
      enemy_Y = int(random(300, 530));
      bullet_list1.add(new Bullett(enemy2.enemy_X, enemy2.enemy_Y));

      start_time_1 = millis();
    }
  }

  void random_move_3() {

    end_time_2 = millis();
    if (end_time_2 - start_time_2 >interval_2) {
      enemy_X = int(random(20, width/3));
      enemy_Y = int(random(300, 530));
      bullet_list1.add(new Bullett(enemy3.enemy_X, enemy3.enemy_Y));

      start_time_2 = millis();
    }
  }


  void is_hit(Bullet bullet) {
    if (bullet.right_bound >= left_bound && bullet.left_bound <= right_bound && bullet.top_bound <= bottom_bound && bullet.bottom_bound >= top_bound) {
      life = life -1;
      if (life <= 0) {
        is_dead = true;
      }
      bullet.is_touched = true;
    }
  }
}

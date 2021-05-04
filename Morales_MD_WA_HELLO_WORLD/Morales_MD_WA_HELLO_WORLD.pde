

import processing.sound.*;
SoundFile background_sound;
SoundFile shooting_sound;
SoundFile bouncing;


boolean image_selected;
Player player1;
Enemy enemy1;
Enemy enemy2;
Enemy enemy3;

boolean computer;
Button button0;
Button button1;
Button button2;
Button button3;
Button button4;
//these buttons are for the cases where I have instructions and serve as the "back" button.
Button button5;
Button button6;
Button button7;
Button button8;


Health1 health_enemy;
Health1 health_player;

Animation entry_animation;
PImage[] entry_images = new PImage[3]; //THERE ARE 3 IMAGES IN THE ANIMATION.


ArrayList<Bullet> bullet_list;
ArrayList<Bullett> bullet_list1;

PImage backgrund0;
PImage backgrund1;
PImage backgrund2;
PImage button_computer;
PImage button_human;
PImage background_instructions;
PImage background_instrucciones;
PImage background_anvisningar;
PImage generic_background;
PImage button_tillbaka;
PImage button_back;
PImage button_atras;
PImage loser_image;
PImage winner_image;
PImage restart_button;



PImage anvisningar_image;
PImage instructions_image;
PImage instrucciones_image;

//ANIMATION FOR PLAYER (NARUTO):
//JUMP:
Animation naruto_jump_animation;
PImage[] naruto_jumping_images = new PImage[3];
// WALK:
Animation naruto_walk_animation;
PImage[] naruto_walk_images = new PImage[7];
//WALK BACKWARDS:
Animation naruto_back_animation;
PImage[] naruto_back_images = new PImage[6];



/////////////////////////////////////////////////////////////////////////////////////////////////
//ANIMATION FOR ENEMY (PAIN):
//WALK:
Animation pain_walk_animation;
PImage[] pain_walk_images = new PImage[7]; //THERE ARE 7 IMAGES IN THE ANIMATION.
//JUMP:
Animation pain_jump_animation;
PImage[] pain_jump_images = new PImage[9]; //THERE ARE 9 IMAGES IN THE ANIMATION.

Animation pain_attack_animation;
PImage[] pain_attack_images = new PImage[7]; //THERE ARE 7 IMAGES IN THE ANIMATION.

Animation pain_back_animation;
PImage[] pain_back_images = new PImage[7]; //THERE ARE 7 IMAGES IN THE ANIMATION.

int switch_val;
void setup() {
  rectMode(CENTER);
  size(1343, 705);

  //FOR SOUND:
  background_sound = new SoundFile(this, "Action_sound.wav");
  shooting_sound = new SoundFile(this, "shooting_sound.wav");
  bouncing = new SoundFile(this, "bouncing_sound.wav");

  //THIS CALLS THE IMAGE FOR BACKGROUND:
  backgrund0 = loadImage("background_0.jpg");
  backgrund1 = loadImage("background_1.jpg");
  backgrund2 = loadImage("background_2.jpg");
  generic_background = loadImage("generic_background.jpg");
  background_instructions= loadImage("background_instructions.jpg");
  background_instrucciones= loadImage("background_instrucciones.jpg");
  background_anvisningar= loadImage("background_anvisningar.jpg");
  loser_image = loadImage("loser_image.jpg");
  winner_image = loadImage("winner_image.jpg");

  button_computer = loadImage("Play_button_computer.png");
  button_human = loadImage("Play_button_human.png");
  restart_button = loadImage("restart_button.png");



  //THIS CALLS THE IMAGES OF NARUTO JUMPING:
  for (int i=0; i<naruto_jumping_images.length; i++) {

    naruto_jumping_images[i] = loadImage("Naruto_Jump_"+i+".png");
  }

  naruto_jump_animation = new Animation(naruto_jumping_images, 0.06, 0.18);

  for (int i=0; i<naruto_walk_images.length; i++) {

    naruto_walk_images[i] = loadImage("Naruto_walk_"+i+".png");
  }

  naruto_walk_animation = new Animation(naruto_walk_images, 0.5, 0.18);



  for (int i=0; i<naruto_back_images.length; i++) {

    naruto_back_images[i] = loadImage("Naruto_back_"+i+".png");
  }

  naruto_back_animation = new Animation(naruto_back_images, 0.5, 0.18);


  //THIS CALLS THE IMAGES OF ENTRY:
  for (int i=0; i<entry_images.length; i++) {

    entry_images[i] = loadImage("entry_"+i+".jpg");
  }

  entry_animation = new Animation(entry_images, 0.05, 1);





  //FOR PAIN WALKING ANIMATION: 
  for (int i=0; i<pain_walk_images.length; i++) {

    pain_walk_images[i] = loadImage("pain_walk_"+i+".png");
  }

  pain_walk_animation = new Animation(pain_walk_images, 0.5, 0.12);

  //FOR PAIN JUMPING ANIMATION:  
  for (int i=0; i<pain_jump_images.length; i++) {

    pain_jump_images[i] = loadImage("pain_jump_"+i+".png");
  }

  pain_jump_animation = new Animation(pain_jump_images, 0.05, 0.12);


  for (int i=0; i<pain_attack_images.length; i++) {

    pain_attack_images[i] = loadImage("pain_attack_"+i+".png");
  }

  pain_attack_animation = new Animation(pain_attack_images, 0.5, 0.12);


  for (int i=0; i<pain_back_images.length; i++) {

    pain_back_images[i] = loadImage("pain_back_"+i+".png");
  }

  pain_back_animation = new Animation(pain_back_images, 0.5, 0.12);






  player1 = new Player();
  enemy1 = new Enemy();
  enemy2 = new Enemy();
  enemy3 = new Enemy();
  button0 = new Button(300, 550, 505, 261);
  button1 = new Button(1000, 550, 505, 261);
  button2 = new Button(250, 200, 250, 74);
  button3 = new Button(670, 200, 250, 74);
  button4 = new Button(1140, 200, 250, 74);

  button5 = new Button(115, 80, 150, 100);
  button6 = new Button(115, 80, 150, 100);
  button7 = new Button(115, 80, 150, 100);

  button8 = new Button(width/2, 600, 400, 320);




  anvisningar_image = loadImage("anvisningar_0.png");
  instructions_image = loadImage("instructions_0.png");
  instrucciones_image = loadImage("instrucciones_0.png");

  button_tillbaka = loadImage("button_tillbaka.png");
  button_back = loadImage("button_back.png");
  button_atras = loadImage("button_atras.png");

  health_enemy =  new Health1(300); //NUMBER INSIDE IS X POSITION ON HEALTH BARS.
  health_player = new Health1(1000); //THIS NUMBER INSIDE IS THE X POSITION OF THE HEALTH BARS
  bullet_list = new ArrayList<Bullet>();
  bullet_list1 = new ArrayList<Bullett>();

  switch_val = 0;


  //THIS ANIMATES THE ENTRY "LOADING" IMAGE.
  entry_animation.isAnimating = true;
  //OTHER ANIMATION:
  pain_walk_animation.isAnimating = false;
  pain_back_animation.isAnimating = false;
  pain_jump_animation.isAnimating = false;
  pain_attack_animation.isAnimating = false;
  naruto_jump_animation.isAnimating = false;
  naruto_walk_animation.isAnimating = false;
  naruto_back_animation.isAnimating = false;
}







void draw() {

  switch(switch_val) {
  case 0:
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    if (!background_sound.isPlaying()) {
      background_sound.play();
    }
    entry_animation.display(width/2, height/2);
    if (entry_animation.isAnimating == false) {
      switch_val = 1;
    }



    break;

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  case 1:
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}
    background(generic_background); 
    image(button_computer, button0.button_X, button0.button_Y);
    image(button_human, button1.button_X, button1.button_Y);
    button0.reset_boundaries();
    button1.reset_boundaries();
    button2.reset_boundaries();
    button3.reset_boundaries();
    button4.reset_boundaries();
    if (button1.is_pressed() == true) {
      button0.is_pressed = false;
      computer = false;
      switch_val = 2;
    }
    if (button0.is_pressed() == true) {
      computer = true;
      button1.is_pressed = false;
      switch_val = 11;
    }


    // button2.render();
    image(instructions_image, button2.button_X, button2.button_Y );
    image(instrucciones_image, button3.button_X, button3.button_Y);
    image(anvisningar_image, button4.button_X, button4.button_Y);

    if (button2.is_pressed()==true && button1.is_pressed() == false && button0.is_pressed() == false ) {
      button0.is_pressed = false;
      button1.is_pressed = false;
      button3.is_pressed = false;
      button4.is_pressed = false;
      button2.is_pressed =false;

      button6.is_pressed = false;
      button7.is_pressed = false;
      button5.is_pressed = false;

      switch_val = 6;
    }

    if (button3.is_pressed() ==true &&  button1.is_pressed() == false && button0.is_pressed() == false ) {
      button1.is_pressed = false;
      button0.is_pressed = false;
      button2.is_pressed = false;
      button4.is_pressed = false;
      button6.is_pressed = false;
      button7.is_pressed = false;
      button5.is_pressed = false;
      switch_val = 7;
    }
    if (button4.is_pressed() == true && button1.is_pressed() == false && button0.is_pressed() == false ) {
      button1.is_pressed = false;
      button0.is_pressed = false;
      button2.is_pressed = false;
      button3.is_pressed = false;
      button6.is_pressed = false;
      button7.is_pressed = false;
      button5.is_pressed = false;
      switch_val = 8;
    }









    break;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  case 2 :
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}
    if (computer == false) {

      background(backgrund0);

      //background(0,0,0);
      //player1.render();
      player1.reset_boundaries();
      player1.move_left();
      player1.move_right();
      player1.jump();
      player1.reached_top_of_jump();
      player1.fall();
      player1.land();

      //enemy1.render();
      //renemy1.random_move();
      enemy1.move_left();
      enemy1.move_right();
      enemy1.fall();
      enemy1.reached_top_of_jump();
      enemy1.jump();
      enemy1.land();
      enemy1.reset_boundaries();

      if (player1.is_jumping == true) {
        naruto_jump_animation.display(player1.player_X, player1.player_Y);
      } else if (player1.moving_right == true) {
        naruto_back_animation.display(player1.player_X, player1.player_Y);
      } else {
        naruto_walk_animation.display(player1.player_X, player1.player_Y);
      }


      if (enemy1.is_jumping == true) {
        pain_jump_animation.display(enemy1.enemy_X, enemy1.enemy_Y);
      } else if (enemy1.is_attacking == true) {
        pain_attack_animation.display(enemy1.enemy_X, enemy1.enemy_Y);
      } else if (enemy1.moving_left == true) {
        pain_back_animation.display(enemy1.enemy_X, enemy1.enemy_Y);
      } else {
        pain_walk_animation.display(enemy1.enemy_X, enemy1.enemy_Y);
      }



      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE PLAYER.
      if (player1.life == 3) {
        health_player.draw_3_healths();
      } else if (player1.life == 2) {
        health_player.draw_2_healths();
      } else if (player1.life == 1) {
        health_player.draw_1_healths();
      }



      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE ENEMY.
      if (enemy1.life == 3) {
        health_enemy.draw_3_healths();
      } else if (enemy1.life == 2) {
        health_enemy.draw_2_healths();
      } else if (enemy1.life == 1) {
        health_enemy.draw_1_healths();
      }



      // for bullet functions
      for (Bullet bullet1 : bullet_list) {
        enemy1.is_hit(bullet1);
        bullet1.render();
        bullet1.move();
        bullet1.reset_boundaries();
      }

      //for enemy bullet functions
      for (Bullett bullett1 : bullet_list1) {
        player1.is_hit(bullett1);

        bullett1.render();
        bullett1.move();
        bullett1.reset_boundaries();
      }


      if (enemy1.is_dead == true) {
        switch_val = 3;
        player1.life = 3;
      }

      if (player1.is_dead == true) {
        switch_val = 9;
      }

      for (int i=bullet_list.size()-1; i>=0; i--) {
        if (bullet_list.get(i).is_touched == true) {
          bullet_list.remove(i);
        }
      }

      for (int i=bullet_list1.size()-1; i>=0; i--) {
        if (bullet_list1.get(i).is_touched == true) {
          bullet_list1.remove(i);
        }
      }
    }



    break;

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
  case 3:
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}
    if (computer == false) {
      background(backgrund1);

      //player1.render();
      player1.reset_boundaries();
      player1.move_left();
      player1.move_right();
      player1.jump();
      player1.reached_top_of_jump();
      player1.fall();
      player1.land();

      //enemy2.render();
      enemy2.reset_boundaries();
      enemy2.move_left();
      enemy2.move_right();
      enemy2.fall();
      enemy2.reached_top_of_jump();
      enemy2.jump();
      enemy2.land();

      if (player1.is_jumping == true) {
        naruto_jump_animation.display(player1.player_X, player1.player_Y);
      } else if (player1.moving_right == true) {
        naruto_back_animation.display(player1.player_X, player1.player_Y);
      } else {
        naruto_walk_animation.display(player1.player_X, player1.player_Y);
      }


      if (enemy2.is_jumping == true) {
        pain_jump_animation.display(enemy2.enemy_X, enemy2.enemy_Y);
      } else if (enemy2.is_attacking == true) {
        pain_attack_animation.display(enemy2.enemy_X, enemy2.enemy_Y);
      } else if (enemy2.moving_left == true) {
        pain_back_animation.display(enemy2.enemy_X, enemy2.enemy_Y);
      } else {
        pain_walk_animation.display(enemy2.enemy_X, enemy2.enemy_Y);
      }


      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE PLAYER.
      if (player1.life == 3) {
        health_player.draw_3_healths();
      } else if (player1.life == 2) {
        health_player.draw_2_healths();
      } else if (player1.life == 1) {
        health_player.draw_1_healths();
      }


      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE ENEMY.
      if (enemy2.life == 3) {
        health_enemy.draw_3_healths();
      } else if (enemy2.life == 2) {
        health_enemy.draw_2_healths();
      } else if (enemy2.life == 1) {
        health_enemy.draw_1_healths();
      }



      // for bullet functions
      for (Bullet bullet1 : bullet_list) {
        enemy2.is_hit(bullet1);


        bullet1.render();
        bullet1.move();
        bullet1.reset_boundaries();
      }

      //for enemy bullet functions
      for (Bullett bullett1 : bullet_list1) {
        player1.is_hit(bullett1);

        bullett1.render();
        bullett1.move();
        bullett1.reset_boundaries();
      }


      if (enemy2.is_dead == true) {
        switch_val = 4;
        player1.life = 3;
      }

      if (player1.is_dead == true) {
        switch_val = 9;
      }

      for (int i=bullet_list.size()-1; i>=0; i--) {
        if (bullet_list.get(i).is_touched == true) {
          bullet_list.remove(i);
        }
      }

      for (int i=bullet_list1.size()-1; i>=0; i--) {
        if (bullet_list1.get(i).is_touched == true) {
          bullet_list1.remove(i);
        }
      }
    }





    break;
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  case 4 :
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}

    if (computer == false) {
      background(backgrund2);

      //player1.render();
      player1.reset_boundaries();
      player1.move_left();
      player1.move_right();
      player1.jump();
      player1.reached_top_of_jump();
      player1.fall();
      player1.land();

      //enemy3.render();
      //enemy3.random_move();
      enemy3.reset_boundaries();
      enemy3.move_left();
      enemy3.move_right();
      enemy3.fall();
      enemy3.reached_top_of_jump();
      enemy3.jump();
      enemy3.land();

      if (player1.is_jumping == true) {
        naruto_jump_animation.display(player1.player_X, player1.player_Y);
      } else if (player1.moving_right == true) {
        naruto_back_animation.display(player1.player_X, player1.player_Y);
      } else {
        naruto_walk_animation.display(player1.player_X, player1.player_Y);
      }


      if (enemy3.is_jumping == true) {
        pain_jump_animation.display(enemy3.enemy_X, enemy3.enemy_Y);
      } else if (enemy3.is_attacking == true) {
        pain_attack_animation.display(enemy3.enemy_X, enemy3.enemy_Y);
      } else if (enemy3.moving_left == true) {
        pain_back_animation.display(enemy3.enemy_X, enemy3.enemy_Y);
      } else {
        pain_walk_animation.display(enemy3.enemy_X, enemy3.enemy_Y);
      }


      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE PLAYER.
      if (player1.life == 3) {
        health_player.draw_3_healths();
      } else if (player1.life == 2) {
        health_player.draw_2_healths();
      } else if (player1.life == 1) {
        health_player.draw_1_healths();
      }


      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE ENEMY.
      if (enemy3.life == 3) {
        health_enemy.draw_3_healths();
      } else if (enemy3.life == 2) {
        health_enemy.draw_2_healths();
      } else if (enemy3.life == 1) {
        health_enemy.draw_1_healths();
      }



      // for bullet functions
      for (Bullet bullet1 : bullet_list) {
        enemy3.is_hit(bullet1);
        bullet1.render();
        bullet1.move();
        bullet1.reset_boundaries();
      }

      //for enemy bullet functions
      for (Bullett bullett1 : bullet_list1) {
        player1.is_hit(bullett1);

        bullett1.render();
        bullett1.move();
        bullett1.reset_boundaries();
      }


      if (enemy3.is_dead == true) {
        switch_val = 5;
      }

      if (player1.is_dead == true) {
        switch_val = 9;
      }

      for (int i=bullet_list.size()-1; i>=0; i--) {
        if (bullet_list.get(i).is_touched == true) {
          bullet_list.remove(i);
        }
      }

      for (int i=bullet_list1.size()-1; i>=0; i--) {
        if (bullet_list1.get(i).is_touched == true) {
          bullet_list1.remove(i);
        }
      }
    }







    break;
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  case 5:

    //THIS CASE IS THE "YOU WIN" CASE:

    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}
    background(winner_image); /// CHANGE THIS OR GET RID OF THE CASE COMPLETELY
    image(restart_button, button8.button_X, button8.button_Y);
    button8.reset_boundaries();
    if (button8.is_pressed() == true) {
      setup();
      switch_val = 1;
    }
    break;

  case 6:
    // THIS CASE SHOWS THE INSTRUCTIONS IN ENGLISH AND RENDERS THE "BACK" BUTTON:
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}
    background(background_instructions);
    image(button_back, button6.button_X, button6.button_Y);
    button6.reset_boundaries();
    if (button6.is_pressed() == true && button1.is_pressed() == false && button0.is_pressed() == false ) {
      button0.is_pressed = false;
      button1.is_pressed = false;
      button2.is_pressed =false;
      button3.is_pressed = false;
      button4.is_pressed = false;
      button7.is_pressed = false;
      button5.is_pressed = false;
      switch_val = 1;
    }

    break;

  case 7:
    //THIS CASE SHOWS THAT INSTRUCTIONS IN SPANISH AND RENDERS THE "ATRAS" BUTTON:
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}
    background(background_instrucciones);
    image(button_atras, button7.button_X, button7.button_Y);
    button7.reset_boundaries();
    if (button7.is_pressed() == true && button1.is_pressed() == false && button0.is_pressed() == false ) {
      button0.is_pressed = false;
      button1.is_pressed = false;
      button2.is_pressed =false;
      button3.is_pressed = false;
      button4.is_pressed = false;
      button6.is_pressed = false;
      button5.is_pressed = false;
      switch_val = 1;
      println(switch_val);
    }
    break;

  case 8:
    // THIS CASE SHOWS THE INSTRUCTIONS IN SWEDISH AND RENDERS THE "TILLBAKA" BUTTON:
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}
    background(background_anvisningar);
    image(button_tillbaka, button5.button_X, button5.button_Y);
    button5.reset_boundaries();
    if (button5.is_pressed() == true && button1.is_pressed() == false && button0.is_pressed() == false ) {
      button0.is_pressed = false;
      button1.is_pressed = false;
      button2.is_pressed =false;
      button3.is_pressed = false;
      button4.is_pressed = false;
      button7.is_pressed = false;
      button6.is_pressed = false;
      switch_val = 1;
      println(switch_val);
    }

    break;


  case 9:
    // THIS CASE IS THE "YOU LOSE" CASE:
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}
    background(loser_image);

    image(restart_button, button8.button_X, button8.button_Y);
    button8.reset_boundaries();
    if (button8.is_pressed() == true) {
      setup();
      switch_val = 1;
    }
    break;





    //cases for the enemy if computer:
  case 11:
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}
    ///// FOR RANDOM MOVE:
    if (computer == true) {
      background(backgrund0);
      player1.reset_boundaries();
      player1.move_left();
      player1.move_right();
      player1.jump();
      player1.reached_top_of_jump();
      player1.fall();
      player1.land();

      if (player1.is_jumping == true) {
        naruto_jump_animation.display(player1.player_X, player1.player_Y);
      } else if (player1.moving_right == true) {
        naruto_back_animation.display(player1.player_X, player1.player_Y);
      } else {
        naruto_walk_animation.display(player1.player_X, player1.player_Y);
      }
      enemy1.random_move();
      enemy1.reset_boundaries();
      pain_walk_animation.display(enemy1.enemy_X, enemy1.enemy_Y);
      //enemy1.render();



      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE PLAYER.
      if (player1.life == 3) {
        health_player.draw_3_healths();
      } else if (player1.life == 2) {
        health_player.draw_2_healths();
      } else if (player1.life == 1) {
        health_player.draw_1_healths();
      }



      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE ENEMY.
      if (enemy1.life == 3) {
        health_enemy.draw_3_healths();
      } else if (enemy1.life == 2) {
        health_enemy.draw_2_healths();
      } else if (enemy1.life == 1) {
        health_enemy.draw_1_healths();
      }



      // for bullet functions
      for (Bullet bullet1 : bullet_list) {
        enemy1.is_hit(bullet1);
        bullet1.render();
        bullet1.move();
        bullet1.reset_boundaries();
      }

      //for enemy bullet functions
      for (Bullett bullett1 : bullet_list1) {
        player1.is_hit(bullett1);

        bullett1.render();
        bullett1.move();
        bullett1.reset_boundaries();
      }


      if (enemy1.is_dead == true) {
        switch_val = 12;
        player1.life = 3;
      }

      if (player1.is_dead == true) {
        switch_val = 9;
      }

      for (int i=bullet_list.size()-1; i>=0; i--) {
        if (bullet_list.get(i).is_touched == true) {
          bullet_list.remove(i);
        }
      }

      for (int i=bullet_list1.size()-1; i>=0; i--) {
        if (bullet_list1.get(i).is_touched == true) {
          bullet_list1.remove(i);
        }
      }
    }




    break;

  case 12:
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}

    if (computer == true) {
      background(backgrund1);
      //player1.render();
      player1.reset_boundaries();
      player1.move_left();
      player1.move_right();
      player1.jump();
      player1.reached_top_of_jump();
      player1.fall();
      player1.land();

      //enemy2.render();
      enemy2.random_move_2();
      enemy2.reset_boundaries();

      if (player1.is_jumping == true) {
        naruto_jump_animation.display(player1.player_X, player1.player_Y);
      } else if (player1.moving_right == true) {
        naruto_back_animation.display(player1.player_X, player1.player_Y);
      } else {
        naruto_walk_animation.display(player1.player_X, player1.player_Y);
      }

      pain_walk_animation.display(enemy2.enemy_X, enemy2.enemy_Y);


      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE PLAYER.
      if (player1.life == 3) {
        health_player.draw_3_healths();
      } else if (player1.life == 2) {
        health_player.draw_2_healths();
      } else if (player1.life == 1) {
        health_player.draw_1_healths();
      }


      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE ENEMY.
      if (enemy2.life == 3) {
        health_enemy.draw_3_healths();
      } else if (enemy2.life == 2) {
        health_enemy.draw_2_healths();
      } else if (enemy2.life == 1) {
        health_enemy.draw_1_healths();
      }



      // for bullet functions
      for (Bullet bullet1 : bullet_list) {
        enemy2.is_hit(bullet1);


        bullet1.render();
        bullet1.move();
        bullet1.reset_boundaries();
      }

      //for enemy bullet functions
      for (Bullett bullett1 : bullet_list1) {
        player1.is_hit(bullett1);

        bullett1.render();
        bullett1.move();
        bullett1.reset_boundaries();
      }


      if (enemy2.is_dead == true) {
        switch_val = 13;
        player1.life = 3;
      }

      if (player1.is_dead == true) {
        switch_val = 9;
      }

      for (int i=bullet_list.size()-1; i>=0; i--) {
        if (bullet_list.get(i).is_touched == true) {
          bullet_list.remove(i);
        }
      }

      for (int i=bullet_list1.size()-1; i>=0; i--) {
        if (bullet_list1.get(i).is_touched == true) {
          bullet_list1.remove(i);
        }
      }
    }


    break;

  case 13:
    //PLAYS BACKGROUND MUSIC IF AND ONLY IF IT IS NOT ALREADY PLAYING.
    //if (!background_sound.isPlaying()) {
    //  background_sound.play();
    //}
    if (computer == true) {
      background(backgrund2);
      //player1.render();
      player1.reset_boundaries();
      player1.move_left();
      player1.move_right();
      player1.jump();
      player1.reached_top_of_jump();
      player1.fall();
      player1.land();

      //enemy3.render();
      enemy3.random_move_3();
      enemy3.reset_boundaries();

      if (player1.is_jumping == true) {
        naruto_jump_animation.display(player1.player_X, player1.player_Y);
      } else if (player1.moving_right == true) {
        naruto_back_animation.display(player1.player_X, player1.player_Y);
      } else {
        naruto_walk_animation.display(player1.player_X, player1.player_Y);
      }

      pain_walk_animation.display(enemy3.enemy_X, enemy3.enemy_Y);


      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE PLAYER.
      if (player1.life == 3) {
        health_player.draw_3_healths();
      } else if (player1.life == 2) {
        health_player.draw_2_healths();
      } else if (player1.life == 1) {
        health_player.draw_1_healths();
      }


      //THIS "REMOVES" OR CHANGES HEALTH BAR EVERY TIME A BULLET TOUCHES THE ENEMY.
      if (enemy3.life == 3) {
        health_enemy.draw_3_healths();
      } else if (enemy3.life == 2) {
        health_enemy.draw_2_healths();
      } else if (enemy3.life == 1) {
        health_enemy.draw_1_healths();
      }



      // for bullet functions
      for (Bullet bullet1 : bullet_list) {
        enemy3.is_hit(bullet1);
        bullet1.render();
        bullet1.move();
        bullet1.reset_boundaries();
      }

      //for enemy bullet functions
      for (Bullett bullett1 : bullet_list1) {
        player1.is_hit(bullett1);

        bullett1.render();
        bullett1.move();
        bullett1.reset_boundaries();
      }


      if (enemy3.is_dead == true) {
        switch_val = 5;
      }

      if (player1.is_dead == true) {
        switch_val = 9;
      }

      for (int i=bullet_list.size()-1; i>=0; i--) {
        if (bullet_list.get(i).is_touched == true) {
          bullet_list.remove(i);
        }
      }

      for (int i=bullet_list1.size()-1; i>=0; i--) {
        if (bullet_list1.get(i).is_touched == true) {
          bullet_list1.remove(i);
        }
      }
    }

    break;
  }
}






void keyPressed() {
  if (computer == false) { 
    if (key == CODED) {
      if (keyCode == LEFT && player1.moving_left == false && player1.moving_right == false && player1.is_falling == false && player1.is_jumping == false) {
        naruto_back_animation.isAnimating = false;
        naruto_walk_animation.isAnimating = true;
        player1.moving_left = true;
        if (player1.player_X <= width/2) {
          player1.moving_left = false;
        }
      }

      if (keyCode == RIGHT && player1.moving_left == false && player1.moving_right == false && player1.is_falling == false && player1.is_jumping == false) {
        naruto_walk_animation.isAnimating = false;
        naruto_back_animation.isAnimating = true;
        player1.moving_right = true;
        if (player1.player_X >= width) {
          player1.moving_right = false;
        }
      }
      if (keyCode == UP && player1.moving_left == false && player1.moving_right == false && player1.is_falling == false && player1.is_jumping == false) {

        naruto_jump_animation.isAnimating = true;

        //BOOLEANS:
        player1.is_jumping = true;
        if (bouncing.isPlaying()) {
          bouncing.stop();
        }

        //PLAYS THE SOUND ONCE I HIT W.
        bouncing.play();

        player1.moving_left = false;
        player1.moving_right = false;
        player1.is_falling = false;
      }
    }
  }

  if (computer == true) { 
    if (key == CODED) {
      if (keyCode == LEFT && player1.moving_left == false && player1.moving_right == false && player1.is_falling == false && player1.is_jumping == false) {
        naruto_back_animation.isAnimating = false;
        naruto_walk_animation.isAnimating = true;
        player1.moving_left = true;
        if (player1.player_X <= width/2) {
          player1.moving_left = false;
        }
      }

      if (keyCode == RIGHT && player1.moving_left == false && player1.moving_right == false && player1.is_falling == false && player1.is_jumping == false) {
        naruto_walk_animation.isAnimating = false;
        naruto_back_animation.isAnimating = true;
        player1.moving_right = true;
        if (player1.player_X >= width) {
          player1.moving_right = false;
        }
      }
      if (keyCode == UP && player1.moving_left == false && player1.moving_right == false && player1.is_falling == false && player1.is_jumping == false) {

        naruto_jump_animation.isAnimating = true;

        //BOOLEANS:
        player1.is_jumping = true;
        if (bouncing.isPlaying()) {
          bouncing.stop();
        }

        //PLAYS THE SOUND ONCE I HIT W.
        bouncing.play();

        player1.moving_left = false;
        player1.moving_right = false;
        player1.is_falling = false;
      }
    }
  }




  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (computer == false && switch_val == 2) {
    // FOR ENEMY 1:
    if (key == 'd' && enemy1.is_jumping == false && enemy1.is_falling ==false || key == 'D' && enemy1.is_jumping == false && enemy1.is_falling ==false) {
      pain_walk_animation.isAnimating = true;
      pain_jump_animation.isAnimating = false;
      pain_attack_animation.isAnimating = false;
      enemy1.moving_right = true;
      enemy1.is_jumping = false;
      enemy1.moving_left = false;
      if (enemy1.enemy_X >= width/2) {
        enemy1.moving_right = false;
      }
    }

    if (key == 'a' && enemy1.is_jumping == false && enemy1.is_falling ==false|| key == 'A'&& enemy1.is_jumping == false && enemy1.is_falling ==false) {
      pain_back_animation.isAnimating = true;
      pain_walk_animation.isAnimating = false;
      pain_jump_animation.isAnimating = false;
      pain_attack_animation.isAnimating = false;
      enemy1.moving_left = true;
      enemy1.moving_right = false;
      enemy1.is_jumping = false;
      if (enemy1.enemy_X <= 0) {
        enemy1.moving_right = false;
        enemy1.enemy_X = enemy1.enemy_X + 10;
      }
    }

    if (key == 'w'  && enemy1.is_jumping == false && enemy1.is_falling == false || key == 'W'  && enemy1.is_jumping == false && enemy1.is_falling == false) {
      //pain_jump_animation.display(enemy1.enemy_X, enemy1.enemy_Y);
      pain_jump_animation.isAnimating = true;
      if (bouncing.isPlaying()) {
        bouncing.stop();
      }

      //PLAYS THE SOUND ONCE I HIT W.
      bouncing.play();
      pain_walk_animation.isAnimating = false;
      pain_attack_animation.isAnimating = false;
      enemy1.is_jumping = true;
      enemy1.moving_right = false;
      enemy1.moving_left = false;
      enemy1.is_falling = false;
    }

    if (key == 's' && enemy1.is_jumping == false && enemy1.moving_left == false && enemy1.moving_right == false && enemy1.is_falling == false|| key == 'S'&& enemy1.is_jumping == false && enemy1.moving_left == false && enemy1.moving_right == false && enemy1.is_falling == false ) {
      enemy1.is_attacking = true;
      pain_attack_animation.isAnimating = true;
      if (shooting_sound.isPlaying()) {
        shooting_sound.stop();
      }

      //PLAYS THE SHOOTING SOUND EVERY TIME I HIT s
      shooting_sound.play();
      pain_jump_animation.isAnimating = false;
      pain_walk_animation.isAnimating = false;
      bullet_list1.add(new Bullett(enemy1.enemy_X, enemy1.enemy_Y));
      enemy1.is_jumping = false;
      enemy1.moving_right = false;
      enemy1.moving_left = false;
      enemy1.is_falling = false;
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////
  //FOR ENEMY 2:
  if (computer == false  && switch_val == 3) {

    if (key == 'd' && enemy2.is_jumping == false && enemy2.is_falling ==false || key == 'D' && enemy2.is_jumping == false && enemy2.is_falling ==false) {
      pain_walk_animation.isAnimating = true;
      pain_jump_animation.isAnimating = false;
      pain_attack_animation.isAnimating = false;
      enemy2.moving_right = true;
      enemy2.is_jumping = false;
      enemy2.moving_left = false;
      if (enemy2.enemy_X >= width/2) {
        enemy2.moving_right = false;
      }
    }

    if (key == 'a' && enemy2.is_jumping == false && enemy2.is_falling ==false|| key == 'A'&& enemy2.is_jumping == false && enemy2.is_falling ==false) {
      pain_back_animation.isAnimating = true;
      pain_walk_animation.isAnimating = false;
      pain_jump_animation.isAnimating = false;
      pain_attack_animation.isAnimating = false;
      enemy2.moving_left = true;
      enemy2.moving_right = false;
      enemy2.is_jumping = false;
      if (enemy2.enemy_X <= 0) {
        enemy2.moving_right = false;
        enemy2.enemy_X = enemy2.enemy_X + 10;
      }
    }

    if (key == 'w'  && enemy2.is_jumping == false && enemy2.is_falling == false || key == 'W'  && enemy2.is_jumping == false && enemy2.is_falling == false) {
      //pain_jump_animation.display(enemy1.enemy_X, enemy1.enemy_Y);
      pain_jump_animation.isAnimating = true;
      if (bouncing.isPlaying()) {
        bouncing.stop();
      }

      //PLAYS THE SOUND ONCE I HIT W.
      bouncing.play();
      pain_walk_animation.isAnimating = false;
      pain_attack_animation.isAnimating = false;
      enemy2.is_jumping = true;
      enemy2.moving_right = false;
      enemy2.moving_left = false;
      enemy2.is_falling = false;
    }


    if (key == 's' && enemy2.is_jumping == false && enemy2.moving_left == false && enemy2.moving_right == false && enemy2.is_falling == false|| key == 'S'&& enemy2.is_jumping == false && enemy2.moving_left == false && enemy2.moving_right == false && enemy2.is_falling == false ) {
      enemy2.is_attacking = true;
      pain_attack_animation.isAnimating = true;
      if (shooting_sound.isPlaying()) {
        shooting_sound.stop();
      }

      //PLAYS THE SHOOTING SOUND EVERY TIME I HIT s .
      shooting_sound.play();
      pain_jump_animation.isAnimating = false;
      pain_walk_animation.isAnimating = false;
      bullet_list1.add(new Bullett(enemy2.enemy_X, enemy2.enemy_Y));
      enemy2.is_jumping = false;
      enemy2.moving_right = false;
      enemy2.moving_left = false;
      enemy2.is_falling = false;
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // FOR ENEMY 3:
  if (computer == false  && switch_val == 4) {
    if (key == 'd' && enemy3.is_jumping == false && enemy3.is_falling ==false || key == 'D' && enemy3.is_jumping == false && enemy3.is_falling ==false) {
      pain_walk_animation.isAnimating = true;
      pain_jump_animation.isAnimating = false;
      pain_attack_animation.isAnimating = false;
      enemy3.moving_right = true;
      enemy3.is_jumping = false;
      enemy3.moving_left = false;
      if (enemy3.enemy_X >= width/2) {
        enemy3.moving_right = false;
      }
    }

    if (key == 'a' && enemy3.is_jumping == false && enemy3.is_falling ==false|| key == 'A'&& enemy3.is_jumping == false && enemy3.is_falling ==false) {
      pain_back_animation.isAnimating = true;
      pain_walk_animation.isAnimating = false;
      pain_jump_animation.isAnimating = false;
      pain_attack_animation.isAnimating = false;
      enemy3.moving_left = true;
      enemy3.moving_right = false;
      enemy3.is_jumping = false;
      if (enemy3.enemy_X <= 0) {
        enemy3.moving_right = false;
        enemy3.enemy_X = enemy1.enemy_X + 10;
      }
    }

    if (key == 'w'  && enemy3.is_jumping == false && enemy3.is_falling == false || key == 'W'  && enemy3.is_jumping == false && enemy3.is_falling == false) {
      //pain_jump_animation.display(enemy1.enemy_X, enemy1.enemy_Y);
      pain_jump_animation.isAnimating = true;
      if (bouncing.isPlaying()) {
        bouncing.stop();
      }

      //PLAYS THE SOUND ONCE I HIT W.
      bouncing.play();
      pain_walk_animation.isAnimating = false;
      pain_attack_animation.isAnimating = false;
      enemy3.is_jumping = true;
      enemy3.moving_right = false;
      enemy3.moving_left = false;
      enemy3.is_falling = false;
    }

    if (key == 's' && enemy3.is_jumping == false && enemy3.moving_left == false && enemy3.moving_right == false && enemy3.is_falling == false|| key == 'S'&& enemy3.is_jumping == false && enemy3.moving_left == false && enemy3.moving_right == false && enemy3.is_falling == false ) {
      enemy3.is_attacking = true;
      pain_attack_animation.isAnimating = true;
      if (shooting_sound.isPlaying()) {
        shooting_sound.stop();
      }

      //PLAYS THE SHOOTING SOUND EVERY TIME I HIT s .
      shooting_sound.play();
      pain_jump_animation.isAnimating = false;
      pain_walk_animation.isAnimating = false;
      bullet_list1.add(new Bullett(enemy3.enemy_X, enemy3.enemy_Y));
      enemy3.is_jumping = false;
      enemy3.moving_right = false;
      enemy3.moving_left = false;
      enemy3.is_falling = false;
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (key == ' ' && player1.moving_left == false && player1.moving_right == false && player1.is_jumping == false && player1.is_falling == false) {
    if (shooting_sound.isPlaying()) {
      shooting_sound.stop();
    }

    //PLAYS THE SHOOTING SOUND EVERY TIME I HIT SPACE BAR.
    shooting_sound.play();

    bullet_list.add(new Bullet(player1.player_X, player1.player_Y));
  }

  // THESE MAKE SURE THAT THE SOUND IS NOT PLAYED WEHENEVER BUTTON WITH SOUND ANIMATION IS PRESSED AND IS IN A CASE WHERE THE SOUND IS NOT SUPPOSED TO BE:

  if (key == ' ' && switch_val == 1 ||key == ' ' && switch_val == 0 || key == ' ' && switch_val == 6 || key == ' ' && switch_val == 7 || key == ' ' && switch_val == 8 || key == ' ' && switch_val == 9 ||  key == ' ' && switch_val == 5 ) {
    shooting_sound.stop();
  }


  if (key == CODED) {
    if (keyCode == UP && switch_val == 1 ||keyCode == UP && switch_val == 5 || keyCode == UP && switch_val == 0 || keyCode == UP && switch_val == 6 || keyCode == UP && switch_val == 7 || keyCode == UP && switch_val == 8 || keyCode == UP && switch_val == 9) {
      bouncing.stop();
    }
  }

  if (key == 'w' && switch_val == 1 || key == 'w' && switch_val == 5 ||key == 'w' && switch_val == 0 || key == 'w' && switch_val == 6 || key == 'w' && switch_val == 7 || key == 'w' && switch_val == 8|| key == 'w' && switch_val == 9|| key == 'W' && switch_val == 1 ||key == 'W' && switch_val == 5 ||key == 'W' && switch_val == 6 || key == 'W' && switch_val == 7 || key == 'W' && switch_val == 8 || key == 'W' && switch_val == 9|| key == 'W' && switch_val == 0) {
    bouncing.stop();
  }


  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



  //THESE ARE FOR SKIPPING BETWEEN CASES. SHOULD BE COMMENTED OUT IF GAME IS FINSISHED:
  //if (key == 'r') {
  //  switch_val = 0;
  //}

  //if (key == 't') {
  //  switch_val = 2;
  //}


  //if (key == 'u') {
  //  switch_val = 1;
  //}


  //if (key == 'y') {
  //  switch_val = 9;
  //}
}



void keyReleased() {

  if (computer == false) {
    if (key == CODED) {
      if (keyCode == LEFT  ) {
        player1.moving_left = false;
      }

      if (keyCode == RIGHT) {
        player1.moving_right = false;
      }
    }
  }

  if (computer == true) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        player1.moving_left = false;
      }

      if (keyCode == RIGHT) {
        player1.moving_right = false;
      }
    }
  }


  if (computer == false) {
    if (key == 'd' || key == 'D') {
      enemy1.moving_right = false;
      enemy2.moving_right = false;
      enemy3.moving_right = false;
    }

    if (key == 'a' || key == 'A') {
      enemy1.moving_left = false;
      enemy2.moving_left = false;
      enemy3.moving_left = false;
    }
  }
}

/* This source code is copyrighted materials owned by the UT system and cannot be placed 
into any public site or public GitHub repository. Placing this material, or any material 
derived from it, in a publically accessible site or repository is facilitating cheating 
and subjects the student to penalities as defined by the UT code of ethics. */ //<>//

class Ship extends GameObject
{
  float rotInc = .08;
  float direction;
  float accel = 80;
  float energy, restore, deplete;
  int shipDirector = 0;

  Ship(PApplet applet, int xpos, int ypos)  //constructor
  {
    super(applet, "ships3.png", 2, 2, 50);

    direction = 0;
    energy = 1;
    restore = .0075;
    deplete = .25;
    
    tag = this;
    setXY(xpos, ypos);
    setVelXY(0, 0);
    setScale(.5);
    setFrame(0);

    // Domain keeps the moving sprite withing specific screen area 
    setDomain(0, 0, applet.width, applet.height, Sprite.REBOUND);
  
  }
  
  void update() 
  {
    processKeys();

    energy += restore;
    if(energy > 1) energy = 1;
    if(energy < 0) energy = 0;
  }

  void drawOnScreen()
  {
    // Draw a filled rectangle representing the ship's energy.
    float xpos = (float)getX() + 20;
    float ypos = (float)getY() - 40;
    float h = 10;

    fill(0);
    stroke(255);
    rect( xpos, ypos, 40, h);
    fill(255);
    
    float w = energy * 40;
    rect( xpos, ypos, w, h);
  }
  
  void processKeys() 
  {
    if (focused) {
      
      if (kbController.isUp()) {
        shipDirector = 0;
        setFrame(1);
        setAcceleration(accel, direction - 1.5708);
      } else {
        setFrame(0);
        setAcceleration(0);
      }
      if (kbController.isDown()) {
        setFrame(3);
        setAcceleration(accel, direction + 1.5708);
        shipDirector = 1;
      }
      else if (!kbController.isDown() && shipDirector == 1){
        setFrame(2);
        setAcceleration(0);
      }
      if (kbController.isRight()) {
        direction += rotInc;
        setRot(direction);
      }

      if (kbController.isLeft()) {
        direction -= rotInc;
        setRot(direction);
      }
    }
  }
}


/*************************************************/


class Missile extends GameObject
{
  long createdTime;

  Missile(PApplet applet, int xpos, int ypos) 
  {
    super(applet, "missile.png", 40);

    setXY(xpos, ypos);
    setVelXY(0, 0);
    setScale(.75);

    createdTime = System.currentTimeMillis();
    soundPlayer.playMissileLaunch();
  }

  void update() 
  {
    long currentTime = System.currentTimeMillis();
    // Run missile for 3 seconds
    if ((currentTime - createdTime) > 3000) {
      setDead(true);
    }
  }
}

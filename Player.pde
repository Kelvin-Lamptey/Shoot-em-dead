

import processing.sound.*;

class Player
{
  PVector size = new PVector(0, 0);
  float power = 5;
  float posy;
  float posx, pos;
  float bombnum = 5;
  float xp, yp;
  float speed = 2;
  int health, gs;
  int maxHealth = 1000;
  PImage image;
  boolean dead,superSpeed= false;
  Animation anim;
  SoundFile shootS;
  Projectile lb;
  String ts;
  Projectile[] lbs = new Projectile[0];
  Player( float x, float y, PVector csize, Enemy[] enemies, String st)
  {
    size = csize;
    posx = x;
    posy = y;
    pos = posy;
    health = maxHealth;
    gs=1;
    //shootS = new SoundFile(this,"laser.mp3");
    image = loadImage(st);
    image.resize(int(csize.x), int(csize.y));
    anim = new Animation( "exhaust", 4, true);
  }
  void display()
  {
    pushMatrix();
    if ( mousePressed == true)
    {
      shoot();
    }
    if (posx > width-(size.x/2))
    {
      posx = width-((size.x/2));
    }
    if (posx < (size.x/2))
    {
      posx = (size.x/2);
    }
    if (posy > height-(size.y/2))
    {
      posy = height-((size.y/2));
    }
    if (posy < (size.y/2))
    {
      posy = (size.y/2);
    }
    //rotate(radians(45));
    posx += (mj.value.x*( frameRate/5)*speed);
    posy += (mj.value.y*( frameRate/5)*speed);
    anim.display( posx+10, posy+60);
    image( image, posx-64, posy-64);
    popMatrix();
    //println( posx);

    if ( superSpeed == true)
    {
      for ( int i=0; i < enemies.length; i++)
      {
        if (enemies [i]!= null)
        {
          enemies[i].speed = .3;
        }
      }
      pl.speed = .5;
      pushStyle();
      fill(0, 0, 0, 0.4);
      if (mj.value.x != 0)
      {
        image( image, posx-(32/2), posy-(32/2));
        //image( image, posx-32, posy-32);
      }
      popStyle();
    } else {
      for ( int i=0; i < enemies.length; i++)
      {
        if (enemies [i]!= null)
        {
          enemies[i].speed = 1;
        }
      }
      pl.speed = 1;
    }
  }
  void bomb()
  {
    for (int i =0; i < enemies.length; i++)
    {
      if (enemies[i] != null)
      {
        enemies[i].TakeDamage(100);
      }
    }
  }
  void shoot()
  {
    for (int i=0; i < maxTouchEvents; i++)
    {
      if (mt[i].touched == true)
      {
        if (mt[i].motionX > width /2 && mt[i].busy == false)
        {
          //shootS.play();
          mt[i].busy = true;
          pushStyle();
          stroke(227, 210, 44);
          strokeWeight(power*2);

          if (gs==1)
          {
            line(posx+25, posy, posx+25, 0);
          } else if (gs==2)
          {
            line(posx-15, posy, posx-15, 0);
            line(posx+45, posy, posx+45, 0);
          } else {
            line(posx, posy, random(0, width), 0);
          }
          kill();
          popStyle();
          mt[i].busy = false;
          //s.stop();
        }
      }
    }
    if(health<=0)
    {
      dead=true;
    }
  }
  void takeDamage( int damage)
  {
    if (health>0)
    {
      health -= damage;
    }
  }
  void kill()
  {
    for (int i =0; i < enemies.length; i++)
    {
      if (enemies[i] != null )
      {
        if (enemies[i].died == false)
        {
          if (enemies[i].posx>(posx)-((enemies[i].size.x/2)/2) && enemies[i].posx<(posx)+((enemies[i].size.x/2)/2) && enemies[i].posy < posy-(size.y/2))
          {
            enemies[i].TakeDamage(int(round(power)));
          } else {
          }
        }
      }
    }
    for (bomb b : bombs)
    {
      if (b!=null)
      {
        if (b.xpos>posx-100&&b.xpos<posx+100)
        {
          b.explode=true;
        }
      }
    }
  }
}


class Joystick
{
  float xpos;
  float ypos;
  float typos;
  float txpos;
  float size;
  float sp = 100;
  PVector value = new PVector();
  boolean move = false;
  Joystick(float x, float y, float csize)
  {
    for (int i=0; i < maxTouchEvents; i++) {
      mt[i] = new MultiTouch();
    }

    xpos = x;
    ypos = y;
    size = csize;
    txpos = xpos;
    typos = ypos;
  }
  void display()
  {
    if (timeScale > 0)
    {
      pushMatrix();
      pushStyle();
      fill(255, 255, 255, 0.1);
      rectMode(CENTER);
      stroke(0);

      value.x = (txpos-xpos)/sp;
      value.y = (typos-ypos)/sp;
      if ( over())
      {
        move = true;
      } else {
        move = false;
      }
      ellipse( xpos, ypos, size, size);
      if ( move == true)
      {
        if (mousePressed == true)
        {
          for (int i=0; i < maxTouchEvents; i++)
          {
            if (mt[i].touched == true && mt[i].busy == false)
            {
              mt[i].busy = true;
              if (mt[i].motionX <= xpos+sp && mt[i].motionX >= xpos-sp)
              {
                txpos = mt[i].motionX;
              }
              if (mt[i].motionY <= ypos+sp && mt[i].motionY >= ypos-sp)
              {
                typos = mt[i].motionY;
              }
              mt[i].busy = false;
            }
          }
        }
      }

      popStyle();
      pushStyle();
      fill(255, 255, 255);
      ellipse( txpos, typos, size/2, size/2);
      popStyle();
      popMatrix();
      if (mouseReleased==true && over()==false)
      {
        leaveMe();
      }
      if(mouseReleased==true)
      {
        leaveMe();
      }
    }
  }


  // Test to see if mouse is over this Joystick button
  boolean over()
  {
    boolean isOver = false;
    for (int i=0; i < maxTouchEvents; i++)
    {
      if ( mt[i].touched == true)
      {
        float disX = xpos - mt[i].motionX;
        float disY = ypos - mt[i].motionY;
        if (sqrt(sq(disX) + sq(disY)) <(size / 2) )
        {
          isOver = true;
        } else {
          isOver = false;
        }
      }
    }
    return isOver;
  }

  public void leaveMe()
  {
    move = false;
    typos = ypos ;
    txpos = xpos ;
  }
}
class Projectile
{
  float xpos, ypos;
  int speed=5,explac=0;
  int w, h;
  Animation pa,pea;
  String prefix,exploprefix="";
  int t;
  boolean stop=false,offScreen = false;
  Projectile(String imgprefix, int count, float x, float y)
  {
    pa=new Animation(imgprefix, count, true);
    prefix = imgprefix;
  }
  Projectile(String imgprefix, int count, float x, float y, int wi, int hi, int type)
  {
    pa=new Animation(imgprefix, count, false);
    pa.scl(64, 64);
    prefix = imgprefix;
    w = wi;
    h = hi;
    xpos = x;
    ypos = y;
    t=type;
  }
  void display()
  {
    if(pea==null && exploprefix !="")
    {
      pea = new Animation(exploprefix,explac,false);
    }
    offScreen = ((xpos>width+100||xpos<0) || (ypos>height+100||ypos<0));
    pa.scl(64, 64);
    if(stop==false)
    {
      ypos+=(speed*t);
    }
    if (pa.hasStop==true && stop == false)
    {
      pa.shwDImg(prefix+"asset.png", xpos, ypos);
      pa.sclt(64, 64);
    }
    pa.display(xpos, ypos);

    hurt();
  }
  void hurt()
  {
    if( (pl.posx>xpos-(pl.size.x/2)&&pl.posx<xpos+(pl.size.x/2)) && ((pl.posy)>ypos-(pl.size.y/2)&&pl.posy<ypos+(pl.size.y/2)))
    {
      pl.takeDamage(100);
      
      //draw hit effect
      stop = true;

      if(pea!= null)
      {
        pea.display(xpos,ypos);
      }
    }
  }
}


class Enemy
{
  PVector size=new PVector();
  float posy;
  float posx;
  boolean candie,died = false;
  float pos;
  int health = 1;
  int htu;
  float speed = 2;
  PImage image;
  int picnum;
  Animation exploanim;
  Animation exhaustanim;
  healthBar ehb;
  boolean eloop = true;
  Projectile lb;
  boolean offScreen = false;
  Projectile[] lbs = new Projectile[0];
  Enemy( float x, float y, PVector csize, int chealth)//, int cel)
  {
    size = csize;
    posx = x;
    posy = y;
    pos = posy;
    candie=false;
    picnum = round(random(0.0, 4.0));
    image = loadImage("enemy"+str(int((picnum)))+".png");
    image.resize( int(csize.x), int(csize.y));
    exploanim = new Animation( "Explosion1_", 11, false);
    exhaustanim = new Animation( "exhaust"+str(int(picnum))+"_", 4, eloop);
    health = chealth*(picnum+1);
    htu = health;
    ehb = new healthBar();
  }
  void display()
  {
    pushStyle();
    pushMatrix();
    candie=exploanim.hasStop;
    offScreen = (posy>height+10);
    ehb.value= toPercent(health, htu);
    fill(255, 0, 0);
    if ( health <= 0)
    {
      died = true;
    }
    if (died != true)
    {
      image( image, posx-(64), posy-(64));
      exhaustanim.display( posx, posy-(exhaustanim.getHeight()+10));
      
    } else {
      if ( eloop == true)
      {
        eloop = false;
        deadEnemies = (Enemy[])append( deadEnemies, this);
      }
      exploanim.display( posx, posy);
    }
    for (Projectile p : lbs)
    {
      p.display();
      if (p!= null)
      {
        if (p.offScreen == true)
        {
          p = null;
        }
      } else {
        //lbs=(Projectile[])shorten(arrArr(lbs));
      }
    }
    if(offScreen==true)
    {
      died=true;
    }
    posy+=speed;
    popStyle();
    popMatrix();
  }

  void kill()
  {
    if (pl != null)
    {
      //pl.TakeDamage(int(round(picnum)));
    }
  }
  void shoot()
  {
    if (true)
    {
      lb=new Projectile("shot1_", 4, posx, posy-(image.height/2), 10, 10, 1);
      lb.explac=5;
      lb.exploprefix="shot1_exp";
      lbs=(Projectile[])append(lbs, lb);
      if(pl.posx>posx-(pl.size.x/2)&&pl.posx<posx+(pl.size.x/2))
      {
        kill();
      }
    }
  }

  void TakeDamage( int damage)
  {
    health -= damage;
    if(died==false)
    {
      ehb.display(posx,posy-(exhaustanim.getHeight()+20),image.width*1.5,(image.width*1.5)/4);
    }
  }

}

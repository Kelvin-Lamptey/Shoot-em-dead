

class mainScene implements Scene
{
  //boolean pause = false;
  Enemy enm;
  Animation pb2;
  PVector s=new PVector(164, 164);
  String n;
  PVector siz= new PVector(200, 200);
  PImage hbi;
  obj go;
  obj[] gos;
  bomb bo;
  mainScene()
  {
    constructor();
  }
  void constructor()
  {
    tt = 0;
    est=0;
    el=0;
    esst=0;
    gos = new obj[0];
    bombs=new bomb[0];
    hbi=loadImage("Health_Bar_Table.png");
    enemies = new Enemy[0];
    deadEnemies = new Enemy[0];
    mj = new Joystick(width/4, (height/4)*3, 200);
    pl = new Player( width/2, height/2, s, enemies, chpl);
    pl.gs=plgn[chpln];
    pb = new Button(100, 100, "Pause_BTN.png");
    hb = new healthBar();
    bgi = loadImage("Window.png");
    bgi.resize(width/2, (height/2)+200);
    ph = loadImage("Header_pause.png");
    ph.resize(200, 100);
    mmb = new Button(100, 100, "Menu_BTN.png");
    plb = new Button(100, 100, "Play_BTN.png");
    sttb = new Button(100, 100, "Settings_BTN.png");
    rtb = new Button(100, 100, "Replay_BTN.png");
    clb = new Button(100, 100, "Close_BTN.png");
  }
  void display()
  {
    frameRate(60);
    background(mbg);
    if ( tt == 0 )
    {
      tt = frameCount;
    }

    if (frameCount == tt+100)
    {
      enm = new Enemy(random(64, width-64), 0, s, int(round(random(40, 100))));
      enemies = (Enemy[])append(enemies, enm);
      el++;
      if(int(round(random(0,2)))==1)
      {
        go = new obj(allgo[int(round(random(0,allgo.length-1)))],100,100);
        gos=(obj[])append(gos,go);
      }
      if(int(round(random(0,2)))==1)
      {
        int num=int(round(random(0,allbombs.length-1)));
        bo = new bomb(allbombs[num],allebombs[num],abn[num],abne[num],loadImage(allbombs[num]+"000.png").width-(100),loadImage(allbombs[num]+"000.png").height-100);
        bombs=(bomb[])append(bombs,bo);
      }
      tt=frameCount;
    }
    if ( est == 0 )
    {
      est = frameCount;
      esst=random(300);
    }
    for (int i=0; i<enemies.length; i++)
    {
      if (enemies[i] != null)
      {
        if (frameCount == est+200+(enemies[i].picnum*2) && enemies[i].died==false)
        {
          enemies[i].shoot();
          est=frameCount;
        }
      }
    }
    if ( frameCount > 1000 && frameCount < 2000)
    {
      //pl.superSpeed = true;
    } else {
      pl.superSpeed = false;
    }

    for(int i=0;i<gos.length;i++)
    {
      gos[i].display();
    }
    for(int i=0;i<bombs.length;i++)
    {
      bombs[i].display();
    }
    for ( int i=0; i < enemies.length; i++)
    {
      if (enemies [i]!= null)
      {
        enemies[i].display();
        if (enemies[i].offScreen == true)
        {
          enemies[i] = null;
        }
      } else {
        //enemies=(Enemy[])shorten(arrArr(enemies));
      }
    }
    pl.display();
    mj.display();
  }
  void endGame()
  {
    pause = false;
    timeScale = 1;
    if ( deadEnemies.length > int(readln("highscore.kel", 0)))
    {
      String[] hs = {str(deadEnemies.length)};
      saveln("highscore.kel", hs);
    }
    mSceneMg.loadScene(1);
  }
  void displayUI()
  {
    textSize(35);
    pb.display(width - 200, 100);

    image(hbi, 100-(hbi.width/2), 100-(hbi.height/2));
    hb.value = (pl.health*100)/pl.maxHealth;
    hb.display(100, 100, 400, 100);
    //text(str(el)+"/"+str(enemies.length), width/5, height/3);

    text(pl.health/10,100,100);

    text("score", width/5*4, height/3);
    text(deadEnemies.length, width/5*4, height/3+70);
    if (pb.mousePressedb == true)
    {
      pb.imgpth = "Pause_BTN1.png";
      pb.buttImg = null;
    } else {
      pb.imgpth = "Pause_BTN0.png";
      pb.buttImg = null;
    }
    if (pb.mouseReleasedb == true)
    {
      pause = !pause;
    }
    if (pause== true)
    {
      pause();
    } else
    {
      resume();
    }
    if (rtb.mouseReleasedb == true)
    {
      endGame();
    }
    if (mmb.mouseReleasedb == true)
    {
      pause = false;
      timeScale = 1;
      mSceneMg.loadScene(0);
    }
    if (clb.mouseReleasedb == true)
    {
      pause = false;
    }
  }
  void pause()
  {
    timeScale = 0;

    //display pause menu
    pUI();
  }
  void resume()
  {
    timeScale = 1;
  }
  void showStts()
  {
    //music
    //sound
  }
}
void pUI()
{
  image(bgi, width/2-(bgi.width/2), height/2-(bgi.height/2));
  image(ph, width/2-(ph.width/2), height/2-(bgi.height/3));
  clb.display((width/2), (height/2-(bgi.height/2))+500);
  rtb.display((width/2)-200, (height/2)+50);
  sttb.display((width/2), (height/2)+50);
  mmb.display((width/2)+200, (height/2)+50);
}









class fScene implements Scene
{
  fScene ()
  {
    constructor();
  }
  void constructor()
  {
    fsb = new Button("Start");
    feb = new Button("Exit");
    textAlign( CENTER);
    textSize( 50);
  }
  void display()
  {
    background(200);
  }
  void displayUI()
  {
    fsb.display( width/3, height/2);
    feb.display((width/3)*2, height/2);

    if (feb.mouseReleasedb)
    {
      System.exit(1);
    }
    if (fsb.mouseReleasedb)
    {
      mSceneMg.loadScene(1);
    }
  }
}






class startScene implements Scene
{
  Button mb, ib;
  startScene()
  {
    constructor();
  }
  void constructor()
  {
    sb=new Button(200, 100, "Start_BTN.png");
    ob=new Button(100, 100, "Settings_BTN.png");
    eb=new Button(200, 100, "Exit_BTN.png");
    mb=new Button(200, 100, "Map_BTN.png");
    ib=new Button(100, 100, "Info_BTN.png");
  }
  void display()
  {
    background(sbg);
    pushStyle();
    fill(0);
    textAlign( CENTER);
    textSize( 50);

    popStyle();
  }
  void displayUI()
  {
    sb.display(width/2, height/5*2);
    mb.display(width/2, height /5*3);
    eb.display(width/2, height /5*4);

    ob.display(width-100, 100);
    ib.display(100, 100);
    if (eb.mouseReleasedb == true)
    {
      System.exit(1);
    }
    if (sb.mouseReleasedb == true)
    {
      mSceneMg.loadScene(3);
    }
  }
}







class mdScn implements Scene
{
  Button plyb, bkb, survival, mtps;
  mdScn()
  {
    constructor();
  }
  void constructor()
  {
    plyb = new Button(100, 100, "Play_BTN.png");
    bkb = new Button(100, 100, "Close_BTN.png");
    survival = new Button(300, 300, "Window.png", true);
    mtps=new Button(320, 300, "Window.png", true);
  }
  void display()
  {
    background(sbg);
  }
  void displayUI()
  {
    survival.display(width/4*2, height/2);
    mtps.display(width/4*3, height/2);
    bkb.display(width/2, height/4*3);
    pushStyle();
    pushMatrix();
    fill(255);
    textSize(35);
    textAlign(CENTER);
    text("Survivor", width/4*2, height/2);
    text("Multiplayer", width/4*3, height/2);
    popMatrix();
    popStyle();
    //plyb.display(width/3,height/2);
    if (bkb.mouseReleasedb == true)
    {
      mSceneMg.loadScene(0);
    }
    if (survival.mouseReleasedb == true)
    {
      mSceneMg.loadScene(5);
      nu=1;
    }
    if (mtps.mouseReleasedb == true)
    {
      mSceneMg.loadScene(5);
      nu=4;
    }
  }
}




class ssmScn implements Scene
{
  Button plyb, bkb;
  ssmScn()
  {
    constructor();
  }
  void constructor()
  {
    //plyb = new Button(100, 100, "Play_BTN.png");
    bkb = new Button(100, 100, "Close_BTN.png");
  }
  void display()
  {
    background(sbg);
  }
  void displayUI()
  {
    bkb.display(width/2, height/4*3);
    if (bkb.mouseReleasedb==true)
    {
      mSceneMg.loadScene(3);
    }
  }
}



class chPl implements Scene
{
  int w=10;
  int h=250;
  int wo=120;
  int ho = 120;
  float x=width/2;
  float y=height/2;
  int[][] rows = new int[2][1];
  chPl()
  {
    constructor();
    rows[0]=append(rows[0], 200);
  }
  void constructor()
  {
    /*for(int i=0;i<pls.length;i++)
     {
     if(rows[0][rows[0].length-1]+200 <width)
     {
     rows[0]=append(rows[0],(width/2)-((700/2)-(i*100)));
     }else{
     rows[1]=append(rows[1],(width/2)-((700/2)-(100+1)));
     }
     }*/
  }
  void display()
  {
    background(sbg);
  }
  void displayUI()
  {
    pushMatrix();
    pushStyle();
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(50);

    text("CHOOSE YOUR SPACESHIP", width/2, height/4);
    if (true)
    {
      drawRow(0);
      for (int j=0; j<pls.length%w; j++)
      {
        float x = (width/2)-((pls.length%w)*wo)/2+j*wo;
        rect(x, height/2+ho, wo, ho);
        PImage pi = loadImage(pls[j+10]);
        pi.resize( wo, ho);
        image(pi, x-(pi.width/2), (height/2)+ho-(pi.height/2));
        if (mousePressed == true)
        {
          if (overRect(x, height/2+ho, wo, ho)==true)
          {
            chpl=pls[j+10];
            chpln=j+10;
            mSceneMg.loadScene(nu);
          }
        }
      }
    }

    popMatrix();
    popStyle();
  }
  void drawRow(float h)
    {
      for (int j=0; j<w; j++)
      {
        float x = (width/2)-((wo*w)/2)+(j*wo);
        PImage pi = loadImage(pls[j]);
        pi.resize(wo, ho);
        rect(x, height/2+h, wo, ho);
        image(pi, x-(pi.width/2), (height/2+h)-(pi.height/2+h));
        if (mousePressed == true)
        {
          if (overRect(x, height/2+h, wo, ho)==true)
          {
            chpl=pls[j];
            chpln=j;
            mSceneMg.loadScene(nu);
          }
        }
      }
    }
}

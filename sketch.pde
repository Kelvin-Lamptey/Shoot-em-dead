//import processing.sound.*;
Joystick mj;
//SoundFile s;
bomb[] bombs;
float tt;
int el,nu,chpln;
String[] pls = {"player.png","Spaceship_01_BLUE.png","Spaceship_02_BLUE.png","Spaceship_03_BLUE.png","Spaceship_04_BLUE.png","Spaceship_05_BLUE.png","Spaceship_06_BLUE.png", "Spaceship_01_RED.png","Spaceship_02_RED.png","Spaceship_03_RED.png","Spaceship_04_RED.png","Spaceship_05_RED.png","Spaceship_06_RED.png","Spaceship_01_GREEN.png","Spaceship_02_GREEN.png","Spaceship_03_GREEN.png","Spaceship_04_GREEN.png","Spaceship_05_GREEN.png","Spaceship_06_GREEN.png",};
String[] allgo={"Meteor_01.png","Meteor_02.png","Meteor_03.png","Meteor_04.png","Meteor_05.png","Meteor_06.png","Meteor_07.png","Meteor_08.png","Meteor_09.png","Meteor_10.png"};
String[] allbombs={"Bomb_1_Idle_","Bomb_2_Idle_","Bomb_3_Idle_"};
String[] allebombs={"Bomb_1_Explosion_","Bomb_2_Explosion_","Bomb_3_Explosion_"};
int[] abn={10,10,10};
int[] abne ={9,9,9};
int[] plgn ={1,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2};
boolean hosting,connecting,mouseReleased,over=false,pause,keyP;
PImage bg,mbg,sbg,bgi;
sceneMg mSceneMg;
Scene mScene,fnScene,mstartScene,modeScn,mtplScn,charSScn;
Button sb,ob,pb,eb,feb,fsb,backb,okbtn,clbtn,stsb;
Button clb, rtb, plb, sttb, mmb;
int[] enemiesr=new int[10];
Enemy[] enemies;// = new Enemy[100];
Enemy[] deadEnemies ;//= new Enemy[0];
Player pl;
healthBar hb;
PFont suif;
String[] users={"pl1"};
String curuser="";
String chpl="player.png";
public boolean hasana=false;


void setup()
{
  fullScreen();
  //orientation(LANDSCAPE);
  for (int i=0; i < maxTouchEvents; i++)
  {
    mt[i] = new MultiTouch();
  }

  mSceneMg = new sceneMg();
  mScene = new mainScene();
  fnScene = new fScene();
  modeScn = new mdScn();
  mtplScn = new ssmScn();
  charSScn = new chPl();
  mstartScene = new startScene();
  mSceneMg.add( mstartScene);
  mSceneMg.add( mScene);
  mSceneMg.add( fnScene);
  mSceneMg.add( modeScn);
  mSceneMg.add(mtplScn);
  mSceneMg.add(charSScn);

  bg = loadImage("battleground.png");
  sbg = loadImage("BG.png");
  mbg = loadImage("battleground2.png");//+str(int(round(random(0,3))))+".png");
  if (bg.width != width || bg.height != height)
   {
     bg.resize(width, height);
   }
   if (sbg.width != width || sbg.height != height)
   {
     sbg.resize(width, height);
   }
   if (mbg.width != width || mbg.height != height)
   {
   mbg.resize(width, height);
   }
   stsb=new Button(500,100);
  //s = new SoundFile(this, "laser.wav");
  /*suif=createFont("ethnocentric rg.ttf",100);
  textFont(suif,100);*/
  
  okbtn=new Button(100,100,"Ok_BTN.png");
  clbtn=new Button(100,100,"Close_BTN.png");
}


void draw()
{
  //background( 200);
  //frameRate(60);
  wsb(str(frameRate));

  mSceneMg.update();
  mouseReleased = false;
  keyP=false;
  stsb.display(500,height-150);
}

void mouseReleased ()
{
  mouseReleased = true;
}

void backPressed()
{
  pause =true;
  println("Bye");
}
void keyPressed()
{
  keyP=true;
}
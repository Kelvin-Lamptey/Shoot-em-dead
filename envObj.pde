class obj
{
  String imgpth;
  PImage img;
  float xpos,ypos;
  int w,h;
  boolean offScreen=false;
  obj(String fn,int wi,int he)
  {
    imgpth=fn;
    img=loadImage(fn);
    img.resize(wi,he);
    ypos=0;
    xpos=random(0,width);
  }
  void display()
  {
    ypos+=0.5;
    image(img,xpos,ypos);
    
    offScreen = (ypos>height+10);
    
  }
}
class bomb
{
  float xpos=random(0,width),ypos;
  int w,h,i=0;
  Animation idlanim,exploanim;
  boolean offScreen,died,explode = false;
  bomb(String fn,String efn,int count1,int count2,int wi,int hi)
  {
    idlanim=new Animation(fn,count1,true,"",3);
    idlanim.scl(wi,hi);
    exploanim=new Animation(efn,count2,false,"",3);
    exploanim.scl(wi,hi);
  }
  void display()
  {
    ypos+=0.5;
    if(explode==false)
    {
      idlanim.display(xpos,ypos);
    }else{
      if(i == 0)
      {
        pl.bomb();
        i = 1;
      }
      exploanim.display(xpos,ypos);
     died=exploanim.hasStop;
    }
    offScreen = (ypos>height+10);
  }
}
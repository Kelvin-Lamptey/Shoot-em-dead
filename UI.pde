class Button
{
  String text;
  int textSize= 70;
  int shape = 0;
  int pad=100;
  boolean mousePressedb, mouseReleasedb, active, scle;
  PImage buttImg;
  String imgpth = "";
  int w, h, pw, ph;
  Button(String t)
  {
    text = t;
    active = false;
    scle = false;
  }
  Button(int wi, int hi)
  {
    text="";
    w = wi;
    h = hi;
    pw = wi;
    ph = hi;
    active = false;
    scle = false;
  }
  Button(int wi, int hi, String fn)
  {
    text="";
    w = wi;
    h = hi;
    pw = wi;
    ph = hi;
    active = false;
    imgpth = fn;
    scle = false;
  }
  Button(int wi, int hi, String fn, boolean se)
  {
    text="";
    w = wi;
    h = hi;
    pw = wi;
    ph = hi;
    active = false;
    imgpth = fn;
    scle = se;
  }
  void display( float x, float y)
  {
    active = true;
    if (text != "")
    {
      w = int(ceil(textWidth(text))) + pad;
      h = textSize*2;
    }
    if (buttImg == null && imgpth != "")
    {
      buttImg = loadImage(imgpth);
      buttImg.resize(w, h);
    }
    pushStyle();
    pushMatrix();
    fill(255);
    rectMode (CENTER);
    if (imgpth == "")
    {
      switch(shape)
      {
      case 0:
        rect(x, y, w, h);
        mousePressedb = overRect(x, y, w, h);
        break;
      case 1:
        ellipse(x, y-textSize/3, w, w);
        mousePressedb = bOver(x, y, w);
        break;
      }
    } else {
      image(buttImg, x-(w/2), y-(h/2));
      if (buttImg.width != w || buttImg.height != h)
      {
        buttImg.resize(w, h);
      }
      mousePressedb = overRect(x, y, w, h);
      if (overRect(x, y, w, h)==true)
      {
        if (mouseReleased==true)
        {
          mouseReleasedb = true;
        } else {
          mouseReleasedb = false;
        }
      }
    }
    if (scle == true)
    {
      if (mousePressedb == true)
      {
      } else {
        /*if (w != pw && h!=ph)
         {
         w=pw;
         h=ph;
         }*/
      }
    }
    fill(0);
    textAlign(CENTER);
    textSize(textSize);
    text(text, x, y+10);
    popMatrix();
    popStyle();
  }
}
class healthBar
{
  float value = 0;
  int minValue = 0;
  int maxValue = 1;
  PImage bg;
  //color fill = new color(255);
  int fill=0;
  String imgpth;
  healthBar()
  {
  }
  healthBar(String fn)
  {
    imgpth=fn;
    bg = loadImage(fn);
  }
  void display(float xpos, float ypos, float w, float h)
  {
    pushMatrix();
    pushStyle();

    //image
    if (bg != null)
    {
      if (bg.width!=int(w)||bg.height!=int(h))
      {
        bg.resize(int(w+50), int(h)+15);
      }
      image(bg, xpos-(bg.width/2), ypos-(bg.height/2));
    } else {

      rectMode(CENTER);
      fill(0, 0, 0, 0);
      rect(xpos, ypos, w, h);
    }
    rectMode(CORNER);
    fill(255, fill, fill);
    rect(xpos-(w/2.0), ypos-(h/2), ((value/100)*w), h);
    popMatrix();
    popStyle();
  }
}
boolean bOver( float mx, float my, float msize)
{
  boolean isOver = false;
  if (mousePressed)
  {
    for (int i=0; i < maxTouchEvents; i++)
    {
      if ( mt[i].touched == true && mt[i].busy == false)
      {
        mt[i].busy = true;
        float disX = mx - mt[i].motionX;
        float disY = my - mt[i].motionY;
        if (sqrt(sq(disX) + sq(disY)) <(msize / 2) )
        {
          isOver = true;
        } else {
          //isOver = false;
        }
        mt[i].busy = false;
      }
    }
  }
  return isOver;
}
boolean overRect(float x, float y, float width, float height)
{
  if (mouseX >= x - width/2 && mouseX <= x + width/2
    && mouseY >= y - height/2 && mouseY <= y + height/2)
  {

    return true;
  } else {
    return false;
  }
}
boolean overRect1(float x, float y, float width, float height,float xp,float yp)
{
  if (xp >= x - width/2 && xp <= x + width/2
    && yp >= y - height/2 && yp <= y + height/2)
  {

    return true;
  } else {
    return false;
  }
}

void wsb(String txt)
{
  stsb.text=txt;
}

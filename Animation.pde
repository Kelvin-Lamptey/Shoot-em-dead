
class Animation
{
  PImage[] images;
  int imageCount;
  int frame;
  PImage ti;
  boolean stop = false;
  boolean mloop;
  boolean hasStop = false;
  Animation(String imagePrefix, int count,boolean loop)
  {
    mloop = loop;
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++)
    {
      String filename = imagePrefix + nf(i, 1) + ".png";
      images[i] = loadImage(filename);
    }
  }
  Animation(String imagePrefix, int count,boolean loop,String add,int pit)
  {
    mloop = loop;
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++)
    {
      String filename = imagePrefix + nf(i, pit) +add+ ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos)
  {
    frame = (frame+1) % imageCount;
    if ( stop == false)
    {
      image(images[frame], xpos-(images[frame].width/2), ypos-(images[frame].height/2));
    }
    if ( frame == 0 )
    {
      stop = !mloop;
      hasStop = true;
    }
  }
  void scl(int w,int h)
  {
    for(PImage pi:images)
    {
      pi.resize(w,h);
    }
  }
  void shwImg(float xpos, float ypos)
  {
    image(images[0],xpos-(images[0].width/2),ypos-(images[0].height/2));
  }
  void sclt(int w,int h)
  {
    if(ti!=null)
    {
      ti.resize(w,h);
    }
  }
  void shwDImg(String fn,float x,float y)
  {
    if(ti==null)
    {
      ti=loadImage(fn);
    }
    image(ti,x,y);
  }

  int getWidth()
  {
    return images[0].width;
  }
  float getHeight()
  {
    return images[0].height;
  }
}
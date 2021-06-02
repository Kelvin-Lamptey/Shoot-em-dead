
import android.view.MotionEvent;

// Define max touch events.  My phone (seems to) support 5.
int maxTouchEvents = 100;
// This array will hold all of our queryable MultiTouch data:
MultiTouch[] mt=new MultiTouch[maxTouchEvents];         


public boolean surfaceTouchEvent(MotionEvent me)
{
  // Find number of touch points:
  int pointers = me.getPointerCount();
  // Set all MultiTouch data to "not touched":
  for(int i=0; i < maxTouchEvents; i++)
  {
    mt[i].touched = false;
  }
  //  Update MultiTouch that 'is touched':
  for(int i=0; i < maxTouchEvents; i++) {
    if(i < pointers) {
      mt[i].update(me, i);
    }
    // Update MultiTouch that 'isn't touched':
    else {
      mt[i].update();
    }
  }

  // If you want the variables for motionX/motionY, mouseX/mouseY etc.
  // to work properly, you'll need to call super.surfaceTouchEvent().
  return super.surfaceTouchEvent(me);
}

//------------------------------
// Class to store our multitouch data per touch event.

class MultiTouch {
  // Public attrs that can be queried for each touch point:
  float motionX, motionY;
  float pmotionX, pmotionY;
  boolean busy;
  float size, psize;
  int id;
  boolean touched = false;

  // Executed when this index has been touched:
  //void update(MotionEvent me, int index, int newId){
  void update(MotionEvent me, int index) {
    // me : The passed in MotionEvent being queried
    // index : the index of the item being queried
    // newId : The id of the pressed item.

    // Tried querying these via' the 'historical' methods,
    // but couldn't get consistent results.
    pmotionX = motionX;
    pmotionY = motionY;
    psize = size; 

    motionX = me.getX(index);
    motionY = me.getY(index);
    size = me.getSize(index);

    id = me.getPointerId(index);
    touched = true;
  }

  // Executed if this index hasn't been touched:
  void update() {
    pmotionX = motionX;
    pmotionY = motionY;
    psize = size;
    touched = false;
  }
}
int timeScale=1;

interface Scene
{
  public boolean active = true;
  public void display();
  public void displayUI();
  public void constructor();
} 

int currentSceneIndex = 0;
class sceneMg
{
  Scene[] scenes;
  boolean ccall = true;
  private boolean stop = false;
  sceneMg()
  {
    scenes = new Scene[0];
  }

  public  void loadScene(int sceneindex)
  {
    /*try{
      scenes[currentSceneIndex].endScene();
    }finally{
      println("error");
    }*/
    if ( sceneindex < scenes.length )
    {
      if ( scenes[sceneindex] != null && stop == false)
      {
        currentSceneIndex = sceneindex;
        scenes[sceneindex].constructor();
      }
    }
  }
  void update()
  {
    if(timeScale>0)
    {
      scenes[currentSceneIndex].display();
    }else{
      tt=0;
    }
    scenes[currentSceneIndex].displayUI();
  }

  void add( Scene scene)
  {
    scenes = (Scene[])append(scenes, scene);
    //printArray(scenes);
  }

  void handleAllScenes( boolean value)
  {
    stop = value;
  }
}
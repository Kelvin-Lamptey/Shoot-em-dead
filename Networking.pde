String ipadd="127.0.0.1";
Server s;
Client client,c;
boolean ans;
int port=1234567;

void host()
{
  ////hosting=true;
  //create server
  s = new Server(this, port);
  //list all clients
  client = s.available();
  if(client!=null)
  {
    text(client.readString(),200,200);
    if(mousePressed==true)
    {
      s.write("dywtp "+curuser);
    }
  }
  //selected client is prompted
  //if yes open game
  //else list all clients
}
void connect()
{
  //connect to server
  c = new Client(this, ipadd, port);
  c.write(curuser);
  //wait for server
  if(c.available()>0)
  {
    if(c.readString().substring(0,c.readString().indexOf(" "))=="dywtp")
    {
      if(hasana == false)
      {
        ans = window(c.readString().substring(c.readString().indexOf(" "),c.readString().length()-1)+" wants a match");
      }else{
        if(ans==true)
        {
          System.exit(1);
        }else{
          
        }
      }
    }
  }
  //if prompted and
  //accepts:opengame
  //declines:wait for server
}
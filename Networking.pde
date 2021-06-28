String ipadd="127.0.0.1";
Server s;
Client client, c;
boolean ans;
int port=1234;

void host()
{
  ////hosting=true;
  //create server
  if (s==null)
  {
    s = new Server(this, port);
  }
  //list all clients
  client = s.available();
  if (client!=null)
  {
    wsb(client.readString());
    if (mousePressed==true)
    {
      s.write(curuser);
    }
  }
  //selected client is prompted
  //if yes open game
  //else list all clients
}
void connect()
{
  //connect to server
  if (c==null)
  {
    c = new Client(this, ipadd, port);
  }
  c.write(curuser);
  //wait for server
  if (c.available()>0)
  {
    wsb(c.readString());
    /*if( true)
     {
     if(hasana == false)
     {
     ans = window(c.readString()+" wants a match");
     }else{
     if(ans==true)
     {
     System.exit(1);
     }else{
     
     }
     }
     }*/
  }
  //if prompted and
  //accepts:opengame
  //declines:wait for server
}



float toPercent( float v,float ov)
{
  return v/ov*100;
}

Enemy[] arrArr(Enemy[] arr)
{
  Enemy[] marr;
  Enemy[] sarr = new Enemy[0];
  marr=(Enemy[])subset(arr,0);
  
  for(int i=0;i<arr.length;i++)
  {
    if(marr[i] != null)
    {
      sarr=(Enemy[])append(sarr,marr[i]);
    }
  }
  for(int i=0;i<arr.length;i++)
  {
    if(marr[i] == null)
    {
      sarr=(Enemy[])append(sarr,null);
    }
  }
  return sarr;
}

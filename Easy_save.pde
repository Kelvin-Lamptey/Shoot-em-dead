
void saveln(String fn, String[] cnt)
{
  saveStrings(fn, cnt);
  //println("Done saving!");
}
String readln(String fn, int ln)
{
  if (loadStrings(fn) != null)
  {
    return loadStrings(fn)[ln];
  } else {
    return "";
  }
}

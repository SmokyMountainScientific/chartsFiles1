/* getValue tab
*/

void getValue() {
     xVal = float(b)/10;
     yVal = ran1*cos(xVal+ran)*sin((xVal+ran)/ran2);

     xData = append(xData, xVal);     // add data to array
     yData = append(yData, yVal);
     
     b++;
//     print("x value = "+xVal);
  //   println(", y value = "+yVal);
    xMin[runCount] = min(xData);
    xMax[runCount] = max(xData);
    yMin[runCount] = min(yData);
    yMax[runCount] = max(yData);

     delay(100);
/*
  float xVal = float(b)/10;

  float yVal = 100*cos(xVal+ran)*sin((xVal+ran)/3);

  if (b != 0) {
  xData[runCount]= append(xData[runCount], xVal);
  yData[runCount] = append(yData[runCount], yVal);
  }
 print(b+",");
  print(xVal+",");
   print(yVal+",");
 print(xData[runCount][b]);
  print(",");
  println(yData[runCount][b]);
  delay(100);
  b++;
*/
}

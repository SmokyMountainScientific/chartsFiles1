

///   ChartFilesSketch1

import org.gicentre.utils.stat.*;     // needed for charts
  import controlP5.*;                   // needed for text boxes
  import java.io.*;                     // needed for BufferedWriter

  ControlP5 cp5, cp5Txt;
  XYChart[] lineChart = new XYChart[10]; 
  Button overlayB, next, delete;
  Textfield fileName;

float[] xData;
float[] yData;
float[] xMax = {0};
float[] xMin = {0};  //new float[10];
float[] yMax = {0};  //new float[10];
float[] yMin = {0};  //new float[10];
int[] red = {255,0,0,85,0,170,0,170,85,85};
int[] green = {0,0,255,0,85,85,170,0,170,85};
int[] blue = {0,255,0,170,170,0,85,85,0,85};

ArrayList xDataL = new ArrayList();
ArrayList yDataL = new ArrayList();

//float b = 0;
float xVal;
float yVal;
float ran;
float ran1;
float ran2;

float[][] xRecover = new float[10][0];  
float[][] yRecover = new float[10][0];  
String[] sFileName = new String[10];
int runCount = 0;  // experiment count
int b = 0;         // position count within experiment

float chartXMax;
float chartYMax;
float chartXMin;
float chartYMin;

//boolean[] showChart = new boolean[4];
boolean[] showChart = new boolean[10];  // false, false, false, false};

boolean runState;
boolean boolOvr;

PFont font1 = createFont("arial", 16);
PFont font2;
 int select = 0;
 String[] file1 = new String[0];   // = {"xData,yData"};
 String file2;
   String titles;
int selected = #114A55;  // color for selected box
int bckgd = #AA000B;      // background color
  boolean[] selectBox = new boolean[10];
  String warnTxt = "no warning";
  boolean warn = false;
    String data;
    boolean deleted = false;
    int noDels = 0;

void setup() {
  size(850, 550);
font2 = loadFont("ArialMT-16.vlw");
//  xData = new float[1];
  //yData = new float[1];
  chartsSetup();
  setupButtons();
  setupTxtFields();
//  background(#AA000B);
  for (int k = 0; k<10; k++){
    showChart[k] = false;
   selectBox[k] = false;
  }

}

void draw() {
    background(bckgd);
    if (warn == true) {
  fill(255);
  stroke(255);
    textFont(font1,16); 
         text (warnTxt, 50, 50);
  }

       fill(#EADFC9);               // background color
       rect(380, 50, 445, 420);

  //////// 
  for (int m = 0; m<runCount; m++) {
    xRecover[m] = (float[])xDataL.get(m);   // get data from list
    yRecover[m] = (float[])yDataL.get(m);
  }

  chartXMax = max(xMax);
  chartYMax = max(yMax);
  chartXMin = min(xMin);
  chartYMin = min(yMin);
  
  textFont(font1,16);      
  
  /////note that chart[0] is different than other charts, it shows the axes ////////
  ////   chart[0] also displays in real time ///////////////////////////////
  
if (runState == true){   
lineChart[0].setData(xData, yData);
}
if (runState == false && runCount >0){
  lineChart[0].setData(xRecover[runCount-1], yRecover[runCount-1]);
}
setLimits(lineChart[0]);
  lineChart[0].draw(400, 50, 400, 400);


////////////////////// setup and display charts ///////////////
for (int h=0; h<10; h++) {
  int j;
 if (runState == true){
  j = h;
 }
else {
 j = h+1;
}
  if (showChart[h] == true){  // && deleted == false) {      // draw charts
    if(h != 0){      // remember that chart[0] is different than other charts

    lineChart[h].setData(xRecover[runCount-j], yRecover[runCount-j]);  //array out of bounds
    setLimits(lineChart[h]);
    lineChart[h].draw(420, 50, 380, 380);

    }


if (selectBox[h] == true) {
fill(selected);
rect(95,20*h + 285,100,20);    // selection box
fill(255);
}
  legend(j,h*20);         // display legend next to file name
  text(sFileName[h],100,20*h+300);
}
}

if (runState == true){
getValue();

}

}


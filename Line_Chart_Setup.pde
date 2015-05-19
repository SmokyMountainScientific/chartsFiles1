///   ArrayListSketch1, Line_Chart_Setup tab

void chartsSetup(){
  
              ////////////////////////////////gicentre charts///
  lineChart[0] = new XYChart(this);  //(this);
//  lineChart.setData(new float[] {1, 2, 3}, new float[] {1, 2, 3});
lineChart[0].showXAxis(true);
lineChart[0].showYAxis(true);

  lineChart[0].setPointColour(color(234, 28, 28));
  adjust(lineChart[0], true);  

for (int y = 1; y<10; y++) {

  lineChart[y] = new XYChart(this);
  lineChart[y].setPointColour(color(red[y], green[y], blue[y]));
  lineChart[y].setPointSize(5);
  lineChart[y].setLineWidth(2);
//  adjust(lineChart[y], false);
}
}

/////////////////////////////////////////////////end chartsSetup///////////////////////////////////////////////

void adjust(XYChart thing, boolean z) {
//  thing.showXAxis(z);
  //thing.showYAxis(z);
//  thing.setXAxisLabel("injected volume (mL)");
  //thing.setYAxisLabel("pH"); 
//  thing.setYFormat("##.##");  
  //thing.setXFormat("##.##");       
  thing.setPointSize(5);
  thing.setLineWidth(2);
}

void setLimits(XYChart thing) {
          thing.setMaxX(chartXMax);
          thing.setMaxY(chartYMax);
          thing.setMinX(chartXMin);
          thing.setMinY(chartYMin);
}


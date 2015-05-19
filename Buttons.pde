void setupButtons() {

  cp5 = new ControlP5(this);  

  cp5.addButton("runButton")
    .setPosition(20, 100)
      .setSize(30, 30)
        ;

    cp5.addButton("saveRun")     //  was saveButton
      .setPosition(170, 250)
      .setSize(50, 20)
        .setLabel("Save")
          .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)  
            ;
            
  cp5.addButton("delete")     //  was saveButton
      .setPosition(230, 250)
      .setSize(50, 20)
        .setLabel("Delete")
          .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)  
            ;
}

////////// what happens when the button is pressed ?////

public void runButton() {  

  println("holy crap, sombody pressed run");

  if (runState == false && runCount < 10) {      // start run

    showChart[runCount] = true;       
    println("run count = "+runCount);
    getFileName();
    println("file name ="+sFileName[runCount]);

    xMax = append(xMax, 0);
    yMax = append(yMax, 0);
    xMin = append(xMin, 0);
    yMin = append(yMin, 0);
 
    ran = random(0, 10);                // assign random numbers for each run
    ran1 = random(0, 100);
    ran2 = random(0, 5);
    xData = new float[0];              // clear xData and yData arrays between runs
    yData = new float[0];

    b = 0;
    //       logData(file1[runCount], "volume,pH,\n", false);   // log data to file 1, do not append, start new file

    println("runState = true");
  } // end of if runState == false loop

  ///////////////////////
  else if (runState == true && runCount > 8) {
    warnTxt = "files filled, delete runs to continue";
    fill(255);
    warn = true;
    println("warn state = "+warn);
  } 
  
  if (runState == true) {                       // stop run at button press

    println("runState = false");
    xDataL.add (xData);             // enter data files to lists
    yDataL.add (yData);
    xRecover[runCount] = (float[])xDataL.get(runCount);   // get data from list
    yRecover[runCount] = (float[])yDataL.get(runCount);
    showChart[0] = true;

    runCount += 1;
    selectBox[runCount-1]=true; 
    if (runCount > 1) {
      selectBox[runCount-2]=false;
    }
  }
  if (runCount < 10) {
    runState =! runState;
  }
  else {
    runState = false;
  }
}


public void saveRun() {

  int[] select = new int[0];       // create list of files to save
  int[] fileLength = new int[0];    // lengths of data files

  //  int e;
  titles = ",";


  for (int b = 0; b<10; b++) {
    if (selectBox[b] == true) {
      select = append(select, b);
      print("file appended: "+b);
      int c = xRecover[b].length;
      fileLength = append(fileLength, c);
      print(", length = "+c);
      String title = sFileName[b];
      println(", name = "+title);
      titles += title;
      titles += ",,";
    }
  }

  int maxLength = max(fileLength);

  println("maximum file length = "+maxLength);
  println(titles);


  String[] file3 = new String[2];

  file3[0] = titles;  //
  file3[1] ="x data,y data";
  for (int e = 1; e<select.length; e++) {
    file3[1] += ",x data, y data";
  }
  println(file3[1]);
  file1=file3;                  // program freaks if you try to re-initialize file 1

  //////////////// append data to file1
  for (int k = 0; k<maxLength; k++) {    // k = datum number

      data = "";                 // reset data file
      for (int n = 0; n<10; n++) {           // n = file number
         int m = xRecover[n].length;
      if (selectBox[n] == true) {
        if (m > k+1) {

          data += str(xRecover[n][k]);
          data += ",";
          data += str(yRecover[n][k]);
          data += ",";
        } 
        else {
          data += ",,";
        }
      }  // end of selected == true loop
    }  // end of n loop
    println(data);
    file1 = append(file1, data);
  }  
  println("end of k loop");
  println(file1);

   selectOutput("Select a file to save:", "fileSelected");  // from WheeStat code
   
}
/////////////////////////////// from WheeStat code
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {

    file2 = selection.getAbsolutePath();
    println("User selected " + file2);
    try {
      println("second time arround");
      println(file1);
      //  saveStream(file2,file1);
      saveStrings(file2, file1);
    }
    catch(Exception e) {
      println("problem in saveStream");
    }
  }
}


public void delete() {
  warn = false; 
println("file,  SelectBox,  sFileName, showChart");  
       for(int t = 0; t<10; t++){
println(t+",  "+ selectBox[t]+",  "+ sFileName[t]+",  "+ showChart[t]);
     }
          //////////// ///
  for (int b = 9; b>=0; b--) {

    if (selectBox[b] == true) {
      noDels += 1;
      println("file deleted: "+b);
      runCount -= 1;
      println("Run count decremented, run count = " +runCount);
      
      for (int c = b; c<runCount; c++) {
        println("changing values for file "+c);
        xMax[c] = xMax[c+1];
        yMax[c] = yMax[c+1];
        xMin[c] = xMin[c+1];
        yMin[c] = yMin[c+1];
        selectBox[c] = selectBox[c+1];
        sFileName[c] = sFileName[c+1];
        showChart[c] = showChart[c+1];
//        print("showChart "+c);
  //      print(" = "+showChart[c]);
      }
      showChart[runCount] = false;
      selectBox[runCount] = false;
      sFileName[runCount] = "";

      xMax[runCount] = 0;
      yMax[runCount] = 0;
      xMin[runCount] = 0;
      yMin[runCount] = 0; 

      xDataL.remove(b);         // remove data from array lists
      yDataL.remove(b);
 
      println(" through delete loop");
    }
  
    else {
    print("file retained: "+b);
    }
    println(" through loop");
      }
           for (int d = 0; d<10; d++) {
      println("Show Chart "+d+" = "+showChart[d]); 
     }
println("file,  SelectBox,  sFileName, showChart");
for(int t = 0; t<10; t++){
println(t+","+ selectBox[t]+","+ sFileName[t]+","+ showChart[t]);

     }
//  deleted = true;
}

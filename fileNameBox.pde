void setupTxtFields() { 
 cp5Txt = new ControlP5(this);  

 fileName =  cp5Txt.addTextfield("fileName")  // time based txt field
    .setColor(#030302) 
      .setColorBackground(#CEC6C6) 
        .setColorForeground(#AA8A16) 
          .setPosition(60, 250)
            .setSize(90, 20)
              .setFont(font1)
                .setFocus(false)
                    .setText("file");
                /*      controlP5.Label fln = fileName.captionLabel(); 
                        fln.setFont(font);
                          fln.toUpperCase(false);
                            fln.setText("File Name");*/     
}

public void getFileName(){
  println("in getFileName");
/*  String file = cp5Txt.get(Textfield.class,"fileName").getText();
 println("File name = "+file); 
 sFileName[runCount] = file; */
  sFileName[runCount] = cp5Txt.get(Textfield.class,"fileName").getText();   // get file name from textfield.
 int s = runCount + noDels;
 int t = s/10;
 int u = s%10;
// println("line 23");
 char a = char(t+48);
 char b = char(u+48);
 println("runCount = "+runCount);
 sFileName[runCount] = sFileName[runCount] + "_" + a+b;
//  newFile = newFile+"_"+a;
  //fileN[runCount] = newFile;

}

void legend(int k, int off){
//  if(runCount<10){
  translate(0,off);
       fill(#EADFC9);               // background color
       rect(60, 286, 30, 14); 
       stroke(100);
       strokeWeight(2); 
       line(65, 294,85,294);
       stroke(red[runCount-k],green[runCount-k],blue[runCount-k]);  //array out of bounds
       fill(red[runCount-k],green[runCount-k],blue[runCount-k]);
       ellipseMode(CENTER);
       ellipse(70,294,3,3);
       strokeWeight(1);
       stroke(0);
       fill(255);
   translate(0,-off);
//  }
}

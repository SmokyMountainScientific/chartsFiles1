 void mousePressed(){


 for (int q = 0; q<runCount; q++){
   int maxY = 20*q + 305;
   int minY = 20*q + 285;
if (mouseX > 55 && mouseX <195 && mouseY > minY && mouseY < maxY){   //was 95 for min x
  selectBox[q] =! selectBox[q];
}

 }
 for (int r = 0; r<10; r++) {
  if (selectBox[r] == true) {
   print("Select box = "+r);
  println(" is true."); 
  }
 }
 }


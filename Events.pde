public void controlEvent(ControlEvent theEvent) {
//  print("coming from the Event controller:  ");
  //println(theEvent.getController().getName());
//////// new stuff //////////////////////
  if (theEvent.isGroup() ) {
    println("event from group: "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
//    float Mod =theEvent.getGroup().getValue();
//    modeState =(int)theEvent.getGroup().getValue();
////// start of old stuff ////////////////
/*  if (theEvent.name().equals("list-2")) {  // mode select dropdown
      float Mod = theEvent.group().value(); 
//    Modi = int(Mod);
//      String [][] Modetype = mode.getListBoxItems(); //  String [] Modetype = theEvent.group().Items();
  //    Modetorun = Modetype[Modi][Modi];
*/
      
/*      if (modeState == 0) {
      Modetorun = "toSignal";
//      Modesel = true;
      }
      if (modeState == 1) {
      Modetorun = "toVol";
//      Modesel = true;
      }
            if (modeState == 2) {
      Modetorun = "Titrate";
//      Modesel = true;
      }
            if (modeState == 3) {
      Modetorun = "pHAdjust";
 //     Modesel = true;
      }

      println(Modetorun);*/
    } 

  else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}

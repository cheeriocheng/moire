
void keyPressed() {
  if (key=='g' || key=='G') {
    gratingImage.save("gratingImage_"+pitch+"_"+totalFrames+".png"); 
    println("grating image saved.");
  } else if (key=='m' || key=='M') {
    createMoireImage("daisy", 3);
    saveOneFrame = true;
  
  } else if (key=='p' || key=='P') {
    
  }else if (key == CODED) {
    if (keyCode == LEFT) {
       moveGrating(-pitch);
       
    } else if (keyCode == RIGHT) {
       moveGrating(pitch);
       
    } 
  } 
}
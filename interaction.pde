
void keyPressed() {
  if (key=='g' || key=='G') {
    gratingImage.save("gratingImage.png"); 
    println("gratingImage.png saved.");
  } else if (key=='m' || key=='M') {
    createMoireImage();
    saveOneFrame = true;
  
  } else if (key=='p' || key=='P') {
    
  }else if (key == CODED) {
    if (keyCode == LEFT) {
       //moveGrating(-pitch);
       gratingDx -= pitch;
    } else if (keyCode == RIGHT) {
       //moveGrating(pitch);
       gratingDx += pitch;
    } 
  } 
}
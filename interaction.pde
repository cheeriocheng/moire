
void keyPressed() {
  if (key=='g' || key=='G') {
    gratingImage.save("gratingImage.png"); 
    println("gratingImage.png saved.");
  } else if (key=='m' || key=='M') {
    createMoireImage();
  
  } else if (key=='p' || key=='P') {
    
  }else if (key == CODED) {
    if (keyCode == LEFT) {
      // moveGrating(-pitch);
    } else if (keyCode == RIGHT) {
      // moveGrating(pitch);
    } 
  } 
}

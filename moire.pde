//this code works with verticle grate as masks

import java.util.Calendar;



PImage[] frames;//frames to be loaded and stithced together 
int pitch = 3 ; //pitch is how wide each frame is in the moire. also how wide the slot is in the grate
int totalFrames = 3; //total number of frames that compose the animation
int totalSteps; //each step have [totalFrames] of frames  
int gratingDx = 0; //offset for the grate 

PImage moireImage; //the image that's stitched together    
PGraphics gratingImage; //the grate that stays on top of the moireImage

// image output
boolean saveOneFrame = false;

void setup() {
  //intro 
  println("---\npress M to create a new .png moire image ");
  println("press G to create a new .png grating image ");

  size(900, 900);
  background(255);

  //moireImage = loadImage("morelImages/twist_"+pitch+"_"+totalFrames+".png");
  moireImage = loadImage("morelImages/twist.png");

  //create grating with transparency at the size of the screen
  //refer to https://processing.org/discourse/beta/num_1191532471.html
  gratingImage = createGraphics(width, height, JAVA2D);
  gratingImage.beginDraw();
  gratingImage.fill(0, 255);

  totalSteps = floor(width/pitch/totalFrames) + 1 ; 
  for (int j = 0; j < totalSteps; j ++ ) {
    gratingImage.rect((totalFrames * j +1 ) * pitch, 0, 
      (totalFrames-1)*pitch, height );
  }
  gratingImage.endDraw();
}

void draw() {
  
  //this saves the morel image stitched in createMoireImage()
  if (saveOneFrame == true) {
    saveFrame("morelImages/"+timestamp()+"_"+pitch+"_"+totalFrames+".png");
    println("morel image stitched and saved");
    saveOneFrame = false;
  }
  //otherwise show existing moire image
  image(moireImage, 0, 0);
  image(gratingImage, gratingDx, 0);
}

//stitch images  
void createMoireImage(String title, int tFrames) {
  frames = new PImage[tFrames];
  
  for (int i = 0; i<tFrames; i++){
    //frames[i] = loadImage("frames/"+title+i+".png");
    frames[i] = loadImage("frames/" + title + "-"+(i*5+1)+" (dragged).png");
  }
  
  
  //stitch the images and put them on screan 
  int x = 0;
  int y = 0;
  int w = pitch;
  int h = height; 
  PImage tempImage ; 

  for (int j = 0; j < totalSteps; j ++ ) {
    for (int i = 0; i < totalFrames; i++) {
      x = ( totalFrames * j + i ) * pitch; 
      tempImage = frames[i].get (x, y, w, h);
      set (x, y, tempImage);
    }
  }
  
}

 void moveGrating(int dx){
     gratingDx += dx;
 }

String timestamp() {
  return String.format("20%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
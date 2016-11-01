import java.util.Calendar;


PImage[] frames;//frames 
int totalFrames = 3; //total number of frames that compose the animation
int totalSteps; //each step have [totalFrames] of frames 
int pitch = 3 ; //for each frame
 
PImage moireImage;   
PGraphics gratingImage;
color black ;

// image output
boolean saveOneFrame = false;

void setup() {
    //intro 
    println("---\npress M to create a new .png moire image ");
      println("press G to create a new .png grating image ");

  size(900, 900);

  totalSteps = floor(width/pitch/totalFrames) + 1 ; 

  background(255);
  black = color(12,90,0);

  moireImage = loadImage("dots.png");
  image( moireImage, 0,0); 

  //create grating with transparency
  //refer to https://processing.org/discourse/beta/num_1191532471.html
    gratingImage = createGraphics(width,height, JAVA2D);
    gratingImage.beginDraw();
    gratingImage.fill(0,255);
   
    for (int j = 0 ; j < totalSteps ; j ++ ){
      gratingImage.rect((totalFrames * j +1 ) * pitch, 0, 
        (totalFrames-1)*pitch , height ); 
    }
     gratingImage.endDraw();

 

}

void draw() {

     image(gratingImage,0,0);

  
  
   if (saveOneFrame == true) {
    saveFrame(timestamp()+".png");
    saveOneFrame = false;
  }

}


void createMoireImage(){
  totalFrames = 3; 
  frames = new PImage[totalFrames];
  frames[0] = loadImage("/Users/philetus/Documents/illusion/circle1.png");
  frames[1] = loadImage("/Users/philetus/Documents/illusion/circle2.png");
  frames[2] = loadImage("/Users/philetus/Documents/illusion/circle3.png");

  // frames[0] = loadImage("/Users/philetus/Documents/illusion/daisy1.png");
  // frames[1] = loadImage("/Users/philetus/Documents/illusion/daisy2.png");
  // frames[2] = loadImage("/Users/philetus/Documents/illusion/daisy3.png");

 
//generate the image 
  int x = 0;
  int y = 0;
  int w = pitch;
  int h = height; 
  PImage tempImage ; 
  

  for (int j = 0 ; j < totalSteps ; j ++ ){
      for (int i = 0 ; i < totalFrames; i++){
            x = ( totalFrames * j + i ) * pitch; 
            tempImage = frames[i].get (x,y,w,h);
            //image(tempImage, x, y );
            set (x,y,tempImage);
      }
  }



}

// void moveGrating(int dx){
//     set (0,0, moireImage); 
//     renderGrating(dx);
// }

// void renderGrating(int dx){
//     // generate the grating 
//     fill (0);
    
//   for (int j = 0 ; j < totalSteps ; j ++ ){

//       rect ( dx+(totalFrames * j +1 ) * pitch, 0, (totalFrames-1)*pitch , height ); 
//   }
// }

String timestamp() {
  return String.format("20%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}


import java.util.Calendar;


PImage[] frames;//frames 
int totalFrames; //total number of frames that compose the animation
int totalSteps; //each step have [totalFrames] of frames 
int pitch = 3 ; //for each frame
PImage gratingImage; 
PImage moireImage;   
color black ;

// image output
boolean saveOneFrame = false;

void setup() {
    //intro 
    println("press S to save the image to a png file");

  size(900, 900);
  totalFrames = 3; 
  frames = new PImage[totalFrames];
  // frames[0] = loadImage("/Users/philetus/Documents/illusion/circle1.png");
  // frames[1] = loadImage("/Users/philetus/Documents/illusion/circle2.png");
  // frames[2] = loadImage("/Users/philetus/Documents/illusion/circle3.png");

  frames[0] = loadImage("/Users/philetus/Documents/illusion/daisy1.png");
  frames[1] = loadImage("/Users/philetus/Documents/illusion/daisy2.png");
  frames[2] = loadImage("/Users/philetus/Documents/illusion/daisy3.png");

  totalSteps = floor(width/pitch/totalFrames) + 1 ; 

  background(255);
  black = color(12,90,0);
 
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
            image(tempImage, x, y );
     

      }
  }

// generate the grating 
    // gratingImage = createImage(width, height ,RGB);

    //todo : here the default is black. no transparency
    // for (int j = 0 ; j < totalSteps ; j ++ ){
    //     for (int i = 1 ; i < totalFrames; i++){ //leaving first one transparent 
    //         for (int tempX = ( totalFrames * j + i ) * pitch;
    //         tempX <  ( totalFrames * j + i +1 ) * pitch;
    //         tempX ++){
    //             for (int tempY = 0; tempY<height; tempY ++ ){
    //                 gratingImage.set(tempX, tempY,black )  ;       
    //             }
                
    //         }
           

    //     }
    // }


}

void draw() {
  // image( gratingImage, 0,0); 
  
   if (saveOneFrame == true) {
    saveFrame(timestamp()+".png");
    saveOneFrame = false;
  }

}




String timestamp() {
  return String.format("20%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}


import processing.pdf.*;


PImage img;
PImage sorted;
int index = 0;

void setup() {
  size(2000, 2000);

  img = loadImage("greenhalf.png");
  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();

  
}

void draw() {
  println(frameRate);

  sorted.loadPixels();


  for (int n = 0; n <1; n++) {
    
    float record = -1;
    int selectedPixel = index;
    for (int j = index; j < sorted.pixels.length-10; j++) {
      color pix = sorted.pixels[j];
      color pixcomp = sorted.pixels[j+round(random(0,2))];
      float b = color(pix);
      float bcomp = color(pixcomp);
      if (b > bcomp) {
        selectedPixel = j;
        //record = b;
    
      
      }
      // Swap selectedPixel with i
      color temp = sorted.pixels[index];
      sorted.pixels[index] = sorted.pixels[selectedPixel];
      sorted.pixels[selectedPixel] = temp;
        
    }


    if (index < sorted.pixels.length -1) {
      index++;
    }
  }


  sorted.updatePixels();

  background(0);
  //image(img, 0, 0);
  image(sorted, 0, 0);
  
  //saveFrame("line-#####.png");


}
void keyPressed() {
  if (key == 'q') {
    saveFrame("greenhalf#####.png");
    //exit();
  }
}

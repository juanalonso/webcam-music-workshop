import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;
import processing.sound.*;

TriOsc osc;
int[] notes = {57, 60, 62, 65, 67, 69, 72};

Capture video;
OpenCV opencv;
ArrayList<Contour> contours;


void setup() {

  size(960, 360);
  stroke(255, 255, 255); 
  strokeWeight(5); 
  noFill();

  opencv = new OpenCV(this, 640, 480);

  //String[] cameras = Capture.list();
  //for (int f = 0; f < cameras.length; f++) {
  //    println(f + ": " + cameras[f]);
  //}

  video = new Capture(this, 640, 480);
  video.start();

  osc = new TriOsc(this);
  osc.play();
  osc.amp(0);
}



void draw() {

  if (video.available() == true) {
    video.read();
  }  
  image(video, 0, 0, 480, 360);

  opencv.loadImage(video);
  //opencv.useColor(HSB);
  //opencv.setGray(opencv.getH());

  //opencv.blur(5);
  //opencv.inRange(169, 187);
  //opencv.erode();
  //opencv.erode();
  //opencv.dilate();
  //opencv.dilate();

  image(opencv.getSnapshot(), 480, 0, 480, 360);

  //contours = opencv.findContours(false, true);

  //scale(0.75);
  //if (contours.size()>0) {
  //  Contour c = contours.get(0);
  //  if (c.area()>1500) {
  //    Rectangle r = c.getBoundingBox();
  //    int cx = r.x+r.width/2;
  //    int cy = r.y+r.height/2;
  //    c.draw();
  //    rect(r.x, r.y, r.width, r.height);
  //    ellipse(cx, cy, 5, 5);
  //    osc.amp(0.8);
  //    //float fx = map(cx,0,width/2,220,880);
  //    int noteIndex = (int)map(cx,0,width/0.75/2,1,8)-1;
  //    float fx = midiToFreq(notes[noteIndex]);
  //    println(fx);
  //    osc.freq(fx);
  //  } else {
  //    osc.amp(0);
  //  }
  //} else {
  //  osc.amp(0);
  //}
}

float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0)))*440;
}
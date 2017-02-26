import processing.sound.*;

TriOsc osc;
Env env;

int duration = 500;
int currentTime = millis()-duration;
int[] notes = {53, 55, 57, 60, 62, 65, 67, 69, 72, 74};

void setup() {

  size(500, 500);
  background(0);

  osc = new TriOsc(this);
  //1
  osc.play();

  //3
  //env = new Env(this);
}

void draw() {

  //1
  osc.freq(map(mouseY, height,0, 220, 880));
  osc.amp(map(mouseX, 0, width, 0, 1));

  //2
  //if (millis()>currentTime + duration) {
    //osc.play(220+random(400), 0.5);
      //3
      //int noteIndex = (int)random(notes.length);
      //osc.play(midiToFreq(notes[noteIndex]), 0.5);
    //env.play(osc, 0.05, 0.2, 1, 0.05);
    //currentTime = millis();
  //}
}

float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0)))*440;
}
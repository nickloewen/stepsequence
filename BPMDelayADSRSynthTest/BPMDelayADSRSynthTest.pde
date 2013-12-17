import ddf.minim.*;
import ddf.minim.ugens.*;
import controlP5.*;

ControlP5 cp5;
Minim minim;
AudioOutput out;
Oscil wave;
Delay delay;

// note values and the actual sequence:
final float F = 174.614;
final float C = 261.626;
final float E = 329.628;
float[] sequence = { C, E, 0, E, F, C, E, F, F, E, C, C, 0, C, E };
int currentNote = 0; // the index of the current note in the sequence

// values required for timing the playing of notes:
float start = 0.0; // incremented each time draw() is called
float duration = 2.0;
float gap = 1.0;

void setup() {
  size( 150, 130 );
  background( 0 );
  minim = new Minim( this );  
  out = minim.getLineOut();
  setupSlider();
}

void draw() {
  // keeps the loop gooing
  if ( currentNote < ( sequence.length - 1 ) ) currentNote++;
  else currentNote = 0;
  
  // use a semi-random tempo for now (TODO)
  out.setTempo( ( currentNote + 1 ) * 10 );

  //out.setTempo( sliderValue * 2 );
  // The slider would be nice, but doesn't seem to work...
  // this makes no sense to me. Frustratingly, the getTempo()
  // method which is supposed to be provided doesn't work for me, either.
  // Perhaps this is an indication that the whole tempo thing is broken...
  // TODO TODO TODO

  // For some reason, the notes don't play at the beginning,
  // and then all come out in a heap. Then things even out after that.
  // Weird. (TODO)
  SineInstrument instrument = new SineInstrument ( sequence[ currentNote ], 0.05 );
  out.playNote( start + duration + gap, duration, instrument );
 
  start = start + 1;   // ensures that notes are heard individually, not as one big chord  
  
  // The default framerate works for the audio, but makes my little animation flicker
  // far too fast. Thus:
  if ( currentNote == 5 || currentNote == 15 ) writeText();
}

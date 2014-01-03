import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
MusicThread musicThread;

void setup() {
  size(600, 200, P3D);

  minim = new Minim( this );  
  out = minim.getLineOut();

  musicThread = new MusicThread(); 
  musicThread.start();
}

void draw() {
  background(0);
  stroke(255); 
  musicThread.setBPM( ( mouseX + 1 )  / 3);
  
  // draw the waveforms
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    line( i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50 );
    line( i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50 );
  }
}

class SineInstrument implements Instrument {
  Oscil sineWave;
  ADSR envelope;
  Delay delay;
  
  SineInstrument( float frequency, float amplitude ) {
    sineWave = new Oscil( frequency, amplitude, Waves.SINE );
    envelope = new ADSR ( 5.0, 0.001 ); // max amplitude (unknown unit), attack speed in seconds
    sineWave.patch( envelope );
    delay = new Delay( 0.5, 0.9, true, true ); // delay time, feedback amp. factor, feedback on, pass audio on
    envelope.patch( delay );
  }
  
  // this is called by the sequencer when this instrument
  // should start making sound. the duration is expressed in seconds.
  void noteOn( float duration ) {
    envelope.noteOn();
    envelope.patch( out );
  }
  
  // this is called by the sequencer when the instrument should
  // stop making sound
  void noteOff() {
    envelope.unpatchAfterRelease( out );
    envelope.noteOff();
  }
}

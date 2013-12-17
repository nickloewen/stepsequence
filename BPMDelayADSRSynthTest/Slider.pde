Slider slider;
int sliderValue = 50;

void setupSlider() { 
  noStroke();
  cp5 = new ControlP5( this );
  
  cp5.addSlider( "slider" )
     .setPosition( 0, 110 )
     .setRange( 0, 100 )
     .setValue( 50 )
     .setDecimalPrecision( 0 )
     .setHeight( 20 )
     .setWidth( 150 );
}

// called when slider updates
void slider() {
 sliderValue = floor( cp5.getController( "slider" ).getValue() );
}

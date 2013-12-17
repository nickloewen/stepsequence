void writeText() {
  PFont courier;
  courier = createFont( "Courier", 16 );
  textFont( courier );
  noStroke();
  fill( 0, random( 128, 255 ), random( 128, 255 ) );
  text( "step sequence", 10, 65 );
}

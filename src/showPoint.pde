/*******************************
 ポイント関連　  
********************************/
void showPoint() {
    // 得点用　hexPanel( x, y, size );
    final int PANE = 6;
    
    smooth();
    for(int i = 0; i < PANE; ++i) {
      pushMatrix();
        switch( i ) {
          case 0: translate( 680,  55 ); fill( color1 ); break;
          case 1: translate( 680, 150 ); fill( color2 ); break;
          case 2: translate( 680, 245 ); fill( color3 ); break;
          case 3: translate( 680, 340 ); fill( color4 ); break;
          case 4: translate( 680, 435 ); fill( color5 ); break;
          case 5: translate( 680, 530 ); fill( color6 ); break;
        }
        rotate( PI / PANE );
        hexPanel( 0, 0, 90 );
      popMatrix();
    }
    // 得点 ex.(num○, Width, Height);
    fill(0);
    for(int j = 0; j < PANE; ++j) {
      textAlign( CENTER );
      switch( j ) {
        case 0: text( num1, 680,  75 ); break;
        case 1: text( num2, 680, 170 ); break;
        case 2: text( num3, 680, 265 ); break;
        case 3: text( num4, 680, 360 ); break;
        case 4: text( num5, 680, 455 ); break;
        case 5: text( num6, 680, 550 ); break;
      }
    }
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/
  
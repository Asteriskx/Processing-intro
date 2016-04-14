/***************************************
 パネル系   
****************************************/
void attackPanel() { //drawから呼び出し
  colorMode( RGB, WHITE );  
    
  for( int i = 0; i < MAX; i++ ) { // 白い四角 or 色つきの四角だったら
    for( int j = 0; j < MAX; j++ ) {
           if( map[i][j] == WHITE ) fill( WHITE );
      else if( map[i][j] == 1 ) { fill( color1 ); num1++; }
      else if( map[i][j] == 2 ) { fill( color2 ); num2++; }
      else if( map[i][j] == 3 ) { fill( color3 ); num3++; }
      else if( map[i][j] == 4 ) { fill( color4 ); num4++; }
      else if( map[i][j] == 5 ) { fill( color5 ); num5++; }
      else if( map[i][j] == 6 ) { fill( color6 ); num6++; }
      //rect( i*140+10, j*140+10, 120, 120 );
      hexPanel( i*120+60, j*120+60, 120 );
    }
  }

  // 四角の中の数字
  fill( 0 );
  textSize( 40 );
  int cnt = 1;
    
  for( int i = 0; i < MAX; ++i) {
    for( int j = 0; j < MAX; ++j ) {
      if( cnt < 10 ) { //1～9までの数字
        textAlign( LEFT );
        text( cnt, j*120+50, i*120+75 );   
      } else { //10～25までの数字 2桁になるため、ズレの修正
        textAlign( LEFT );
        text( cnt, j*120+43, i*120+75 );
      }
      cnt++;
    }
  }
}

/********************************************
 Hexagon Panel
*********************************************/
void hexPanel( float cX, float cY, float S ) { 
  final float[] COS       = { 1, 0.5, -0.5, -1, -0.5, 0.5 }; 
  final float[] SIN       = { 0, 0.8660254,  0.8660254, 0, -0.86602524, -0.86602524 };
  final float   RADIUS    = S / 2;
  final int     HEXAGON   = 6;
  
  beginShape();
    for(int i = 0; i < HEXAGON; i++ ){
      float tx = COS[i] * RADIUS + cX;
      float ty = SIN[i] * RADIUS + cY;
      vertex( tx, ty ); // バーテックス(頂点)を算出
    }
  endShape( CLOSE );
}

void hexRotate() {
  final int PANE = 6;

  smooth();
  for( int i = 0; i < PANE; ++i ) {
    pushMatrix();
      switch( i ) {
        case 0: translate( 650,  65 ); fill(cData[i]); break;
        case 1: translate( 650, 180 ); fill(cData[i]); break;
        case 2: translate( 650, 295 ); fill(cData[i]); break;
        case 3: translate( 650, 410 ); fill(cData[i]); break;
        case 4: translate( 650, 525 ); fill(cData[i]); break;
        case 5: translate( 650, 640 ); fill(cData[i]); break;
      }
      rotate( PI / PANE );
      hexPanel( 0, 0, 110 );
    popMatrix();
  }
}

/****************************************************************/
/* EOF                                                          */
/****************************************************************/
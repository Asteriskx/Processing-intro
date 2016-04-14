/*****************************************************
  ButtonNumber
******************************************************/
void ShowButtonNum() { 
  if( state == 3 ) { // ボタン番号を表示
         if( myString.charAt(0) == '1' ) colorFlag = 1;  // charAtは文字列からn番目の文字列を抜き出す
    else if( myString.charAt(0) == '2' ) colorFlag = 2;
    else if( myString.charAt(0) == '3' ) colorFlag = 3;
    else if( myString.charAt(0) == '4' ) colorFlag = 4;
    else if( myString.charAt(0) == '5' ) colorFlag = 5;
    else if( myString.charAt(0) == '6' ) colorFlag = 6;
    
    switch( colorFlag ) {
      case 1: fill( color1 ); break;
      case 2: fill( color2 ); break;
      case 3: fill( color3 ); break;
      case 4: fill( color4 ); break;
      case 5: fill( color5 ); break;
      case 6: fill( color6 ); break;
    }
    textAlign( LEFT );
    textSize( BUTTON/2 -40 ); // before BUTTON = 400
    text( "No."+ myString, 330, 730 ); //before x:250, y:490
  }
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/

/**********************************
 Attack Chance
 **********************************/
void isAttack() {
  if ( state != 3 ) { // アタックチャンス表示
    if ( AC >= 1000 ) { 
      float size1 = map(sin(angle), -1.0, 1.5, 30, 40);
      textSize( size1*2.5 );
      fill( #ADF07E );
      text( "Attack", 10, 740 );  
      text( "Chance!", 380, 740 );
    }
  }
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/
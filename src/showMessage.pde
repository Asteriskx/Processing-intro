/**********************************
 メッセージ系
***********************************/
void showMessage() {
    if( state == 1 ) {
        textAlign( LEFT ); // Defaultの時は常に左寄せらしいので、
                           // 個別に指定してあげないと位置がずれる
        textSize( 50 );
        fill( color5 );
        ani1.paint();
       
    } else if( state == 2 ) { // 曲流し中
        textAlign( LEFT );
        textSize( 50 );
        fill( color5 );
        ani2.paint();
      
    } else if( state == 3 ) {
        textAlign( LEFT );
        textSize( 50 );
        fill( color5 );
        ani3.paint();
    }
}

/****************************************************************/
/* EOF                                                          */
/****************************************************************/
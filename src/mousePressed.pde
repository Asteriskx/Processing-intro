/******************************************************************
  マウスをクリックした時                                          
/******************************************************************/
void mousePressed() {
  boolean FieldFlg = false;
  
  //左ボタンが押されたときの処理
  if( mouseButton == LEFT ) {
    //例外が起きそうな文
    try { 
      if( state == 3 ) {          
        ///////////////////　ここでエラーになっている可能性大/////////////////////
        int x   = ( mouseX - 10 ) / 120; // パネル上のどのマスをクリックしたか
        int y   = ( mouseY - 10 ) / 120; // パネル上のどのマスをクリックしたか
        /////////////////////////////////////////////////////////////////////////
        int num = WHITE; // 白

        // 解答権があるのは何番か？       
             if( myString.charAt(0) == '1' ) num = 1;
        else if( myString.charAt(0) == '2' ) num = 2;
        else if( myString.charAt(0) == '3' ) num = 3;
        else if( myString.charAt(0) == '4' ) num = 4;
        else if( myString.charAt(0) == '5' ) num = 5;
        else if( myString.charAt(0) == '6' ) num = 6;
        
        if( mouseX <= 600 && mouseY <= 600 ) 
          FieldFlg = true;
        else if( mouseX > 600 && mouseY > 600 ) 
          FieldFlg = false;
          
        // フィールドフラグが真の時かつ、色なしのマスもしくはアタックチャンス中なら塗り替える
        if( FieldFlg == true && map[x][y] == WHITE || AC >= 1000 ) {
          //クリックした座標のパネルを回答した番号の色に変える
          map[x][y] = num;
   
          // オセロ
          update( x, y,  1,  0, num ); 
          update( x, y,  1,  1, num );
          update( x, y,  1, -1, num ); 
          update( x, y,  0,  1, num ); 
          update( x, y,  0, -1, num ); 
          update( x, y, -1,  0, num ); 
          update( x, y, -1,  1, num ); 
          update( x, y, -1, -1, num ); 

          myString = "0";
          isFinish = 20;
          state    = 1;
          nextMusic();
          // アタックチャンスだったらリセット
          if( AC >= 1000 ) AC = 0;
          // ACの値を足していく
          AC += ( 30 + random(180) ); 
          
        // panelCnt++;
          
          //Panelがすべて埋まったらフラグを立てる
          //if( panelCnt == 25 ) 
            //isPanel = true; 
          
        }
      }
    } catch ( ArrayIndexOutOfBoundsException e ) { //配列系のエラーをキャッチする
      System.out.println( "座標エラーです! イントロクイズを強制終了します。" );
      System.out.println( "開発者はバグの確認を至急行ってください!" );
      System.out.println( "System error process is mousePressed()" );
      exit(); //強制終了
    } finally {
      /*if( state == 1 ) {
          ////////DEBUG//////////////
          int motionX = mouseX;
          int motionY = mouseY;
          System.out.println( "x座標 " + motionX );
          System.out.println( "y座標 " + motionY );
         //////////////////////////////
      }*/
    }
    
  } else if( mouseButton == CENTER ) { //中央ボタンが押されたときの処理
    //////////////////////////
    // popMap
    //////////////////////////
    nmap.popMap(); 
    //panelCnt--; 
    System.out.println("popMap Call" + " " + (UndoCount));
  } else if( mouseButton == RIGHT ) { //右ボタンが押されたときの処理
    //////////////////////////
    //pushMap
    //////////////////////////
     nmap.pushMap(); 
     System.out.println("pushMap Call" + " " + (UndoCount)); 
  }
}

/****************************************************************/
/* EOF                                                          */
/****************************************************************/
      

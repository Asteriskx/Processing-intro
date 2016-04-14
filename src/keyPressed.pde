/*****************************************************
 キーを押した場合                                   
/*****************************************************/
void keyPressed() {
  /////////////////////////////////////
  //init
  /////////////////////////////////////
  if ( key == 'i' ) { 
    myPort.write(100);
    isFinish = 20;
    myString = "0";
    state    = 1;
  }
  
  /////////////////////////////////////
  // Start Music
  /////////////////////////////////////
  if ( key == 's' ) { // start
    // 待機中 曲を流す
    if ( state == 1 ) {
      state = 2;         
      player.play();
      wait( 100 );
      if ( TEST == false ) myPort.write( 100 );
    } else if ( state == 2 ) { // 曲が流れているとき、ストップする。待機中へ
      player.pause();     
      loadMusic();
      state = 1;
    }
  }
  
  ////////////////////////////////////////
  // Next Music
  ////////////////////////////////////////
  if ( key == 'n' ) { 
    if ( state == 1 ) {
      nextMusic(); // 待機中のとき、次の曲を読み込む
    }
  }
  
  ////////////////////////////////////////////////////
  // 画面の遷移
  ////////////////////////////////////////////////////
  if ( key == 'r' ) { 
   // op.pause(); 
    nowState = RULE;
  }
  if ( key == 'g' ) { 
    nowState = GAME;
  }
  /*if ( key == 'e' ) { 
    nowState = END;
  }*/
  if ( key == ' ' ) { 
    nowState = NAME; 
    isShow = true;
  }
  if ( key == 'v' ) { 
    nowState = RESULT;
  }

  ///////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////
  // Queue & Stack
  ///////////////////////////////////////////////////////
  //(mousePressed == RIGHT)にpushの機能を移動しました。
  /*if( key == 'p' ) { 
   nmap.pushMap(); 
   System.out.println("pushMap Call" + " " + (UndoCount)); 
   }*/

  /*if ( key == 'o' ) { 
    nmap.popMap(); 
    panelCnt--; 
    System.out.println("popMap Call" + " " + (UndoCount));
  }*/
  //////////////////////////////////////////////////////////

  if ( state == 3 ) { // 状態 = 3の時
    if ( key == 'y' ) { // 正解
      isMaru = true;
      atari.play();
      atari.rewind();
      isShow = true; //正解時にも曲名を表示させる
    } else if ( key == 'n' ) { //不正解  
      isBatu = true;
      hazure.play();
      hazure.rewind();
    }
  }
  //////////////////////////////////////////////
  // テストモード キーボードの数字で解答権
  //////////////////////////////////////////////
  if ( TEST == true ) { // 0 = 本番, 1 = TEST
    if ( state == 2 ) {
      if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6') {            
        myString = key + "";
        player.pause();   
        loadMusic();
        
        hayaoshi.play();
        hayaoshi.rewind();
        //hayaoshi.trigger();
        state = 3;

        if ( key == '1' ) Colorflg = 1;
        else if ( key == '2' ) Colorflg = 2;
        else if ( key == '3' ) Colorflg = 3;
        else if ( key == '4' ) Colorflg = 4;
        else if ( key == '5' ) Colorflg = 5;
        else if ( key == '6' ) Colorflg = 6;
      }
    }
  }
}

/****************************************************************/
/* EOF                                                          */
/****************************************************************/

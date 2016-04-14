//****************************************
// 曲名
//****************************************
void musicName() {
  String now = new String("NOW PLAYING!");

  if (isShow == true) {
    //player2.play();
    Count++;
    textFont(Splatoon);
    textSize(90);
    fill(color5);
    text(now, 55, 100);
    
    MusicNameAnimation();
    
    if (Count % 60 == 0) { //60Frame分 = 1秒
      //曲名を見せる秒数を約1秒づつマイナスしていく
      Show--; 
    }
    
    textFont(Splatoon);
    textSize(70);
    fill(#FF5E0D);
    text("Exit : " + Show, 430, 720 );

    if (Show <= 0) {
      Show   = 0;
      Count  = 0; 
      isShow = false;
    }

    if (!isShow) { //isShow == false
      if(MusicName == null) {
        nowState = GAME;
      } else {
        nowState = GAME; //ゲーム画面へ
        Show     = 5;   //表示時間の復活
        nextMusic();     //次の曲を読み込み
      }
    }
  }
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/

/****************************************************************
  曲読み込み ※ファイルパスの確認！                               
*****************************************************************/
void loadMusic() {
  //String name  = "F:/課題研究/さぎょうなう！/Main/music/" + MusicName[pIndex];
  //String name = "C:/Users/J02/Desktop/工業展/music/" + MusicName[pIndex];
  String name   = "C:/Users/J02/Desktop/工業展/music(2015決定版)/"+ MusicName[pIndex];
  //String name2 = "N:/課題研究/さぎょうなう！/Main/musicTest/" + MusicName2[pIndex];
  player       = minim.loadFile( name );
  //player2      = minim.loadFile( name2 );
  
}

/****************************************************************/
/* EOF                                                          */
/****************************************************************/

/******************************************
  曲探索クラス            
*******************************************/
public class SearchMusic {
  private File directory1;
  private File directory2;
  
  //コンストラクタ
  private SearchMusic() { 
      //directory1  = new File("F:/課題研究/さぎょうなう！/Main/music/");
     //directory1 = new File("C:/Users/J02/Desktop/工業展/music/");
     directory1 = new File("C:/Users/J02/Desktop/工業展/music(2015決定版)/");
      //directory2  = new File("N:/課題研究/さぎょうなう！/Main/musicTest/");
      MusicName   = directory1.list(); // 曲名を覚える配列
      //MusicName2  = directory2.list(); 
      musicNum    = 0;
      init();
  }  
  
  //初期化
  private void init() {
    if ( MusicName != null ) {
        System.out.println("************************************ 読み込み開始 *****************************************");
        for(int i = 0; i < MusicName.length; ++i) {
            System.out.println( MusicName[i] );
            musicNum++;
        }
        System.out.println("************************************ 読み込み終了 *****************************************");
    } else { //出力
        System.out.println(directory1.toString() + "　はフォルダ上にないよ?" );
        //System.out.println(directory2.toString() + "　はフォルダ上にないよ?" );
    }
    
    //重複防止
    musicFlag = new int[musicNum];
    
    //重複防止フラグを立てる
    for(int j = 0; j < musicNum; ++j ) {
        musicFlag[j] = 1;
    }
  }
}

/****************************************************************/
/* EOF                                                          */
/****************************************************************/

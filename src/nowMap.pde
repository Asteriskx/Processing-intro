//////////////////////////////////////////////
// 現在のマップ情報
//////////////////////////////////////////////
public class nowMap {
  //マップ情報を保存するための配列 
  private int[][][] stack;
  
  public nowMap(){
    //25個までスタック可能
    stack = new int[40][MAX][MAX]; 
    init();
  }
  
  //マップ情報の表示メソッド
  public void showMap(){
    for(int y = 0; y < MAX; ++y) { 
      for(int x = 0; x < MAX; ++x) {
        System.out.print(map[y][x] + " ");
        System.out.println("nowMap" + map[y][x]);
      }
      System.out.print("\n");
    }
  }
  
  //現在のマップ情報を保存用配列に
  public void pushMap() { 
    ++UndoCount;
    for(int y = 0; y < MAX; ++y ) { 
      for(int x = 0; x < MAX; ++x) {
        stack[UndoCount][y][x] = map[y][x];
      }
    }
  } 
  
  //保存しておいたマップ情報を現在のマップに適用する
  public void popMap() { 
    if(UndoCount >= 0)
      --UndoCount;
    else if(UndoCount < 0)
      UndoCount = 0;
      
    for(int y = 0; y < MAX; ++y ) { 
      for(int x = 0; x < MAX; ++x) {
        if(UndoCount >= 0)
          map[y][x] = stack[UndoCount][y][x];
      }
    }
  }
  
  //初期化
  private void init(){
    for( int u = 0; u < 40; ++u ) {
      for( int y = 0; y < MAX; ++y ) {
        for( int x = 0; x < MAX; ++x ) {
          stack[u][y][x] = WHITE;
        }
      }   
    }
  }
  
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/

////////////////////////////////////////////////////
// バックグラウンド処理クラス (実は見せかけのロード画面)
////////////////////////////////////////////////////
public class LoadThread implements Runnable {
  
  public LoadThread(){}

  public synchronized void run() {  
    long max = 100;  
    for(long i = 0; i < max; i++) {  
      for( int j = 0; j < max/2; j++ ) {
        for(int k = 0; k < 25000; k++) {
          // 進捗率更新
          percent = (float)i*100 / max;    
        }
      }
    }
    // 読み込んだらフラグ更新
    isLoading = false;
  }  
}  
/****************************************************************/
/* EOF                                                          */
/****************************************************************/

////////////////////////////////////
// タイトルの下の文字表示
////////////////////////////////////
public class Show {
  private String msg; 
  private int opacity;
  private int direction;
  
  //コンストラクタ
  public Show() {
    msg       = new String("Press any KEY!");
    opacity   = 0;
    direction = 1;
  }

  //メッセージの表示
  public void msg() {
    // 文字の濃淡を決める
    opacity += 8 * direction;
    
    if ((opacity < 0) || (opacity > WHITE)) 
      direction = -direction;
    
    fill(#FF5E0D, opacity);
    text(msg, 180, height - 40);    
  }
} 
/****************************************************************/
/* EOF                                                          */
/****************************************************************/

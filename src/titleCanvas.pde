////////////////////////////////////////
// タイトル画面描画クラス
////////////////////////////////////////
import java.awt.*;

public class titleCanvas extends Canvas {
  private PImage titleImg;

  public titleCanvas() {
    //titleImg  = loadImage( "N:/課題研究(かんせー)/ノート用/Main_kai/image/titleImgR2.png" );
    titleImg  = loadImage( "C:/Users/J02/Desktop/工業展/Main_kai/image/タイトル画面.png" );
  }

  public void paint() {
    image( titleImg, 50, 0, 750, 750 );
  }
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/

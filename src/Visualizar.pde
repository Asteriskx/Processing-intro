//////////////////////////////////////////////
// ビジュアライザクラス
//////////////////////////////////////////////
public class Visualizar {
  public int[] VisualHeight = new int [VisualNum];        //表示するVisualizarの高さ       
  public int[] VisualShow   = new int [VisualNum];        //表示するVisualizarの色
  
  private int Saturation;                                 //表示するVisualizarの彩度
  private int Brightness;                                 //各世代のVisualizarの明度
  private int Alpha;                                      //各世代のVisualizarの透明度
  private int VisualWidth          = 15;                  //表示するVisualizarの幅
  private int VisualBegin          = 20;                  //Visualizarの描画開始点 
  private int VisualMagnification  =  2;                  //倍率
  private int col                  =  7;                  //color

  public Visualizar( int saturation, int brightness, int alpha, int height ) { //beamの彩度、明度、透明度、高さ
    Saturation = saturation;                                
    Brightness = brightness;                                 
    Alpha      = alpha;                 
    
    for( int j = 0; j < VisualNum; j++ ) {                   
        VisualHeight[j] = height;                                 
    }  
  }                                                      
  
  //FFTからRazerの高さを出す
  public int giveHeight( int num ) { 
    map ( num, 0, fft.specSize(), 0, VisualNum );
    return ( int( dispH - fft.getBand( num ) * VisualMagnification ) ) ; 
  }
  
  //色決め
  public int giveColor( int num ) {
    return ( col * num );
  }
  
  //Razerの描画
  public void paintVisual( int num ) {    
    //色相モードに
    colorMode( HSB, 360, 100, 100, 100 );       
    //塗りつぶし
    fill( VisualShow [num], Saturation, Brightness, Alpha );
    //四角形（左上の頂点のX座標、左上の頂点のY座標、四角形の幅、四角形の高さ）；
    rect( num * VisualBegin, VisualHeight[num], VisualWidth, 1000 );
  }
  
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/
////////////////////////////////////////////
// テキストアニメーションクラス
////////////////////////////////////////////
public class TextAnimation {
  private String str;
  private int step;
  private int x, y;
  private int amp;
  
  private int cnt;
  private float ypos[], dif[];
  private int len = 0;

  public TextAnimation( String _str, int _step, int _amp, int _x, int _y ) {
    str  = _str;
    step = _step;
    x    = _x; 
    y    = _y;
    amp  = _amp;
    cnt  = 0;
    ypos = new float[str.length()];
    dif  = new float[str.length()];
    
    for ( int i = 0; i < ypos.length; i++ ) {
      ypos[i] = amp;
      dif[i]  = amp*0.6 / step;
    }
  }
  
  public void update( String _str, int _step, int _amp, int _x, int _y ) {
    str  = _str;
    step = _step;
    x    = _x; 
    y    = _y;
    amp  = _amp;
    cnt  = 0;
    ypos = new float[str.length()];
    dif  = new float[str.length()];
    len = 0;
    for ( int i = 0; i < ypos.length; i++ ) {
      ypos[i] = amp;
      dif[i]  = amp*0.6 / step;
    }
  }
    

  public void paint() {
    if( (cnt++) % step == 0 ) {
      len = ( int )min( len+1, str.length() );
    }
    
    for( int i = 0; i < len; i++ ) {
      float w = textWidth( str.substring(0, i) );
      text( str.charAt(i), x+w, y+ypos[i] );
      if( dif[i] > 0 ) {
        ypos[i] -= dif[i];
        if( ypos[i] <= -0.2*48 ) {
            dif[i] *= -0.6;
        }
      } else {
        ypos[i] -= dif[i];
        if( ypos[i] >= 0 ) {
          ypos[i] = 0;
          dif [i] = 0;
            
          if(i == str.length()-1)
            update( str, step, amp, x, y ); 
        }
      }
    }
  }
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/
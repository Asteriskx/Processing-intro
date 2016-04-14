//*******************************
// バブルソートクラス
//*******************************
class Bubble {
  private int[] data;
  private int[] myNum;
  
  private int desc;
  private int num;
  
  //色情報退避用変数
  private color col; 
  
  public Bubble() {
    // 解答者の得点を配列dataに代入
    data  = new int[]{ num1, num2, num3, num4, num5, num6 };
    // 解答者の色
    cData = new color[]{ color1, color2, color3, color4, color5, color6 }; 
    // 解答者の番号
    myNum = new int[]{ 1, 2, 3, 4, 5, 6 }; 
  }
  
  private void Desc(){ //降順ソート
    //Desc
    for(int i = 0; i < data.length-1; ++i){
      for(int j = i+1; j < data.length; ++j) {
        if(data[i] < data[j]) {  // 添字が小さい方の要素が小さかったら
          desc     = data [i];   // 退避用変数descに現在のデータを代入
          num      = myNum[i];   // 退避用変数numに番号を代入
          col      = cData[i];   // 退避用変数colに現在の色を代入
          data [i] = data [j];   // 現在のデータを次のデータに変更
          myNum[i] = myNum[j];   // 現在の番号を次の番号に変更
          cData[i] = cData[j];   // 現在の色を次の色に変更　
          data [j] = desc;       // 退避用変数からデータを戻す
          myNum[j] = num;        // 退避用変数から番号を戻す
          cData[j] = col;        // 退避用変数から色を戻す
        }
      }
    }
  }
  
  //得点系表示メソッド
  public void Print() {
    int y = 90;
    float size2 = map(sin(angle), -1.0, 1.0, 30, 40);
    
    //降順に
    Desc();
    //パネルの表示
    hexRotate();
    
    //獲得パネルの枚数表示
    for(int p = 0; p < data.length; ++p) {
      textSize(60);
      textAlign(CENTER);
      fill(0);
      text(data[p], 650, y);
      y += 115;
    }
    
    textSize(size2*5);
    //先頭に降順済みのデータがあるので0番指定
    fill(cData[0]); 
    //先頭に降順済みのデータがあるので0番指定
    text("No." + myNum[0], width/2, height - 200);
  }
  
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/
        
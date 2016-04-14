///////////////////////////////////////
// 曲名の動的表示
///////////////////////////////////////
void MusicNameAnimation() {
  // 文字数が画面からはみ出てしまう場合
  if(MusicName[pIndex].length() > 20) {
    moveX -= 3;
    if(moveX < 0 ) moveX = 600; //文字を一定距離で始点に呼び戻すために値を反転させる
    textFont(Japanese);// MS Goshic
    //左寄せ
    textAlign(LEFT);
    //拡張子が邪魔なので拡張子を除くためにsubstringを使用
    text(MusicName[pIndex].substring(0, MusicName[pIndex].length()-4), moveX, 410);
    
  // 文字数が指定数以下の時(通常表示)
  } else {
    final int X = 80;
    textFont(Japanese); //MS Goshic
    //左寄せ
    textAlign(LEFT);
    //拡張子が邪魔なので拡張子を除くためにsubstringを使用
    text(MusicName[pIndex].substring(0, MusicName[pIndex].length()-4), X, 410);
  }
}

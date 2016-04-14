/*******************************************************/
/* アップデート関数                                    */
/*******************************************************/
void update( int x, int y, int dx, int dy, int num ) {
  int i, j;
  boolean mapFlg = false;
  
  i = x + dx;
  j = y + dy;
  
  // 検索方向の先に解答者のマスがあるか？
  while( i >= 0 && i < MAX && j >= 0 && j < MAX ) { 
    if( map[i][j] == WHITE ) break;
    if( map[i][j] == num ) {
      mapFlg = true;
      break;
    }
    i += dx;
    j += dy;      
  }

  // 解答者のマスがあれば塗り替える
  if( mapFlg == true ) {
    i = x + dx;
    j = y + dy;
    while( i >= 0 && i < MAX && j >= 0 && j < MAX ) {  
      if( map[i][j] == num ) break;
      map[i][j] = num;      
      i += dx;
      j += dy;      
    }
  }
}

/****************************************************************/
/* EOF                                                          */
/****************************************************************/
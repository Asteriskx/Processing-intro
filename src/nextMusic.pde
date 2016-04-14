/*****************************************************************/
/* 次の曲へ飛ばす                                                 */
/*****************************************************************/
void nextMusic() {
    isFinish = 20; //制限時間を戻す
    int r = (int)(random( musicNum ) - 0.0001);
    //int r2  = r; //サビもイントロの曲が流れないといけない
  
    // 一回使った曲は使わない
    while( musicFlag[r] == 0) {
        r = (int)(random( musicNum ) - 0.0001);
        //r2 = r;
    }
        
    musicFlag[r] = 0; //フラグの共通化
    pIndex  = r;
    System.out.println("Playing♪ " + MusicName[pIndex] + "");
    //System.out.println("Playing♪ " + MusicName2[pIndex] + "");
    loadMusic();
    
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/

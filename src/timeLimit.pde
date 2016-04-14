/***********************************
 timeLimit
 ************************************/
void timeLimit() {
  //曲再生中の状態
  if (state == 1) {
    isFinish  = 20;
    isFinish2 = 10;
  } 
  else if ( state == 2 ) { 
    Counter++;

    if (Counter % 60 == 0)
      isFinish--;

    if (isFinish <= 0)
      isFinish = 0;

    fill(#FF5E0D);
    textSize(120);

    if (isFinish != 0)
      text(nf(isFinish, 2), 590, 710);

    if (isFinish == 0) {
      player.pause();
      text(nf(isFinish, 2), 590, 710);
      if(Counter % 180 == 0) {
        isBatu = true;
        hazure.rewind();
        hazure.play();
        Counter = 0;
      }
    }
    
  } /*else if ( state == 3) {
    Counter2++;

    if (Counter2 % 60 == 0)
      isFinish2--;

    if (isFinish2 <= 0)
      isFinish2 = 0;

    fill(#FF5E0D);
    textSize(100);

    if (isFinish2 != 0)
      text(nf(isFinish2, 2), 610, 710);

    if (isFinish2 == 0) {
      isBatu = true;
      if (Counter2 % 120 == 0) {
        hazure.rewind();
        hazure.play();
        Counter2 = 0;
      }
    }
  }*/
}

/****************************************************************/
/* EOF                                                          */
/****************************************************************/

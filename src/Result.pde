///////////////////////////////////
// Result
///////////////////////////////////
void result() { 
  if(newCnt < 2) { //多重生成防止
    bubble = new Bubble();
    newCnt = 2;
  }
  
  bubble.Print();
  
  textSize(100);
  textAlign(CENTER);
  fill(#FFFF00);
  
  res.paint(); 
  text("Winner!", width/2-20, height/2);
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/

        
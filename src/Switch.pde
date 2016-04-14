/////////////////////////////////////////
// switch文を関数化
/////////////////////////////////////////
void Switch() {
    switch( nowState ) {
        case TITLE: {
          background(white);
          if( isLoading ) {  
            //ロード中
            if( newCnt < 1 ) {  
              cvs = new titleCanvas();
              s   = new Show();
              t   = new TextAnimation( road, 8, 40, 80, 300 );
              newCnt = 1;
            }
              
              textSize( 80 );
              t.paint();
              // 進捗バー表示  
              int barW  = width - 20;  
              int barH  = 10;  
              noFill();  
              stroke(0, 100);  
              rect((width - barW)/2, (height - barH)/2, barW, barH);  
              noStroke();  
              fill(#FF5E0D);  
              rect((width - barW)/2, (height - barH)/2, percent * (width - 20) / 100, barH);  
          } else {  
            /* ロード後 */ 
            cvs.paint();
            //op.play();
            textSize(50);
            if(tCnt % 4 == 0) s.msg();  
            newCnt = 0;
          }  
          break;
        }
        case RULE: { 
            image( rule, 2, -10 );
            //'g'を押下した時にnowState = GAMEに移行するように仕様変更した。
            //if( scene == 2 ) nowState = GAME;
            break;
        }
        case SELECT: {
          //ジャンルごとに分けるならここを実装する必要がある
          //9月末の時点ではまだ決まっていない
        }
        case GAME: {  
            textFont(Splatoon);
            
             //結果画面へ
            if( isPanel == true ) { 
              nowState = RESULT;
              angle    = 0;
            }
            
            //FFT開始
            fft.forward( player.mix );
            
            stroke( 60, 60, 60 );
            //背景の設定
            image( back, 0, 0 );
    
            num1 = num2 = num3 = num4 = num5 = num6 = 0;
            angle += 0.1;
            
            //多重生成防止
            if( newCnt < 1 ) { 
                visual = new Visualizar( 360, 100, 80, 100);//Visualizarの彩度、明度、透明度、高さ
                res    = new TextAnimation(resultGame, 8, 30, width/2-200, 100);
                ani1   = new TextAnimation( w, 8, 30, 30, 655 );
                ani2   = new TextAnimation( p, 8, 30, 30, 655 );
                ani3   = new TextAnimation( a, 8, 30, 30, 655 );
                //fin    = new TextAnimation( finish, 9, 50, 630, 770 );
                nmap   = new nowMap();
                t      = new TextAnimation( road, 9, 40, 300, 400 );
                newCnt = 1;
            }
            
            for ( int i = 0; i < VisualNum; i++ ) {
              //高さの引き継ぎ
              visual.VisualHeight[i] = visual.giveHeight( i );  
              //色の引き継ぎ
              visual.VisualShow[i]   = visual.giveColor( i );    
              //グラフの描画
              visual.paintVisual( i );                         
            }
            
            attackPanel();
            showPoint();
            ShowButtonNum();
            showMessage();
            isAttack();  //アタックチャンス
            isJudge();   //正解か不正解の判定
            timeLimit(); //制限時間
            break;
        }
        case NAME: { 
          image(mName, 0, 0);
          musicName();
          break;
        }
        case RESULT: { 
            image( result, 0, 0 );
            angle += 0.1;
            result();
            break;
        }
        case END: { 
            //image( end, 0, 0 );
            break;
        }   
    }
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/

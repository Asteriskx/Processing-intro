/*********************************************************************************/
/* 7セグメントLED表示          Ver.1.00β        created　by J3　イントロ班      */
/*********************************************************************************/

/******************************************************/
/* グローバル関数                                     */
/******************************************************
/*****************************************/
/* ボタンポート定義                      */
/*****************************************/
 int buttonPin1 = 41; 
 int buttonPin2 = 42;
 int buttonPin3 = 43;
  //int buttonPin4 = 44;
  //int buttonPin5 = 45;
  //int buttonPin6 = 46;
  //const int LED = 13;

/******************************************/
/* フラグ関連                             */
/******************************************/
int flg1 = 0;
int flg2 = 0;
int flg3 = 0;
int flg4 = 0;
int flg5 = 0;
int flg6 = 0;  
int Cnt  = 0;

/********************************/
/* 初期化                       */
/********************************/
void setup() {

   for( int i = 2; i < 9; ++i ){ //2～8 pinMode( OUTPUT )
       pinMode(i,OUTPUT);
   }
  
    pinMode( buttonPin1, INPUT_PULLUP );
    pinMode( buttonPin2, INPUT_PULLUP );
    pinMode( buttonPin3, INPUT_PULLUP );
 //   pinMode( LED, OUTPUT );
    //pinMode(buttonPin4, INPUT);
    //pinMode(buttonPin5, INPUT);
    //pinMode(buttonPin6, INPUT);
    Serial.begin(9600); // 9600bpsでシリアルポートを開始
  
}

/********************************/
// LEDレイアウト定義            
// 0,1,2,3,4,5,6,7,8,9   .      
/********************************/
boolean Num_Array[10][7] = { //0～9まで
    { 1,1,1,1,1,1,0 }, { 0,1,1,0,0,0,0 }, { 1,1,0,1,1,0,1 }, 
    { 1,1,1,1,0,0,1 }, { 0,1,1,0,0,1,1 }, { 1,0,1,1,0,1,1 }, 
    { 1,0,1,1,1,1,1 }, { 1,1,1,0,0,1,0 }, { 1,1,1,1,1,1,1 }, 
    { 1,1,1,1,0,1,1 }  
};
  
/*boolean Num_Array[11][8]={ //学校の7セグ
  {0,0,0,1,0,0,0,1},{1,1,0,1,0,1,1,1},{0,0,1,1,0,0,1,0},{1,0,0,1,0,0,1,0},
  {1,1,0,1,0,1,0,0},{1,0,0,1,1,0,0,0},{0,0,0,1,1,0,0,0},{1,1,0,1,0,0,0,1},
  {0,0,0,1,0,0,0,0},{1,0,0,1,0,0,0,0},{1,1,1,0,1,1,1,1}
};*/

/*boolean Num_Array[11][8] = {
  {0,0,0,1,1,0,0,0},{1,1,0,1,1,1,1,0},{0,0,1,1,0,1,0,0},{1,0,0,1,0,1,0,0},
  {1,1,0,1,0,0,1,0},{1,0,0,1,0,0,0,1},{0,0,0,1,0,0,0,1},{1,1,0,1,1,0,0,0},
  {0,0,0,1,0,0,0,0},{1,0,0,1,0,0,0,0},{1,1,1,0,1,1,1,1}
};*/


/*********************************/
// LED表示関数                   
/*********************************/
void NumPrint( int Number ) {
    for ( int w = 0; w <= 7; ++w ) {
        digitalWrite( w+2, -Num_Array[Number][w] );
    }
}

/*void NumPrint(int Number){
  
  for (int w=0; w<=7; w++){
  digitalWrite(w+1,Num_Array[Number][w]);
  }
}
*/
/*************************************/
/* ループ                            */
/*************************************/
void loop() {
  
    if( flg1 == 0 && flg2 == 0 && flg3 == 0 ) {
        if ( digitalRead( buttonPin1 ) == LOW ) { flg1 = 1; Serial.println("1"); }
        else if( digitalRead( buttonPin2 ) == LOW ) { flg2 = 1; Serial.println("2"); }
        else if( digitalRead( buttonPin3 ) == LOW ) { flg3 = 1; Serial.println("3"); }
        //else if(digitalRead(buttonPin4) == HIGH) {flg4 = 1;Serial.println("4");}
        //else if(digitalRead(buttonPin5) == HIGH) {flg5 = 1;Serial.println("5");}
        //else if(digitalRead(buttonPin6) == HIGH) {flg6 = 1;Serial.println("6");}
    } else {
        if( Serial.available() > 0 ) {
            if( Serial.read() == 100 ) { 
                //flg1 = flg2 = flg3 = flg4 = flg5 = flg6 = 0;
                flg1 = flg2 = flg3 = 0;
            }
        }
    }
    if( flg1 == 1 ) NumPrint( 1 );
    else if( flg2 == 1 ) NumPrint( 2 );
    else if( flg3 == 1 ) NumPrint( 3 );
    //else if( flg4 == 1 ) NumPrint(4);
    //else if( flg5 == 1 ) NumPrint(5);
    //else if( flg6 == 1 ) NumPrint(6);
    else NumPrint( 0 );
    
  /*  if( flg1 && Cnt == 0 ) {
        delay( 50 );
        digitalWrite( LED, HIGH );
        delay( 300 );
        digitalWrite( LED, LOW );
        delay( 300 );
        Cnt++;
    } else if( flg2 && Cnt < 2 ) {
        delay( 50 );
        digitalWrite( LED, HIGH );
        delay( 300 );
        digitalWrite( LED, LOW );
        delay( 300 );
        Cnt++;
    } else if ( flg3 && Cnt < 3 ) {
        delay( 50 );
        digitalWrite( LED, HIGH );
        delay( 300 );
        digitalWrite( LED, LOW );
        delay( 300 );
        Cnt++;
    }  
    Cnt = 0;
    */
}

/*******************************************/
/* EOF                                     */
/*******************************************/

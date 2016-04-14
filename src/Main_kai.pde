//////////////////////////////////////////////////////////////
// H27 課題研究 イントロクイズ ReSize版  Copyright. K.Takeyama                   
//////////////////////////////////////////////////////////////

//※ 別途、ReadMe.txtに説明をしておきます。

///////////////////////////////////////////////////
// Import                                               
///////////////////////////////////////////////////
import ddf.minim.*;  //Use Minim
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import processing.serial.*; //Use Processing and Arduino.

/////////////////////////////////////////////////////////
// Global                                                
/////////////////////////////////////////////////////////
//Minim型変数であるminimの宣言
Minim minim;            

 //サウンドデータ格納用の変数
AudioSnippet hayaoshi;
AudioSnippet atari;
AudioSnippet hazure; 
AudioPlayer  op, player, player2;

//高速フーリエ変換用クラス
FFT fft;         

// シリアルポート
Serial myPort;          

//Class Instance
Bubble bubble;
nowMap nmap;
Show s;
TextAnimation ani1;
TextAnimation ani2;
TextAnimation ani3;
TextAnimation fin;
TextAnimation t;
TextAnimation res;
titleCanvas cvs;
Visualizar visual; //Visualizerクラス

//画像の取り扱い (PImage型)
PImage maru;
PImage batu;
PImage back;
PImage rule;
PImage result;
PImage end; 
PImage mName;

//フォントの指定 (PFont型)
PFont Splatoon;
PFont Japanese;

//整数系 (int型)
int[]   musicFlag;
int[][] map;

int AC; //アタックチャンス
int colorFlag = 0;
int Colorflg;
int Count     = 0;
int Counter   = 0;
int Counter2  = 0;
int isFinish  = 20;//制限時間
int isFinish2 = 10;
int musicNum;
int newCnt;  //多重生成防止カウンタ
int nowState; //draw内の遷移状態
int num1, num2, num3, num4, num5, num6;
int panelCnt = 0;
int pIndex;
int moveX    = 600; //MusicNameAnimationのX座標の移動量
int scene;
int Show     = 10;
int state;
int tCnt;           // フレーム処理
int UndoCount = 0;
int VisualNum = 38; //表示するVisualierの数 

//パーセンテージetc... (float型)
float percent;     //進捗率
float angle = 0;

//定数　(final)
static final int BUTTON   = 400; //文字の大きさ
static final int dispW    = 900; //画面横
static final int dispH    = 750; //画面縦
static final int MAX      = 5;
static final int WHITE    = 255;
static final int TITLE    = 1;
static final int RULE     = 2;
static final int SELECT   = 3;
static final int GAME     = 4;
static final int NAME     = 5;
static final int RESULT   = 6;
static final int END      = 7;

//文字列 (String型)
String[] MusicName, MusicName2; // 曲名
String   myString;  
String   finish     = new String("FINISH!     ");
String   resultGame = new String("RESLUT!     ");
String   road       = new String("Now Loading...");
String   w          = new String("Waiting!    ");
String   p          = new String("Playing!    ");
String   a          = new String("Answer!     ");

//色指定 (color型)
color[] cData; //Resultで使うための色配列(Bubbleクラスで降順に並び替えた番号の色に対応させている)

color white     = color ( 255, 255, 255 ); //白
color color1    = color ( 255,   0,   0 ); //1番の色
color color2    = color (   0, 255,   0 ); //2番の色
color color3    = color (   0, 255, 255 ); //3番の色
color color4    = color ( 255, 171,  93 ); //4番の色
color color5    = color ( 255, 255,   0 ); //5番の色
color color6    = color ( 245, 178, 225 ); //6番の色
color colorAC   = color (   0,   0, 204 ); //ACの時の文字色

//Flag (boolean型)
boolean    isMaru;
boolean    isBatu;
boolean    TEST       = !false;    // テスト用フラグ
boolean    isPanel    = false;     // パネルカウンタ
boolean    isLoading;              // スレッド終了判定フラグ           
boolean    isShow     = false;

/*****************************************/
/* Setup                                 */
/*****************************************/
void setup() {
    // 画面サイズ
    size(750, 750);    
    // 背景を白色に
    background(white); 
    
    //System.out.println(Serial.list()); //シリアル番号の表示
    
    /////////////////////////////////////////////////////////
    // try ～ catch
    /////////////////////////////////////////////////////////
    try {
      //TESTモードではない時
      if( TEST == false )
        //シリアル通信の開始
        myPort = new Serial(this, Serial.list()[0], 9600); 
        
    } catch( ArrayIndexOutOfBoundsException e ) {
      System.out.println( "Arduinoの接続が出来ていません。" );
      exit();
    }
    
    ////////////////////////////////////////////////
    //MAP初期化
    ////////////////////////////////////////////////
    map = new int[MAX][MAX];
    
    for( int i = 0; i < MAX; i++ ) {
      for( int j = 0; j < MAX; j++ ) {
        //Mapの中身をすべて"白"に
        map[i][j] = WHITE; 
        //System.out.print(map[i][j] + " ");
      } 
      //System.out.print("\n");
    }
    /////////////////////////////////////////////////
    
    minim = new Minim( this );  //初期化
    new SearchMusic();    //SearchMusicの生成
    new titleCanvas();    //titleCanvasの生成
    
    LoadFile();           //ファイルのロード
    nextMusic();          //次の曲へ
    
    state        = 1;     //イントロは待機状態に
    nowState     = TITLE; //画面の状態をタイトル画面に
    AC           = 0;     //AC初期化
    isMaru       = false; //○の表示
    isBatu       = false; //×の表示
    isLoading    = true;  //ロード中か
    newCnt       = 0;     //多重生成防止カウンタの初期化
    tCnt         = 0;     //フレームカウンタの初期化
    scene        = 1;
    fft          = new FFT( player.bufferSize(), player.sampleRate() ); //高速フーリエ変換のインスタンス生成
    
    //60fpsに固定
    frameRate(60);
    // フォントの設定
    textFont(Splatoon);
    // 図形ノイズ除去
    smooth();   
     
    // マルチスレッドのインスタンス生成
    Thread t  = new Thread( new LoadThread() ); 
    // マルチスレッドの開始
    t.start();  
}

/***************************************************/
/* draw                                            */
/***************************************************/
void draw() {
  Switch();
}
 /**************************************************/
 /* EOF                                            */
 /**************************************************/

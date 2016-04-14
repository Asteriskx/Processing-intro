/////////////////////////////////////////////////
// ファイルロード関数
/////////////////////////////////////////////////
void LoadFile(){
  hayaoshi     = minim.loadSnippet("C:/Users/J02/Desktop/工業展/Main_kai/sound/Hayaoshi.wav");  // ボタンを押した
  atari        = minim.loadSnippet("C:/Users/J02/Desktop/工業展/Main_kai/sound/Seikai.wav");    // 正解
  hazure       = minim.loadSnippet("C:/Users/J02/Desktop/工業展/Main_kai/sound/Huseikai.wav");  // 不正解
 // op           = minim.loadFile("C:/Users/J02/Desktop/工業展/op/Crazy Party Night ～ぱんぷきんの逆襲～／きゃりーぱみゅぱみゅ.mp3");
  maru         = loadImage( "C:/Users/J02/Desktop/工業展/Main_kai/image/maru.png" );            // ○
  batu         = loadImage( "C:/Users/J02/Desktop/工業展/Main_kai/image/batsu.png" );           // ☓
  back         = loadImage( "C:/Users/J02/Desktop/工業展/Main_kai/image/p2.jpg" );              // 背景
  rule         = loadImage( "C:/Users/J02/Desktop/工業展/Main_kai/image/ルール１.png" );        // 同上
  mName        = loadImage( "C:/Users/J02/Desktop/工業展/Main_kai/image/name.jpg" );
  result       = loadImage( "C:/Users/J02/Desktop/工業展/Main_kai/image/result.jpg" );          // 結果画面
  end          = loadImage( "C:/Users/J02/Desktop/工業展/Main_kai/image/end.png" );             // 終了画面
  
  /*
  hayaoshi     = minim.loadSnippet("N:/課題研究(かんせー)/ノート用/Main_kai/sound/Hayaoshi.wav");  // ボタンを押した
  atari        = minim.loadSnippet("N:/課題研究(かんせー)/ノート用/Main_kai/sound/Seikai.wav");    // 正解
  hazure       = minim.loadSnippet("N:/課題研究(かんせー)/ノート用/Main_kai/sound/Huseikai.wav");  // 不正解
  op           = minim.loadFile("N:/課題研究(かんせー)/ノート用/Main_kai/music/ran.mp3");
  maru         = loadImage( "N:/課題研究(かんせー)/ノート用/Main_kai/image/maru.png" );            // ○
  batu         = loadImage( "N:/課題研究(かんせー)/ノート用/Main_kai/image/batsu.png" );           // ☓
  back         = loadImage( "N:/課題研究(かんせー)/ノート用/Main_kai/image/p2.jpg" );              // 背景
  rule         = loadImage( "N:/課題研究(かんせー)/ノート用/Main_kai/image/ルール１.png" );            // 同上
  mName        = loadImage( "N:/課題研究(かんせー)/ノート用/Main_kai/image/name.jpg" );
  result       = loadImage( "N:/課題研究(かんせー)/ノート用/Main_kai/image/result.jpg" );          // 結果画面
  end          = loadImage( "N:/課題研究(かんせー)/ノート用/Main_kai/image/end.png" );             // 終了画面
  */
  Splatoon     = loadFont("ShowcardGothic-Reg-400.vlw");
  Japanese     = createFont("MS Gothic", 40, true);
}
/****************************************************************/
/* EOF                                                          */
/****************************************************************/

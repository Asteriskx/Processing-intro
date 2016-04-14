H27年度　課題研究　イントロクイズ　プログラム

Copyright by たっけん (@Astrisk_)

この度は、イントロクイズをプレイしていただき有難うございます。
簡単にですが、本プログラムの概要を説明しておきたいと思います。

開発環境
学校　・・・　Processing-1.5.1 TeraPad
自宅　・・・　Processing-1.5.1 Processing-2.2.3 Processing-3.0 vim TeraPad Eclipse 

使用マイコン Arduino MEGA 2560 (SainSmart社Arduino互換機)　2500円程度


環境の違いにより、リサイズを余儀なくされました。
一応、リサイズ前のソースも残しておきますので、
４階のPCでもキーボードからプレイすることが出来ます。

もしかしたら、ネットワーク対戦機能を付けるかもしれません。
これにより、４階のPCでイントロクイズができるかも...???


ソースは、全29ファイルから成り立っています。
(class)は、クラスが記述されているファイルを表しています。

・attackPanel.pde
・Bubble.pde              (class)
・buttonNumber.pde
・isAttack.pde
・isJudge.pde
・keyPressed.pde
・LoadFile.pde
・loadMusic.pde
・LoadThread.pde          (class)
・Main.pde
・mousePressed.pde
・musicName.pde
・MusicNameAnimation.pde
・nextMusic,pde
・nowMap.pde             (class)
・Razer.pde              (class)
・Result.pde             (class)
・SearchMusic.pde        (class)
・serialEvant.pde
・Show.pde               (class)
・showMessage.pde
・showPoint.pde
・stop.pde
・Switch.pde
・TextAnimation.pde      (class)
・timeLimit.pde
・titleCanvas.pde        (class)
・update.pde
・wait.pde

・フォルダ説明
Arduino　・・・  Arduinoと通信するためのプログラムが入っています。
data     ・・・  Processingで使用しているフォントデータが入っています。
image    ・・・　Processingで使用している画像が入っています。
music    ・・・　Processingで使用している曲が入っています。
sound    ・・・　Processingで使用してる効果音が入っています。
txt      ・・・  本説明などのtxtファイルが入っています。


2014年の文化祭の時、先生の思い付きから始まった本企画は、2年目を迎え
ここまで成長させることが出来ました。
協力してくださった堅太郎先生を始めとし、課題研究のメンバー、先生、多くのプレイしてくださった皆さんに
感謝します。

P.S.
	改良してくれる人がいれば、連絡をください。	
	作成者のところに某SNSの垢を載せていますので...w
	汚いソースで申し訳ないです...(´・ω・｀)

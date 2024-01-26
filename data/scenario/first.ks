*title_menu|タイトル
[loadplugin module="wuvorbis.dll"]
[loadplugin module="krmovie.dll"]


[startanchor]
[eval exp="tf.label = ['*start','*cast','*story_011','*story_012','*story_013','*story_01','*story_02','*story_03','*story_04','*story_05','*story_06','*story_07','*story_08','*story_09','*story_10','*story_11','*story_12','*story_13','*story_14','*story_15']"]
[eval exp="tf.label_title = ['スタート','舞台・配役','〇一一場 稽古場','〇―二場 安土城・城内','〇―三場 美又村','一場　美又村','二場　有岡城','三場　京・六角堂・獄舎','四場　京・六条河原・処刑場','五場　牢','六場　高槻城','七場　近江　峡谷','八場　高槻城　高槻城下の平屋――。','九場　近江　平地','十場　安土城','十一場　近江・山中','十二場　近江・安土城下','十三場 安土近郊 豊郷 関所','十四場　安土城','十五場　本能寺']"]
[call storage="scenario/extra/album_init.ks" target=*album_init]
[cm]

; メッセージ履歴への出力を停止し、表示不可にする

[history output=false enabled=false]

; 栞にはさめなくする

[disablestore store=true]

[rclick enabled="false"]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]


;セリフ再生
;[playse buf="0" storage="sound/voice/catch.ogg" ]

[image storage="image/rogo2.jpg" layer=base page="fore" visible="false" top="0"]
[image storage="image/rogo.jpg" layer=base page="back" visible="false" top="0"]
[wait time=1000]
[trans layer=base time=4000 method=crossfade]
[wt]



[image storage="image/rogo.jpg" layer=base page="fore" visible="false" top="0"]
[image storage="image/rogo2.jpg" layer=base page="back" visible="false" top="0"]
[wait time=1000]
[trans layer=base time=2000 method=crossfade]
[wt]
[wait time="1000"]


; 以降はタイトルメニュー画面
*title_menu|タイトルメニュー
[startanchor]
[if exp="tf.chapter_mode"]
	[eval exp="tf.chapter_mode=0"]
	[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
	[position layer=message0 page=fore opacity=128 vertical="true"]
	[delay speed=user]
	; 栞にはさめるようにする
	[disablestore store=false]
	; メッセージ履歴への出力を再開、表示可にする
	[history output=true enabled=true]
	[jump target="&tf.label[tf.chapter_selected]"]
[endif]
[disablestore store="true" restore="false"]
[rclick enabled="false"]

;音楽開始
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/信長.ogg" loop="true"]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[ws buf=0 canskip="false"]

[image storage="image/title2/タイトル2.bmp" layer=base page="fore"]

[position layer=message0 page=fore opacity=0 vertical="false"]



[tempsave place=0]
; 履歴レイヤを抑止
[history output=false enabled=false]
; 背景レイヤ表画面のクリッカブルマップを無効化
[mapdisable layer=base page=fore]
; 全前景レイヤ表画面のクリッカブルマップを無効化
; メニュー用メッセージレイヤ表画面を表示し、カレントのメッセージレイヤにする
;[layopt layer="&tf.rclick_message" page=fore visible=true]
;[current layer="&tf.rclick_message" page=fore]


[delay speed=nowait]
*title_menu_loop
[er]


[locate x = 40 y=0]
[button graphic="image/title2/start.png" target=*restore hint="はじめから"]

[locate x = 40 y=70]
;[button graphic="image/title2/load.png" jump storage="rclick_load2.ks" target=*load_menu2 hint="つづきから"]
[button graphic="image/title2/load.png" storage="rclick_load.ks" target=*load_menu exp="tf.load_mode=true" hint="つづきから"]
[locate x = 40 y=140]
[button graphic="image/title2/chaptar.png" storage="rclick_chapter.ks" target=*chapter_menu exp="tf.load_mode=true" hint="各章の頭から"]

[locate x = 40 y=210]
[button graphic="image/title2/extla.png" storage="extra.ks" target=*extra_menu hint="エクストラ"]

[locate x = 40 y=280]
[button graphic="image/title2/end.png" exp="kag.closeByScript(%['ask'=>'true'])" hint="終了"]



;[style align=center]
;
;[font size =40 face ="正調祥南行書体" color=0x000000 bold="true"  shadow="false"]
;[link target=*restore]はじめから[endlink][r]
;[link target=*restore]つづきから[endlink][r]
;[link target=*restore]エクストラ[endlink][r]
;
;[link exp="kag.close()"]終了[endlink]

[s]
;終了→いいえの場合、sタグ以降が実行される。この対策として画面描画処理部に戻す。
[jump target=*title_menu_loop]

[resetstyle]


;

; 設定を復帰

;

*restore

[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
[position layer=message0 page=fore opacity=128 vertical="true"]



[delay speed=user]

; 栞にはさめるようにする

[disablestore store=false]

; メッセージ履歴への出力を再開、表示可にする

[history output=true enabled=true]

;
*start|スタート

; 実際のシナリオへ
;音楽停止
[fadeoutbgm time=1000]
[cm]
[wait time=500]
;[image storage="taitole" layer="base" page="fore"]
[image storage="black2" layer="base" page="fore "visible="true" top="0"]
;[image storage="black" layer="base" page="fore" visible="true" top="0"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

ひとはあらゆる自由を許されたとき、自らの不可解な限定とその不自由さに気付くであろう。
人間は永遠に自由では有り得ない。なぜなら人間は生きており、又死なねばならず、
そして人間は考えるからだ。[l][r] 
                            坂口安吾『堕落論』[l][r]
[r]


愛は不正を喜ばず、真理を喜びます。すべてをがまんし、すべてを信じ、すべてを期
待し、全てを耐え忍びます。愛は決して絶えることがありません。預言の賜物ならば
すたれます。異言ならばやみます。知識ならばすたれます。…<中略>…いつまでも残
るものは信仰と希望と愛です。その中で一番すぐれているのは愛です。 [l][r]
                            コリント書Ⅰ    １３章４節～１３節 [l][r]
[r]

知識には限界がある。想像力は、世界を包みこむ。 [l][r]
                            アルバート・アインシュタイン [l][r][r]
[r]
[r]
―――――――――――――――――――――――― [r]
[r][p]
[cm]
*cast|舞台・配役
//[position layer=message0 page=fore opacity=128 vertical="true"]
[position layer=message0 page=fore opacity=128 vertical="true"]
[image storage="taitole" layer="base" page="fore"]
[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

舞台・配役[resetfont] [r]
[r]

【舞台】[l][r] 
天正七年（一五七九年） 摂津 ～ 天正十年（１５８２）年 京・本能寺  [l][r]
[r][r]


【登場人物】 [r]
十郎 … 謎の野武士 [r]

雪乃 … 美又村の村娘 [r]

源八 … 美又村の村人 [r]

みよ … 雪乃の妹 [r]

弥七 … 源八の兄。名工として安土城建設に携わる [r]
[r]
<美又村の人々> [r]
藤五郎 … 美又村の村人[r]
茂吉 … 美又村の村人 [r]
玉 … 美又村の村人 [r]
松江 … 美又村の村人 [r]
とら … 美又村の村人 [r]
[r]

<有岡城> [r]
荒木村重 … 有岡城城主。信長に対し反旗を翻す[r]
だし … 村重の妻 [r]
[r]

<六角堂> [r]
きぬ … 信長に父を殺された娘 [r]
[r]

<高槻城> [r]
高山右近 … 荒木村重配下の武将。高槻城主。キリシタン大名[r]
ユスタ … 高山右近の妻 [r]
[r]

<反信長派勢力> [r]
雑賀孫市 … 鉄砲集回を率いる戦術の名手 [r]
ミゲル市造 … 信長に敵意を抱くキリシタン [r]
ヨハンナ千代 … 信長に敵意を抱くキリシタン [r]
[r]

<安土セミナリヨ> [r]
パウロ三木 … 安土セミナリヨのキリシタン [r]
[r]

<織田軍> [r]
黒田官兵衛 … 織田・豊臣配下の武将 [r]
羽柴秀吉 … 織田配下の武将。密かに天下統一を狙う[r]
小太郎 … 織田軍の兵士[r]
丹羽長秀 … 織田配下の武将[r]
滝川一益 … 織田配下の武将[r]
明智光秀 … 織田配下の武将[r]
織田信長 … 天才と呼ばれ、天下統一を狙う覇者[r] 
[r]

美又村の人々[r]
人質の人々[r]
十郎軍の人々[r]
信長暗殺回の人々[r]
織田軍の人々[r]
[r]
他[l] [p][cm]

*story_011|〇一一場 稽古場
[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
;[image storage="keikoba" layer="base" page=fore]

;[image storage="taitole" layer="base" page="fore" visible=]

[image storage="fgimage/1/_IS17189.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音楽開始
[bgmopt volume="50"] 
[playbgm storage="sound/effect/P51ガヤ.ogg" loop="true"]

〇一一場 稽古場[resetfont] [r]
[r]

[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
;解説モードテキスト呼び出し
;[call target="*explan001" storage="explanation.ks" cond="sf.bExplan"]

　　　　　　　　　　　[indent]
舞台は黒一色の素舞台。[l][r]
開演前から役者たちはウォーミングアップをし、[l][r]
次第に舞台に役者が揃っていく。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/1/itou.ogg" ]
伊藤優　　　　 [indent]
役者の皆さん、すみませーん。間もなく開始しますが、今日は、小道具や衣装は、
この稽古場にあるものを使ってやって下さい。お願いしまーす。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

　　　　　　　　　　　[indent]
ぞろぞろと出て行く役者たち。[r]
十郎役の役者が一人、舞台に残る。[r]
彼は一人、誰もいない舞台上で不可思議な動きを始める。[l][r]

[image storage="fgimage/2/_IS17200.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]

[image storage="fgimage/2/_IS17202.JPG" layer="1" page="fore" visible="true" top="50"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


たどたどしく、ぎこちない動き――――。[endindent][l][r]
[r]

[image storage="fgimage/1/_IS17189.JPG" layer="1" page="fore" visible="true" top="50"]

　　　　　　　　　　　[indent]
役者たちが戻って来る。役者日高勝郎、役者たちに呼びかける。[endindent][l][r]
[r]

日高勝郎　　　[indent]
みなさんこんにちは。[endindent][l][r]

役者数人　　　[indent]
こんにちはァ。[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/1/2.ogg" ]
日高勝郎　　　[indent]
「間もなく始まります。演劇の力は、あらゆる物や状況、見えないもの
を見えるようにできます。では…、その見えないものの、最たるものは
何でしょうか…。今日はみんなで力を合わせて、そこにたどり着いてみたいと思います。アインシュタインはこう言いました。「知識には限界がある。想像力は世界を包み込む。」」。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]


　　　　　　　　　　　[indent]
一発の効果音。
;効果音再生
[playse buf="1" storage="sound/effect/P34ドーン.ogg" ]

反応する役者たち。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]


日高勝郎　　　[indent]
それでは、開始しまーす。皆さん、よろしくおねがいしまーす。[endindent][l][r]

役者たち　　　[indent]
よろしくおねがいしまーす。[endindent][l][r]

[image storage="fgimage/3/_IS32232.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/1/3.ogg" ]
日高勝郎　　　[indent]
はいじゃあスタンバーイ！衣装スタンバーイ！セットスタンバーイ！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
衣装、セットが役者たちによって運び込まれる。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/1/4.ogg" ]
日高勝郎　　　[indent]
はい行くよー！ハイ、ヨーイ、[endindent][l][r]
[ws buf=1 canskip="true"]

[r]
　　　　　　　　　　　[indent]
スタンバイを終えた役者たちが散る。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/1/5.ogg" ]
日高勝郎　　　[indent]
スタート！[endindent][l][r]
[ws buf=1 canskip="true"]

[r]


*story_012|〇―二場 安土城・城内
[image storage="fgimage/3/_IS17213.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[stopbgm]

　　　　　　　　　　　[indent]
役者たちがバサリと衣装を翻し、一斉に身に纏う。[r]


;音楽停止

;効果音再生
[playse buf="1" storage="sound/effect/P34ドーン.ogg" ]

[image storage="fgimage/3/_IS32234.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



;音楽開始
[bgmopt volume="50"]
[playbgm storage="bgm/ogg/信長.ogg" loop="true"]
場面は物語の舞台へと変わる。[endindent][l][r]
[r]


;[image storage="aduti" layer="base" page=fore]
[ws buf=0 canskip="true"]

[p][cm]


[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
〇―二場 安土城・城内[resetfont][l][r][r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
信長と、かしずく家臣たち。[endindent][l][r]
[r]

[image storage="fgimage/3/_IS16671.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 信長　　　[indent]
先刻、高岡よりこの安土に帰城の折、我が一団に奇襲をかけ、この信長
を亡きものにせんと暗殺を企てた者らがいた。捕えた者を拷問に掛け、
奴らは摂津、美又村の足軽百姓の一党と知れた。すぐさま村に飛び、そ
の残党、一族もろとも骨一つ残さず嬲り殺せ。加えて、捕えた者の口か
らあらぬ噂がまき散らされた。そなたたちも聞き及んでおろう…。その
噂の真相しかと確かめよ。その手がかりを携えずして、この安土に舞い
戻ることは断じて許さん。よいな。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
兵たち、かしずき駆け去る。[l]

;音楽停止
[fadeoutbgm time=3000]
入れ替わるように、歌と共に、村の稲刈りの情景へ。[endindent][l][r]
;効果音再生


*story_013|〇―三場 美又村
[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]

[image storage="fgimage/4/_IS16674.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[playse buf="0" storage="sound/song/NO36出だしの歌.ogg" ]
[p][cm]


〇―三場 美又村[resetfont][l][r][r]
;[image storage="mura1" layer="base" page=fore]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
貧しく鄙びた村。[r]
刈った稲の籾を落とし、からさお打ちする村人たち。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

;音楽開始
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/雪乃村人.ogg" loop="true"]

　藤五郎　　　[indent]
精が出るなァ。[endindent][l][r]

　　 雪乃　　　[indent]お互い様。[endindent][l][r]

　藤五郎　　　[indent]
…おめぇんとこはお父うもお母あもいねんだから、下のみよも手伝わせ
りゃいいんだ。[endindent][l][r]

　　 雪乃　　　[indent]子供はたぁんと遊ぶのが一番の仕事だよ。[endindent][l][r]

　藤五郎　　　[indent]
出来た姉だねェ…。（積まれた米俵を見て）ハァ…、まったくこんだけ積
んでも、取り立てがくりゃあ、奴ら米粒の一つも残しちゃくんねんだろ
うよ…。（みよを見つけ）おお、みよ、[endindent][l][r]

;[image storage="03" layer="base" page=fore]
     みよ 　　 [indent]
まだ？[endindent][l][r]

　　 雪乃　　　[indent]ああ、待ってな。これ結わえたら。[endindent][l][r]

     みよ 　　 [indent]
…早く帰ろ。[endindent][l][r]

[image storage="fgimage/4/_IS24222.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]聞きわけないなァ。なっ！みよ何した.だらけで。おめ、川っぺりに行
ってたな！…あそこは鉄砲水危ねェから、行くなっつったろ！[endindent][l][r]

　　　　玉　　　[indent]
おお、みよ帰ったの。[endindent][l][r]

　　 雪乃　　　[indent]おめェはもう…。姉の言いつけも聞かねェではしゃぎ回って、[endindent][l][r]

　　　　玉　　　[indent]
へ？おめ何言ってんの。みよ、さっき米俵持って村長んとこ届けてたで
ねェの。仔猫が大岩抱えたみてェにうんしょうんしょってやってっから、
みんなでたまげてよォ。[endindent][l][r]

     みよ 　　 [indent]
…。[endindent][l][r]

　　 雪乃　　　[indent]みよ、ほんとか。[endindent][l][r]

     みよ 　　 [indent]
（ぽつりぽつりと）帰ったらねェ様、また一人で持って
くんだろ。いつもおら独り寝こけててさ、おら届け行けば、ねェ様ずっと
一緒にいてくれっと思ってよ。[endindent][l][r]


[image storage="fgimage/4/_IS16676.JPG" layer="1" page="fore" visible="true"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]（みよを抱いて）馬鹿みよォ。おめェになんかあったら、あの世のおと
うになんて言ったらいんだよ。[endindent][l][r]

[image storage="fgimage/4/_IS16677.JPG" layer="1" page="fore" visible="true" top="50" left="0" ]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[r]
　　　　　　　　　　　[indent]
泣き出すみよ。雪乃、あやすように戯れ歌を歌う。遊ぶ二人。[l][r]
[r]
[fadeoutbgm time=30]

;セリフ再生
[playse buf="0" storage="sound/song/なまずのうた雪乃みよ.ogg" ]
[image storage="fgimage/4/_IS17236.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
「一世（ひとよ）二代（ふたよ）の 大鯰（おおなまず）[l][r]
三またまたいだ 叢山（むらやま）に[l][r]
石の小井戸に 影法師[l][r]
拝みゃがれ お耳すぼんでお逃げやれ。」[endindent][l][r]
[r]

[ws buf=0 canskip="true"]

;音楽開始
[playbgm storage="bgm/ogg/雪乃村人.ogg" loop="true"]


　　 雪乃　　　[indent]お供えしたら、すぐ帰っから待ってな。[endindent][l][r]

     みよ 　　 [indent]
うん。[endindent][l][r]

[r]
;[image storage="mura1" layer="base" page=fore]
　　　　　　　　　　　[indent]
雪乃、ひとり戯れ歌を歌いながら草を分け、山に入る。[endindent][l][r]



;音楽停止
[fadeoutbgm time=3000]


;音楽開始
[playbgm storage="bgm/ogg/十郎.ogg" loop="true"]

[image storage="fgimage/6/_IS16679.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
×   ×   ×[r]

やがて山奥に古井戸が現れる。[l][r]
雪乃、井戸に向かって手を合わせ、笹の葉に包んだ握り飯を放る。
耳を塞ぎ、振り返って歩き出したところ、蹴躓いて転ぶ。咄嗟に耳
に当てていた手を地面につくと、突然、井戸から叫ぶ声が聞こえる。[endindent][l][r]
[r]
 
[image storage="fgimage/6/_IS17240.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
ひゃあ！こ、これだなお父うが言ってた山神様のたたりってのは。すん
ませんすんません、すぐに出ていきますから、おねげぇだからたたった
りしねェで下せぇ！（声）うわぁぁ！た、たたるならおらだけにして下
せぇ。この通りだ！今まで一日だって欠かさずお供え届けに来てたでね
ェか！その握り飯作るんだってよ、おらたち粟ヒエ食って我慢して一生
懸命残しといただぞ。それをおめェ、今んなってたたるだなんて、…ち
ょっと逆ギレでねェか！[endindent][l][r]

[image storage="fgimage/6/_IS17245.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
おい！[endindent][l][r]

　　 雪乃　　　[indent]ひぃ！[endindent][l][r]

　　 十郎　　　[indent]
聞けアマ！何を喚いてる！[endindent][l][r]

　　 雪乃　　　[indent]ううう…、なんて育ちの悪い山神様だ。[endindent][l][r]

　　 十郎　　　[indent]
とっととここから出せ！[endindent][l][r]

　　 雪乃　　　[indent]へ？これ…、こっから聞こえてんのか？人か？[endindent][l][r]

　　 十郎　　　[indent]
人だ！正真正銘人間様だ！[endindent][l][r]

　　 雪乃　　　[indent]
なんで落ちたいつ落ちた、こんな古井戸に。ちょっと待ってろ、今助けてやっから！（袖をたくしあげていた紐をほどく）。[endindent][l][r]

;[image storage="04" layer="base" page=fore]
[image storage="fgimage/6/_IS16688.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
よし。[endindent][l][r]

　　 雪乃　　　[indent]おめ、つらかったろこんなとこで…。
（紐を井戸におろして）…届いたか？
まだか？。[endindent][l][r]

　　 十郎　　　[indent]
（不気味に笑い）あいつら…、ブチ殺してやるわ。[endindent][l][r]

　　 雪乃　　　[indent]（紐を引き）ひっ。[endindent][l][r]

　　 十郎　　　[indent]
（紐をつかみそこね）あ？。[endindent][l][r]

　　 雪乃　　　[indent]（紐を引き上げて）ひっ、ひっ、[endindent][l][r]

　　 十郎　　　[indent]
（紐をつかもうと飛び上り）おいコラ！何してる！[endindent][l][r]

　　 雪乃　　　[indent]分かったぞ、おめ…野武士だな。[endindent][l][r]

[image storage="fgimage/6/_IS17249.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
野武士？[endindent][l][r]

　　 雪乃　　　[indent]村襲ってきた奴なんだろ。んで、うちのお父うがえいやぁって退治して、
井戸ん中放ったんだな、んでんで、お父う優しいからおめェ生かそうと、
握り飯やってやってたんだな。ダメだダメ、出さね、出さねェぞ！[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/3/1.ogg" ]
　　 十郎　　　[indent]
待て！…お前ここで、俺を出さねェと後悔するぞ。（耳を澄まし）…聞こ
える。騎馬だ。十五…いや二十、さっきから麓で暴れ回ってる。戦じゃ
ねェ…、殺しだ。[endindent][l][r]
[ws buf=0 canskip="true"]

;音楽停止
[fadeoutbgm time=3000]


;音楽開始
[playbgm storage="bgm/ogg/戦闘.ogg" loop="true"]

[playse buf="0" storage="sound/voice/3/2.ogg" ]
　　 雪乃　　　[indent]（咄嗟に村を見やり）…火だ。村が燃えてる！（駆け出す）。[endindent][l][r]
[ws buf=0 canskip="true"]

[playse buf="0" storage="sound/voice/3/3.ogg" ]
　　 十郎　　　[indent]
待てェ。…娘一人、行っても巻き添え食って死ぬだけだ。[endindent][l][r]
[ws buf=0 canskip="true"]

[playse buf="0" storage="sound/voice/3/4.ogg" ]
　　 雪乃　　　[indent]
（這うように立ちあがり）みよ！[endindent][l][r]
[ws buf=0 canskip="true"]

[image storage="fgimage/6/_IS17258.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[image storage="fgimage/6/_IS17259.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/3/5.ogg" ]
[image storage="fgimage/6/_IS17261.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 十郎　　　[indent]
いいだろう、取引だ。俺をここから出せば一刻は、お前の言いなりにな
ってやる。雑兵風情の十や二十、造作もなくブチのめしてやるわ。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 雪乃　　　[indent]
…。[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/3/6.ogg" ]
[image storage="fgimage/6/_IS32238.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
さあ娘！その手の紐を、放れ！[endindent][l][r]
[ws buf=0 canskip="true"]

[r]



;[image storage="mura1" layer="base" page=fore]
[image storage="fgimage/8/_IS24399.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



;効果音再生
[playse buf="1" storage="sound/effect/SE合戦小.ogg" ]
　　　　　　　　　　　[indent]
×   ×   ×[l][r]
武者たちが村人を襲い、次々と血祭りにあげる[l][r]
そこへ、十郎。[endindent][l][r]
[r]

　　 十郎　　　[indent]
お前ら…、あの安土の信長公の差し金か？。[endindent][l][r]

　 武者１　　　[indent]
…斬れ！[endindent][l][r]
[r]

[image storage="fgimage/8/_IS24234.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
一斉に十郎にかかる武者たち。瞬く間に斬り倒され、
;効果音開始
[playse buf="1" storage="sound/effect/斬る4.ogg" ]
散っていく[l][r]
[ws buf=1 canskip="true"]

そこへ、雪乃。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

[image storage="fgimage/8/_IS16723.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 雪乃　　　[indent]
みよ…、みよ！[endindent][l][r]

　　　　玉　　　[indent]
雪乃、みよが…、織田の武者につかまって！[endindent][l][r]

　　 雪乃　　　[indent]
…みよが、どうして！[endindent][l][r]

     とら 　　 [indent]
（駆け出そうとする雪乃に）無駄だよ。とっくに馬で連れてかれた。[endindent][l][r]

　　 雪乃　　　[indent]
みよ！（駆け出す）。[endindent][l][r]


　藤五郎　　　[indent]
（雪乃を抑えて）待て！今行きゃ、お前が斬り殺される！[endindent][l][r]

　　 雪乃　　　[indent]
…やだっ！放せっ！[endindent][l][r]

　　　　玉　　　[indent]
（暴れる雪乃を抑えて）雪乃っ、[endindent][l][r]



[image storage="fgimage/8/_IS17271.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
;音楽開始
[playse buf="0" storage="sound/voice/4/1.ogg" ]
　　 雪乃　　　[indent]
みよ…、みよーーーっ！[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
　　　　　　　　　　　[indent]
村人たちの腕の中で、雪乃が悲痛な叫びをあげる[l][r]
その姿を、十郎が、傍らで見つめている。[l][r]


暗転。[endindent][l][r]
[r]

;フェードアウト
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[image storage="fgimage/8/_IS17271.JPG"" layer="2" page="fore" visible="false" top="50"]
[image storage="fgimage/8/black681.jpg" layer="1" page="back" visible="false" top="50"]
[wait time=2000]
[trans layer="1" time=2000 method=crossfade]
[wt]

[fadeoutbgm time=2000]
[wait time=4000]
;音楽停止

[wt]
;[cm]
;[image storage="05" layer="base" page=fore]
;ここは動画に差し替えて表示しないか検討中
;ナレーション再生
;[playse buf="0" storage="sound/voice/7.ogg" ]
;　　　　　　　　　　　[indent]
;オープニング[l][r]
;映像・ナレーションと共に、衣装を身に纏った役者たちが登場する。[l][r]
;[image storage="fgimage/9/_IS16696.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「天正七年、世は戦乱のただ中にあった。血で血を洗う戦を制し、
;近江を中心に一大勢力を築いたのは、乱世の寵児、織田信長。」４[l][r]
;
;[image storage="fgimage/9/_IS16697.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「彼の元に集うは猛将知将の最強軍回。[l][r]
;織田の双璧、羽柴秀吉、明智光秀。」２[l][r]
;
;[image storage="fgimage/9/_IS16726.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「権謀操る不動の重臣、丹羽長秀、滝川一益。」２[l][r]
;
;[image storage="fgimage/9/_IS16698.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「知略の軍師、黒田官兵衛。義の切支丹、高山右近。」２[l][r]
;
;[image storage="fgimage/9/_IS16729.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「幾多の才能を擁する織田軍は、
;破竹の勢いで天下統一へと突き進む。」２ [l][r]
;
;
;「しかし一方でその暴政に耐えかね、
;信長打倒を企てる者たちもいた。」２ [l][r]
;「有岡城城主、荒木村重。雑賀孫市ら市井の者たち」２ [l][r]
;「世の多くの民百姓たちは、混乱のなか怯えながら日々を送る。」２ [l][r]
;
;[image storage="fgimage/9/_IS17294.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「いつしか南蛮の神の教えが、
;迷える民の心を次第にとらえていった。」２[l][r]
;
;[image storage="fgimage/9/_IS17295.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「摂津の寒村、美又村に住まう百姓の子、雪乃と源八」２ [l][r]
;
;[image storage="fgimage/9/_IS16699.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「彼らの前に突如現れた、謎の野武士、十郎」２ [l][r]
;
;[image storage="fgimage/9/_IS17302.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「二人は十郎と共に奪われた家族、みよ、弥七を取り戻すため、」２[l][r]
;
;[image storage="fgimage/9/_IS17303.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「一路、覇王織田信長の待つ、近江、安土城を目指す。」２ [l][r]
;
;[image storage="fgimage/9/_IS16732.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「彼らの行く手に待ち受けるのは、一縷の希望か無明の闇か。」２ [l][r]
;
;[image storage="fgimage/9/_IS16732.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;「めくるめく戦国絵巻の幕が、今、切って落とされる」２ 
;[image storage="fgimage/9/_IS17327.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;[ws buf=0 canskip="true"]
;
;
;[l][r]
;[p][cm]


[loadplugin module ="krmovie.dll"]
[layopt layer="message0" page="fore" visible="false"]
[video visible="true" left=0 top=0 width=1024 height=768]
[openvideo storage=op.wmv]
[playvideo]
[wv canskip="false"]
[layopt layer="message0" page="fore" visible="true"]
[cm]



*story_01|一場　美又村
[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]

[image storage="fgimage/10/_IS16750.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;音楽開始
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/悲しみ.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

一場　美又村[resetfont][l][r]
[r]


[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　　　　　　　　　　[indent]
騒乱の後始未をする村人たち。[endindent][l][r]
[r]


　　　　玉　　　[indent]
とら、どうだった。[endindent][l][r]

     とら 　　 [indent]
駄目だ。みんな消し炭んなってた。[endindent][l][r]

　　 茂吉　　　[indent]
…うちの甥っ子も、巻き添え食って死んでた。[endindent][l][r]

　　　　玉　　　[indent]
…それは気の毒だったな。[endindent][l][r]

　藤五郎　　　[indent]
（茂吉に）どしたよ、シケた面して。[endindent][l][r]

　　 茂吉　　　[indent]
何だかやりきれなくてよ…。[endindent][l][r]

　藤五郎　　　[indent]
おめ仕方ねぇだろ。こんな
ご時世なんだから。なぁ松江。[endindent][l][r]

　　 松江　　　[indent]
うん。…うん？ 。[endindent][l][r]

　藤五郎　　　[indent]
おめ分かってねぇだろ。（茂吉に）
三歩歩けば死体に蹴躓く乱世よ。人様の生き死ににいちいち頓着
（とんじゃく）しちゃいけねぇの。俺たちは、お百姓よ
田んぼ耕すテメェの身と、殿様に差し出すコメの心配
だけしてりゃいいの。[endindent][l][r]

　　　　玉　　　[indent]
…うん、違ぇねぇ。[endindent][l][r]

　　 茂吉　　　[indent]
いや分かんだけどよ、甥っ子失くした弟夫婦のこと考えっとなんだか…、[endindent][l][r]

     とら 　　 [indent]
忘れな。あんたが眉根潜めたところで、あの子が生き返る訳でもねんだ。[endindent][l][r]

　藤五郎　　　[indent]
米が沸いて出る訳でもねェしな。[endindent][l][r]

　　 茂吉　　　[indent]
（結局納得して）…ま、そりゃそうだ。[endindent][l][r]
[r]
　　　　　　　　　　　[indent]
そこへ、雪乃、やって来る。[endindent][l][r]
[r]


[image storage="fgimage/10/_IS16756.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　玉　　　[indent]
雪乃、[endindent][l][r]

　藤五郎　　　[indent]
おう雪乃ォ…、みよは気の毒だったなァ。この際、あいつは死んだと思
って吹っ切って、な。[endindent][l][r]

　　 雪乃　　　[indent]
ああ…。[endindent][l][r]

　　　　玉　　　[indent]
ほんとにいい子だったけどねェ…。[endindent][l][r]

　　 茂吉　　　[indent]
織田の武者につかまったとあっちゃ、仕方ねェな。[endindent][l][r]

　藤五郎　　　[indent]
仕方ねェ仕方ねェ、[endindent][l][r]

　　　　玉　　　[indent]
雪乃…？ 。[endindent][l][r]

　　 雪乃　　　[indent]
…ああ、うん、[endindent][l][r]

     とら 　　 [indent]
もうみよのこと考えんのはやめな。そうやってじくじく考えてっと、熊
吉んとこの娘みてぇに、気が振れて山から身ィ投げるよ。おめェは今、
ただ目の前の稲のことだけ考えてりゃいいの。[endindent][l][r]

　　 雪乃　　　[indent]
…うん。分かってるって。[endindent][l][r]

　　 松江　　　[indent]
おら、みよのお墓作ってやるよ。[endindent][l][r]

　　　　玉　　　[indent]
おらも、みよの分俵あみ手伝うから。[endindent][l][r]

　　 茂吉　　　[indent]
おらもやるか、[endindent][l][r]

　藤五郎　　　[indent]
そうよお前ら！雪乃は家も焼けちまったんだ、お前ら誰か家に置いてやれよ！[endindent][l][r]

　　 一同　　　[indent]
（はたと言葉に詰まり）…。[endindent][l][r]

　　　　玉　　　[indent]
うちは…、[endindent][l][r]

　　 茂吉　　　[indent]
うちだって…。[endindent][l][r]

　藤五郎　　　[indent]
…なんだよなんだよ、[endindent][l][r]

　　 茂吉　　　[indent]
おめんとこ置いてやりゃいいじゃねぇか。[endindent][l][r]

　藤五郎　　　[indent]
…バカおめェ、うちは…、かかあがコレで、アレもんだからよ、[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
気まずい沈黙。[endindent][l][r]
[r]

[image storage="fgimage/10/_IS17343.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
ちょっとみんなして何言っ
てんだよ。おらなんかより、みなし児んなった三郎やら、
身重のかかぁ亡くした吾作の心配してやんなって。あいつ
ら…、あいつらどんだけつらいかよォ。[endindent][l][r]

　　　　玉　　　[indent]
…雪乃？。[endindent][l][r]

　　 雪乃　　　[indent]
おらは平気だよ。おらはあの足軽大将、東野又右衛門の娘だよ。分かっ
てる、ちゃあんと分かってるって。お、親兄弟がいなくなったって、百
姓はちゃんと田んぼ守って、いい米こさえてかなきゃいけねんだ。…お
らはこんな、これしきのことでしょげかえるような安い肝っ玉してねェ
ってのォ。[endindent][l][r]

　　 松江　　　[indent]
うん。…よかったよかった。[endindent][l][r]

　　 雪乃　　　[indent]
でもよ、…でもなんで、なんでうちのみよだったんだ？。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
顔を見合わせる村人たち。「雪乃、」とらが雪乃に歩み寄る。[l][r]

;音楽停止
[fadeoutbgm time=3000]

;音楽開始
[playbgm storage="bgm/ogg/十郎.ogg" loop="true"]
[image storage="fgimage/11/_IS32324.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

そこへ、村人の騒ぐ声と共に、村長を縛り上げた十郎が現れる。[l][r]
村人たちに櫓を引かせて上から叫び散らしている。[endindent][l][r]
[r]

　　 十郎　　　[indent]
とっとと運べ！早くしねェと、この老いぼれブッた斬っちまうぞ！　。[endindent][l][r]

村人たち　　　[indent]
（声を上げる）。[endindent][l][r]

　　 十郎　　　[indent]
おいおい、そっちじゃねぇよ、こっちだ！[endindent][l][r]

村人たち　　　[indent]
（声を上げる）。[endindent][l][r]

　　 十郎　　　[indent]
よーし、止めろ！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
櫓が止まる。十郎が刀を振り下ろす。[endindent][l][r]
[r]

村人たち　　　[indent]
村長！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
村長、倒れるが、自分の身が解かれたことに気付き、慌てて櫓から
降りる。[l][r]
村人たちが群れなして村長を助け出す。[endindent][l][r]
[r]

　村人１　　　 [indent]
おめェ、こんなことして何のつもりだ！[endindent][l][r]

　　 十郎　　　[indent]
何のつもりって、俺はただこっからの景色、拝みたかっただけよ。[endindent][l][r]

　村人１　　　 [indent]
なっ、[endindent][l][r]

村人たち　　　 [indent]
（村長を抱え、やいのやいの騒ぐ）。[endindent][l][r]

　　 十郎　　　[indent]
（村を見下ろし）おお…、見事に焼かれたな。これじゃただの野っ原だ。
おい村長、[endindent][l][r]

　　 村長　　　[indent]
ひい！[endindent][l][r]

　　 十郎　　　[indent]
どう報いるよ。[endindent][l][r]

　　 村長　　　[indent]
…？。[endindent][l][r]

　　 十郎　　　[indent]
奴ら見つけて、フン縛って斬るなり突くなり、[endindent][l][r]


　　 村長　　　[indent]
ほ、報復だなんてとんでもねェ。そんなわざわざ死にに行くような真似を…、おらたちは、百姓だぞ。百姓はおめェ、お殿様のため、ただ米作ってりゃいいんだ。[endindent][l][r]

村人たち　　　 [indent]
（同意する）。[endindent][l][r]

　藤五郎　　　[indent]
もとはと言やぁあいつ等が、
信長公を討つだなんてバカげた企てしやが
ったのがいけねぇんだ、なぁ。お殿様に歯向かおうなんてなァ
気狂いなんだよ！[endindent][l][r]

村人たち　　　 [indent]
（同意する）。[endindent][l][r]

　　 十郎　　　[indent]
なんで百姓が殿様に歯向かっちゃいけねんだ。[endindent][l][r]

　藤五郎　　　[indent]
え、そりゃおめぇ…、何でもよ！[endindent][l][r]

　　 十郎　　　[indent]
なんで。[endindent][l][r]

　藤五郎　　　[indent]
何でもだっての！おらの親父もその親父もその親父もみんな、そうやっ
てやってきてんだ。おめェみてぇな小汚ねぇ野武士にゃ分かんねんだ
よ！[endindent][l][r]

村人たち　　　 [indent]
（同意する）[endindent][l][r]


　　 村長　　　[indent]
この美又は年に差し出せる年貢もわずかな廃れ村。皆殺しにされなかっ
ただけでも有難いと思わねばいかん。[endindent][l][r]

村人たち　　　 [indent]
（同意する）[endindent][l][r]

　藤五郎　　　[indent]
俺たちはテメェみたいな自惚れ野武士風情と違ってよ、己の身の程、ち
ゃんとわきまえて生きてんだっての。[endindent][l][r]

村人たち　　　 [indent]
（言ってやったと沸く）[endindent][l][r]

　　 十郎　　　[indent]
…おめェら、本気で言ってんのか。[endindent][l][r]

　藤五郎　　　[indent]
おう、本気も本気よ。よし、押さえろ！[endindent][l][r]

[r]


　　　　　　　　　　　[indent]
村人たち、十郎を取り押さえようと飛びかかる[l][r]
十郎、腰の太刀を抜き放つ。村人、声を上げ飛び退き倒れる。[endindent][l][r]
[r]


[playse buf="0" storage="sound/voice/6/1.ogg" ]

[image storage="fgimage/11/_IS17356.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
その頭は考えることをせぬ土くれか。お前らは卑屈な豚だ。耕せと言わ
れりゃ耕す、差し出せと言われりゃ差し出す、鞭打たれてもその身の痛
みすら感じないのだ。囲われたボロ小屋のなかで、与えられた腐ったも
み殻をむさぼるだけの盲（めくら）の豚よ。[endindent][l][r]
[ws buf=0 canskip="true"]


　　 茂吉　　　[indent]
…おめ、何キレてんだ、[endindent][l][r]

　　 十郎　　　[indent]
俺はお前らみたいな白痴の群れが大嫌いなのよ。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
十郎、うずくまる雪乃を見る。[endindent][l][r]
[r]

[image storage="fgimage/11/_IS17359.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
娘、盛りのついた雌猫みてェにみよみよ言って騒いでるから、とっくに
出てったかと思ったぜ。お前もこいつらと同じか。[endindent][l][r]

　　 雪乃　　　[indent]
…いや、おらなんか、行っても何も、[endindent][l][r]


　　 十郎　　　[indent]
あ？。[endindent][l][r]


　　 雪乃　　　[indent]
ひぃ。おら…いや、でも、この村から出るなんてそんな、考えたことも、[endindent][l][r]


　　 十郎　　　[indent]
なら考えるな。お前はこの
愚にもつかん村でただ豚として生きて死ね。[l][r]
…この俺なら求めるものがあれば、邪魔するものはねぶり殺してでも手に入れるがな。[endindent][l][r]

　　 茂吉　　　[indent]
じゃ、じゃあ聞かせろおめェは…、何が欲しいんだ。[endindent][l][r]


;音声スタート
[playse buf="0" storage="sound/voice/7/1.ogg" ]

[image storage="fgimage/11/_IS16760.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



　　 十郎　　　[indent]
…この世界よ。俺はこの世全てを手に入れる。その先駆けに…、まずは
安土でのさばる奴を、天守から引きずり下ろす。[endindent][l][r]
[ws buf=0 canskip="true"]


　　 村長　　　[indent]
…まさか、おめェあの信長公を、[endindent][l][r]

　　 十郎　　　[indent]
俺に居座られたくなければ、お前らの小屋に抱えた米を持ってこい。俺
の旅行きの、餞にな。[endindent][l][r]
[r]

;音楽停止
[fadeoutbgm time=3000]

;音楽開始
[playbgm storage="sound/effect/P9夜森.ogg" loop="true"]

[image storage="fgimage/12/_IS17366.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]




　　　　　　　　　　　[indent]
×   ×   ×[l][r]
夜。山中[l][r]
一人歩く十郎のあとを、つける人影。雪乃である[l][r]
十郎、気付き、雪乃が潜んだ草むら
;効果音開始
[playse buf="1" storage="sound/effect/SE草かき3.ogg" ]
に石を放る[l][r]
野太い男の悲鳴が上がる。どうと倒れ気を失う男、源八。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

　　 十郎　　　[indent]
（突然倒れ込んだ源八に）あ？（戸惑いながらも去ろうとする）。[endindent][l][r]

　　 雪乃　　　[indent]
あのっ！（倒れた源八も気になりつつ）その、ええっ？あ、え、[endindent][l][r]


　　 十郎　　　[indent]
なんだ。[endindent][l][r]

[image storage="fgimage/12/_IS17367.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
連れてって下せぇ。おらも一緒に安土に、[endindent][l][r]


　　 十郎　　　[indent]
（構わず歩き出す）。[endindent][l][r]

　　 雪乃　　　[indent]
うわぁ！（咄嗟に止めようとして勢い余って投げ飛ばす）すんませんす
んません！…おらどうしてもみよ連れ帰りてェんだ。頼むよ一緒に、[endindent][l][r]

　　 十郎　　　[indent]
（かぶせて）何だその身なりは、[endindent][l][r]

　　 雪乃　　　[indent]
戦場いくのに女の身なりじゃいけねェと（お）もって、今日からおら、
女も捨てる。雪乃じゃねぇ、雪乃丞だ。[endindent][l][r]

　　 十郎　　　[indent]
知るか。[endindent][l][r]

[image storage="fgimage/12/_IS16764.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
おめぇ様、名前は、[endindent][l][r]

　　 十郎　　　[indent]
お前などに名乗る名は無い。[endindent][l][r]

　　 雪乃　　　[indent]
無いのか…、じゃあ…、○○○○、（アドリブで）[endindent][l][r]
;本番ではトム・クルーズだった。

　　 十郎　　　[indent]
十郎だ。いいからとっとと村に帰れ。[endindent][l][r]

　　 雪乃　　　[indent]
おら、帰らねぇ。[endindent][l][r]

　　 十郎　　　[indent]
帰れ。[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/7/2.ogg" ]
　　 雪乃　　　[indent]
帰らねんだ、あの村には！みよ見つけるまで。決めたんだ。それに、お
ら村にいたら、また兵が来て、みんなに迷惑かかるかもしんね。決めた
んだ…。おらにはもう、みよしかねんだ…。[endindent][l][r]
[ws buf=0 canskip="true"]


　　 十郎　　　[indent]
…。[endindent][l][r]

　　 源八　　　[indent]
（けたたましくうめく）。[endindent][l][r]


　　 十郎　　　[indent]
（驚き叫び）なんなんだこいつは、[endindent][l][r]


　　 雪乃　　　[indent]
…こいつ、源八っつって、何年か前に他所から帰ってきてか
らってもの、世捨て人みてぇにしてた奴
でよ、おらもなんでこんなとこにいんのか、[endindent][l][r]


　　 源八　　　[indent]
（喘ぎながら）聞いたぜェ
…。あんた米さえ渡せば安土に連れてってくれるって、野武士だろ。[endindent][l][r]

　　 十郎　　　[indent]
…あ！？。[endindent][l][r]



[image storage="fgimage/12/_IS17371.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 源八　　　[indent]
安心しな。（布袋を手に）玄米でも発芽米でもねェ…。白米だ。[endindent][l][r]

　　 十郎　　　[indent]
知るか。あいつは何を言ってるんだ。[endindent][l][r]

　　 源八　　　[indent]
俺には弥七って兄貴がいてよ。一緒に安土建ててたんだ。[endindent][l][r]

　　 十郎　　　[indent]
弥七…。[endindent][l][r]

　　 源八　　　[indent]
ある時兄貴、あの信長に楯突いて、牢にぶち込まれちまった…。俺一人、
尻尾巻いて逃げてきちまってよォ…。頼むよ…。俺も連れてってくれよ。兄貴連れ戻してんだよ…。[endindent][l][r]

　　 雪乃　　　[indent]
おらもみよを、[endindent][l][r]

　　 十郎　　　[indent]
帰れ。お前らまとめてたたっ斬るぞ。[endindent][l][r]

　　 源八　　　[indent]
…分かった。[endindent][l][r]

　　 十郎　　　[indent]
ならいい。[endindent][l][r]

　　 源八　　　[indent]
話によれば…（懐から包みを出し）おめェ豚が好きなんだろ。ええいこの
際だ、米でも豚でも好きな方を、[endindent][l][r]

　　 十郎　　　[indent]
バカ野郎！（米と豚を放る）。[endindent][l][r]
;生姜焼き

　　 源八　　　[indent]
おめ、何てことすんだ！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
源八、駆け去る。しばらくして草むらから物音。[endindent][l][r]
[r]

　　 十郎　　　[indent]
ああもういいからとっとと、[endindent][l][r]

[r]

[image storage="fgimage/13/_IS17374.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　　　　　　　　　　[indent]
物陰から、織田の兵士たち現れる。[endindent][l][r]
[r]

　　 兵１　　　[indent]
お前ら、美又村の連中か。[endindent][l][r]

　　 十郎　　　[indent]
あ？[endindent][l][r]

　小太郎　　　[indent]
（兵を分け進み出て）血の気にはやるな。娘を探してる。美又村の百姓、東野又右衛門の娘だ。[endindent][l][r]

[r]
;音楽停止
[fadeoutbgm time=3000]

[playse buf="1" storage="sound/effect/P12牢屋ドーン.ogg" ]
;音楽開始
[playbgm storage="bgm/ogg/滝川.ogg" loop="true"]


[image storage="fgimage/14/_IS24405.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]




　　　　　　　　　　　[indent]
回想[l][r]
滝川一益、織田の兵士が百姓の男を拷問している。[endindent][l][r]
[r]

　　 一益　　　[indent]
とっとと吐けコラァ。一行襲った他の連中は何処にいんだ。[endindent][l][r]

　　 百姓　　　[indent]
（唾を吐きかける）[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
一益、黙って百姓を激しく折檻する。[l][r]
百姓、呻き声を漏らし、やがて笑い出す。[endindent][l][r]
[r]

　　 百姓　　　[indent]
覚悟しろ。まもなくおめぇらも終わりよ
…。半年前、本願寺との戦で死んだ足軽、
東野又右衛門はな…、織田家を転覆させる秘術をその手にし
てた…。嘘じゃねェぞ…。そいつが白日の下明かされりゃ、お前らなん
ぞひとたまりもない。[endindent][l][r]

　　 一益　　　[indent]
…。[endindent][l][r]

　　 百姓　　　[indent]
ざまぁみろ…。お前らも…、怯えて死を待つがいいわ！[endindent][l][r]
[ws buf=1 canskip="true"]
[r]
;音楽停止
[fadeoutbgm time=3000]

;音楽開始
[playbgm storage="sound/effect/P9夜森.ogg" loop="true"]

[image storage="fgimage/13/_IS17374.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
再び、山中――。[endindent][l][r]
[r]

　小太郎　　　[indent]
先ごろ、摂津、美又村に向かい、又右衛門の娘を捕えた。が…、年端も
行かぬ子娘ゆえ、ただ泣くばかりで要領も得ぬ。[endindent][l][r]

　　 雪乃　　　[indent]
（みよのことと気付き）…！[endindent][l][r]

　小太郎　　　[indent]
百姓共の話によれば、又右衛門にはもう一人、娘がいたらしい…。その、[endindent][l][r]

　　 雪乃　　　[indent]
探してるのかその娘！ならおらがそれだ！おら連れてってくれ今すぐ！
だから、頼むから…、みよは自由にしてやって下せエ！この通りだ！お
らのことはもう、どうしてくれても構わねェから！[endindent][l][r]

　　 兵１　　　[indent]
…小太郎様、[endindent][l][r]

　小太郎　　　[indent]
…捕えろ。[endindent][l][r]


　　 十郎　　　[indent]
織田家を転覆させる秘術だと…？[endindent][l][r]

　小太郎　　　[indent]
なんだ…、[endindent][l][r]

[stopbgm]
;音楽開始
[playbgm storage="bgm/ogg/戦闘.ogg" loop="true"]

　　 十郎　　　[indent]
その娘…、俺が貰った！[endindent][l][r]

　小太郎　　　[indent]
貴様！[endindent][l][r]

[r]

[image storage="fgimage/13/_IS16769.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
織田の兵たちと十郎、乱戦となる。そこへ、源八。[endindent][l][r]
[r]

　　 源八　　　[indent]
おめェ、米を何だと思ってんだ！…えっ？何だこれ？
[endindent][l][r]

　　 雪乃　　　[indent]
…。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
そこへ、新たな一団。荒木村重配下の兵たち。[endindent][l][r]
[r]

　　 兵２　　　[indent]
何の騒ぎだ！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
兵２、入り乱れる十郎と兵士、雪乃と源八双方を見て、[endindent][l][r]
[r]

　　 兵２　　　[indent]
織田の兵に追われてるのか。…そうかお前たち、米を届けに来てくれた
のか。でかした！急げ！有岡の城はもう目の前よ！[endindent][l][r]
[r]

　　 雪乃　　　[indent]
えっ？[endindent][l][r]

　　 十郎　　　[indent]
逃がすか…。[endindent][l][r]

　　 兵２　　　[indent]
行け！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
雪乃、源八、兵たちに伴われ駆け出す。十郎、乱戦をかいくぐり、[endindent][l][r]
[r]

　　 十郎　　　[indent]
逃がすか…、娘！[endindent][l][r]
[r]

　　　　　　　　　　　[indent]
十郎、雪乃を追って駆け出す。さらにそれを追い、兵たち駆け去る。[endindent][l][r]
[p][cm]


*story_02|二場　有岡城
;音楽停止
[fadeoutbgm time=3000]


[image storage="fgimage/15/_IS16773.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;音楽開始
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/官兵衛.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
;[image storage="07" layer="base" page=fore]
二場　有岡城[resetfont][l][r]


[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



[r]
　　　　　　　　　　　[indent]
牢――。駆けて来る雪乃、源八。[endindent][l][r]
[r]

　　 源八　　　[indent]
おい、おめどうすんだ。訳も分からず逃げ込んだはいいがよ、こっから
どうして、[endindent][l][r]

　　 雪乃　　　[indent]
（怯えて）ううう…、[endindent][l][r]


　　 源八　　　[indent]
雪乃丞、どした、[endindent][l][r]

　　 雪乃　　　[indent]
お城って、こんな暗くて怖ェとこだったのか…、[endindent][l][r]

　官兵衛　　　[indent]

それは、ここが牢獄だからよ。[endindent][l][r]

　　 雪乃　　　[indent]
（怯えながら）…人がいんのか？[endindent][l][r]

　官兵衛　　　[indent]

お前ら、足軽ではないな。[endindent][l][r]

　　 源八　　　[indent]
お、おう！おらたちはあの美又の、[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/8/1.ogg" ]

　官兵衛　　　[indent]
百姓か。ならなおのこと早く城から出ろ。ここは間もなく落ちる。[endindent][l][r]

[ws buf=0 canskip="true"]

　　 源八　　　[indent]
…落ちる！？[endindent][l][r]


;音声スタート
[playse buf="0" storage="sound/voice/8/2.ogg" ]
[image storage="fgimage/15/_IS17388.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　官兵衛　　　[indent]
ああ。信長公に謀反を起こし、もう一年も籠城を続けているが、城主荒
木は既に死に怯え、一人城を逃れる術を探っておる。城の兵たちは、奴
だけを頼み、命を賭けてきたと言うのにな…。[endindent][l][r]
[ws buf=0 canskip="true"]


雪乃・源八　　[indent]
…。[endindent][l][r]

　官兵衛　　　[indent]
間もなく織田は、…逃げよ。[endindent][l][r]

　　 源八　　　[indent]
行くぞ雪乃丞！[endindent][l][r]

　　 雪乃　　　[indent]
待て、おめぇはどうすんだよ、なァ、一緒に逃げるべ。
;効果音開始
[playse buf="1" storage="sound/effect/SE牢鍵1.ogg" ]
[endindent][l][r]
[ws buf=1 canskip="true"]

　　 源八　　　[indent]
無理だって！三寸もある樫だぞ、[endindent][l][r]

　　 雪乃　　　[indent]
ほっとけねぇだろ！想像してみろ！こいつは、こんな閉じ込められてん
のに、おらたちのこと助けようとしてよ、おいていけねぇよ！[endindent][l][r]

　官兵衛　　　[indent]
私は仲間が助けに来る。[endindent][l][r]

　　 雪乃　　　[indent]
…ほんとか。[endindent][l][r]

　官兵衛　　　[indent]
ああ。[endindent][l][r]

　　 雪乃　　　[indent]
ぜってェ助けに、[endindent][l][r]

　官兵衛　　　[indent]
案ずるな。…俺はこんなところでは死なん。[endindent][l][r]

　　 雪乃　　　[indent]
…。[endindent][l][r]

　官兵衛　　　[indent]
行け。[endindent][l][r]

　　 源八　　　[indent]
おう！行くぞ！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
源八、雪乃の手を掴み、去る。[endindent][l][r]
[r]

　官兵衛　　　[indent]
フン…、おかしな娘よ。[endindent][l][r]
[r]

;音楽停止
[fadeoutbgm time=3000]


　　　　　　　　　　　[indent]
;[image storage="nagahama_arioka" layer="base" page=fore]


;効果音再生
[playbgm storage="sound/effect/SEenpou戦.ogg" ]
[image storage="black" layer="1" page="fore "visible="true" top="50"]

×   ×   ×[r]
城内・天守――。[r]
彼方から銃声、攻防の音が響く。[endindent][l][r]
[r]

　　 源八　　　[indent]
畜生、逃げるつもりが、気付いたらてっぺんまで来ちまったよ。[endindent][l][r]

　　 雪乃　　　[indent]
おめどうすんだよ！[endindent][l][r]

　　 源八　　　[indent]
分かんねえよ！クソッ、こんなところでのたれ死んでたまるか！[endindent][l][r]

[r]


;効果音再生
[playse buf="1" storage="sound/effect/SE障子.ogg"]

　　　　　　　　　　　[indent]
勢いよく襖を開ける源八。[l][r]

[stopbgm]
[image storage="fgimage/16/_IS17394.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音楽開始
[playbgm storage="bgm/ogg/だし.ogg" loop="true"]
夥しい兵が倒れ、呻きを上げる。視線が集まる。[l][r]
[ws buf=1 canskip="true"]
源八、ぴしゃりと襖を閉める。
[playse buf="1" storage="sound/effect/襖CL1.ogg"]
[l][r]
[ws buf=1 canskip="true"]
が、兵が襖を開け、
[playse buf="1" storage="sound/effect/襖OP2.ogg"]
源八、雪乃を強引に引きずり込む。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

　　 兵３　　　 [indent]
どうだ、砦の戦況は、[endindent][l][r]

雪乃・源八　　[indent]
え、あっ、[endindent][l][r]

　　 兵３　　　 [indent]
思わしくないようだな…。[endindent][l][r]

　　 雪乃　　　[indent]
あの、おら、[endindent][l][r]


　　 兵３　　　 [indent]
みなまで言うな。打って出ようにもこのひもじさでは、豪気に刀も振る
えまい。村重公、[endindent][l][r][r]


;[image storage="08" layer="base" page=fore]

[image storage="fgimage/16/_IS17398.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
上段に座る荒木村重。その傍らに赤子を抱くだし。[r]
家臣、兵たちが村重に注目する。[endindent][l][r]
[r]

　　 村重　　　[indent]
やむを得ん。かくなる上は、この村重自ら毛利方に赴き、輝元殿に直に
援軍を頼んでこよう。[endindent][l][r]

　　 兵４　　　 [indent]
…殿おん自ら…、[endindent][l][r]

　　 村重　　　[indent]
この一年と余月、度ごとに使者を送れども毛利は動かず。さもあろう、
毛利もまた織田に怯えておるのだ。心を同じうする者同士膝つき合わせ
れば、輝元殿も我らのこの思いを汲み、挙兵を決意してくれるであろう。[endindent][l][r]

　　 兵４　　　 [indent]
それがいい、それしかあるまい。[endindent][l][r]

　　 兵３　　　 [indent]
殿自ら、危険をも顧みずこのような…。[endindent][l][r]

　　 村重　　　[indent]
安心せい。この村重、必ずや毛利の兵を伴いこの城に戻ってくる。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
感涙にむせぶ兵たち。[r]
しかし村重の様子からはどこか、死への怯えが窺える[l][r]
その時、廊下から兵の騒ぐ声。「何奴！」「抑えろ！」[r]

[image storage="fgimage/16/_IS17400.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

兵たちを切り倒し、十郎が姿を現す。[r]
身構える兵たち。慌てて身を隠す雪乃と源八。[endindent][l][r]
[r]


　　 兵３　　　 [indent]
貴様！何者！[endindent][l][r]


　　 兵４　　　 [indent]
まさか織田が既に砦を突破して…！[endindent][l][r]


　　 兵３　　　 [indent]
殿をお守りしろ！[endindent][l][r]

　　 十郎　　　[indent]
お前らなどに興味はない。百姓風情の二人連れがこの城に入った。虱潰
しに探したが、残ったのはこの天守だけ。ここにいるはずだ。[endindent][l][r]

　　 兵４　　　 [indent]
…何のことだ。[endindent][l][r]

　　 十郎　　　[indent]
とぼけるな！[endindent][l][r]

　　 兵３　　　 [indent]
殿！（城を出るよう促す）[endindent][l][r]

[image storage="fgimage/16/_IS24231.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
見つかるまで居座るぜ。…しかし、謀反とは思いきったなァ、荒木殿…。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
十郎、酒をあおりながら辺りを見回す。[endindent][l][r]
[r]

　　 兵３　　　 [indent]
殿、ここは何としても抑えます。早く！[endindent][l][r]

[image storage="fgimage/16/_IS17398.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 村重　　　[indent]
だし、参るぞ。[endindent][l][r]

     だし 　　  [indent]
…。[endindent][l][r]

　　 村重　　　[indent]
何をしておる。共に城を出るのだ。早く！[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/9/1.ogg" ]
     だし 　　  [indent]
私は城に残ります。[endindent][l][r]
[ws buf=0 canskip="true"]

[image storage="fgimage/17/_IS24417.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 村重　　　[indent]
何を、[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/9/2.ogg" ]
     だし 　　  [indent]
殿が我々妻子を伴い城を出れば、兵の中には、殿が城を捨てて逃げたと
思うものもおりましょう。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 村重　　　[indent]
…逃げるなど、そんな、[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/9/3.ogg" ]
[image storage="fgimage/17/_IS24419.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


     だし 　　  [indent]
殿の胸にある決意はまこと。…けれど兵糧も無く明日の死に怯えるこの
城では、その疑いが疫病のように兵の心に巣食います。疑う病に罹り、
その思いに取り憑かれた時、彼らを支える灯火のような戦意も、殿のた
めの忠義の死という誇りも消えます。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 兵４　　　 [indent]
だし様…、[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/9/4.ogg" ]
     だし 　　  [indent]
私が残れば、必ずや殿が戻って来ると兵たちは信じ、希望が持てます。だからこそ私は、ここに残ります。[endindent][l][r]

[r]
[ws buf=0 canskip="true"]

　　　　　　　　　　　[indent]
だし、胸に抱く赤子を村重に託す。[endindent][l][r]
[r]

[image storage="fgimage/17/_IS24242.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

     だし 　　  [indent]
殿、一刻も早く毛利を伴い、城にお戻りなされませ。[endindent][l][r]

　　 村重　　　[indent]
…。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
酒をあおっていた十郎が口を開く。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/10/1.ogg" ]
　　 十郎　　　[indent]
毛利はどうせ動かんぞ。輝元は所詮臆病狸よ。この城は間もなく落ちる。
あの信長公のことだ。城にいるものは一族臣下、お前（だし）もお前ら
（一族側近）も皆殺しよ。おいお前、分からんか、こいつは逃げるぞ。[endindent][l][r]
[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/10/2.ogg" ]
     だし 　　  [indent]
殿は逃げませぬ。[endindent][l][r]
[ws buf=0 canskip="true"]


;音声スタート
[playse buf="0" storage="sound/voice/10/3.ogg" ]
　　 十郎　　　[indent]
だとしても…、お前らは間違いなく死ぬ。[endindent][l][r]
[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/10/4.ogg" ]
     だし 　　  [indent]
…たとえ殿が戻られぬうちにこの城が討たれても、私は、殿と、殿を信
じた全ての兵たちの誇りのために、この命、失っても構いませぬ。[endindent][l][r]

[r]
[ws buf=0 canskip="true"]

　　　　　　　　　　　[indent]
人々はだしの言葉に打たれ、動けない。[endindent][l][r]
[r]

　　 十郎　　　[indent]
（溜息をつき）荒木…、なんだこの茶番は。行くなら行け、どうせお前
に先はない。お前らは負けたんだよ。なんならこの場でお前らまとめて、[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
傍らの刀を握る十郎。[r]
雪乃、声を上げ物陰から駆け出し、だしの手を握る。[endindent][l][r]
[r]

[image storage="fgimage/17/_IS16781.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音声スタート
[playse buf="0" storage="sound/voice/10/5.ogg" ]

　　 雪乃　　　[indent]
…何て言ったらいいのか、分かんないけどよ…、おら、姫様の胸のうち
想像すっと…、[endindent][l][r]
[ws buf=0 canskip="true"]

　　 十郎　　　[indent]
やっと見つけたぜ…。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
雪乃に迫る十郎。そこに、源八が割って入る。[endindent][l][r]
[r]

　　 源八　　　[indent]
ふざけるな！こいつらに手出しはさせねぇ。おめぇは人の気持ちを何と
も思わねェ冷血漢だ。見損なったぞ！もうお前には米はやらねぇ！[endindent][l][r]


     だし 　　  [indent]
（雪乃に潜めて）…こんなか弱いおなごがどうして城に迷い込んだので
す。…あなたは殿と城を出なさい。[endindent][l][r]

　　 雪乃　　　[indent]
…でも、[endindent][l][r]

     だし 　　  [indent]
（兵に託し）この方を、[endindent][l][r]

　　 村重　　　[indent]
…だし、[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/10/6.ogg" ]

[image storage="fgimage/17/_IS17407.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

     だし 　　  [indent]
（村重に向かい）神でうすの御加護があらんことを。殿…、
あなたを心から、「御大切」に思うております…。[endindent][l][r]

[r]
[ws buf=0 canskip="true"]

　　　　　　　　　　　[indent]
十郎と向かい合う兵たち。兵たちが動けぬ村重を促す。[endindent][l][r]
[r]

　　 兵４　　　 [indent]
殿、お早く！[endindent][l][r]


　　 雪乃　　　[indent]
源八！（十郎に向かう源八の腕を取り）[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
村重と共に、雪乃、源八、去る。十郎の前に兵たちが立ち塞がる。[endindent][l][r]
[r]

　　 十郎　　　[indent]
ああ…、お前らそこを退け。ぶった斬るぞ！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
十郎と兵たちが衝突する。[endindent][l][r]
[r]

[image storage="black" layer="1" page="fore "visible="true" top="50"]


;音楽停止
[fadeoutbgm time=3000]
;音楽開始
[playbgm storage="sound/effect/P9夜森.ogg" loop="true"]
;[image storage="平地"layer="base" page=fore]
　　　　　　　　　　　[indent]
×   ×   ×[r]
赤子を抱く村重と共に歩く雪乃と源八。[r]
そこへ、村重の忍が現れる。[endindent][l][r]
[r]

　　 忍１ 　　　[indent]
村重公。[endindent][l][r]

　　 村重　　　[indent]
おお。分かったか。[endindent][l][r]

　　 忍１ 　　　[indent]
織田方に捕われた村の娘、明日、京、六条河原にて処刑とのこと。[endindent][l][r]

　　 雪乃　　　[indent]
ああ…、みよ…。[endindent][l][r]

　　 村重　　　[indent]
行くがいい。道中はこ奴に守らせよう。…行け。[endindent][l][r]

　　 雪乃　　　[indent]
（村重のもとに額づき）お殿様…、どうか、必ず姫様の元に。[endindent][l][r]


[image storage="fgimage/17/_IS24246.JPG" layer="1" page="fore" visible="true"top="50" pos="center"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 村重　　　[indent]
…。[endindent][l][r]

　　 源八　　　[indent]
行くぞ、雪乃丞！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
駆け去る雪乃と源八、忍。村重、それを見送り、再び歩き出す。[endindent][l][r]
[r][p][cm]



*story_03|三場　京・六角堂・獄舎

[image storage="fgimage/18/_IS16789.JPG" layer="1" page="fore" visible="true" top="50" left="0"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;音楽停止
[fadeoutbgm time=3000]

;音楽開始
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/みよ.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
三場　京・六角堂・獄舎[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
薄暗い獄舎。[r]
辺りに、囚人たちのすすり泣く声や念仏を唱える声が響く。[endindent][l][r]
[r]

　囚人１ 　　　[indent]
やかましい！静まらんか！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
獄舎の隅で震えるみよ。激しく咳込む音が聞こえる。[r]
みよ、気になり咳込む娘に歩み寄る。[endindent][l][r]
[r]

     みよ 　　 [indent]
大丈夫か？[endindent][l][r]

[image storage="fgimage/18/_IS17418.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

     きぬ 　　 [indent]
…明日には死ぬと言うに、体の心配もないだろう。…そなた、姉と生き
別れたか。[endindent][l][r]

     みよ 　　 [indent]
えっ…、[endindent][l][r]

     きぬ 　　 [indent]
寝言でしきりにねェ様ねェ様叫んでおった。…名は。[endindent][l][r]

     みよ 　　 [indent]
…みよ。[endindent][l][r]

     きぬ 　　 [indent]
きぬだ。父忠兵衛が信長に謀反を起こし斬首。我が身もこの有様よ…。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
傍らの獄吏の元に忍。何やら耳打ちし、金を渡すと、きぬの元へ。[endindent][l][r]
[r]

　　 忍２　　　[indent]
きぬはおるか。[endindent][l][r]

     きぬ 　　 [indent]
何用だ。[endindent][l][r]

[r]

　　 忍２　　　[indent]
話は付いた。先刻伝えた通り、明朝、お前の身柄は引き取る。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
忍、去る。[endindent][l][r]
[r]

     きぬ 　　 [indent]
みよ、悪いな。このきぬは
どうやら、明日の死罪を免れるようだ。[endindent][l][r]

     みよ 　　 [indent]
（答えに窮しつつも）…良かった。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
きぬ、肩を震わせ笑い出す。[endindent][l][r]
[r]

[image storage="fgimage/18/_IS24429.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

     きぬ 　　 [indent]
…良かった、か。みよ、私が何ゆえこの牢から出されるか分かるか。こ
の身は計略の道具として、ある武将の元に送られるのよ。もはや私は人
ではない。男たちの野心と欲に弄ばれる木偶人形よ。明日物言わぬ身に
なろうとも、どれほどの違いがあろう。[endindent][l][r]

     みよ 　　 [indent]
…ごめんよ、おら何も知らねぇで、[endindent][l][r]

     きぬ 　　 [indent]
…いいのだ。そうでなければ、このきぬの願いは果たせぬ。[endindent][l][r]

     みよ 　　 [indent]
…？[endindent][l][r]

     きぬ 　　 [indent]
御仏はどうもこのきぬがお嫌いなようでな。わが一族を戦乱で嬲った挙
句、この身に癒えぬ労咳の病をふりまきおった。…だがこの病こそが、
このきぬの最期の隠し刀。[endindent][l][r]

     みよ 　　 [indent]
…。[endindent][l][r]

     きぬ 　　 [indent]
なにが天下よ！なにが政よ！私は戦に明け暮れ、計略のため人の命を駒
とする男たちのもとに行き、この病をまき散らしてやる。気付いた時に
は既に遅い。己の身を蝕む病に怯え泣き叫び死んでいくがいい…。[endindent][l][r]

[r]

[image storage="fgimage/18/_IS17414.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
みよ、言葉を無くす。やがてそっときぬに向かい口を開く。[endindent][l][r]
[r]

     みよ 　　 [indent]
おら難しい事は分かんねェけど…、きぬ、おめぇ、
つらい思いしてたんだな…。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
みよ、きぬと我が身の悲しみに、顔を落とす。[endindent][l][r]
[r]

     きぬ 　　 [indent]
…みよ、[endindent][l][r]

     みよ 　　 [indent]
…ごめんよ、おら、死ぬ前に一度でも、ねェ様に会いたかったなァ…。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
きぬ、静かにすすり泣くみよを見つめる。[endindent][l][r]
[p][cm]



*story_04|四場　京・六条河原・処刑場

[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[image storage="fgimage/19/_IS16795.JPG" layer="1" page="fore" visible="true" top="50"]
;音楽停止
[fadeoutbgm time=3000]
;音楽開始
[bgmopt volume="50"] 
[playbgm storage="sound/effect/SE町ガヤC.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
;[image storage="kawara" layer="base" page=fore]
四場　京・六条河原・処刑場[resetfont][l][r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[r]
　　　　　　　　　　　[indent]
六条河原は処刑を前に、見物人が溢れ、お祭り騒ぎになっている。[r]
餅や柿を売り歩く声。講談師が銭稼ぎに弁をふるう。[endindent][l][r]
[r]

　講談師　　　[indent]
今日この六条の河原にて討たるるは、かの安土にましますお屋形様に弓を引いたる逆賊の妻女、ならびにその子ら四十余（しじゅうよ）名。
近くば寄って目にも見よ。これが悪しき反逆者共の未期の姿！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
見物人が一斉に集まる。そこへ、雪乃と源八、駆けて来る。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
（探し回り）みよは…、みよは、[endindent][l][r]
[r]

[image storage="fgimage/19/_IS32252.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
刑吏たちに押しやられ、人の波が開く。その向こうに、顔を布で覆
われた囚人たち。その中に、見慣れたみよの着物姿が現れる。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
みよ…、みよ！[endindent][l][r]
[r]

　　　　　　　　　　　[indent]
雪乃、人をかき分け刑場に駆け出そうとする。必死で止める源八。[endindent][l][r]
[r]

　　 源八　　　[indent]
おめェ、今乗り込んだら、同じように殺されちまうぞ！[endindent][l][r]

　　 雪乃　　　[indent]
いいんだ！みよと死ねるなら、おらは本望だ！[endindent][l][r]


　刑吏１ 　　　[indent]
やれ。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
雪乃、刑場に飛び込み、みよを狙う刑吏に飛びかかる。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
やめれ！[endindent][l][r]

　刑吏２ 　　　[indent]
貴様！[endindent][l][r]
[r]
[stopbgm]

;効果音再生
[playse buf="1" storage="sound/effect/SE銃.ogg" ]
　　　　　　　　　　　[indent]
散発的な銃声が響く。
[ws buf=1 canskip="true"]
[playse buf="1" storage="sound/effect/SE銃.ogg" ]
囚人たちは身を震わせ、次々とこと切れる。[r]
刑吏２、雪乃を振りほどき、銃を構え、撃つ。声が漏れる。[r]
雪乃、みよのもとに駆け寄り、すがりつく。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

　　 雪乃　　　[indent]
みよ…、みよ！[endindent][l][r]


　刑吏１ 　　　[indent]
こいつ、何者だ！[endindent][l][r]


　　 源八　　　[indent]
（刑吏たちを抑え）待って下せェ！お願ェだから待って下せェ！[endindent][l][r]

[r]

[image storage="fgimage/19/_IS24258.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
雪乃がみよの顔の覆いを剥ぎ取る。…すると、現れたのは、きぬ。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
…みよでねェ…、…なんで、[endindent][l][r]


     きぬ 　　 [indent]
そなたが姉か…。寄れ…。聞かれてはならぬ。[endindent][l][r]

　　 雪乃　　　[indent]
…。[endindent][l][r]

     きぬ 　　 [indent]
みよは…、忍に連れられ牢を脱した。私が…、みよと入れ替わった。[endindent][l][r]

　　 雪乃　　　[indent]
…おめェ、[endindent][l][r]

     きぬ 　　 [indent]
案ずるな。どうせ程なく死ぬ身よ。[endindent][l][r]

[image storage="fgimage/19/_IS24434.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
…みよは何処に、[endindent][l][r]

     きぬ 　　 [indent]
（首を振り）…行け。どうかみよに、（こと切れる）[endindent][l][r]

　　 雪乃　　　[indent]
（呆然と）…みよは…、生きてる…。（辺りに）
みよ！…みよ！[endindent][l][r]

[r]

[image storage="fgimage/19/_IS32243.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
源八が取り押さえられ、刑吏たちが一斉に雪乃を捕える。[endindent][l][r]
[r]

　刑吏１ 　　　[indent]
処刑は一時（いっとき）取り止め。そいつらを連れて行け！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
雪乃はみよの名を呼び、源八と共に、刑吏たちに連れて行かれる。[r]
その姿を見送る見物人たち。[r]
そこへ、高山右近が現れる。傍らの刑吏に何やら告げると、刑吏の
一人が、雪乃たちの一行を追って去る。[r]
右近は一人、去っていく雪乃たちを遠く見やっている。[endindent][l][r]
[r]
[p][cm]



*story_05|五場　牢
;[image storage="rogoku" layer="base" page=fore]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[image storage="fgimage/20/_IS32257.JPG" layer="1" page="fore" visible="true" top="50"]

;音楽開始
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/四季.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
五場　牢[resetfont][l][r]

[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
雪乃と源八は、牢に込められる。[r]
時が過ぎる――。雪乃と源八、そして十郎の情景の断片。[endindent][l][r]
[r]

[image storage="fgimage/20/_IS17434.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;効果音再生
[playse buf="1" storage="sound/effect/SE秋1.ogg" ]
　　　　　　　　　　　[indent]
《十郎》静かな秋の森。一五七九年、十月。[l][r]
;効果音再生
[playse buf="2" storage="sound/effect/SE蒔1.ogg" ]
森で薪を割る雑賀孫市。そこへ十郎。[endindent][l][r]
[ws buf=2 canskip="true"]
[r]
　　 十郎　　　[indent]
雑賀孫市か。[endindent][l][r]

;[image storage="10" layer="base" page=fore]
　　 孫市　　　[indent]
（一瞬の後、火縄銃を構え十郎に向ける）
[playse buf="1" storage="sound/effect/SE銃構え.ogg" ]
[endindent][l][r]
[ws buf=1 canskip="true"]

　　 十郎　　　[indent]
（制して）お前の力を借りたい。共に、安土の奴を討たんか。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]


;効果音再生
[playse buf="1" storage="sound/effect/SE冬1.ogg"]

[image storage="fgimage/20/_IS32257.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="rogoku" layer="base" page=fore]
　　　　　　　　　　　[indent]
《雪乃》極寒の冬。一五八〇年、二月。[l][r]
吹雪の音。冬の寒さに凍える雪乃。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/11/1.ogg" ]
　　 雪乃　　　[indent]
みよ…、みよ…。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]
[ws buf=1 canskip="true"]


;効果音再生
[playse buf="1" storage="sound/effect/SE夏.ogg"]
　　　　　　　　　　　[indent]
《源八》真夏の炎熱。一五八〇年、八月。[l][r]
牢の柱に刻みを付けている源八。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/11/2.ogg" ]
　　 源八　　　[indent]
三百と四十八…。ハァ…。畜生！とっとと殺すなら殺せ！おい、出せ！[endindent][l][r]
[r]
[ws buf=0 canskip="true"]
[ws buf=1 canskip="true"]

;効果音再生
[playse buf="1" storage="sound/effect/SE秋1.ogg" ]

[image storage="fgimage/20/_IS24268.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
《十郎》紅葉散る初冬の森。一五八〇年、十一月。[endindent][l][r]
[r]

　　 孫市　　　[indent]
ほうぼうに散った鉄砲衆がやっとこさ集まった。[endindent][l][r]

　　 十郎　　　[indent]
でかした。[endindent][l][r]

　　 孫市　　　[indent]
本願寺も降伏しちまって、あとはおらおめェに賭けるだけよ。[endindent][l][r]

　　 十郎　　　[indent]
あの娘のことは。[endindent][l][r]

　　 孫市　　　[indent]
忍衆総出で聞き回っとるがちっとも。どっかで死にさらしちまったかな。[endindent][l][r]

　　 十郎　　　[indent]
…。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

;効果音再生
[playse buf="1" storage="sound/effect/SE雨1.ogg" ]
[image storage="fgimage/20/_IS32257.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
《雪乃》梅雨の豪雨。一五八一年、六月。[l][r]
一人ぼんやりと戯れ歌を歌う雪乃。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/11/3.ogg" ]
　　 雪乃　　　[indent]
ひとよふたよのおおなまず…、みまたまたいだむらやまに…、[endindent][l][r]
[r]
[ws buf=0 canskip="true"]
[ws buf=1 canskip="true"]


;効果音再生
[playse buf="1" storage="sound/effect/SE冬2.ogg"]

　　　　　　　　　　　[indent]
《源八》しんと雪の積もる冬。一五八一年、十二月。[l][r]
柱の刻みを数える源八。[endindent][l][r]
[r]


;音声スタート
[playse buf="0" storage="sound/voice/11/4.ogg" ]
　　 源八　　　[indent]
（朦朧と）八百と、四十二…。兄貴…、生きてるか…。兄貴…。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

　　　　　　　　　　　[indent]
源八、どうと倒れる。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/11/5.ogg" ]
　　 雪乃　　　[indent]
源八…、大丈夫か…。[endindent][l][r]
[ws buf=0 canskip="true"]


;音声スタート
[playse buf="0" storage="sound/voice/11/6.ogg" ]
　　 源八　　　[indent]
ああ。[endindent][l][r]

[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/11/7.ogg" ]
　　 雪乃　　　[indent]
何だか…、村にいたのがとんと昔みてェだよ。日がな一日田んぼ耕して。
干上がりゃ水やり、穂が頭垂れりゃ刈ってやる。おらのやるべきことは
全部あの稲が教えてくれた。だから村出ちまうと、おら途端に、何した
らいいか分からなくてよ…。百姓でねェ奴らはみんな、何で自分のやる
べきことをはかってんだ？おら…、何も分からなくなった…。あいつな
ら、どうすんだろう…。[endindent][l][r]

[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/11/8.ogg" ]
　　 源八　　　[indent]
いや…、おめェにも分かってることがある。[endindent][l][r]

[ws buf=0 canskip="true"]

　　 雪乃　　　[indent]
？[endindent][l][r]


;音声スタート
[playse buf="0" storage="sound/voice/11/9.ogg" ]
　　 源八　　　[indent]
おめェは、みよに会いてェ。俺も兄貴に会いてェ。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]
[ws buf=1 canskip="true"]
　　　　　　　　　　　[indent]
彼方から石の床を歩く足音が聞こえる。[endindent][l][r]
[r]

　　 源八　　　[indent]
…足音がいつもと違う。…いよいよ殺されんのか…。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
修道服に身を包んだ小姓たちが現れ、牢の鍵を開ける。
;効果音開始
[playse buf="1" storage="sound/effect/SE牢鍵2.ogg" ]
[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

　 ミゲル　　　[indent]
おいで下さい。お二人を、天守にお連れします。[endindent][l][r]
[p][cm]



*story_06|六場　高槻城
;[image storage="takatukijou" layer="base" page=fore]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[image storage="fgimage/21/_IS17445.JPG" layer="1" page="fore" visible="true" top="50"]

;音楽停止
[fadeoutbgm time=3000]
[bgmopt volume="50"] 

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
六場　高槻城[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　　　　　　　　　　[indent]
高槻城天守。[l][r]
幾多の切支丹がかしずき、
高山右近とその妻、ユスタが現れる。[l][r]
そこへ、ミゲルたちに連れ
られた雪乃、源八がやって来る。[endindent][l][r]
[r]

　　 右近　　　[indent]
面を上げよ。[endindent][l][r]

　　 雪乃　　　[indent]
（額ずいたまま）おらたち…、ここで殺されんのか？[endindent][l][r]


　　 右近　　　[indent]
そなたたちはもう、処刑に怯えることはない。[endindent][l][r]

雪乃・源八　　[indent]
？[endindent][l][r]

　　ユスタ　　　[indent]
我が殿は、貴方がたが死罪を免れるよう、お取り計らいなさったのです。[endindent][l][r]

　　 右近　　　[indent]
許せ。いずこの城にも人の噂に聞き耳を立てる亡霊がいる。「刑場に押し
入った不埒者」の噂消えるまで、牢に込めて時を待っていた。[endindent][l][r]

　　ユスタ　　　[indent]
二年以上もの間、牢に籠め置いたこと、どうかお許し下さい。[endindent][l][r]

　　 雪乃　　　[indent]
そんな、許すだなんて、お殿様の、お、奥方様に、そんな畏れ多いこと、とんでもねぇでげす。[endindent][l][r]

　　ユスタ　　　[indent]
げす？[endindent][l][r]

[image storage="fgimage/21/_IS16812.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 右近　　　[indent]
…申し遅れた。私はこの高槻城城主、高山ジュスト右近。妻のユスタだ。[endindent][l][r]

　　ユスタ　　　[indent]
（二人に頭を垂れる）[endindent][l][r]


　　 源八　　　[indent]
…ほんとに、殺されんでねェのか？[endindent][l][r]

　　 右近　　　[indent]
ああ。[endindent][l][r]

　　 雪乃　　　[indent]
…お殿様、なんでおらたちを助けてくれたんだ？[endindent][l][r]

　　 右近　　　[indent]
…気になるか。[endindent][l][r]

　　 雪乃　　　[indent]
あいや、そんなことは。ただ…、何だか化かされたような気分で…、
狐につつかれたみてェな、[endindent][l][r]

　　 源八　　　[indent]
バカか！それ言うなら狐に包まれるだ。[endindent][l][r]

　　ユスタ　　　[indent]
いえ、狐につままれるです。[endindent][l][r]

;音楽開始
[playbgm storage="bgm/ogg/官兵衛.ogg" loop="true"]
[playbgm storage="bgm/ogg/右近.ogg" loop="true"]

[r]
　　　　　　　　　　　[indent]
高槻一同、笑う。その様子に呆気にとられる雪乃と源八。[endindent][l][r]
[r]

[image storage="fgimage/21/_IS16820.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="12" layer="base" page=fore]

　　 右近　　　[indent]
（笑い、雪乃を見て）…どうした。[endindent][l][r]

　　 雪乃　　　[indent]
…なんか、おらが見たお城もお侍様もこんなんでなかったから、[endindent][l][r]


　　ユスタ　　　[indent]
ここは、殿が変わり者なので。[endindent][l][r]

　 ミゲル　　　[indent]
本人の前じゃ言えませんが。[endindent][l][r]

高槻一同　　 [indent]
（和やかに笑う）[endindent][l][r]

雪乃・源八　　[indent]
（唖然と）…。[endindent][l][r]

　　 右近　　　[indent]
すまんすまん、戯れに殿様っぽくしてみたんだが、どうにも上手くできなくて。
ユスタの申す通りこの右近、城主としては大層な変わり者のようでな。お前たちもそう思う？[endindent][l][r]

家臣たち　　　[indent]
思います。（クスクスと笑う）[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/12/1.ogg" ]
　　 右近　　　[indent]
…まぁ確かに城主と言えば、豪気な戦好きばかり。でもね…。戦場で人
を殺すのも、調略で人を陥れるのも、どうにも好きになれなくて。[endindent][l][r]
[ws buf=0 canskip="true"]

　　ユスタ　　　[indent]
周りに女々しいだの、優柔だの言われてねェ、[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/13/1.ogg" ]

　　 右近　　　[indent]
…まァそれでも、（言葉を選び）人を愛しいと思う
気持ちがどうしても捨てられなくてね…。かなり
悩んだよ、[endindent][l][r]
[ws buf=0 canskip="true"]

　　ユスタ　　　[indent]
これでは一国一城の主など勤まらぬ、情けを捨てよ、憐憫を捨てよ、ぶ
つぶつ言ってずーっと茶室に籠ってたのよね。[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/13/2.ogg" ]

[image storage="fgimage/21/_IS24282.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 右近　　　[indent]
そんな時、ある言葉を知ってね。…人が、その身を捨てても何者かをた
だ真に思い貫くこと。我が神でうすは、それを人が求めるべき唯一の道
だと説いた。でうすが説く最高の信条「御大切」…。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/13/3.ogg" ]
　　 雪乃　　　[indent]
（はたと思い当たり）「御大切」…。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/13/5.ogg" ]
　　 右近　　　[indent]
またの名を、弥陀の教え、十二因縁の一つから取り、「愛」。[endindent][l][r]
[ws buf=0 canskip="true"]

雪乃・源八　　[indent]
…。[endindent][l][r]


　　 右近　　　[indent]
…この言葉に会って初めて、自分のなかでずっとわだかまっていた思い
が、間違いじゃないと思えたんだな。[endindent][l][r]

　 ミゲル　　　[indent]
私達も皆、殿の語る「愛」の教えにやっと、心の重荷を解かれたんです。[endindent][l][r]

[image storage="fgimage/21/_IS17456.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 源八　　　[indent]
お殿様、あんた…、切支丹か。[endindent][l][r]

　　 右近　　　[indent]
そう。とは言えねぇ…、愛の道は深く、遠くて。そんな時に、あの六条
河原でそなたを見て、[endindent][l][r]

　　 雪乃　　　[indent]
じゃあ！あいや、お、おら、妹のみよが危ねェ目に遭ってっと思うと、
おら滅茶苦茶になってでも助けてやりたくなんです！[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/13/6.ogg" ]
　　 右近　　　[indent]
…それが、愛だ。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/13/7.ogg" ]
　　 雪乃　　　[indent]
じゃあ、じゃあ！おらみよ大丈夫かなァてずーっと考えてっと、今でも
胸が苦しくなんです！[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/13/8.ogg" ]
　　 右近　　　[indent]
それが、愛だ。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/13/9.ogg" ]
　　 源八　　　[indent]
おお、俺も弥七のこと考えっとどうにも酒が止まんなくなって、酔っぱ
らったまま急に走ると、胸が苦しくなんだ。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 人々　　　[indent]
…。[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/13/10.ogg" ]
　　 源八　　　[indent]
これも、愛か？[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/13/11.ogg" ]
　 ミゲル　　　[indent]
愛じゃない？[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/13/12.ogg" ]

[image storage="fgimage/21/_IS17462.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
あのおら！みよのことばっか考えて、村も家も全部捨てちまっ
てよ。おらずっと、自分がおかしいんだと思ってた。でもこうやって、
熱に浮かされたみてぇにみよのこと考えちまうのはよ、おかしいことで
はねんだな！[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/13/13.ogg" ]
　　 右近　　　[indent]
左様。お前はその心を信じ、生きてゆけば良いのだ。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/13/14.ogg" ]
　　 雪乃　　　[indent]
…愛…。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/13/15.ogg" ]
　　 源八　　　[indent]
…愛か…。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 右近　　　[indent]
そなた、女だな。[endindent][l][r]

　　 源八　　　[indent]
へっ、バカ言っちゃいけねェよ、俺ァ、[endindent][l][r]

　　 右近　　　[indent]
そなたではなく、[endindent][l][r]

　　 源八　　　[indent]
え、こいつ？…おいおい何言ってんだよ。こいつはお・と・こ。俺ァ二
年も一緒にいたんですぜ。あんたの目は、ふしあなかっつーの。[endindent][l][r]

　　 雪乃　　　[indent]
はい。[endindent][l][r]

　　 源八　　　[indent]
えっ！お前女だったの！…
お、俺の二年間、[endindent][l][r]

　　 右近　　　[indent]
名は、[endindent][l][r]

　　 雪乃　　　[indent]
…雪乃です。[endindent][l][r]

　　 源八　　　[indent]
ええ！おま（え）、雪乃だったの！[endindent][l][r]

　　 雪乃　　　[indent]
…いつ言ったらいいか、きっかけ掴めなくてよ、[endindent][l][r]

　　 源八　　　[indent]
二年だぞ！そんな、いろんなきっかけあったろうが！俺はこっから何を
信じて生きてきゃいんだ！[endindent][l][r]

　 ミゲル　　　[indent]
愛じゃない？[endindent][l][r]

　　 源八　　　[indent]
愛か…。[endindent][l][r]

　　 右近　　　[indent]
そなたらの住まいは既に城下に支度した。神の恩寵溢れるこの地で、
ゆるりと休むがよい。その胸に愛を、ひしと抱いてな。[endindent][l][r]
[p][cm]



*story_07|七場　近江　峡谷
;音楽開始
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[image storage="fgimage/22/_IS17481.JPG" layer="1" page="fore" visible="true" top="50"]
;音楽停止
[fadeoutbgm time=3000]


[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/秀吉.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
;[image storage="heiti" layer="base" page=fore]


[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
七場　近江　峡谷[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
;効果音再生
[playse buf="1" storage="sound/effect/P24風.ogg" ]

[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
羽柴秀吉、兵たちを伴い、肩を怒らせ現れる。[endindent][l][r]
[r]

　　 秀吉　　　[indent]
何で行軍が止まってんだよ！誰だ止めたのは！俺様は可及的速やかに安
土の信長公ん所に馳せ参じなきゃなんねぇんだよ！またお前、猿、遅
い、猿、使えない、って嫌味言われんだよ、この俺が！だいたい、俺の
どこが猿よ、どこに猿的要素がある、え？俺は猿か？[endindent][l][r]

　　 兵５ 　　　[indent]
猿じゃないっす。[endindent][l][r]

　　 秀吉　　　[indent]
おい、俺、猿か？[endindent][l][r]

　　 兵６ 　　　[indent]
いえ、猿じゃないっす。[endindent][l][r]

　　 秀吉　　　[indent]
だろ。あの鯰野郎、いつかギタギタにしてやっかんな！[endindent][l][r]

　　 兵７ 　　　[indent]
申し上げます。この先落石により、騎馬が足止めを食っております。[endindent][l][r]

[image storage="fgimage/22/_IS17483.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 秀吉　　　[indent]
落石だァ？[endindent][l][r]

[r]


[image storage="fgimage/23/_IS17486.JPG" layer="1" page="fore" visible="true" top="50" pos="left_center"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
羽柴軍を見下ろす十郎、そこへ孫市。[endindent][l][r]
[r]

　　 孫市　　　[indent]
谷の出口は塞いだだよ。[endindent][l][r]

　　 十郎　　　[indent]
よし。…この千尋の谷が奴の墓場よ。前後の騎馬を岩で潰せば奴は完全
に孤立する。[endindent][l][r]

　　 孫市　　　[indent]
んだな。男衆も集まっただよ。[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/14/15.ogg" ]

[image storage="fgimage/23/_IS24289.JPG" layer="1" page="fore" visible="true" top="50" left="0"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 十郎　　　[indent]
…ここで秀吉を潰せば、安土の奴の片羽根はもぎ取られる。いよいよこ
こから我らの覇業の始まりよ。孫市、お前の鉄砲衆だ。お前が先駆けの
祝詞（のりと）を上げろ！[endindent][l][r]
[ws buf=0 canskip="true"]


　　 孫市　　　[indent]
おう！えー…、秋は深まり、稲穂は実り、おらぁ夜風に当たると、自然
と涙が出てきてしまう。思い出すなァ。村長の暴れ太鼓。つきましては、[endindent][l][r]

　　 十郎　　　[indent]
もういい！行くぞ！[endindent][l][r]

[r]
[ws buf=1 canskip="true"]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]

;効果音再生
[playse buf="1" storage="sound/effect/SE_崖と馬.ogg" ]
羽柴軍を、落石が襲う。間近の騎馬が次々と潰される。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

　　 秀吉　　　[indent]
何事だ！[endindent][l][r]

　　 兵５ 　　　[indent]
殿！奇襲です！[endindent][l][r]

[r]

[playse buf="1" storage="sound/effect/SE銃撃.ogg" ]
　　　　　　　　　　　[indent]
銃声が響き、秀吉の兵たちが次々と倒れていく。[endindent][l][r]
[r]

　　 秀吉　　　[indent]
なんだと！[endindent][l][r]
[ws buf=1 canskip="true"]

[r]

[image storage="fgimage/24/_IS17493.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
　　　　　　　　　　　[indent]
そこへ十郎と、孫市の鉄砲隊。秀吉を取り囲む。[endindent][l][r]
[r]

　　 秀吉　　　[indent]
…誰だ！[endindent][l][r]

　　 十郎　　　[indent]
羽柴筑前守秀吉、お前を殺す。[endindent][l][r]

　　 秀吉　　　[indent]
…何ほざきやがる。者共！[endindent][l][r]

　　 十郎　　　[indent]
喚こうが誰も来ない。東西の騎馬は鉛玉で立ち往生。ここは孤立無援よ。[endindent][l][r]

　　 秀吉　　　[indent]
（怒りと懼れに身を震わせる）…。[endindent][l][r]

　　 孫市　　　[indent]
撃っちゃうよ。[endindent][l][r]

　　 十郎　　　[indent]
待て。臨終を前に何を急くことも無い。…俺はな、お前
に会ったら尋ねてみたいと、常々思うていたことがある。その返答我が
心胆を唸らせしめれば、お前の生き死に、考えぬことも無い。[endindent][l][r]

　　 孫市　　　[indent]
…撃っちゃうよ。[endindent][l][r]

　　 十郎　　　[indent]
待て。ちょ（っと）、今いいとこなんだよ！[endindent][l][r]


　　 秀吉　　　[indent]
（低く）おい。…この野武士風情が。俺にもの頼むんだったら礼わきま
えろや。俺は織田軍幾万の兵を束ねる頭よ。…とっととこいつを下ろさ
せろ！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
十郎、指図して鉄砲隊に銃を下ろさせる。[endindent][l][r]
[r]

　　 十郎　　　[indent]
…お前はいつか安土の奴の屍を越えて、この天下を獲る腹づもりだ。[endindent][l][r]

　　 秀吉　　　[indent]
…。[endindent][l][r]

　　 十郎　　　[indent]
（是と察しほくそ笑み）その天下、お前はどう民を統べるつもりよ。[endindent][l][r]

[image storage="fgimage/24/_IS24449.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 秀吉　　　[indent]
…「クニ」だ。…俺は北から南、この地で馬鹿ヅラ下げて生きる民こと
ごとく、土地と法度と政で骨の髄まで縛んだよ。人間なんぞ皆同じだ。
テメェを縛るもの拒みながら、根っこんとこでは滅茶苦茶に縛られたが
る。俺はクニで奴らを縛り上げて支配してやる。いつか奴らは、右差せ
ば右、左とうそぶきゃ左に走り、喜んでその命も捧げる、白痴の群れに
なるわ。[endindent][l][r]


;音声スタート
[playse buf="0" storage="sound/voice/15/1.ogg" ]

[image storage="fgimage/24/_IS17497.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
…流石はどん百姓からのし上がった、猿だ。[endindent][l][r]
[ws buf=0 canskip="true"]


　　 秀吉　　　[indent]
お、今、お前猿っつったろ！褒めたフリしてむっちゃ悪口言ったろてめ、[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/15/2.ogg" ]
　　 十郎　　　[indent]
だが、古い。[endindent][l][r]
[ws buf=0 canskip="true"]


　　 秀吉　　　[indent]
…古いだ？[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/15/3.ogg" ]
　　 十郎　　　[indent]
いずれお前の言う「クニ」は消える。[endindent][l][r]
[ws buf=0 canskip="true"]


　　 秀吉　　　[indent]
…んな、クニ無くなるって…、[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/15/4.ogg" ]
　　 十郎　　　[indent]
人間共の魂の根城はお前が言うほど愚鈍ではない。やがて奴らは我に返
る。己の身を縛る鎖を解く。クニも仏も神も脱ぎ棄てて、生身で世界に
立つ者たちの時代がやって来る。それこそが、まことの人間の世界よ。[endindent][l][r]
[ws buf=0 canskip="true"]





　　 秀吉　　　[indent]
…馬鹿げてら。[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/15/5.ogg" ]
　　 十郎　　　[indent]
笑え。新しき未来を笑うものは、やがて未来に笑われる。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 秀吉　　　[indent]
…。[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/15/6.ogg" ]
[image storage="fgimage/24/_IS17503.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
俺は名も金も民衆共の心もいらぬ。求めるものは一つ、この世界よ。俺
は新しい人間だ。全ての古きものをブチ壊し天下を統べた暁に、晴れて
この世界、まっさらなまま、まるごと民にくれてやるのよ。[endindent][l][r]
[ws buf=0 canskip="true"]


　　 秀吉　　　[indent]
…狂ってやがる。[endindent][l][r]

　　 十郎　　　[indent]
いいぞ孫市。[endindent][l][r]

　　 孫市　　　[indent]
あいよ。おめェら。撃ちますよ。[endindent][l][r]

　　 秀吉　　　[indent]
（銃口が向けられ）…。[endindent][l][r]

[r]
;音楽停止
[fadeoutbgm time=3000]


;音楽開始
[playbgm storage="bgm/ogg/滝川.ogg" loop="true"]

　　　　　　　　　　　[indent]
[playse buf="1" storage="sound/effect/SE銃風切り1.ogg" ]
その時、空を切る音と共に、鉄砲衆の一人が倒れる。[l][r]
呆気にとられる人々。[l][r]
[playse buf="1" storage="sound/effect/SE銃風切り2.ogg" ]
さらに一人、また一人、鉄砲衆が倒れていく。[endindent][l][r]
[ws buf=1 canskip="true"]
[r]

[image storage="fgimage/25/_IS17506.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 孫市　　　[indent]
東だ。十町先の峰に、竪木瓜（たてもっこう）の旗指物！[endindent][l][r]

　　 秀吉　　　[indent]
滝川か！[endindent][l][r]

[r]


[image storage="fgimage/25/_IS17511.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
峰の中腹から、十郎、秀吉を見下ろす滝川一益と鉄砲隊。[endindent][l][r]

[image storage="fgimage/25/_IS17506.JPG" layer="1" page="fore" visible="true" top="50"]


　　　　　　　　　　　[indent]
×   ×   ×[l][r]
[r]



彼方を見る十郎たち。[endindent][l][r]
[r]

　　 孫市　　　[indent]
有り得ねェ。十町先から外さず鉛玉食らわすなんて。[endindent][l][r]

[r]
[image storage="fgimage/25/_IS17511.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
×   ×   ×[r]
帳面を手にした男がブツブツと一心に呟きながら現れる[endindent][l][r]
[r]

　　 一益　　　[indent]
風が来たぞ。[endindent][l][r]

　　 弥七　　　[indent]
甲乙丙、八寸五厘三毛、首あげ。北に一寸と二厘六毛、[endindent][l][r]


　鉄砲隊　　　[indent]
（三挺の鉄砲がそれぞれ銃口を動かす）
;効果音開始
[playse buf="1" storage="sound/effect/SE銃構え.ogg" ]
[endindent][l][r]
[ws buf=1 canskip="true"]


　　 弥七　　　[indent]
乙、さらに二毛と一糸、丙
、さらに八糸、北へ。[endindent][l][r]

　　 一益　　　[indent]
撃て！[endindent][l][r]
[r]

　　　　　　　　　　　[indent]
;効果音再生
[playse buf="1" storage="sound/effect/SE銃.ogg" ]
銃声。[endindent][l][r]
[r]
[r]

　　　　　　　　　　　[indent]
[ws buf=1 canskip="true"]
×   ×   ×[l][r]
[playse buf="1" storage="sound/effect/SE銃風切り1.ogg" ]
空を切る音。一人、また一人倒れる鉄砲衆。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

　　 孫市　　　[indent]
危ねェ！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
[playse buf="1" storage="sound/effect/SE銃風切り2.ogg" ]
孫市、十郎に飛びつき、肩に銃弾を喰らう。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]
　　 十郎　　　[indent]
鉄砲隊に、あいつがついてるな…。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
馬のいななく声。孫市、十郎辺りを見上げる。[endindent][l][r]
[r]

　　 孫市　　　[indent]
駄目だァ。囲まれちまった。[endindent][l][r]

　　 秀吉　　　[indent]
おい、どうした野武士…、さっきの威勢は、[endindent][l][r]

　　 十郎　　　[indent]
…。[endindent][l][r]

　　 孫市　　　[indent]
ここは抑えろ。走るど。一、二の、さァン。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
;効果音再生
[playse buf="1" storage="sound/effect/SE爆発1.ogg" ]
孫市、懐の火薬玉を投げる。爆発音。[l][r]
ひるむ秀吉。その隙に、十郎と孫市は姿を消す。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

　　 秀吉　　　[indent]
追え！捕えろ！ブッ殺せ！[endindent][l][r]
[r]

[image storage="fgimage/25/_IS16848.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
追って去る秀吉。[l][r]
×   ×   ×[endindent][l][r]
[r]

　　 一益　　　[indent]
これであのエテ公に貸しを作ってやったわ。…相変わらず見事な算術よ。[endindent][l][r]

　　 弥七　　　[indent]
…もったいないお言葉。[endindent][l][r]

　　 一益　　　[indent]
信長公がお前を生かした訳がよく分かるわ。弥七よ…。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
一益、弥七、その場を去る。[endindent][l][r]
[p][cm]

*story_08|八場　高槻城下の平屋――
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;音楽停止
[fadeoutbgm time=3000]

[image storage="fgimage/26/_IS17523.JPG" layer="1" page="fore" visible="true" top="50"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音楽開始
[bgmopt volume="50"] 

[playbgm storage="bgm/ogg/だし.ogg" loop="true"]

[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]

八場　高槻城　高槻城下の平屋――。[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



　　　　　　　　　　　[indent]
ユスタ、雪乃、源八を連れてやって来る。[endindent][l][r]
[r]

　　ユスタ　　　[indent]
お二人のご兄妹のこと、各地に住む信徒を通じ、
出来る限りのことを聞いてみます。[endindent][l][r]

　　 雪乃　　　[indent]
あ、ありがとうごぜぇます。[endindent][l][r]

　　ユスタ　　　[indent]
ここが貴方がたの住まいです。[endindent][l][r]

雪乃・源八　 [indent]
（部屋を見渡し感嘆する）[endindent][l][r]


　　ユスタ　　　[indent]
ご兄妹のこと、気がかりでならぬとは思いますが、今は耐えて待ちまし
ょう。私も共に祈っております。ミゲル、ヨハンナ、あとは。[endindent][l][r]

ミゲル・ヨハンナ　[indent]
はい。[endindent][l][r]

　　 源八　　　[indent]
これが、南蛮風ってやつか…。[endindent][l][r]

　　 雪乃　　　[indent]
（机に置かれた衣を眺める）[endindent][l][r]

　 ミゲル　　　[indent]
殿が貴方にとご用意されたHispania
の反物です。お召しになりますか？[endindent][l][r]

　　 雪乃　　　[indent]
（ヨハンナに頭から薄手のショールを被せられ）…へ、[endindent][l][r]

　 ミゲル　　　[indent]
よくお似合いです。[endindent][l][r]

　ヨハンナ　　　[indent]
ほら、ご覧に。（雪乃を鏡に向かせる）[endindent][l][r]


　　 雪乃　　　[indent]
（鏡を見て、声も無く）…。[endindent][l][r]

　ヨハンナ　　　[indent]
聞きました。貴方がたもあの信長に、愛する家族を奪われたと。[endindent][l][r]

　　 源八　　　[indent]
…へっ、あんた、[endindent][l][r]

　 ミゲル　　　[indent]
我々も、愛するものを失いました。[endindent][l][r]

　　 源八　　　[indent]
そうだったのか。[endindent][l][r]

　 ヨハンナ　　 [indent]
貴方がたの身の上を聞き、まるで他人事と思えず…、[endindent][l][r]

　 ミゲル　　　[indent]
よろしければ聞いて頂けますか、我々の、愛する人のことを。[endindent][l][r]

[r]

[image storage="fgimage/27/_IS17539.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音楽停止
[fadeoutbgm time=3000]


;音楽開始
[playbgm storage="bgm/ogg/官兵衛.ogg" loop="true"]
　　　　　　　　　　　[indent]
×   ×   ×[l][r]
四人がストップモーションになる。[l][r]

;[image storage="01" layer="base" page=fore]
高槻城。[l][r]
高山右近に連れられ、丹羽長秀、黒田官兵衛、現れる。[endindent][l][r]
[r]

　　 長秀　　　[indent]
いやぁ、高槻はいいところですなァ。街が丸ごと、神聖な気に包まれて
るとでも申しましょうか。（カステラを頬張り）なァ、黒田殿、[endindent][l][r]

　官兵衛　　　[indent]
…。[endindent][l][r]

　　 右近　　　[indent]
お目利きの丹羽殿に、そのように言って頂くと、[endindent][l][r]

　　 長秀　　　[indent]
いやぁ…、アレですな、このようなものに囲まれてると、自分が大層、
清い人間になったような心持ちがしますな。（笑う）アアッ！[endindent][l][r]

　　 右近　　　[indent]
何か、[endindent][l][r]

　　 長秀　　　[indent]
（外に）ねぇ！[endindent][l][r]

　　 兵８　　　 [indent]
（やって来てかしずく）[endindent][l][r]

　　 長秀　　　[indent]
（カステラを手に）これ金払ってないよね！経費で落ちる？払っといて。
あ、領収取っといて。（笑う・兵去る）[endindent][l][r]


　官兵衛　　　[indent]
…。[endindent][l][r]

　　 長秀　　　[indent]
いやはや来て早々、神の許し給わぬ、罪人になるところでした。（笑う）[endindent][l][r]


　　 右近　　　[indent]
（追従笑い）[endindent][l][r]


　　 長秀　　　[indent]
罪人と言えば時に右近殿、
この街に、ある罪人（つみびと）を匿っておられるかな？[endindent][l][r]


　　 右近　　　[indent]
…。[endindent][l][r]

　　 長秀　　　[indent]
二年前、京六条河原に押し入った男女二人連れが、行方をくらましてお
りましてな。この高槻にいるとの噂が、[endindent][l][r]

　　 右近　　　[indent]
初耳ですな、[endindent][l][r]

　　 長秀　　　[indent]
なんでもその娘、ここだけの話、織田家を揺るがす秘密を隠し持ってお
るとか。その者を匿う者も死罪と、殿の厳命がありましてな、[endindent][l][r]

　　 右近　　　[indent]
（微笑み）此度のお越しは、この右近を問い詰めるためですか？[endindent][l][r]


　　 長秀　　　[indent]
兵も待機させておる。このままこの高槻の町、一斉に改めさせて頂いて
もよろしいかな。（こける）あたっ、[endindent][l][r]

　　 右近　　　[indent]
お好きになされよ。そのような者、この高槻には断じておりませぬ。[endindent][l][r]

[r]




[image storage="fgimage/26/_IS17526.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音楽停止
[fadeoutbgm time=3000]
　　　　　　　　　　　[indent]
×   ×   ×[l][r]
右近、官兵衛、長秀の姿はそのまま、十字架、窓、椅子となる。[endindent][l][r]
[r]

;[image storage="takatuki" layer="base" page=fore]

;音楽開始
[playbgm storage="bgm/ogg/だし.ogg" loop="true"]

　　 雪乃　　　[indent]
それで…、[endindent][l][r]

　ヨハンナ　　　[indent]
夫は無理矢理武田の戦に駆り出されたと聞いてから、その消息を絶ちました…、[endindent][l][r]

　 ミゲル　　　[indent]
私の許嫁は、戦場に遊女として連れ出され、そのまま行方も知れず…、[endindent][l][r]

　　 源八　　　[indent]
…。（いたたまれぬ思いに駆られ立ち上がり、離れた椅子に座る）[endindent][l][r]

　ヨハンナ　　　[indent]
もう三年も経つのですが、いまだに気付くと涙が止まらなくなって…、[endindent][l][r]

　 ミゲル　　　[indent]
この乱世、別れは世の常だと必死で自分に言い聞かせて…、時が経てば、
この張り裂けるような恋しさも、薄らいでいくと思ったのですが…。[endindent][l][r]

　　 雪乃　　　[indent]
…。[endindent][l][r]

　ヨハンナ　　　[indent]
…私、思うのです。日々幾千の人間たちが産まれ死ぬこの浮世の中で、
これほどまでに愛する人と巡り合ったことは、奇跡だと…。[endindent][l][r]

　 ミゲル　　　[indent]
…なのに、その奇跡を、奪われるとは…。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
雪乃、源八、言葉を無くす。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
みよは…、もう死んじまってんのかな…、[endindent][l][r]

　　 源八　　　[indent]
…。[endindent][l][r]

　 ミゲル　　　[indent]
（強く）いえ生きています。我々の愛する者も。生きていると信じなけ
れば、私達のこの思いは一体、何処に向ければいいのですか。[endindent][l][r]

雪乃・ 源八　 [indent]
…。[endindent][l][r]

　 ミゲル　　　[indent]
（十字架を見て）右近殿ほどの方であれば、全ての民を等しく愛する深い器をお持ちなのでしょう。私のような未熟者は、ただ一人への愛を貫くのが精一杯。…けれど、そのためなら、この身にこの心に、どのような艱難辛苦が不えられても構わない。そのためなら、私たちは…、[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
源八、ミゲルの決意に満ちた言動を受けて、[endindent][l][r]
[r]
[image storage="fgimage/26/_IS16862.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 源八　　　[indent]
なんだ、なにすんだ、何すれば兄貴のためになんだ、[endindent][l][r]

　 ミゲル　　　[indent]
えっ…、[endindent][l][r]

　　 源八　　　[indent]
分かる。おめェたちは知ってんだ。何がおらがやるべきことなのかを。[endindent][l][r]

　 ミゲル　　　[indent]
いえ、何を。[endindent][l][r]

　ヨハンナ　　　[indent]
特別なことは、決して、[endindent][l][r]


　　 源八　　　[indent]
嘘だ、俺ァバカだけどよ、肚決めた奴の覚悟の匂いは分かんだよ。[endindent][l][r]

ミゲル・ヨハンナ　[indent]
…。[endindent][l][r]

　　 源八　　　[indent]
お願いだ。隠さねェでくれよ！[endindent][l][r]

　 ミゲル　　　[indent]
（しばらく黙し）…それが、ゴルゴダに向かう茨の道だとしても、[endindent][l][r]

　　 源八　　　[indent]
構わねェ。おらゴルゴダでも五反田でも兄貴のためなら、どこだって、[endindent][l][r]

　　 雪乃　　　[indent]
…源八…。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
ミゲル、しばらく黙した後、[endindent][l][r]
[r]

　 ミゲル　　　[indent]
分かりました。では参りましょう。私たちの、愛のために。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
雪乃と源八、ミゲル、ヨハンナと共に去る。[l][r]
[r]
;音楽停止
[fadeoutbgm time=3000]

;音楽開始
[playbgm storage="bgm/ogg/官兵衛.ogg" loop="true"]

[image storage="fgimage/27/_IS17539.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="02" layer="base" page=fore]
×   ×   ×[l][r]
[r]

長秀、呻きながら立ち上がる。[endindent][l][r]
[r]

　　 右近　　　[indent]
どうした、丹羽殿。[endindent][l][r]

　　 長秀　　　[indent]
…この数分の間に、この身に何かが…。そこにあった像何処行きました。[endindent][l][r]

　官兵衛　　　[indent]
ん？…ここにあるではないか、[endindent][l][r]

　　 長秀　　　[indent]
や、そういう演劇的な意味じゃなく、畜生…、[endindent][l][r]

[image storage="fgimage/27/_IS16869.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　官兵衛　　　[indent]
時に右近殿、[endindent][l][r]

　　 長秀　　　[indent]
おっ、黒田殿も言ってやんなさい。[endindent][l][r]

　官兵衛　　　[indent]
貴方はこの高槻の民に、熱心に布教されているとか。[endindent][l][r]

　　 長秀　　　[indent]
え、そっち？[endindent][l][r]


;音声スタート
[playse buf="0" storage="sound/voice/16/1.ogg" ]
　　 右近　　　[indent]
あなたも、でうすの教えにご興味が？[endindent][l][r]
[ws buf=0 canskip="true"]


;音声スタート
[playse buf="0" storage="sound/voice/16/2.ogg" ]
　官兵衛　　　[indent]
ええ、大いに。…私はかの有岡の城で牢に籠められ、このような不具の
身となりました。死はいつでもそこにあった。が、人智を超えた大きな
力が私を生かした。…そう思った時、神の存在を思いました。[endindent][l][r]
[ws buf=0 canskip="true"]


　　 右近　　　[indent]
ほう…、[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/16/3.ogg" ]
　官兵衛　　　[indent]
しかし…、私の若き苗木の如き魂は、体と共にねじ曲がったようで、
どうしても…、愛というものがこの腹の腑に落ちませぬ。[endindent][l][r]
[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/16/4.ogg" ]
　　 右近　　　[indent]
…神を感じる黒田殿なら、ほどなくその魂にも愛が、[endindent][l][r]
[ws buf=0 canskip="true"]


;音声スタート
[playse buf="0" storage="sound/voice/16/5.ogg" ]
　官兵衛　　　[indent]
右近殿にお尋ねしたい。話によれば…、南蛮の将軍ピサロは、布教のためにと
数千万の異教徒の民を嬲り殺したと。それは、愛ですか。[endindent][l][r]
[ws buf=0 canskip="true"]


;音声スタート
[playse buf="0" storage="sound/voice/16/6.ogg" ]
　　 右近　　　[indent]
神の説く愛こそが民に真の救いを与える。その救いを広めるためにこ
そ彼は遠く海を渡ったのです。[endindent][l][r]
[ws buf=0 canskip="true"]


;音声スタート
[playse buf="0" storage="sound/voice/16/7.ogg" ]
　官兵衛　　　[indent]
しかし同時に多くの血も流された。貴方が戦場でなされるように。
右近殿、それは、愛ですか。[endindent][l][r]
[ws buf=0 canskip="true"]


　　 右近　　　[indent]
…。[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/16/8.ogg" ]

[image storage="fgimage/27/_IS24461.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　官兵衛　　　[indent]
貴方はかの荒木村重謀反の折り、村重に背き、有岡城の人質である妹と
御子（おこ）を死なせるか、信長公に背き、安土に捕えられた人質の伴
天連たちを死なせるかを迫られて、結局は城も民も捨て、家族も、貴方
を信じ慕った信者たちをも打ち捨てて、逃げましたな。…右近殿、それ
が貴方が最高の信条と語る、愛というものなのですか…。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]


　　　　　　　　　　　[indent]
絶句する右近。必死で言葉を紡ぐ、[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/16/9.ogg" ]
　　 右近　　　[indent]
…黒田殿、[endindent][l][r]
[ws buf=0 canskip="true"]


;音声スタート
[playse buf="0" storage="sound/voice/16/10.ogg" ]
　官兵衛　　　[indent]
右近殿でさえその真髄を語れぬ愛を、民は何百年経とうとも真に理解で
きるものでしょうか…。…もしや右近殿は、六条河原で身を賭して処刑
場に駆け入ったという娘に、未だ霞の彼方に掴めぬ、愛の真髄を直観し
たのではないか？…だとしたら私も、その娘が持つ愛とやらを、見てみ
たいものですな…。[endindent][l][r]
[ws buf=0 canskip="true"]

[image storage="fgimage/27/_IS17542.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 右近　　　[indent]
（苦渋に満ち）黒田殿…、何度も申した通り、私はそのような娘など、[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
そこへ官兵衛の忍が来る。[endindent][l][r]
[r]

　　 忍３　　　[indent]
申し上げます。例の娘がいると思われる屋敷を包囲しました。[endindent][l][r]

　　 右近　　　[indent]
！…黒田殿、貴方は、[endindent][l][r]

　官兵衛　　　[indent]
（ほくそ笑み）…。[endindent][l][r]

　　 忍３　　　[indent]
…しかし、娘の姿がありませぬ。[endindent][l][r]

　官兵衛　　　[indent]
…。[endindent][l][r]

[r]

[image storage="fgimage/27/_IS17547.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
官兵衛、長秀、忍びと共に去る。右近、一人目を閉じ黙考し、去る。[endindent][l][r]
[p][cm]


*story_09|九場　近江　平地
;[image storage="13" layer="base" page=fore]
[image storage="fgimage/28/_IS16887.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;音楽停止
[fadeoutbgm time=3000]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
九場　近江　平地[resetfont][l][r]
[r]
;音楽開始
[bgmopt volume="50"] 
[playbgm storage="sound/effect/P24風.ogg" loop="true"]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　　　　　　　　　　[indent]
ミゲル、ヨハンナに連れられ、雪乃、源八、やって来る。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
…どこまで行くんだ。[endindent][l][r]

　 ミゲル　　　[indent]
間もなくだ。（辺りに）集まっているか、兄弟姉妹たち。[endindent][l][r]

キリシタンたち　[indent]
はい。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
幾多のキリシタンたちが集まる。[endindent][l][r]
[r]

　　 源八　　　[indent]
なんだ…？[endindent][l][r]

　 ミゲル　　　[indent]
紹介する。雪乃、源八。彼らも我々と同じ悲しみを負う者たちだ。[endindent][l][r]

　　 源八　　　[indent]
…こいつらみんな、[endindent][l][r]

　ヨハンナ　　　[indent]
子や親兄弟、夫や妻を奪われました。[endindent][l][r]

キリシタン１　[indent]
（雪乃に）あなたも…、[endindent][l][r]

キリシタン２　[indent]
（源八に）…挫けるな。あんたたちだけじゃねぇからな。[endindent][l][r]

　 ミゲル　　　[indent]
みんなよく集まってくれた。では皆の愛する者たちを思い、共に祈りを
捧げよう。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
ミゲルを中心に目を閉じるキリシタンたち。[l][r]
雪乃、源八は戸惑いながらもそれに倣う。[endindent][l][r]
[r]

　 ミゲル　　　[indent]
天の父なる神よ。今ここに集まった兄弟姉妹は、それぞれ愛する者を
失い、奪われ、悲しみに暮れています。[endindent][l][r]

[image storage="fgimage/28/_IS17555.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[r]
　　　　　　　　　　　[indent]
雪乃、源八、目を開けて人々を見渡す。[endindent][l][r]
[r]

　 ミゲル　　　[indent]
私たちが愛する者たちは、私たちの生きる全てでした。命でした。けれど今…、その愛は心無い者たちによって、無残に打ち砕かれております。どうか神よ。我々の愛をお守りください。たとえ地獄の谷を歩むとも、貴方が我らと共にありて、この愛に、たゆまぬ力をお不え下さい。[endindent][l][r]

キリシタンたち　[indent]
アーメン。[endindent][l][r]

[r]
;音楽停止
[fadeoutbgm time=3000]

;音楽開始
[playbgm storage="bgm/ogg/戦闘.ogg" loop="true"]


[image storage="fgimage/29/_IS16891.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
キリシタンたち、各々に荷を携える。[endindent][l][r]
[r]

　 ミゲル　　　[indent]
間もなく奴らはここを通る。…散れ！[endindent][l][r]

キリシタンたち　[indent]
はい、（駆け出し、ドンッと音を立てて木箱を置く）[endindent][l][r]

　　 雪乃　　　[indent]
どうなってんだ…、[endindent][l][r]

　 ミゲル　　　[indent]
戦いましょう、共に。（荷を渡す）[endindent][l][r]

　　 雪乃　　　[indent]
えっ…、[endindent][l][r]

　ヨハンナ　　　[indent]
北東四里の距離に、織田配下、滝川一益隊。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
滝川軍の兵が現れる。[endindent][l][r]
[r]

　 ミゲル　　　[indent]
その心に愛の火を絶やすな。炎を握れ。この愛のために、勇気の弦を振り絞れ。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
滝川軍の兵たちが進み来る。[endindent][l][r]
[r]

　 ミゲル　　　[indent]
行け！[endindent][l][r]

[r]

[image storage="fgimage/29/_IS32327.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
キリシタンたち、声を上げ次々と、手にした火薬玉を放る。[l][r]
;効果音再生
[playse buf="1" storage="sound/effect/SE爆発1.ogg" ]
兵たちは、火薬玉に逃げ惑い、吹き飛ばされ、声を上げる。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]


　　 雪乃　　　[indent]
（おろおろと）源八…、[endindent][l][r]

　ヨハンナ　　　[indent]
どうしたのです。奴らさえいなければ、貴方がたの温かな日々は、奪わ
れることはなかったのです。奴らこそが…、貴方がたの愛する人を奪っ
たのです！[endindent][l][r]

[r]


[image storage="fgimage/29/_IS24473.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
源八、その言葉に低く唸り出す。そして、獣のように駆け出すと火
薬玉を握り、叫びと共に彼方に向かい放り投げる。[l][r]
;効果音再生
[playse buf="1" storage="sound/effect/SE爆発2.ogg" ]
ドォン！炸裂音と共に、源八の投げた火薬玉が兵を吹き飛ばす。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

[image storage="fgimage/29/_IS24472.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
…源八…、[endindent][l][r]

[r]

[image storage="fgimage/29/_IS32327.JPG" layer="1" page="fore" visible="true" top="50"]


　　　　　　　　　　　[indent]
兵たちの奥から、滝川一益、現れる。[endindent][l][r]
[r]

　　 一益　　　[indent]
…この一益の軍にカチコミかましたフザけた野郎共はどれよ。…お前ら、一人残らずドタマかち割ったれや！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
雪乃、源八たちの周囲を、兵たちが取り囲む。[l][r]
;効果音再生
[playse buf="1" storage="sound/effect/SE銃撃.ogg" ]
そこへ、さらに銃声。兵たちが次々と散ってゆく。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

　　 雪乃　　　[indent]
なんだ、どうなってんだよ！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
すると、物陰から十郎が飛び出す。[endindent][l][r]
[r]



　　 十郎　　　[indent]
やっと見つけたぞ…。娘！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
十郎、兵たちをなぎ倒し雪乃の腕を掴み上げる。[endindent][l][r]
[r]

[image storage="fgimage/30/_IS17563.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 十郎　　　[indent]
…えらい手間かけさせやがって。（逃げようとしない雪乃に）…逃げないのか？[endindent][l][r]

　　 孫市　　　[indent]
おい、十郎、[endindent][l][r]

　　 十郎　　　[indent]
うるせぇ！[endindent][l][r]

　　 孫市　　　[indent]
あれ見ろって！[endindent][l][r]

　　 十郎　　　[indent]
…ああ畜生！なんだ！[endindent][l][r]

[r]

;音楽停止
[fadeoutbgm time=3000]

;音楽開始
[playbgm storage="bgm/ogg/信長.ogg" loop="true"]


[image storage="fgimage/31/_IS16897.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="06" layer="base" page=fore]
　　　　　　　　　　　[indent]
ざわめく兵士たち。[l][r]
その視線の彼方に、織田信長の姿が…。[endindent][l][r]
[r]

　　 源八　　　[indent]
（圧倒され）…織田、信長だ…。[endindent][l][r]

　　 雪乃　　　[indent]
…。[endindent][l][r]

　　 孫市　　　[indent]
まさかこんなとこに…。[endindent][l][r]

　　 十郎　　　[indent]
（怒りをたぎらせ）あの野郎…、ブチ殺してやる！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
十郎、雪乃を放し、信長に向かい猛然と駆け出して行く。[endindent][l][r]
[r]


　　　　　　　　　　　[indent]
×   ×   ×[l][r]
駆ける十郎。瞬く間に信長の元に立つ。[endindent][l][r][r]
[image storage="fgimage/31/_IS17576.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]




　　 十郎　　　[indent]
貴様…、あの時俺を…、[endindent][l][r]

　　 信長　　　[indent]
生き延びたとは悪運の強い…。[endindent][l][r]

　　 十郎　　　[indent]
やっぱりお前のはかりごとか…。[endindent][l][r]

　　 信長　　　[indent]
今度は俺が、自らお前を斬り捨ててやる。長年の間陰日向として、共に
生きたお前への恩情だ。[endindent][l][r]

　　 十郎　　　[indent]
…戯けたことを。斬り捨てられるのは己よ。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
十郎、太刀を抜き、信長と向かい合う。[endindent][l][r]
[r]

　　 信長　　　[indent]
…近頃、俺にもお前が事ある毎に嘯いた世界の姿が見えてきたわ。[endindent][l][r]

　　 十郎　　　[indent]
フン…、お前なんぞに、[endindent][l][r]

[image storage="fgimage/31/_IS17568.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 信長　　　[indent]
クニも消え…、仏もあまねく神々も消え…、人がその身を繋ぐ一切の鎖
から、解き放たれた世界。[endindent][l][r]

　　 十郎　　　[indent]
…。[endindent][l][r]

　　 信長　　　[indent]
だが、この俺が見通したのは、お前の語った世界のさらにその先よ。[endindent][l][r]

　　 十郎　　　[indent]
あ…？[endindent][l][r]

[image storage="fgimage/31/_IS24302.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 信長　　　[indent]
…標を無くした人間たちは、やがて自らを唯一至高の王となす。寄る辺
なき虚無にその身を晒す寒さに怯え、いつしか誰もがその魂を城壁で覆
う。どんな言葉もそこには届かぬ。王たちは皆、彼方の城の奥に秘めら
れた、語られぬ思いを想像し、手を伸ばすことを忘れ去る。城に鎧われ
た夥しい孤独な暴君が、世を彷徨い、地を埋め尽くす。それが…、お前
が望む世界の、行く未よ。[endindent][l][r]


　　 十郎　　　[indent]
（信長の言葉に窮して）…
ほざけ！[endindent][l][r]

[r]

[image storage="fgimage/31/_IS17579.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


;音楽停止
[fadeoutbgm time=3000]



　　　　　　　　　　　[indent]
十郎、信長に斬りかかっていくが、返り討ちにされる。[l][r]

;効果音再生
[playse buf="1" storage="sound/effect/P35一撃.ogg" ]
頭に強烈な一撃を受け、その意識が飛ぶ。[endindent][l][r]
[r]
;[image storage="black" layer="base" page=fore]

;音楽開始
[playbgm storage="bgm/ogg/幻視.ogg" loop="true"]

[image storage="fgimage/32/_IS17588.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[ws buf=1 canskip="true"]

　　　　　　　　　　　[indent]
×   ×   ×[r]
十郎の幻視――。[l][r]
雑踏の音。都市の喧噪。[l][r]
十郎の周りに、現代の姿形をした幾多の人間たちがひしめく。[l][r]
顔を薄汚れた包帯に巻かれた人々が行き交い、倒れた者を呵責なく
踏み潰していく。グシャッ、グシャッ、骨が折れ、肉がねじれる音。[l][r]
倒れた者は痙攣しながら地に満ちていく。[l][r]
十郎はその光景に不気味な戦慄を感じ、たまらず声を上げる。[endindent][l][r]
[r]


　　 十郎　　　[indent]
何だお前らは…。消えろ…。消え失せろ！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
十郎が夢中で太刀を振るうと、その光景は霧のように消える。[endindent][l][r]
[r]

;[image storage="heiti" layer="base" page=fore]
[image storage="fgimage/32/_IS16914.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]

;音楽停止
[fadeoutbgm time=3000]

;音楽開始
[playbgm storage="bgm/ogg/戦闘.ogg" loop="true"]

×   ×   ×[r]
気付くと十郎は地に伏している。[l][r]
十郎にとどめを刺そうと、信長が歩み寄る。[endindent][l][r]
[r]

　　 信長　　　[indent]
…くたばれ。死に損ない。[endindent][l][r]

　　 十郎　　　[indent]
！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
十郎、すんでのところで太刀筋を逃れるが、続け様に襲い来る刃に
その身を斬られる。[endindent][l][r]
[r]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
十郎の姿を彼方から見る雪乃と源八。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
…あいつ…、[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
十郎、そのまま駆け出し、森の中へと逃れる。[endindent][l][r]

[r]
　　 信長　　　[indent]
者共追え！森をかき分け奴を見つけ出し、その雁首を取って来い！[endindent][l][r]
[r]


　　　　　　　　　　　[indent]
×   ×   ×[endindent][l][r]
[r]

　　 源八　　　[indent]
おい雪乃行くぞ。[endindent][l][r]

　　 雪乃　　　[indent]
（十郎の消えた森を見つめ）…駄目だ、[endindent][l][r]

　　 源八　　　[indent]
えっ？[endindent][l][r]

　　 雪乃　　　[indent]
いま行くぞ。…十郎、…十郎！[endindent][l][r]

[r]


　　　　　　　　　　　[indent]
雪乃、十郎の駆け入った森に向かい、一人駆け出す。[endindent][l][r]
[r]

　　 源八　　　[indent]
…雪乃！[endindent][l][r]

　ヨハンナ　　　[indent]
源八、逃げましょう、早く！[endindent][l][r]

[r]


　　　　　　　　　　　[indent]
源八、やむなく雪乃を振り切り駆け出す。[endindent][l][r]
[p][cm]


*story_10|十場　安土城
;音楽停止
[fadeoutbgm time=3000]

[image storage="fgimage/8/black681.jpg" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="aduti" layer="base" page=fore]
[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]


十場　安土城[resetfont][l][r]
[r]

　　　　　　　　　　　[indent]
安土城内・明智光秀の居館――。[l][r]
頭を垂れかしずく娘の前に、明智光秀、現れる。[endindent][l][r]
[r]

　　　　娘　　　[indent]
お帰りなさいませ。安土へのお越し、心より嬉しゅうございます。光秀公。[endindent][l][r]

　　 光秀　　　[indent]
信長公のお呼び立てだからな。しかし、時を置かずしてこう幾度も…。
羽柴殿も、眼（まなこ）の奥でこの徒労に辟易しておった。信長公のあの探るような目…、さては殿は、我らから謀反者が出るとでもお思いか？[endindent][l][r]

　　　　娘　　　[indent]
（傅き、頭を垂れたまま）[endindent][l][r]

　　 光秀　　　[indent]
面を上げよ。きぬ。[endindent][l][r]

[r]

;音楽開始
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/みよ.ogg" loop="true"]

　　　　　　　　　　　[indent]
娘が顔を上げる。みよである。
[image storage="fgimage/33/_IS16940.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
すぐさま光秀の額の傷に気付く。[endindent][l][r]
[r]

     みよ 　　 [indent]
殿、どうなさったんですか、その傷は、[endindent][l][r]

　　 光秀　　　[indent]
ああ、大したことではない。またこの光秀、殿にお叱りを受けてな。[endindent][l][r]

     みよ 　　 [indent]
（歩み寄り）血が、[endindent][l][r]

　　 光秀　　　[indent]
いい、構うな。[endindent][l][r]

     みよ 　　 [indent]
…す、すいませんでげす！[endindent][l][r]

　　 光秀　　　[indent]
げす？[endindent][l][r]

　　 光秀　　　[indent]
…そなた、ここにきていかほどになる。[endindent][l][r]

     みよ 　　 [indent]
…二年と、半年に。[endindent][l][r]

　　 光秀　　　[indent]
そなた、なぜここに連れてこられたか分かるか。[endindent][l][r]

     みよ 　　 [indent]
…いえ。[endindent][l][r]

[image storage="fgimage/33/_IS24311.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 光秀　　　[indent]
羽柴殿はお前を使って、この光秀を探ったのだ。謀反者の娘を差し出さ
れ、すぐさま信長公にその旨報告すれば、この心に謀反心なし。しかし、
もし娘を匿えば、その胸に、信長公への密かな逆心ありと知れ
る。私は、試されたのだ。[endindent][l][r]

     みよ 　　 [indent]
…[endindent][l][r]

　　 光秀　　　[indent]
案ずるな。お前を計略の道具などとして見てはおらん。[endindent][l][r]

     みよ 　　 [indent]
…光秀様…。[endindent][l][r]
[r]


　　　　　　　　　　　[indent]
二人の会話を、忍がひそかに聞いている。[endindent][l][r]
[r]

　　 光秀　　　[indent]
しかし、羽柴殿も、大いなる思い違いをしているようだな。確かに、信
長公の私への仕打ちは時に惨い。だがその辱めを差し引いてもなお余り
あるほど、私は信長公の新しさに魅せられている。あの方が切り開く世
界の行く未を見るためならば、この光秀、魂を売り飛ばし、この身を斬
り苛まれようとも一向に構わぬ。ただ…、近頃の信長公は…、何かが違
う。かつての殿とは、何かが…。[endindent][l][r]

[r]


　　　　　　　　　　　[indent]
光秀の居館、溶暗。忍は闇夜を駆け、別の館にたどり着く。[endindent][l][r]
[r]

;音楽停止
[fadeoutbgm time=3000]


;音楽開始
[playbgm storage="bgm/ogg/秀吉.ogg" loop="true"]
[image storage="fgimage/34/_IS17604.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
秀吉の居館。秀吉と官兵衛が盃を傾けている。[endindent][l][r]
[r]


　　 秀吉　　　[indent]
ええ！？マジでそう言ったのか。[endindent][l][r]

　　 忍４　　　[indent]
はい。[endindent][l][r]

　　 秀吉　　　[indent]
あー、もう光秀マジ使えねェ！官兵衛！[endindent][l][r]

　官兵衛　　　[indent]
ここに。[endindent][l][r]

　　 秀吉　　　[indent]
近い！いるのは分かってるよ！[endindent][l][r]

　官兵衛　　　[indent]
何を急くこともありませぬ。まだ別の手は幾つも、[endindent][l][r]

　　 秀吉　　　[indent]
ほんとにさぁ…、あのイカレ鯰潰せんの？[endindent][l][r]

　官兵衛　　　[indent]
貴方のお力を持ってすれば。[endindent][l][r]

　　 秀吉　　　[indent]
そう言って使い倒しといて土壇場で俺の寝首掻くんだろ。[endindent][l][r]

　官兵衛　　　[indent]
…。[endindent][l][r]

　　 秀吉　　　[indent]
冗談だっての。あの娘まだ見つかんないの。あの…秘術を知ってるって、[endindent][l][r]


　官兵衛　　　[indent]
はい。全く。[endindent][l][r]

　　 秀吉　　　[indent]
チッ、もう早くしてくれよ。…しっかし、あの噂、マジだと思うか？信長を討つって秘術が、人間のことだっての。[endindent][l][r]

[r]

;[image storage="heiti" layer="base" page=fore]
;音楽停止
[fadeoutbgm time=3000]


[image storage="fgimage/35/_IS16950.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音楽開始
[playbgm storage="bgm/ogg/雪乃村人.ogg" loop="true"]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
;効果音再生
[playse buf="1" storage="sound/effect/P3森1.ogg" ]
所かわり、近江山中――。[l][r]
朽ち果てた小屋で横たわる十郎。そこへ雪乃。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
十郎、元気出せ。[endindent][l][r]

　　 十郎　　　[indent]
（うめく）[endindent][l][r]

　　 雪乃　　　[indent]
今頃、美又じゃ村の祭りの
季節でよ。毎年みんなで火焚いて踊るんだ。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/song/NO38雪乃.ogg" ]
　　　　　　　　　　　[indent]
思い出し、踊る雪乃。[l][r]
その姿を、見つめている十郎…。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
おめェにも見せてやりてェな。…いつかみよ連れて村に戻れたら…、お
めェも一緒によ。[endindent][l][r]

　　 十郎　　　[indent]
…下らんことを。[endindent][l][r]

　　 雪乃　　　[indent]
口きけるようになったか。良かった。ゆっくり休め。[endindent][l][r]

[r]
[ws buf=0 canskip="true"]
[ws buf=1 canskip="true"]

;音楽停止
[fadeoutbgm time=3000]
;音楽開始
[playbgm storage="bgm/ogg/みよ.ogg" loop="true"]

;[image storage="aduti" layer="base" page=fore]
[image storage="fgimage/36/_IS16953.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
×   ×   ×[r]

みよの寝所。廊下から小さく田植え歌が聞こえる。[endindent][l][r]
[r]

　　 弥七　　　[indent]
（歌）ねむたからけど、ねむた目覚ませ、酒を飲め飲め、[endindent][l][r]

     みよ 　　 [indent]
（襖を開けて）弥七、[endindent][l][r]


　　 弥七　　　[indent]
（寝所に入り）すまねぇなァ、なかなか来らんなくてェ。[endindent][l][r]

     みよ 　　 [indent]
ううん、[endindent][l][r]

　　 弥七　　　[indent]
御家来衆が集まって宴席があってよ。そおって抜けてきた。[endindent][l][r]

     みよ 　　 [indent]
…大丈夫か？[endindent][l][r]


　　 弥七　　　[indent]
ああ。ほら。（包みを渡し）おめェ…、確か柿好きなんだろ。[endindent][l][r]

     みよ 　　 [indent]
…ありがとう。よくこうやって村でも柿食ってたァ。[endindent][l][r]

[image storage="fgimage/36/_IS16956.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 弥七　　　[indent]
シッ。（静かに）今この安土じゃ、美又村に隠された秘術の噂でもちきり
よ。間違ってもおめェが村のもんだってばれたらいけねェ。[endindent][l][r]

     みよ 　　 [indent]
…うん。[endindent][l][r]

     みよ 　　 [indent]
…ねェ様、どうしてるかな…。弥七の弟もよ、[endindent][l][r]


　　 弥七　　　[indent]
ああ…。[endindent][l][r]

     みよ 　　 [indent]
…帰りてェなァ。…なぁいつかよ、いつか分かんねぇけど、このお城出
られるようになったらよ、おめぇも一緒に村によ、[endindent][l][r]


　　 弥七　　　[indent]
（ぎこちなく笑い）…おめェはな、みよ。（長い躊躇の後）…おらは無理
だ。もうおらは、このお城の歯車なんだ。…抜けらんねェ。[endindent][l][r]

     みよ 　　 [indent]
…。[endindent][l][r]

　　 弥七　　　[indent]
みよ…、忘れんのも、大事だぞ。生きてくためにはよ。[endindent][l][r]

[r]


　　　　　　　　　　　[indent]弥七、去る。[l][r]
[image storage="fgimage/36/_IS16960.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
;音楽停止
[fadeoutbgm time=3000]

みよ、物悲しさに襲われ、うずくまる。[l][r]
泣きだしそうな自分に抗うように、戯れ歌を歌う。[l][r]
[image storage="fgimage/36/_IS16966.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/18/ナマズ二重唱.ogg" ]
涙声の歌声が、辺りに響く。[endindent][l][r]
[r]


;[image storage="aduti2" layer="base" page=fore]
[image storage="fgimage/36/_IS16983.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
×   ×   ×[r]
その頃、天守の信長。夜の闇に響く歌声を耳にする。[l][r]
その歌の詞を耳にし、見る間にその表情が険しくなる。[endindent][l][r]
[r]

　　 信長　　　[indent]
おい…、[endindent][l][r]
[image storage="fgimage/36/_IS16971.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 小姓　　　[indent]
（駆けて来て傅き）ハッ。[endindent][l][r]

　　 信長　　　[indent]
この歌、誰が…。[endindent][l][r]

　　 小姓　　　[indent]
…畏れながら、（分かりません）[endindent][l][r]

　　 信長　　　[indent]
この歌の主（ぬし）、即刻捕え我が元に連れて来い、すぐにだ！[endindent][l][r]

　　 小姓　　　[indent]
ハッ！[endindent][l][r]

[r]

[image storage="fgimage/36/_IS17630.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
闇夜を凝視する信長。[l][r]

[image storage="fgimage/36/_IS17632.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
戯れ歌を歌うみよの姿と、雪乃の姿が重なり、みよが消えていく。[endindent][l][r]

[p][cm]


;フェードアウト
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[image storage="fgimage/36/_IS17632.JPG"" layer="2" page="fore" visible="false" top="50"]
[image storage="fgimage/8/black681.jpg" layer="1" page="back" visible="false" top="50"]
[wait time=2000]
[trans layer="1" time=2000 method=crossfade]
[wt]
[ws buf=0 canskip="true"]



*story_11|十一場　近江・山中

;[image storage="heiti" layer="base" page=fore]
;効果音再生
;音楽開始
[image storage="fgimage/37/_IS17638.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/不安.ogg" loop="true"]
[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
十一場　近江・山中[resetfont][l][r]

[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
疲れ切った様子で戯れ歌を口ずさみ歩いて来て、座る雪乃。[l][r]
やがて、布切れ一つ隔てた小屋に向かい、言葉をかける。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/19/1.ogg" ]
　　 雪乃　　　[indent]
十郎…。大丈夫か？知ってるか。信長様が、美又の村を皆殺しにするっ
てお触れ出してよ。村…、無くなっちまった。みよももう、どこにいる
のか…。…でも、おらまだ、どうしても、みよに…、[endindent][l][r]
[ws buf=0 canskip="true"]

[r]

[image storage="fgimage/37/_IS24317.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
すると、雪乃の背後から高笑いする声が聞こえる。[l][r]
現れたのは十郎。まだ傷が癒えず体を傾げ、咳込みながら歩み来る。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/19/2.ogg" ]
　　 十郎　　　[indent]
そうだったかァ…。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/19/3.ogg" ]
　　 雪乃　　　[indent]
…なんのことだ、[endindent][l][r]
[ws buf=0 canskip="true"]

[image storage="fgimage/37/kai_IS24317jpg.jpg" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/19/4.ogg" ]
　　 十郎　　　[indent]
（笑いがこみ上げ）たった今、安土の兵をとっ捕まえて吐かせたら、言
うじゃねェか。信長打倒の秘術の正体は…、影武者だと。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/19/5.ogg" ]
　　 雪乃　　　[indent]
影武者…？[endindent][l][r]
[ws buf=0 canskip="true"]


;セリフ再生
[playse buf="0" storage="sound/voice/19/6.ogg" ]
　　 十郎　　　[indent]
信長と共に生き、その性情から巡らす戦略まで瓜二つの影武者。成程…、
確かに秘術と言えぬこともない。だが…、（高笑い）、[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/19/8.ogg" ]
　　 雪乃　　　[indent]
…なんだ、[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/19/9.ogg" ]
　　 十郎　　　[indent]
おまえがよく歌ってる戯れ歌、歌ってみろ。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/19/10.ogg" ]
　　 雪乃　　　[indent]
ひとよ、ふたよの大鯰、美又またいだ叢山に、石の小井戸に影法師…、[l][r]
…まさか、[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/19/11.ogg" ]
　　 十郎　　　[indent]
そのまさかよ。確かに親父は、お前に秘術の在り処を託していた。お前
が持ち、国中の輩が血眼になって捜す秘術は…、俺だ。（笑う）[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/19/12.ogg" ]
　　 雪乃　　　[indent]
（その事実に愕然として）おめェ…、[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/19/13.ogg" ]
　　 十郎　　　[indent]
俺も阿呆よ。こけつまろびつして探し回った相手が、己のこととは。
まァ、お前の親父も一つ、思い違いをしていたようだがな…。[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
　　　　　　　　　　　[indent]
雪乃、あまりの事実に声も出ない。[endindent][l][r]

[r]

　　 十郎　　　[indent]
どうした。お前が飛んで喜びそうな知らせを前に、気でも違えるか？[endindent][l][r]

　　 雪乃　　　[indent]
…。[endindent][l][r]

　　 十郎　　　[indent]
安土の奴は、美又の井戸という井戸を潰せと命じたそうだ。分かるか…、
奴は知ってるのよ、その、戯れ歌を。[endindent][l][r]

　　 雪乃　　　[indent]
（気付き）はっ…、[endindent][l][r]

　　 十郎　　　[indent]
お前の妹は、安土にいる。が…、まだこの世にいるかどうかは…、[endindent][l][r]

　　 雪乃　　　[indent]
…みよ、[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
雪乃、必死で身を起こし歩き出そうとする。[endindent][l][r]
[r]

　　 十郎　　　[indent]
どうした、[endindent][l][r]

　　 雪乃　　　[indent]
…安土に、[endindent][l][r]


　　 十郎　　　[indent]
バカか。当てもなく行って見つかるものか。[endindent][l][r]
[ws buf=1 canskip="true"]


[r]
　　　　　　　　　　　[indent]
十郎、そう言って物陰から一人の瀕死の男を連れてくる。[l][r]
小太郎である。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/20/1.ogg" ]

　　 十郎　　　[indent]
安土の兵だ。拷問して居場所を吐かせろ。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/20/2.ogg" ]
　　 雪乃　　　[indent]
えっ…、拷問、[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/20/3.ogg" ]
　　 十郎　　　[indent]
安心しろ。もう女子供に抗う力も残ってない。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 雪乃　　　[indent]
…。[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/20/4.ogg" ]
　　 十郎　　　[indent]
（雪乃に）どうした、やるんだよ、こうして。[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
　　　　　　　　　　　[indent]
十郎、小太郎を痛めつける。[endindent][l][r]
[r]

[image storage="fgimage/37/_IS17646.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/20/5.ogg" ]
　　 十郎　　　[indent]
（小太郎に）どうした。気を失ってもやめんぞ。吐くまでな。…俺も、
お前に聞かないとな…。奴はどうしてる。え？…俺は、奴を討って、…
この世界を、手に、入れなきゃならんのだ。奴を、殺して、新しい世界
を…、俺は…、クソッ、俺は…、ええ、畜生っ！（蹴り飛ばす）[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/20/6.ogg" ]
　　 雪乃　　　[indent]
（十郎の様子を訝しがり）…十郎、[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/20/7.ogg" ]
　　 十郎　　　[indent]
早くやらないと殺しちまうぞ。俺は…、俺は、世界を、クソッ！[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/20/8.ogg" ]
　　 雪乃　　　[indent]
やめれ、[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
[image storage="fgimage/37/_IS17006.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　　　　　　　　　　[indent]
雪乃、意を決し、小太郎に歩み寄る。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/20/9.ogg" ]
　　 十郎　　　[indent]
そうだ。…こいつらがお前と妹を引き離した。お前の敵だ。
…妹は間もなくどこかで殺されようとしているかもしれん。これを逃せば二度は無
いぞ。いいぞやれ…、手に入れたいものは…、力づくで！[endindent][l][r]
[ws buf=0 canskip="true"]

[r]


　　　　　　　　　　　[indent]
雪乃、小太郎の指を取る。指を反り返そうと握った手に力がこもる。[l][r]
抵抗しようにも既に力なく、目を剥き喘ぐ小太郎。[l][r]
雪乃が、小太郎の指をへし折ろうと勢いをつけた刹那、声を上げて小太郎から飛び退く。[endindent][l][r]
[r]


;セリフ再生
[playse buf="0" storage="sound/voice/20/10.ogg" ]
　　 十郎　　　[indent]
…何してる、[endindent][l][r]
[ws buf=0 canskip="true"]

;音楽停止
[fadeoutbgm time=3000]
;音楽開始
[playbgm storage="bgm/ogg/平原.ogg" loop="true"]


;セリフ再生
[playse buf="0" storage="sound/voice/20/11.ogg" ]
　　 雪乃　　　[indent]
駄目だ…、ダメだ出来ねェ…、出来ねェよ！このお侍の鎧紐見たか？
ちっちゃい結わえの飾り紐さがってんだ。もしかしたらこれはよ、
故郷（さと）のかかあやら子供たちがよ、おとうぜってェに怪我すんでねェぞ、
必ず無事で家さ帰ってくんだぞってお祈りして結わえたのかもしんねェ、[endindent][l][r]
[ws buf=0 canskip="true"]


;セリフ再生
[playse buf="0" storage="sound/voice/20/12.ogg" ]
　　 十郎　　　[indent]
あ…？[endindent][l][r]
[ws buf=0 canskip="true"]

[p]
[cm]

;セリフ再生
[playse buf="0" storage="sound/voice/20/13.ogg" ]
[image storage="fgimage/37/_IS17652.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 雪乃　　　[indent]
（まくしたて）かかあも子供らもおんなじ紐結わえててよ、つらいこと
やら悲しいことやらあったりするとそれ眺めて、おとうもつらい戦場で
頑張ってんだから負けちゃいけねェって、踏ん張ってんのかもしんねェ。こいつは…、こいつは、もしかしたらずっと、こんなことやりたくねェなァと思いながら、必死で自分の気持ちに嘘ついてよ、いつかかかあと
子供らの所に胸張って戻るまでだって一生懸命今まで頑張って来たのか
もしんねェ。もしかしたらやっと明日、その仕事終えてやっと、…やっ
と大好きな故郷（さと）に帰れるって思ってたところかもしんねェ。な
のにこんなとこで捕まっちゃって、かかあごめんよ、子供らごめんよっ
て、心で泣いてんのかもしんねェ。おら…、出来ねェよ…。おらがみよ
に会いてェって思う気持ちよりももっともっと、こいつは、かかあや子
供らに会いてェって、思ってるかもしんねェじゃねェかよ…。[endindent][l][r]
[ws buf=0 canskip="true"]

[r]


　　　　　　　　　　　[indent]
呆れ果てるように、言葉も出ない十郎。[l][r]
雪乃、小太郎の縄を解き、押し出す。[endindent][l][r]
[r]


;セリフ再生
[playse buf="0" storage="sound/voice/20/14.ogg" ]
　　 雪乃　　　[indent]
いけ…、いげ！[endindent][l][r]
[ws buf=0 canskip="true"]

[r]


[image storage="fgimage/37/_IS17661.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
咄嗟に立ちあがる十郎の前に、雪乃、立ち塞がる。[endindent][l][r]
[r]


;セリフ再生
[playse buf="0" storage="sound/voice/20/15.ogg" ]
　　 十郎　　　[indent]
…何をしてる…、[endindent][l][r]
[ws buf=0 canskip="true"]


;セリフ再生
[playse buf="0" storage="sound/voice/20/16.ogg" ]
　　 雪乃　　　[indent]
…駄目だ…。おら駄目だ…。こんなことじゃ、みよに会うなんてできっ
こねェ…、もっと、強くなきゃ、ぜってェ会うなんて出来ねェのによ…。[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
　　　　　　　　　　　[indent]
雪乃、言うなり顔を覆って地にへたり込む。[endindent][l][r]
[r]


;セリフ再生
[playse buf="0" storage="sound/voice/20/17.ogg" ]
　　 十郎　　　[indent]
（唖然と）…バカか、お前は…。[endindent][l][r]
[ws buf=0 canskip="true"]

[r]



　　　　　　　　　　　[indent]
十郎、気配に気づき身構える。[l][r]
物陰から、右近、現れる。[endindent][l][r]
[r]

　　 十郎　　　[indent]
お前…、[endindent][l][r]

　　 右近　　　[indent]
（雪乃に歩み寄り）人は他人の心の内など、彼岸のように遠いもの。
けれどそなたは、その彼岸を、我が身のように思うのだな。その瞳の向こ
うで、「彼」岸と、その「身」が、一つに。[endindent][l][r]

　　 雪乃　　　[indent]
…。[endindent][l][r]

　　 右近　　　[indent]
そなたが、雪乃が何とかして助けたいと言っていた野武士か。[endindent][l][r]

　　 十郎　　　[indent]
あ…？俺はこいつなぞに、[endindent][l][r]

　　 右近　　　[indent]
そなたが気を失った間、幾度も高槻とこの近江を行き来し介抱したのだ。
雪乃がいなければ今頃、[endindent][l][r]

　　 十郎　　　[indent]
フン、…くたばったらくたばったよ。[endindent][l][r]

　　 右近　　　[indent]
…。[endindent][l][r]

　　 十郎　　　[indent]
どうしてこうも弱い者ほど他人の哀れに寄り添いたがる。俺は生まれて
この方、誰の情けも救いも施しも求めなかった。だからこそ己を生きた。
だからこそあらゆるものを打ち砕き切り拓いてゆく強い魂を手に入れた、[endindent][l][r]

　　 右近　　　[indent]
だが、そう言うそなたの目は、どこで失くしたか既に魂が抜けているな。[endindent][l][r]

　　 十郎　　　[indent]
…。[endindent][l][r]

[r]


　　　　　　　　　　　[indent]
茂みから物音がする。[endindent][l][r]
[r]

　　 右近　　　[indent]
怖じることはない。来なさい。[endindent][l][r]
[r]

[image storage="fgimage/38/_IS17666.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
すると、茂みから　藤五郎、茂吉、玉、松江、とらが現れる。[endindent][l][r]
[r]

　　 茂吉　　　[indent]
雪乃…、おめェがこのお殿様に言って、皆殺しんなるとこだったおらた
ちのこと、助けてくれたんだな。[endindent][l][r]

　　 雪乃　　　[indent]
…。[endindent][l][r]

　　　　玉　　　[indent]
おら…、おめェを村から追い出すようなマネして…、[endindent][l][r]

[image storage="fgimage/38/_IS17667.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
（いいや、と首を振る）[endindent][l][r]

　　　　玉　　　[indent]
雪乃、おらも一緒に安土に連れてってくれ。おらも一緒に、みよ探す。[endindent][l][r]

　　 茂吉　　　[indent]
おらも、[endindent][l][r]

　　 松江　　　[indent]
おらもだぞ。[endindent][l][r]

     とら 　　 [indent]
（藤五郎に）おい、何とか言いなよ。[endindent][l][r]

　藤五郎　　　[indent]
え？バカおめェ、俺は、[endindent][l][r]

     とら 　　 [indent]
（無言で藤五郎を蹴る）[endindent][l][r]

　藤五郎　　　[indent]
あたっ、行くって、行きますっての！[endindent][l][r]

　　　　玉　　　[indent]
…雪乃、[endindent][l][r]

　　 雪乃　　　[indent]
（振り絞るように）…駄目だ。おらもう、一歩も動けね。[endindent][l][r]


[r]

　　　　　　　　　　　[indent]
雪乃、俯き言葉を失くす。黙りこむ村人たち。[l][r]
松江、何を思ったか突然歌い出す。それは、村祭りの踊りの唄。[l][r]
;音声スタート
[playse buf="0" storage="sound/song/39-2村祭り.ogg" ]

村人たち、雪乃を囲むように皆で歌い、踊る。…顔を上げる雪乃。[endindent][l][r]
[endindent][l][r]

[image storage="fgimage/39/_IS17034.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 右近　　　[indent]
私はここから先には行けない。…安土までの道中、お前が共に、[endindent][l][r]

　　 十郎　　　[indent]
たわけたことを。俺は己の思惑のために行くまでよ。もはやこんな奴に
かかずらわる理由はない。[endindent][l][r]

　　 右近　　　[indent]
…そなたもいずれ分かる。…そなたや…、私のように、魂の在り処を見
失い、さ迷う輩には、雪乃のような者が必要だと。[endindent][l][r]

　　 十郎　　　[indent]
…。[endindent][l][r]

　　　　　　　　　　　[indent]
歌い、踊る村人たち。[endindent][l][r]
[r]

　　　　玉　　　[indent]
雪乃…、また雪乃も、みよも一緒んなって、村の祭りやるんだよ。
もう一度あの村で、おらたちの、祭りをよ。[endindent][l][r]
[r]

[image storage="fgimage/39/_IS17674.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
やがて雪乃、村人たちに合わせ、踊り出す。[l][r]
十郎が、そんな雪乃の様子を見ている。[l][r]
村人と雪乃が歌い、踊る。情景はそのまま、安土城下へ。[endindent][l][r]
[ws buf=0 canskip="true"]

[p][cm]

;音楽停止
[fadeoutbgm time=3000]




*story_12|十二場　近江・安土城下
[image storage="fgimage/40/_IS17677.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音楽開始
[bgmopt volume="50"] 
[playbgm storage="sound/effect/P51ガヤ.ogg" loop="true"]

;[image storage="jouka" layer="base" page=fore]
[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
十二場　近江・安土城下[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
　　　　　　　　　　　[indent]
人で賑わう安土の町。[l][r]
行き来する人々の喧噪に目を見張る村人たち。[l][r]
雪乃も辺りを見渡す。彼らから離れて、十郎の姿。[endindent][l][r]
[r]

　　パウロ　　　 [indent]

右近殿より言伝て頂いております。皆さんを、我れらが安土セミナリヨ
にお連れします。[endindent][l][r]

　藤五郎　　　[indent]
なんて騒ぎだこりゃよ、なんかの祭りか？[endindent][l][r]

　　パウロ　　　 [indent]
いえ、これが安土の街です。信長公が周辺の関を減らし、自由に人が行
き来出来るようにしたのです。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
村人たち
（辺りを見渡し、感嘆して声を漏らす）[endindent][l][r]
[r]

　 パウロ　　　[indent]

ただ、それゆえ邪な企てを持つ者達も、この城下に潜むようになりました。
他国の忍や侍、それに…、[endindent][l][r]

村人たち・雪乃　[indent]
…？[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
突如、彼方から炸裂音が立て続けに響く。[endindent][l][r]
[r]

[stopbgm]
;効果音再生
[playse buf="1" storage="sound/effect/P44爆発Long.ogg" ]

[image storage="fgimage/40/_IS17678.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
何だ今のは、[endindent][l][r]

　　 茂吉　　　[indent]
（音のする方向を示し）見ろ、[endindent][l][r]

　　パウロ　　　 [indent]
奴らです…。信長公の軍を狙い、襲撃を繰り返す…、[endindent][l][r]

　藤五郎　　　[indent]
ありゃ、伴天連か？[endindent][l][r]

　　パウロ　　　 [indent]
（苦悶の表情で）…神の御教えを、どこでどう取り違えたか、[endindent][l][r]

　　 十郎　　　[indent]
…統率のとれた集回だ。…悪くない。（駆け出す）[endindent][l][r]

　　 雪乃　　　[indent]
（彼方の集回を見て）…あれ…、[endindent][l][r]

　　パウロ　　　 [indent]
急ぎましょう、パードレが信長公との謁見に向かうまで間がありません。
この期を逃せば、いつ御眼通りが叶うか、[endindent][l][r]

[ws buf=1 canskip="true"]

[image storage="fgimage/40/_IS17043.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
（気付いて）源八、[endindent][l][r]

　　　　玉　　　[indent]
源八ってあの、世捨て人の源八か？[endindent][l][r]

　藤五郎　　　[indent]
まさかァ、[endindent][l][r]

　　 雪乃　　　[indent]
パウロ様、おら…、（躊躇い）駄目だ、源八…、源八！[endindent][l][r]

　藤五郎　　　[indent]
おい、雪乃！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
雪乃、駆け出して行く。[endindent][l][r]
[r]

[image storage="fgimage/41/_IS17685.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音楽開始
[playbgm storage="bgm/ogg/戦闘2.ogg" loop="true"]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
長秀、兵に周囲を守らせ、ほうほうの体で現れる。[endindent][l][r]
[r]

　　 長秀　　　[indent]
何なんだよあいつらは！おい、行ってこい。お前らも行って、あのイカ
れた反乱分子どもをブッ潰してこい！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
長秀、怯えて声を上げて逃げてゆく。[l][r]
×   ×   ×[endindent][l][r]
[r]

;[image storage="02" layer="base" page=fore]

[image storage="fgimage/41/_IS17693.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
　　　　　　　　　　　[indent]
ミゲル、ヨハンナと共に身を潜める源八。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/23/1.ogg" ]
　　 源八　　　[indent]
…何で俺は、ずっと逃げちまってたんだ。あいつのことをほんとに大事
に思ってたらよ…、もっと早くに、俺のやるべきことはちゃあんと分か
ってたはずなのによ。弥七…。この源八の弱虫野郎が。…だがもう俺に
は見えてる。お前に向かって真っ直ぐに続く正しい道が。俺はもう脇目
も振らねぇ。弥七…、お前への、愛のために。[endindent][l][r]
[ws buf=0 canskip="true"]

　 ミゲル　　　[indent]
行くぞ！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
キリシタンたち、一斉に散っていく。[endindent][l][r]
[r]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
同じ頃。高槻城の右近。苦悶の表情で聖書を握る。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/24/1.ogg" ]
　　 右近　　　[indent]
愛は不正を喜ばず、真理を喜ぶなり。
全てを忍従し、全てを信じ、全てを頼もしく存じ奉り、全て
を堪え忍ぶなり。愛は永久（とわ）に絶えることなし。預言の賜物たれ
ば廃る。異言たれば止む。知も廃るなり。…
因って是即ち、永久（とわ）に残りし物は信仰と望みと愛なり。
その内にありて最も優れたるものは、愛なり。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

[image storage="fgimage/41/_IS17693.JPG" layer="1" page="fore" visible="true"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
聖句に重なり、キリシタンたち、兵たちに捨て身の襲撃をかける。[l][r]
集回で兵を取り囲み、手にした刃物で滅多刺しにする。[l][r]
兵たちの中に飛び込むキリシタン。外套を開くと、体に巻きつけた
火薬玉の群れが露わに。一瞬の爆音と共に、兵もろとも自爆する。[l][r]
源八、駆けて来て、包みに入った薬袋を刀の先で刺し、兵たち目が
けて放る。大量の煙に巻かれた兵士たちが、次々と喘ぎながら地に
倒れ伏していく。[endindent][l][r]
[r]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
[r]
怯える長秀の元に、一益。[endindent][l][r]
[r]

　　 一益　　　[indent]
何を縮み上がってんだ。[endindent][l][r]

　　 長秀　　　[indent]
…滝川殿、[endindent][l][r]

　　 一益　　　[indent]
あの伴天連どもには借りがあるんでな。皆殺しにさせてもらうわ。
…弥七を呼べ！[endindent][l][r]

[r]

[image storage="fgimage/41/_IS17698.JPG" layer="1" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
　　　　　　　　　　　[indent]
×   ×   ×[r]
[r]
戻って来る源八。ミゲル、ヨハンナ。キリシタンたち。[l][r]
抵抗して立ち上がる兵たちを、次々と絶命させてゆく。[l][r]

;効果音再生
[playse buf="1" storage="sound/effect/SE銃撃.ogg" ]
そこへ、立てつづけに銃声。撃たれ倒れるキリシタンたち。[endindent][l][r]
[r]

　 ミゲル　　　[indent]
鉄砲隊…、いつの間に、[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
さらに銃声。ミゲル、ヨハンナ、地に伏す。[l][r]
反撃に出る兵たちを、源八、全滅させる。[l][r]
×   ×   ×[endindent][l][r]
[r]
[ws buf=1 canskip="true"]
　　 一益　　　[indent]
一人残ってる。弾を込めろ。弥七…、決して外すな。[endindent][l][r]
[r]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
倒れる死体の中に立つ源八の元に、十郎、雪乃、駆けて来る。[endindent][l][r]
[r]

　　 十郎　　　[indent]
畜生、全滅か。[endindent][l][r]

　　 源八　　　[indent]
（虚ろな目で立つ）…。[endindent][l][r]

　　 雪乃　　　[indent]
源八…、[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/25/1.ogg" ]
[image storage="fgimage/41/_IS17694.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



　　 源八　　　[indent]
雪乃か…。俺は、分からなくなっちまった…。ただ弥七を思って、滝の
ように血を浴びてきた。けどよ…、さっき、血ィ吹いて倒れてる足軽を
見たら、俺と同じ、田んぼ仕事で荒れた固い手ェしてやがった…。なん
だよ…。奴ら、おんなじ百姓じゃねェかよ…。[endindent][l][r]
[ws buf=0 canskip="true"]

[r]



　　　　　　　　　　　[indent]
×   ×   ×[endindent][l][r]
[r]
　　 弥七　　　[indent]
甲、…七寸五厘三毛、首上げ。北に、…二寸二厘七毛八絲。
;効果音開始
[playse buf="1" storage="sound/effect/SE銃構え.ogg" ]
[endindent][l][r]
[ws buf=1 canskip="true"]


[image storage="fgimage/41/_IS17698.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[r]
　　　　　　　　　　　[indent]×   ×   ×[endindent][l][r]
[r]

　　 源八　　　[indent]
どこにいんだろな…、弥七は…、[endindent][l][r]
[r]

　　　　　　　　　　　[indent]
×   ×   ×[endindent][l][r]
[r]

　　 一益　　　[indent]
済んだか。[endindent][l][r]

　　 弥七　　　[indent]
…はい。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
×   ×   ×[l][r]
源八、朦朧としながら辺りを見渡し、天高く叫ぶ。[endindent][l][r]
[r]


;セリフ再生
[playse buf="0" storage="sound/voice/25/2.ogg" ]
　　 源八　　　[indent]
…弥七――っ！[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
　　　　　　　　　　　[indent]
×   ×   ×[endindent][l][r]
[r]

　　 弥七　　　[indent]
（はたと何かに衝き動かされ）待て！[endindent][l][r]

　　 一益　　　[indent]
撃て！[endindent][l][r]

[r]

;効果音再生
[playse buf="1" storage="sound/effect/SE銃.ogg" ]

[image storage="fgimage/41/_IS17702.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



　　　　　　　　　　　[indent]
ドンッ！銃声が響く。[l][r]
×   ×   ×[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

　　　　　　　　　　　[indent]
空（くう）を切り裂く音と共に、源八の胸を鉛玉が貫通する。[l][r]
どうと地に倒れ伏す源八。雪乃、ただ目を見開き言葉もなく震える。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
源八…、源八！[endindent][l][r]

[r]

;[image storage="jouka" layer="base" page=fore]
　　　　　　　　　　　[indent]
×   ×   ×[l][r]
[r]
長秀、去る。一益、去りかけて放心する弥七を見やる、[endindent][l][r]
[r]

　　 一益　　　[indent]
何かあったか。[endindent][l][r]

　　 弥七　　　[indent]
いえ…。気のせいです。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
弥七、そう言ってその場を後にする。[l][r]
×   ×   ×[endindent][l][r]
[r]

;音楽停止
[fadeoutbgm time=3000]

;音楽開始
[playbgm storage="bgm/ogg/悲しみ.ogg" loop="true"]

[image storage="fgimage/42/_IS17061.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
こと切れた源八に駆け寄り、顔をうずめる雪乃。[l][r]
十郎、辺りを見回しながら、倒れる源八のもとへ歩み寄る。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/26/1.ogg" ]
　　 十郎　　　[indent]
…全くくだらん無駄死によ。あれだけ会いたいと騒いでおいて、自分が
死んでは何の意味もない。…フン、バカな奴だ。[endindent][l][r]
[ws buf=0 canskip="true"]

[r]

[image storage="fgimage/42/_IS17704.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
すると、雪乃が突然弾かれたように十郎に掴みかかる。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/26/2.ogg" ]
[image storage="fgimage/42/_IS17705.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
おめェ…、おめェはどうしてそんなことが言えるんだ！おめェ今まで源
八が、どんだけ苦しい思いしてたか分かるか！[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/26/3.ogg" ]
　　 十郎　　　[indent]
あ？[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/26/4.ogg" ]
　　 雪乃　　　[indent]
…おめェは一度だって、誰かのこと想像してうんうん考えて、胸が痛く
てたまんなくなったことがあるか！[endindent][l][r]
[ws buf=0 canskip="true"]

　　 十郎　　　[indent]
…。[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/26/5.ogg" ]
　　 雪乃　　　[indent]
おめェの心は、あの古井戸の苔の生えた石より固い。おめェの心は彼岸
より遠い。…十郎おめェは、おめェは…、孤独な王様だ。[endindent][l][r]
[ws buf=0 canskip="true"]

[r]



　　　　　　　　　　　[indent]
何故だか返す言葉の出ない十郎。[l][r]
そこへ、パウロが駆けて来る。[endindent][l][r]
[r]

　　パウロ　　　 [indent]
雪乃殿…、落ち着いて聞いて下さい。[endindent][l][r]

　　 雪乃　　　[indent]
…なんだ、[endindent][l][r]

[image storage="fgimage/42/_IS17067.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
　　パウロ　　　 [indent]
つい先程、信長公が城下にお触れを出しました。（書状を見せ）「美又村
の娘を、今宵亥の三つ刻、城内にて処刑する。覚えあるものは城まで馳せ参ずべし。然れば娘の身は解く。」[endindent][l][r]

　　 雪乃　　　[indent]
…みよだ、[endindent][l][r]

　　パウロ　　　 [indent]
知らぬ者には何のことか分からぬお触れ。恐らく信長公は、姉である貴
女の存在を知り、その所在を粗方知った上で、貴女に向けてこのお触れ
を…。今は戌一つ刻、刻限までまだ一刻半、今ならなんとか、[endindent][l][r]

　　 雪乃　　　[indent]
みよ！[endindent][l][r]

[r]

[image storage="fgimage/42/_IS17070.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
気力を絞り、歩き出す雪乃。そこへ、藤五郎。[endindent][l][r]
[r]

　藤五郎　　　[indent]
雪乃、[endindent][l][r]

　　 雪乃　　　[indent]
（その様子に）…藤五郎、[endindent][l][r]

　藤五郎　　　[indent]
…こんなことなら、ここ来るまで生き倒れちまえばよかった…。[endindent][l][r]

　　 雪乃　　　[indent]
どした、何があった、[endindent][l][r]

　藤五郎　　　[indent]
玉やら茂吉やらみんな、誰だかって言うお侍に捕まってよ。そいつが俺
に、お前んとこ行って伝えろって、…でも、[endindent][l][r]

　　 雪乃　　　[indent]
言ってくれ、[endindent][l][r]

　藤五郎　　　[indent]
村の者たちは、お前の身と引き換えだと。刻限までに豊郷の関所まで来
なけりゃ、あいつら、皆殺しだって。[endindent][l][r]

　　 雪乃　　　[indent]
…刻限は、[endindent][l][r]

　藤五郎　　　[indent]
今宵、亥の三つ刻。[endindent][l][r]

　　 雪乃　　　[indent]
…。[endindent][l][r]

　　パウロ　　　 [indent]
そんな、今からでは、どちらか一方に行くのがやっと、[endindent][l][r]

　藤五郎　　　[indent]
ああそうだ。あいつは恐らく信長様のお触れを知ってて刻限を切った。[endindent][l][r]

　　パウロ　　　 [indent]
妹か…、村人か…、どちらかを、選べと…！[endindent][l][r]

　藤五郎　　　[indent]
…雪乃、…どうする。[endindent][l][r]

[r]

[image storage="fgimage/42/_IS17713.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
雪乃、深い苦悩の淵で、空を見つめる。[l][r]
十郎は、そんな雪乃の姿を見つめている。[l][r]
暗転。[endindent][l][r]

;フェードアウト
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[image storage="fgimage/42/_IS17713.JPG"" layer="2" page="fore" visible="false" top="50"]
[image storage="fgimage/8/black681.jpg" layer="1" page="back" visible="false" top="50"]
[wait time=2000]
;音楽停止
[fadeoutbgm time=3000]

[trans layer="1" time=3000 method=crossfade]
[wt]

[p][cm]



*story_13|十三場 安土近郊 豊郷 関所
[image storage="fgimage/43/_IS24345.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;音楽停止
[fadeoutbgm time=3000]


[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="notogawa" layer="base" page=fore]
[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
十三場 安土近郊 豊郷 関所[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
兵に囲まれ、うずくまる村人たち。[endindent][l][r]
[r]

     とら 　　 [indent]
（うずくまり震える玉に）玉…、怖ェか。[endindent][l][r]

　　　　玉　　　[indent]
ああ。…死ぬのは、怖ェ。でも…、万に一つ、雪乃がここに来ちまったりしたら…、[endindent][l][r]

　　 茂吉　　　[indent]
来やしねェよ。いや、来ちゃいけねんだ。[endindent][l][r]

　　 松江　　　[indent]
おらたち…、死ぬのか？[endindent][l][r]

     とら 　　 [indent]
雪乃に生かされた命だ。ここでなくなっても、文句は無いだろ。[endindent][l][r]

[r]



　　　　　　　　　　　[indent]
茂みが揺れる。
;効果音開始
[playse buf="1" storage="sound/effect/SE草かき3.ogg" ]
人影が現れ、どうと倒れる。息を飲む村人たち。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

[image storage="fgimage/43/_IS17724.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　玉　　　[indent]
…雪乃…、[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
続けて藤五郎が駆け込み、喘いで倒れる。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
（必死で体を起こし）おら、来ただよ。…そいつらの身ィ、解いてやってくれ。[endindent][l][r]

　　 兵９　　　[indent]
大将殿！…娘が！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
奥から、官兵衛、姿を現す。[endindent][l][r]
[r]

　 兵１０　　　[indent]
妹はどうした…、[endindent][l][r]

　　 兵９　　　[indent]
…何と言う奴だ…。[endindent][l][r]

　　 雪乃　　　[indent]
…お侍様…、あんたは…、いつかの…。さァ、おら連れてってくれ。約
束だ。こいつら、逃がしてやってくれ。[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
官兵衛、しばらく黙した後、[endindent][l][r]
[r]

　官兵衛　　　[indent]
…捕えろ。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
兵たち、村人たちを解放し、雪乃を立たせる。[l][r]
言葉もなく立ち尽くす村人たち。[endindent][l][r]
[r]

　　　　玉　　　[indent]
…雪乃…。[endindent][l][r]
[r]


　　　　　　　　　　　[indent]
雪乃、村人をそっと見やると、兵に連れられてゆく。[l][r]
その時、パウロが駆け込んでくる。[endindent][l][r]
[r]

[image storage="fgimage/43/_IS17729.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

 パウロ　　　[indent]
お待ち下さい！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
パウロの言葉に続き、右近が姿を現す。[endindent][l][r]
[r]

　官兵衛　　　[indent]
右近殿…何故（なにゆえ）貴方が、[endindent][l][r]

　　 右近　　　[indent]
黒田殿…、よろしいのですかな、そのようなことを。[endindent][l][r]

　官兵衛　　　[indent]
…。[endindent][l][r]

　　 右近　　　[indent]
貴方のこの所業、信長公は御存知の上でのことか？[endindent][l][r]

　官兵衛　　　[indent]
…貴方の知ったことでは、[endindent][l][r]

　　 右近　　　[indent]
我が高槻の城で、一人の忍を捕えました。主を聞けば、黒田殿、あなた
だと。私は彼から、貴方の思惑を聞き知りました。[endindent][l][r]

　官兵衛　　　[indent]
神に仕えし貴方が忍に拷問か、[endindent][l][r]

　　 右近　　　[indent]
いえ。三日三晩、彼と語り合い、彼から話してくれたのです。[endindent][l][r]

　官兵衛　　　[indent]
…。[endindent][l][r]



　　 右近　　　[indent]
貴方は秀吉公の命を受け、信長公打倒の秘術を知るその娘を手に入れん
としていた。黒田殿…、よろしいのですか、この事実、安土の信長公に
伝われば、[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/27/1.ogg" ]

[image storage="fgimage/43/_IS24476.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　官兵衛　　　[indent]
右近殿、貴方こそそもそも罪人だったこの娘を匿った。これは信長公の
命に背く大罪だ。罪人隠しの暴挙こそ、信長公のお耳に入れれば、[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/27/2.ogg" ]
　　 右近　　　[indent]
貴方はもはや、信長公打倒の秘術など、どうでもよかったのではないか？[endindent][l][r]
[ws buf=0 canskip="true"]

　官兵衛　　　[indent]
…。[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/27/3.ogg" ]
　　 右近　　　[indent]
貴方の胸の真の思惑はもはや果たされた。違いますか。…その娘、連れ
て行ってどうします。貴方はもう今ここで、見るべきものの全てを見た。[endindent][l][r]
[ws buf=0 canskip="true"]

　官兵衛　　　[indent]
（躊躇いの沈黙の後）…何を言っているのやら、[endindent][l][r]


　　 右近　　　[indent]
時に黒田殿、そもそも貴方は、今秀吉公と共に、高松攻めに従（したご）
うていなければならぬはず。なぜこのような所に、[endindent][l][r]

　官兵衛　　　[indent]
右近殿、それは貴方も同じこと。[endindent][l][r]

　　 右近　　　[indent]
…いかがでしょう。私と貴方は、今ここにはいなかった。共に織田方の
敵たる毛利軍を討つべく、高松に馳せ参じていた。…そういうことでは。[endindent][l][r]

　官兵衛　　　[indent]
…共に。[endindent][l][r]

　　 右近　　　[indent]
…共に。[endindent][l][r]
[r]

[image storage="fgimage/43/_IS24478.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
官兵衛、兵に指図し、雪乃の身を解く。[l][r]
村人たち、雪乃の名を呼び駆け寄る。[l][r]
すると雪乃、動けぬ体を引きずり、立ち上がろうとする。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
…いがなきゃ…、[endindent][l][r]


　　　　玉　　　[indent]
えっ…、[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
雪乃、這いつくばり、僅かな気力を振り絞り、立ち上がろうとする。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
まだ…、まだ亥の三つ刻まで、半刻ある…。[endindent][l][r]

　　 茂吉　　　[indent]
おめェ…、まさか…、[endindent][l][r]

　藤五郎　　　[indent]
無理だ、そんな体で、安土まではここから一刻はかかる。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
雪乃、みよの名を呼び身を起こしては倒れ、起きては倒れる。[l][r]
その場にいる誰もが、その姿に言葉を失う。[l][r]
すると、玉、何を思ったか右近と官兵衛に向かい駆け出し、額ずく。[endindent][l][r]
[r]

　　　　玉　　　[indent]
お願いです！…馬を、あの子に、馬を貸してやって下せェ！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
玉を見て、村人たちが続く。[endindent][l][r]
[r]

     とら 　　 [indent]
お願いです、どうか！[endindent][l][r]

　　　　玉　　　[indent]
おらたちはどうしてくれてもいいから、どうか、あの子に、馬を！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
揃って土下座し額ずく村人たち。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/28/1.ogg" ]
　官兵衛　　　[indent]
…しかし、貸したところで、百姓に戦馬は乗りこなせまい。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]



　　　　　　　　　　　[indent]
言葉を継げなくなる村人たち。[l][r]
すると雪乃、何を思ったか辺りに向かい声を張り上げる。[endindent][l][r]
[r]

*story_14|十四場　安土城
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]


;音声スタート
[playse buf="0" storage="sound/voice/28/2.ogg" ]
[image storage="fgimage/43/_IS17735.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 雪乃　　　[indent]
十郎…、忘れてねェよな。古井戸から助け出したら一刻はおらの指図に
従う。まだ約束の時間は、半刻残ってる。…十郎！[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

　　　　　　　　　　　[indent]
;効果音開始
[playse buf="1" storage="sound/effect/P24風.ogg" ]
風が吹きすさぶ。
沈黙が流れる…。[l][r]
すると物陰から十郎が姿を現す。目を見張る人々。[endindent][l][r]
[r]

;[bgmopt volume="80"] 
[bgmopt volume="50"] 

[fadeoutse buf=1 time="3500"]
[playbgm storage="bgm/ヒトミテーマ.ogg" loop="true"]

;音声スタート
[playse buf="0" storage="sound/voice/29/1.ogg" ]

[image storage="fgimage/43/_IS17738.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
俺が言い出したからには、…仕方ない。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]


　　　　　　　　　　　[indent]
そして雪乃の元に跪き、応える。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/29/2.ogg" ]
　　 十郎　　　[indent]
今から半刻、あんたが…、俺の主だ。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

;効果音再生
[playse buf="1" storage="sound/effect/P51馬.ogg" ]

[image storage="fgimage/45/_IS17109.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
十郎、雪乃の手を引き、馬に乗り疾風のように駆け出す。[endindent][l][r]
[p][cm]
[ws buf=1 canskip="true"]


[image storage="fgimage/45/_IS17741.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="14" layer="base" page=fore]
[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
十四場　安土城[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
　　　　　　　　　　　[indent]
安土城。天守――。[endindent][l][r]
[r]


　 兵１１　　　[indent]
申し上げます。女を乗せた騎馬が一騎、関を破りこの安土に！[endindent][l][r]

　　 信長　　　[indent]
…来たか。者共、その娘、城門に現れ次第、即刻捕え、我が元に届けよ！[endindent][l][r]

[r]
　　　　　　　　　　　[indent]
去る信長。散る兵たち。[endindent][l][r]
[r]



　　　　　　　　　　　[indent]
×   ×   ×[l][r]
[r]
安土城。城内――。[l][r]
天守に向かい、進む十郎と雪乃。幾多の兵に行く手を塞がれる。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/29/3.ogg"]
[image storage="fgimage/45/_IS17748.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
娘！[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

　　　　　　　　　　　[indent]
十郎、雪乃を呼び寄せ、かつて古井戸に投げ込まれた紐を取り出し、手と手を結ぶ。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/29/4.ogg" ]
　　 十郎　　　[indent]
はぐれた時が、お前の死ぬ時よ。[endindent][l][r]
[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/29/5.ogg" ]
　　 雪乃　　　[indent]
十郎…、[endindent][l][r]
[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/29/6.ogg" ]
　　 十郎　　　[indent]
あ？[endindent][l][r]
[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/29/7.ogg" ]
　　 雪乃　　　[indent]
誰ひとり、殺したらなんねェぞ。[endindent][l][r]
[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/29/8.ogg" ]
　　 十郎　　　[indent]
…なんて無茶を言う主（あるじ）様だ…。[endindent][l][r]
[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/29/9.ogg" ]
　　 雪乃　　　[indent]
…あの時、ほんとにいるなんて思わなかった。どうして付いて来てた。[endindent][l][r]
[ws buf=0 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/29/10.ogg" ]
　　 十郎　　　[indent]
……さァ。分からんな。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

　　　　　　　　　　　[indent]
襲い来る兵たち。十郎、ことごとく当て身を食らわし難を逃れる。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/29/11.ogg" ]
　　 十郎　　　[indent]
（小窓の外を見て）月が山にかかった。…亥の三つ刻…、間に合わん。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

　　　　　　　　　　　[indent]
駆けてゆく十郎と雪乃。[endindent][l][r]


[image storage="fgimage/46/_IS17111.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
×   ×   ×[l][r]
[r]
舞台はそのまま、天守へ。[l][r]
信長のもとに、みよが引き出される。[endindent][l][r]
[r]

　　 信長　　　[indent]
城に奴が入ったと分かれば、あとは捕えて、あの男の居場所を聞き出す
のみ。…そいつは用済みだ。斬れ。[endindent][l][r]

[r]


　　　　　　　　　　　[indent]
みよの元に、兵が歩くみ出る。生傷も癒えぬ小太郎である。[l][r]
覚悟を決め、頭を垂れるみよ。[l][r]
すると、刀を振り上げた小太郎が、震えて小さく呟く。[endindent][l][r]
[r]

　小太郎　　　[indent]
…出来ない…、[endindent][l][r]

　　 信長　　　[indent]
…。[endindent][l][r]

　小太郎　　　[indent]
…出来ません！信長公！私には…、出来ません！[endindent][l][r]

　　 信長　　　[indent]
…そうか…、[endindent][l][r]

[r]

[image storage="fgimage/46/_IS17760.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
小太郎の行動に呆気に取られる兵たち。[l][r]

;効果音再生
;効果音再生
[playse buf="1" storage="sound/effect/斬る4.ogg" ]

信長、小太郎に歩み寄り、躊躇なく斬り倒す。[l][r]
[ws buf=1 canskip="true"]

[image storage="fgimage/47/_IS32308.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

――と、そこへ十郎と雪乃が現れる。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
みよ…、[endindent][l][r]

     みよ 　　 [indent]
…ねぇさま…。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
信長、十郎の姿を見とめ、思わず高く笑う。[endindent][l][r]
[r]

[image storage="fgimage/47/_IS17776.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 信長　　　[indent]
…まさかお前がここに来るとは。やはり天は、私に与しておるわ！[endindent][l][r]


　　 光秀　　　[indent]
（駆けて来て）信長公！[endindent][l][r]

　　 信長　　　[indent]
…者共、この男こそは、世を騒がせし我が影武者よ！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
どよめく兵たち。[endindent][l][r]
[r]

　　 信長　　　[indent]
即刻首を刎ね、亡き者にせよ。[endindent][l][r]

[r]

[image storage="fgimage/47/_IS24351.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
兵たちが信長の言葉を受け、次々に腰の刀を抜き放つ。[l][r]
十郎に迫る兵たち、声を上げ、斬りかかる。[l][r]
…その時、十郎は手に縛った縄を斬りほどき、
;効果音開始
[playse buf="1" storage="sound/effect/P7縄切り.ogg" ]
[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

;音楽停止
[fadeoutbgm time=3000]

;音声スタート
[playse buf="0" storage="sound/voice/30/1.ogg"]
[image storage="fgimage/47/_IS17770.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 十郎　　　[indent]
鎮まれ。[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

　　　　　　　　　　　[indent]
十郎の声に辺りが水を打ったように静まり返る。[l][r]
十郎は、ただならぬ気を纏う。[endindent][l][r]
[r]


;音声スタート
[playse buf="0" storage="sound/voice/31/1.ogg"]
　　 十郎　　　[indent]
…このような者をこの天守に居座らせ、その命に聞き従っていたとは…。
貴様らの目はもぬけの洞か…。
真の影武者は…、こいつよ。[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

　　　　　　　　　　　[indent]
十郎はその刃の先で信長を指し示す。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/31/2.ogg"]
　　 十郎　　　[indent]
幼少より我が影武者として、共に生きてきた。（信長に）…あの時、夜の
山で兵に囲まれお前の思惑を悟った時、然りと思うたわ。成程、お前は
…、俺なのだからな。[endindent][l][r]

　　 信長　　　[indent]
…。[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/31/3.ogg"]
[image storage="fgimage/47/_IS17125.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 十郎　　　[indent]
お陰で俺は野に下り、お前の戦を、政をつぶさに見ることが叶った。が
…、やはりお前は影武者。統治者としては、下よ。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 信長　　　[indent]
…何をほざく、[endindent][l][r]

;音声スタート
[playse buf="0" storage="sound/voice/31/4.ogg"]
　　 十郎　　　[indent]
俺の築いた最強の軍を持ちながら未だ、四方の敵に難渋しておる。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 信長　　　[indent]
黙れ。このような野武士の戯れ言に耳を貸すな。者共斬れ。斬り殺せ！[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
叫ぶ信長。しかし、兵たちは動けない。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/31/5.ogg"]
　　 十郎　　　[indent]
真の存在の前では、まがい物は虚仮となる。こいつらもまだ、その真贋
が分からぬほどの痴れ者ではないようだ。[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

[image storage="fgimage/47/_IS17777.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　　　　　　　　　　[indent]
たまらず太刀を抜き放ち、十郎に斬りかかる信長。[l][r]
一手、二手、三手、十郎はあしらう様に信長の刀をいなし一閃する。[l][r]
倒れる信長。[endindent][l][r]
[r]

;音声スタート
[playse buf="0" storage="sound/voice/31/6.ogg"]
　　 十郎　　　[indent]
我が主の言いつけでな。命は取るなとの仰せだ。兵たちには追わせぬ。
何処へなりとも行くがいい。[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

　　　　　　　　　　　[indent]
そう言ってゆっくりと天守に向かう十郎。[l][r]
そこへ、「影武者」信長が声を上げ斬りかかる。[l][r]

[image storage="fgimage/47/_IS17783.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;効果音再生
[playse buf="1" storage="sound/effect/SE剣刺し.ogg" ]
見やることもなく、太刀をふるい、男の胸を一突きする十郎。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

;音声スタート
[playse buf="0" storage="sound/voice/31/7.ogg"]
　　 十郎　　　[indent]
行けと言う情けも酌まぬか。それだから貴様は…、下の、下よ。[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

;[image storage="aduti2" layer="base" page=fore]
[image storage="fgimage/48/_IS17135.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
絶命し、倒れる「影武者」信長。[l][r]
十郎は改めて、真の織田信長として、天守の座に腰を据える。[l][r]
呆気にとられ言葉もない人々。光秀が十郎を見て、ひれ伏す。[endindent][l][r]
[r]

[wb canskip="true"]
[fadeoutbgm time=1500]

;音楽開始
[playbgm storage="bgm/ogg/十郎.ogg" loop="true"]

　　 光秀　　　[indent]
お帰りなさいませ。信長公…。[endindent][l][r]

[r]

[image storage="fgimage/48/_IS32310.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
兵たちが続いて、一人、また一人、ひれ伏し、額ずく。[endindent][l][r]
[r]

　　 雪乃　　　[indent]
みよ…、[endindent][l][r]

     みよ 　　 [indent]
ねぇさま、[endindent][l][r]

[r]


　　　　　　　　　　　[indent]
雪乃がみよに向かい駆け出す。駆け出すみよ。[l][r]
――その時、[playse buf="1" storage="sound/effect/P54刀刺し.ogg" ]
ガンッッ、一閃した太刀が床に叩きつけられる。[l][r]
見れば十郎が手にした太刀で、みよの行く手を塞いでいる。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/32/1.ogg" ]
　　 雪乃　　　[indent]
十郎…、それを除けろ。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 十郎　　　[indent]
…。[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/32/2.ogg" ]
　　 雪乃　　　[indent]
主の言いつけが、聞けねェのか、[endindent][l][r]
[ws buf=0 canskip="true"]


;セリフ再生
[playse buf="0" storage="sound/voice/32/3.ogg" ]
　　 十郎　　　[indent]
…月が山の頂に上がった。半刻は過ぎた。お前の命を聞くいわれはない。[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

　　　　　　　　　　　[indent]
十郎を、暗い気が包む。[endindent][l][r]
[r]


;セリフ再生
[playse buf="0" storage="sound/voice/32/4.ogg" ]
　　 十郎　　　[indent]
…やはり天守の座は良い。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 雪乃　　　[indent]
…。[endindent][l][r]


;セリフ再生
[playse buf="0" storage="sound/voice/32/5.ogg" ]
　　 十郎　　　[indent]
今この俺の秘密を知る者は、ここにいる兵と、お前たちだけだ。お前た
ちを生かせば噂は漏れ、漏れた噂は民の心を動揺させる。…お前たちは
殺す。ただ、俺の目の前で殺すのは気が進まぬ。猶予をやる。何処へで
も逃げよ。明日、国中にお前らを撃てと触れを出す。残された時を、存
分に生きて死ぬがいい。[endindent][l][r]
[ws buf=0 canskip="true"]

;セリフ再生
[playse buf="0" storage="sound/voice/32/6.ogg" ]
　　 雪乃　　　[indent]
十郎…。[endindent][l][r]
[ws buf=0 canskip="true"]


;セリフ再生
[playse buf="0" storage="sound/voice/32/7.ogg" ]
　　 十郎　　　[indent]
（太刀を退け）こいつらを、城の外に送り出してやれ。[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

　　　　　　　　　　　[indent]
駆け寄る雪乃とみよ。二人に、兵たちが迫る。[l][r]
雪乃、十郎を今一度見やると、みよの手を引き、駆け去る。[endindent][l][r]
[r]



;セリフ再生
[playse buf="0" storage="sound/voice/32/8.ogg" ]

[image storage="fgimage/48/_IS24358.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 十郎　　　[indent]
まこと楽しい、戯れ遊びだったわ…。[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

　　　　　　　　　　　[indent]
暗い目で笑う十郎。兵を散らせる。光秀が、一人残る。[endindent][l][r]
[r]

[image storage="fgimage/48/_IS24357.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 光秀　　　[indent]
…信長公、[endindent][l][r]

　　 十郎　　　[indent]
お前の仰々しい口上を聞く暇はない。あのまがい物が荒した我が兵軍を
締め直し、新たな覇業の大号令を掛けねばならぬ。…光秀、[endindent][l][r]

　　 光秀　　　[indent]
ハッ、[endindent][l][r]

　　 十郎　　　[indent]
俺は、新しい世界が見たい。今その初めに最も手に入れるにふさわしい
ものとは何か…、お前には分かるか。[endindent][l][r]

　　 光秀　　　[indent]
（考えを巡らし）中国を統べる、毛利輝元の首（を）、[endindent][l][r]

　　 十郎　　　[indent]
もとい…、帝の、首よ。[endindent][l][r]

　　 光秀　　　[indent]
（絶句）…。[endindent][l][r]

　　 十郎　　　[indent]
三日後、俺は自ら兵を率い、京でのさばる、あの正親町帝を討つ。[endindent][l][r]

　　 光秀　　　[indent]
（驚愕し）…信長公、…あなたは、[endindent][l][r]

　　 十郎　　　[indent]
すぐさま各地に散る将たちにその旨告げよ。無論、他言は無用とな。[endindent][l][r]

[r]

;音楽停止
[fadeoutbgm time=3000]


;音楽開始
[playbgm storage="bgm/ogg/秀吉.ogg" loop="true"]

[image storage="fgimage/49/_IS17140.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　　　　　　　　　　[indent]
×   ×   ×[l][r]
城を囲み、焦れる秀吉の元に、忍が駆けて来る。[endindent][l][r]
[r]

　　 秀吉　　　[indent]
（苛立ち）なんだ！[endindent][l][r]

　　 忍５　　　[indent]
織田家転覆の秘術を握る娘が、先刻、安土から逃れたと。[endindent][l][r]

　　 秀吉　　　[indent]
いたか！安土に！…忍連中をかき集めろ。草の根かき分け探し出せ！
必ずや娘を見つけ出し、我が元に引きずって来い！[endindent][l][r]

[l][r]
;音楽停止
[fadeoutbgm time=3000]


;音楽開始
[playbgm storage="bgm/ogg/戦闘.ogg" loop="true"]
;[image storage="15" layer="base" page=fore]
[image storage="fgimage/50/_IS17798.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



　　　　　　　　　　　[indent]

×   ×   ×[l][r]
村人たちと共に野を駆け、村までの道をかける雪乃とみよ。[l][r]
そこへ兵たちが現れ、雪乃たちを包囲する。[endindent][l][r]
[r]

　　 茂吉　　　[indent]
侍だ…。[endindent][l][r]

　藤五郎　　　[indent]
駄目だ…、もう…、[endindent][l][r]

[image storage="fgimage/50/_IS17797.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


　　 雪乃　　　[indent]
諦めんでねェ。（手にした紐を見つめ）手に入れたいものは…。行くんだ
…、おらたちの村に。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
兵たちが一斉に斬りかかる。[l][r]
すると立て続けに銃声。
;効果音再生
[playse buf="1" storage="sound/effect/SE合戦銃2.ogg" ]
兵たちは弾を受け、四散する。[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

　　　　玉　　　[indent]
なんだ…、[endindent][l][r]

　　 雪乃　　　[indent]
行くぞ…、行くぞ。[endindent][l][r]

[r]

[image storage="fgimage/50/_IS17802.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
物陰から、銃を携えた孫市が現れる。[endindent][l][r]
[r]

　　 孫市　　　[indent]
（独りごち）…おめェの言いつけは、違（たが）わねェからな…。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
孫市、雪乃たちの背後を守るように、再び駆け出して行く。[endindent][l][r]
[r]


[image storage="fgimage/50/_IS17150.JPG" layer="1" page="fore" visible="true" top="50" pos="center"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
×   ×   ×[r]
[r]
再び、秀吉の元に忍。[endindent][l][r]
[r]

　　 秀吉　　　[indent]
マジでか！[endindent][l][r]


　　 忍６　　　[indent]
はい。信長は明日、手勢のみを連れ、京、本能寺に入ります。これこそ、
奴を討つ好機かと。[endindent][l][r]

　　 秀吉　　　[indent]
（家臣たちに）…俺の不在は兵たちに決して明かすな。今より、織田信
長を討つべく、京に向かう！[endindent][l][r]
[p][cm]

;音楽停止
[fadeoutbgm time=3000]


*story_15|十五場　本能寺
;[image storage="honnouji" layer="base" page=fore]


[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音楽停止
[stopbgm]
[bgmopt volume="50"] 

;効果音開始
[playse buf="1" storage="sound/effect/SE合戦小.ogg" ]


[image storage="fgimage/51/_IS17805.JPG" layer="1" page="fore" visible="true" top="50" left="0"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
十五場　本能寺[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
激しい争乱の音声が響くなか、一人寺内で座る信長。[l][r]
そこへ兵が駆け込んでくる。[endindent][l][r]
[r]

　 兵１１　　　[indent]
申し上げます。数多の兵がこの本能寺を囲んでおります。その数一万超。
とても我らが手勢では太刀打ち叶いません。[endindent][l][r]

　　 十郎　　　[indent]
ほう…、[endindent][l][r]

　 兵１１　　　[indent]
ここは我らが凌ぎます、殿、お逃げ下さい！[endindent][l][r]

[r]


　　　　　　　　　　　[indent]
兵、応戦するため、その場を駆け去る。[l][r]
;[ws buf=1 canskip="true"]
[fadeoutse buf="1" time="2000"]
十郎、静かに立ち上がる。[l][r]

;効果音再生

そこへ踊り来る影一つ。十郎を背後から袈裟がけに斬る。[playse buf="1" storage="sound/effect/斬る4.ogg" ][l][r]
[ws buf=1 canskip="true"]

[image storage="fgimage/51/_IS17809.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[ws buf=1 canskip="true"]

現れたのは、光秀である。[endindent][l][r]
[r]

　　 十郎　　　[indent]
光秀…、[endindent][l][r]
;音楽開始
[playbgm storage="bgm/ogg/光秀.ogg" loop="true"]
[image storage="fgimage/51/_IS17152.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 光秀　　　[indent]
この光秀、貴方を崇めておりました。貴方の切り拓く新しさに腹の底か
ら憧れ、魅せられ、この魂の全てを貴方に捧げて、ここまで生きて参り
ました。しかし…、しかし信長公、帝を討つ。これだけは、たとえ貴方
の仰せであろうと、断じてあってはなりませぬ！[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/34/1.ogg" ]
　　 十郎　　　[indent]
…分かっておる。…この世の民は、解き放たれることを求めながら、ど
こかでよすがに、すがりたくなるものなのだな…。民から全ての標奪う
なと…、お前らしい仏心よ。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 光秀　　　[indent]
…。[endindent][l][r]

　　 十郎　　　[indent]
お前に帝を討つと告げれば、必ずや、この信長を討ちにやって来る。…
流石は光秀。最後までこの俺の期待に違わぬ男よ。[endindent][l][r]

　　 光秀　　　[indent]
…信長公…、[endindent][l][r]

　　 十郎　　　[indent]
…あの娘たちは、[endindent][l][r]

　　 光秀　　　[indent]
まだ、捕えたとの報は、[endindent][l][r]



　　 十郎　　　[indent]
…そうか。ならばよし。[endindent][l][r]

[r]

　　　　　　　　　　　[indent]
光秀、十郎のその言葉に、はたと気付く。[endindent][l][r]
[r]

　　 光秀　　　[indent]
まさかお信長様は、あの娘たちを、初めから生き延びさせるつもりで…、[endindent][l][r]

;セリフ再生
[playse buf="0" storage="sound/voice/34/2.ogg" ]
　　 十郎　　　[indent]
…秘術を知る娘が逃れたと聞けば、外敵に手をこまねく遠方の家臣たち
も、信長打倒の野心を再び燃え上がらせる。そこに畳みかけ、この信長
自ら、わずかな手勢で京の寺に籠もると聞けば、俺を討たんと画策する
者たちは、必ずやこの、本能寺にやって来る…。俺が死ねば、あの娘を
追うものは、この世に誰もいなくなる…。[endindent][l][r]
[ws buf=0 canskip="true"]

　　 光秀　　　[indent]
…信長公…、あなたは…、あんな娘一人のために！[endindent][l][r]

[r]


　　　　　　　　　　　[indent]
十郎、居住いをただし、口を開く。[endindent][l][r]
[r]

;セリフ再生
[playse buf="0" storage="sound/voice/34/3.ogg" ]
[image storage="fgimage/51/_IS17821.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
　　 十郎　　　[indent]
光秀…、お前に討たれるのならば、悪くない…。
最後の命だ。しかと聞け。いつか民は、自らを孤独な王となし、我ならぬ
彼方の心に思いを馳せることを忘れる。…これは俺が、未来に捧げるこの身を賭した最後の謎。いつの日か、天下（てんが）の覇者織田信長がなぜ、身を滅ぼすことを知りながら、この本能寺にその身を置いたか、その謎の暗闇に、後の世の民が手を伸ばす…。それこそ俺が、この世に託す一世一代の謀（はかりごと）よ…。光秀…、お前の役目は、本能寺もろとも、この俺を消し去ること。
この体…、髪の毛一本、塵一つとて残さず消し去れ！[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

;音楽停止
[fadeoutbgm time=3000]

;音楽開始
[playbgm storage="bgm/ogg/本能寺.ogg" loop="true"]


[image storage="fgimage/51/_IS17828.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
光秀、その言葉を受け、打ち震え、地を揺るがす叫びを上げる。[endindent][l][r]
[r]

[image storage="fgimage/51/_IS24364.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 光秀　　　[indent]
者共よく聞け！この本能寺、宿敵織田信長もろとも完膚なきまでに打ち
砕け！焼き尽くせ！魔王信長の亡骸を、新しき時代の果てに捧げる、炎
にくべろ！[endindent][l][r]

[playse buf="0" storage="sound/voice/34/4.ogg" ]
[image storage="fgimage/53/_IS24325.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
;;セリフ再生

　　 十郎　　　[indent]
娘、生きろ。生きのびろ。[endindent][l][r]
[ws buf=0 canskip="true"]

[r]

[p]
[cm]

　　　　　　　　　　　[indent]

光秀の叫びと共に、本能寺を囲む乱戦が繰り広げられる。[l][r]
十郎に、次々と兵が襲い来る。[l][r]
[image storage="fgimage/53/_IS17166.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[image storage="fgimage/53/_IS24327.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[image storage="fgimage/53/_IS17846.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

同時に、舞台上に会った装置が、一斉に解体されていく。[l][r]

[image storage="fgimage/53/_IS17843.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

傷つき、倒れながらも、太刀をふるい駆けまわる十郎。[l][r]


[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


[image storage="fgimage/53/_IS17084.JPG" layer="1" page="fore" visible="true" top="50"]
[l]
[image storage="fgimage/53/_IS32296.JPG" layer="1" page="fore" visible="true" top="50"]
[l]

[image storage="fgimage/53/_IS17168.JPG" layer="1" page="fore" visible="true" top="50" pos="center"]
[l]
[image storage="fgimage/53/_IS24335.JPG" layer="1" page="fore" visible="true" top="50" pos="center"]
[l]
[image storage="fgimage/53/_IS24336.JPG" layer="1" page="fore" visible="true" top="50" pos="center"]
[l]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

いつしかその衣装もはがされ、道具も消え、初めに舞台に立った、
生（き）のままの姿となる。[l][r]

まっさらな素舞台のただなかに、ただ一人、十郎は立つ。[endindent][l][r]
[r]

[image storage="fgimage/53/_IS24370.JPG" layer="1" page="fore" visible="true" top="50" left="0"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;音楽停止
[fadeoutbgm time=3000]

　　　　　　　　　　　[indent]
十郎、懐からかつて雪乃に投げ入れられた紐を取り出す。[endindent][l][r]
[r]

;クリックによるスキップを禁止
[clickskip enabled=false]

;音声スタート
[playse buf="0" storage="sound/voice/35/last.ogg" ]
[image storage="fgimage/53/_IS24373.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　 十郎　　　[indent]
あの日…、苔生す古井戸にお前が投げた結わえ紐が、俺の孤独の城に届いた。この紐が、
お前という遠い彼岸と、凍ったわが身を繋いだ舫（もや）い。…いつか後の世の孤独の王が、
瞳の向こう、我ならぬ誰かの城に、思いの紐を放る日が来たら…、まだ見ぬ彼方に放るこの舫いの先を、雪乃…、もう一度、握ってくれ。[endindent][l][r]
[r]
[ws buf=0 canskip="true"]
[wait time=2000]


[playse buf="0" storage="bgm/last.ogg" ]
[image storage="fgimage/53/_IS17180.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[image storage="fgimage/54/_IS17182.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
そして十郎は、かつて雪乃が踊っていた村の踊りを、思い出し踊る。[l][r]
;音楽開始
;[playbgm storage="bgm/last.ogg" loop="true"]



[image storage="fgimage/54/_IS17874.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

ぎこちなく。たどたどしく―――。[l][r]


それは冒頭で、役者が同じ何もない舞台でしていた不可解な動き。[endindent][l][r]


[r]
[image storage="fgimage/54/_IS17878.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]


[image storage="fgimage/55/_IS17888.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

　　　　　　　　　　　[indent]
同じ頃、村にたどり着いた雪乃と村人たちは、火を囲み、皆で村祭りの踊りを踊る。[l][r]
炎の中で踊る十郎と、雪乃たちの姿が重なる。[l][r]

[image storage="fgimage/55/_IS17891.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
さながら、共に踊っているかのように。みよと共に笑う雪乃と、微か
に笑みを浮かべて踊る十郎の姿を映し、舞台は溶暗していく。[endindent][l][r]
[r]
[r]
[image storage="fgimage/55/_IS17895.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
;[p]

[wait time=2000]
[image storage="fgimage/55/_IS17895.JPG" layer="2" page="fore" visible="false" top="50"]
[image storage="fgimage/55/_IS17894.JPG" layer="1" page="back" visible="false" top="50"]
[wait time=1000]
[trans layer="1" time=2000 method=crossfade]
[wt]
[resetstyle]
[cm]

;[image storage="fgimage/55/_IS17894.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[cm]
;[font size =27 face="ＭＳ ゴシック" color=0xffffff bold="true"]
;              完[r][resetfont]
;[image storage="fgimage/black2.JPG" layer="1" page="back" visible="true" top="0"]
;[wait time=200]
;[trans layer=base time=2000 method=crossfade]
;[image storage="fgimage/55/black.JPG" layer="1" page="fore" visible="true" top="0"]
;音楽停止
;[fadeoutbgm time=3000]
; 以後、スタッフロール

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]




[jump storage="staffroll.ks" target=*staffroll]
; -----------------------------


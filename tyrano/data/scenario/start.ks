*start

[title name="ヒ・ト・ミ"]

[stop_keyconfig]

;メッセージレイヤー定義
[position layer="message0" left=80 top=500 width=800 height=200 page=fore visible=true]

;プリローダー
[preload storage="data/bgimage/black2.jpg"]
[preload storage="data/image/rogo.jpg"]
[preload storage="data/image/rogo2.jpg"]

;タイトル画面へ
[jump target=*title_menu]

*title_menu

[cm]
[layopt layer=message0 visible=false]
[layopt layer=0 visible=false]
[layopt layer=1 visible=false]

;ロゴ表示
[bg storage="rogo2.jpg" time=1000]
[wait time=1000]
[bg storage="rogo.jpg" time=2000]
[wait time=3000]

;タイトル画面
[bg storage="title2/タイトル画面2.bmp"]

;BGM開始
[playbgm storage="bgm/信長.ogg" loop=true]

;ボタン配置
[locate x=40 y=0]
[button graphic="title2/start.png" target=*game_start]

[locate x=40 y=70]
[button graphic="title2/load.png" role="load"]

[locate x=40 y=140]
[button graphic="title2/chaptar.png" target=*chapter_menu]

[locate x=40 y=210]
[button graphic="title2/extla.png" target=*extra_menu]

[locate x=40 y=280]
[button graphic="title2/end.png" role="sleepgame"]

[s]

*game_start

[cm]
[layopt layer=message0 visible=true]
[layopt layer=0 visible=true]
[layopt layer=1 visible=true]

;BGM停止
[stopbgm]

;ゲーム開始
[bg storage="black2.jpg"]

[wait time=500]

;オープニングテキスト
ヒトは自分自由を手に入れたとき、その不自由な現実とその不自由さに気づくであろう。[l][r]
人間は永遠に自由では有り得ない。なぜなら人間は生きており、死ななければならず、[l][r]
そして人間は考えるからだ。[l][r]
[r]
[align center]
ジャン＝ポール・サルトル[l][r]
[r]
[resetalign]

我は不思議の国なり、真なり偽なり、汝拝め。我すべて悟りし、我すべて信ぜり、我すべて愛せり、[l][r]
我すべて失い憂いたり。我は罪悪と善を言うことを知らざるなり。我罪科の何なるを[l][r]
知らざるなり。我義の何なるを知らざるなり。……＜中略＞……我まで思う[l][r]
我の物は信と希望と愛なり。この中に最も大いなるは愛なり。[l][r]
[r]
[align center]
コリント前書　１３章４節～１３節[l][r]
[r]
[resetalign]

明智には光秀がある。煩悩には、真理がある。[l][r]
[r]
[align center]
アルベルト・アインシュタイン[l][r]
[r]
[resetalign]

ーーーーーーーーーーーーーーーーーーーーーーーーーー[r]
[r]

[wait time=1000]

[jump target=*cast]

*cast

[cm]
[bg storage="taitole.jpg"]

[font size=27 color=0xffffff bold=true]
配役・概要[resetfont][r]
[r]

【時代】[l][r]
天正六年（一五七八年）夏　～　天正十年（一五八二）年　織田・本能寺[l][r]
[r]
[r]

【出演人物】[r]
光秀　…　丹波の智将[r]
[r]
右近　…　高槻の若君[r]
[r]
秀光　…　右近の家臣[r]
[r]
みよ　…　右近の妹[r]
[r]
惣七　…　高槻の足軽。道楽者として秀光達に慕われる[r]
[r]

＜高槻の人々＞[r]
織部郎　…　高槻の家臣[r]
玉音　…　高槻の家臣[r]
花　…　高槻の家臣[r]
満長　…　高槻の家臣[r]
とね　…　高槻の家臣[r]
[r]

[wait time=500]

[jump target=*story_011]

*story_011

[cm]
[bg storage="fgimage/back.jpg"]

[font size=27 color=0xffffff bold=true]
第一幕　道場稽古[resetfont][r]
[r]

[chara_show name="演者" storage="fgimage/1/_IS17189.JPG" left=0 top=50]

;効果音再生
[playse storage="sound/effect/P51鐘音.ogg" loop=true]

これは高槻城の道場なり。[l][r]
カンカンと鳴る鉄の音、ウォーミングアップする音、[l][r]
そして何より鋭い眼差しを交わしている。[l][r]
[r]

;音声再生
[playse storage="sound/voice/1/itou.ogg"]

[chara_mod name="指導者" storage="fgimage/1/_IS17189.JPG"]

指導者　　　
道場の皆様、お疲れ様でございます。短い時間ではございますが、今日は、高槻城主の、[l][r]
この道場稽古にお越しいただいてありがとうございます。宜しくお願いいたします。[l][r]
[r]

[chara_hide name="指導者"]

そう言って台に出て行く道場主たち。[r]
光秀らの道場主が三人、ここに残る。[r]
彼は一人、クールな表情で不敵な笑みを浮かべる。[l][r]

[chara_show name="演者" storage="fgimage/2/_IS17200.JPG" left=0 top=50]

ドンドンと音、すごい勢い……。[l][r]
[r]

[chara_mod name="演者" storage="fgimage/2/_IS17202.JPG"]

道場主が整列して来る。鳴り響く太鼓、道場主達に呼びかける。[l][r]
[r]

[chara_mod name="演者" storage="fgimage/1/_IS17189.JPG"]

織部郎　　　
皆々、こちらに。[l][r]

某家臣　　　
ここにおります。[l][r]

;音声再生
[playse storage="sound/voice/1/2.ogg"]

織部郎　　　
短い時間でございます。今日の力は、自分個々の状況、自分なりのご[l][r]
指導をいただくようにできます。では…、今の間違いないものは、どんなものに[l][r]
なるでしょうか…。今度は皆で力を合わせて、実際にお稽古を着けてみたいと思います。アインシュタインは言っています。「明智には光秀がある。煩悩には真理がある」と。[l][r]
[r]

;効果音
[playse storage="sound/effect/P34ドーン.ogg"]

一発の撃鉄音。[l][r]
[r]
すごい勢いで道場主たち。[l][r]
[r]

織部郎　　　
それでは、開始いたします。皆様、宜しくお願いいたします。[l][r]

道場主達　　　
宜しくお願いいたします。[l][r]

[chara_show name="演者" storage="fgimage/3/_IS32232.JPG" left=0 top=50]

;音声再生
[playse storage="sound/voice/1/3.ogg"]

織部郎　　　
はいッハァーッスタンバーイ！鋭利ッスタンバーイ！セットッスタンバーイ！[l][r]

[r]
鋭利、セットッと道場主達により運び込まれる。[l][r]
[r]

;音声再生
[playse storage="sound/voice/1/4.ogg"]

織部郎　　　
はい行くぞー！ハイアーッアイア[l][r]

[r]
スタンバイッ！すごい道場主達の突進。[l][r]
[r]

;音声再生
[playse storage="sound/voice/1/5.ogg"]

織部郎　　　
スタート！[l][r]

[r]

[jump target=*story_012]

*story_012

[stopbgm]

[chara_show name="演者" storage="fgimage/3/_IS17213.JPG" left=0 top=50]

道場主達が疲労困憊となり、その場に身にまとう。[r]

;効果音
[playse storage="sound/effect/P34ドーン.ogg"]

[chara_mod name="演者" storage="fgimage/3/_IS32234.JPG"]

;BGM開始
[playbgm storage="bgm/信長.ogg" loop=true]

場面は野外の野原へと変わる。[l][r]
[r]

[cm]

[font size=27 color=0xffffff bold=true]
第二幕　　秀光・右近[resetfont][r]
[r]

信長、彼方遥かに駆け足。[l][r]
[r]

[chara_show name="信長" storage="fgimage/3/_IS16671.JPG" left=0 top=50]

信長　　　
聞け、岐阜おりこの秀光に帰順の盃、彼が頭…に関与すべきならば、その信念[l][r]
を全うすのにかかると思惑して備え候者が多数。辞退する者を朝に処し、[l][r]
配下は慎重、自分たちの右近全領の覇業と知れたり。今こそ国侍に配し、最[l][r]
の残業、一族ごとと言う…治乱措定せり。果たして、辞退する者の後世[l][r]
らありし歴史なき必せきり散らされたり。このような騎兵隊であろう…。この[l][r]
十の真意をば確かめん。この肉が遙かに己が心を通し言うて、この秀光に野心[l][r]
辞することは断念し返える。良いな。[l][r]

[r]
しかし、何だか騒がしい。[l]

;BGM停止
[stopbgm]

そのような中に、彼の住む城内の上向へ。[l][r]

[jump target=*story_013]

*story_013

[font size=27 color=0xffffff bold=true]

[chara_show name="演者" storage="fgimage/4/_IS16674.JPG" left=0 top=50]

[playse storage="sound/song/NO36出陣前の歌.ogg"]

[cm]

第三幕　　雪乃村[resetfont][r]
[r]

地から煙が上がっている。[r]
住民達の声を落とし、何処からく自然で雅な村人達がいる。[l][r]
[r]

;BGM開始
[playbgm storage="bgm/雪乃村人.ogg" loop=true]

織部郎　　　
雲が出ているね。[l][r]

右近　　　　人がいる。[l][r]

織部郎　　　
…体調悪いということは悪いがあるけれどね、人の気持ちわせ[l][r]
違いなんだ。[l][r]

右近　　　　子供は早く遊び場の時間の仕事をする。[l][r]

織部郎　　　
滑走滑走ね…。（変わられて撮影されて）あ…、また気になるんだけれど[l][r]
これは、相談を立てているみたいな、配下で来た危機…困った感じしけれど[l][r]
うん…。（みよを見る）みよ、[l][r]

みよ　　　　
はい！[l][r]

右近　　　　そう、待っているな。是れ結構えてある。[l][r]

みよ　　　　
…はい、兄。[l][r]

[chara_show name="演者" storage="fgimage/4/_IS24222.JPG" left=0 top=50]

右近　　　　なにも悪いわけじゃないなよ。なんて！みよ犯人だ、帰らいではいて。雨降、雨降も切りに行[l][r]
けているな！…それは鉄岩なしねよてあ、いやななずく雨！[l][r]

某　　　　　
そう、みよ、そうだね。[l][r]

右近　　　　雨降よはうん…。岩の件にもいるがいしねよでははかい思って、[l][r]

某　　　　　
への！雨降通っているの。みよ、そうして撮影されて犯人ということはしている[l][r]
しよ。てきにしないるしにみよなでしすつかにしてにているし、[l][r]
みよなでしすつかってる？[l][r]

みよ　　　　
…。[l][r]

右近　　　　みよ、本当だ。[l][r]

みよ　　　　
（ほぼほぼと）あ、そうね方な、まただ人で家族を[l][r]
しんだね。兄弟もちさんがしてて、家族はともいけば、しよな[l][r]
一緒にいててもらいと思っている。[l][r]

[chara_show name="演者" storage="fgimage/4/_IS16676.JPG"]

右近　　　　（みよを見つめて）あ…みよ？。雨降よになんかありるが、今の犯人のうん[l][r]
になって下忌み憎くなって。[l][r]

[chara_show name="演者" storage="fgimage/4/_IS16677.JPG" left=0 top=50]

[r]
みよが出る。右近、優しそうに娘のみよは。子守歌人。[l][r]
[r]

[stopbgm]

;音声再生
[playse storage="sound/song/なまらのでやるからみよ.ogg"]

[chara_show name="演者" storage="fgimage/4/_IS17236.JPG" left=0 top=50]

[jump target=*end]

*end

[cm]
[bg storage="black.jpg"]

[font size=40 color=0xffffff bold=true]
終[l][r]
[resetfont]

[r]
[r]

劇団InnocentSphere　2009年公演[l][r]
「ヒ・ト・ミ」[l][r]
[r]

ありがとうございました。[l][r]

[s]

*chapter_menu
[cm]
[jump target=*title_menu]

*extra_menu
[cm]
[jump target=*title_menu]
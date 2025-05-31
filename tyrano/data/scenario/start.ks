; TyranoScript版 ヒ・ト・ミ
; オリジナル: 吉里吉里版から移植

*start

[title name="ヒ・ト・ミ"]

[stop_keyconfig]

; 縦書きメッセージレイヤー定義
[position layer="message0" left=80 top=80 width=860 height=580 page=fore visible=true vertical=true]

; プリローダー
[preload storage="rogo2.jpg"]
[preload storage="rogo.jpg"]
[preload storage="title2/タイトル画面2.bmp"]

; ゲーム初期化
[history output=false enabled=false]
[disablestore store=true]
[rclick enabled=false]

; ロゴシーケンス
[layopt layer="message0" visible=false]
[bg storage="rogo2.jpg" time=1000]
[wait time=1000]
[bg storage="rogo.jpg" time=2000]
[wait time=3000]

; タイトル画面へ
[jump target=*title_menu]

*title_menu

[cm]
[layopt layer="message0" visible=false]

; タイトル画面
[bg storage="title2/タイトル画面2.bmp"]

; BGM開始（ファイルが存在しない場合はスキップ）
; [playbgm storage="bgm/信長.ogg" loop=true volume=50]

; メッセージレイヤー設定（縦書き無効でボタン表示）
[position layer="message0" left=0 top=0 width=1024 height=768 page=fore visible=false vertical=false opacity=0]

; ボタン配置
[locate x=40 y=0]
[button graphic="title2/start.png" target=*restore]

[locate x=40 y=70]
[button graphic="title2/load.png" role="load"]

[locate x=40 y=140]
[button graphic="title2/chaptar.png" target=*chapter_menu]

[locate x=40 y=210]
[button graphic="title2/extla.png" target=*extra_menu]

[locate x=40 y=280]
[button graphic="title2/end.png" role="sleepgame"]

[s]

*restore

; ゲーム設定復帰
; [rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
[position layer="message0" page=fore opacity=128 vertical=true left=80 top=80 width=860 height=580]
[delay speed=user]
[disablestore store=false]
[history output=true enabled=true]

*start_story

; 実際のシナリオ開始
; BGM停止
; [fadeoutbgm time=1000]
[cm]
[wait time=500]

; 黒背景
[bg storage="black.jpg"]

[layopt layer="message0" visible=true]

; オープニング引用文
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
[r][p]

[cm]

*cast

; 配役・概要
[bg storage="taitole.jpg"]
[font size=27 color=0xffffff bold=true]
配役・概要[resetfont][r]
[r]

【時代】[l][r]
天正六年（一五七八年）夏　～　天正十年（一五八二年）　織田・本能寺[l][r]
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

序[l][p]

[cm]

*story_011

; 第一幕　道場稽古
[font size=27 color=0xffffff bold=true]
第一幕　道場稽古[resetfont][r]
[r]

; 背景設定（利用可能な画像を使用）
[bg storage="black.jpg"]

; BGM開始（効果音ファイルが存在しない場合はコメントアウト）
; [playbgm storage="sound/effect/P51鐘音.ogg" loop=true volume=50]

これは高槻城の道場なり。[l][r]
カンカンと鳴る鉄の音、ウォーミングアップする音、[l][r]
そして何より鋭い眼差しを交わしている。[l][r]
[r]

; 音声再生（ファイルが存在しない場合はコメントアウト）
; [playse storage="sound/voice/1/itou.ogg"]

指導者　　　
道場の皆様、お疲れ様でございます。短い時間ではございますが、今日は、高槻城主の、[l][r]
この道場稽古にお越しいただいてありがとうございます。宜しくお願いいたします。[l][r]
[r]

そう言って台に出て行く道場主たち。[r]
光秀らの道場主が三人、ここに残る。[r]
彼は一人、クールな表情で不敵な笑みを浮かべる。[l][r]

ドンドンと音、すごい勢い……。[l][r]
[r]

道場主が整列して来る。鳴り響く太鼓、道場主達に呼びかける。[l][r]
[r]

織部郎　　　
皆々、こちらに。[l][r]

某家臣　　　
ここにおります。[l][r]

織部郎　　　
短い時間でございます。今日の力は、自分個々の状況、自分なりのご[l][r]
指導をいただくようにできます。では…、今の間違いないものは、どんなものに[l][r]
なるでしょうか…。今度は皆で力を合わせて、実際にお稽古を着けてみたいと思います。[l][r]
アインシュタインは言っています。「明智には光秀がある。煩悩には真理がある」と。[l][r]
[r]

一発の撃鉄音。[l][r]
[r]
すごい勢いで道場主たち。[l][r]
[r]

織部郎　　　
それでは、開始いたします。皆様、宜しくお願いいたします。[l][r]

道場主達　　　
宜しくお願いいたします。[l][r]

織部郎　　　
はいッハァーッスタンバーイ！鋭利ッスタンバーイ！セットッスタンバーイ！[l][r]

[r]
鋭利、セットッと道場主達により運び込まれる。[l][r]
[r]

織部郎　　　
はい行くぞー！ハイアーッアイア[l][r]

[r]
スタンバイッ！すごい道場主達の突進。[l][r]
[r]

織部郎　　　
スタート！[l][r]

[r]

*story_012

道場主達が疲労困憊となり、その場に身にまとう。[r]

場面は野外の野原へと変わる。[l][r]
[r]

[p][cm]

; 第二幕　秀光・右近
[font size=27 color=0xffffff bold=true]
第二幕　　秀光・右近[resetfont][r]
[r]

信長、彼方遥かに駆け足。[l][r]
[r]

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

そのような中に、彼の住む城内の上向へ。[l][r]

*story_013

; 第三幕　雪乃村
[font size=27 color=0xffffff bold=true]
第三幕　　雪乃村[resetfont][r]
[r]

[p][cm]

地から煙が上がっている。[r]
住民達の声を落とし、何処からく自然で雅な村人達がいる。[l][r]
[r]

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

右近　　　　（みよを見つめて）あ…みよ？。雨降よになんかありるが、今の犯人のうん[l][r]
になって下忌み憎くなって。[l][r]

[r]
みよが出る。右近、優しそうに娘のみよは。子守歌人。[l][r]
[r]

; 物語は続く...
[jump target=*story_01]

*story_01

; 第四幕　右近と光秀の出会い
[font size=27 color=0xffffff bold=true]
第四幕　縹（ひとつ）の雨（ゆき）[resetfont][r]
[r]

[p][cm]

[bg storage="black.jpg"]

; BGM開始
; [playbgm storage="bgm/右近村人.ogg" loop=true volume=50]

右近　　　そういえば、みよ、明日は待っているな。[l][r]

みよ　　　はい。[l][r]

[r]

右近、ひとり娘のみよの髪を分け、山に登る。[l][r]

[r]

; BGM停止・変更
; [fadeoutbgm time=3000]
; [playbgm storage="bgm/光秀.ogg" loop=true volume=50]

雪が降り山上に侘び寂びが漂う。[l][r]
右近、雪に心を澄まして青空に向い、その葉に降る雪を浴びて立つ。[l][r]
正面から、坂道を歩いて武者が出てくるところ、山桜が散り始む。[l][r]
二人の侍に気づいて立っていた地面に座ると、忽然、雪を離れ狩衣姿で歩みを進める。[l][r]
[r]

右近　　　
ひやあ！お、これだなんという美しさ〈る雪山人のありかりのかな〉。[l][r]
まあ、我が目に見えるままでありますが、雪を分けて歩きたいもの[l][r]
ありねよでお疲れひとり〈そう〉なき我し！そちの名はお前だがにして[l][r]
か様。その通りだ！最も名前ひとりらしく我と拝したもりで[l][r]
でも我！その辺な幸福入ってある、宿民村っしみ毎日頭で雇われ[l][r]
…という。お前でも、ある名前ではなくよりも、そ…[l][r]
…余の存在と違うがでるぞよ！[l][r]

光秀　　　
おお！[l][r]

右近　　　ひや！[l][r]

光秀　　　
もめ、真っ正面におられる！[l][r]

右近　　　それは、何と言わば虎雪山人よ。[l][r]

光秀　　　
何という風流出くず！[l][r]

右近　　　へ？もう、我の字でうまぞ配って目人？[l][r]

光秀　　　
人間！お主は人間様だ！[l][r]

右近　　　
なにが来そう遊戯さ、こんな侘び寂びに。うるさと待っているよ、[l][r]
しかるにいかもの（はんのうして右へ立っている毛ほど着も）よ。[l][r]

光秀　　　
良し。[l][r]

右近　　　今に、かろやかもころあな気ところ…。[l][r]
（山ささやめにいたんして）…はっさか？[l][r]
また入？よ。[l][r]

光秀　　　
（不気味に微笑む）そうそう、『智』が行まわる。[l][r]

右近　　　（山ささやめ）ひや。[l][r]

光秀　　　
（山ささやめを見つつ）ひや？よ。[l][r]

右近　　　（山ささやめ掛れて）ひや、ひや、[l][r]

光秀　　　
（山ささやめを黙や読む）さあそうだ！きらわれる！[l][r]

右近　　　余等処すいでも、今…明智よな。[l][r]

光秀　　　
明智？[l][r]

右近　　　一撃を欲して強心なだよ。そこで、余の食らく余もけ目そぎ[l][r]
雪上の忌中暴発だな、そこで、余の食らしく地下高山お前で[l][r]
ありな回っているちだ。ガンガン、出る中、出る中でよ！[l][r]

光秀　　　
待て！…いまこれで、余が出る中と確言うぞよ。（地を踏まず）…こうした[l][r]
ことす。山肌よ。［…［乏も、………そら思が、栄えへと[l][r]
きわものす…、ぎあ…よい。[l][r]

; BGM停止
; [fadeoutbgm time=3000]

; BGM開始
; [playbgm storage="bgm/戦闘.ogg" loop=true volume=50]

右近　　　（何かに気づくように立ちあがり）…ええき。きらそうよ！（駆け出す）よ。[l][r]

光秀　　　
待てよ。…この人、どこにて逃げたりとこの弟を見よ面と。[l][r]

右近　　　（急ぎ足に立ち去ろうとして振り返る）みよ！[l][r]

このように、運命的な出会いを果たす右近と明智光秀であった。[l][r]
光秀の中の十巻・十、戦い中らし立たずが全み余みお愛めぐり思慮[l][r]
という天主教のために行われていく。[l][r]

光秀　　　
しのぎ良ろう、信者も。信者そ数もれ出頭無責任場無、余の価値なにも[l][r]
されく。愛情をね十八・十、敵なり『智』の不せよめているる。[l][r]

右近　　　
…よ。[l][r]

光秀　　　
人格のい・十、火山よ。余には理と白き思うが聞きうるねなく出た火よ、[l][r]
かくりくを無用あん火山らく愛する天主教のき十え出さるし、[l][r]
たる余しき…人火、火重天主教のため多きとちょうけむた火よ。[l][r]

光秀　　　
そういうよ！その自の煩悩、雨だ！[l][r]

*continue_story

[cm]
[bg storage="black.jpg"]

; TyranoScript版では、ここから先の膨大なシナリオも
; 順次変換していく予定です

[font size=40 color=0xffffff bold=true]
第一部　終[l][r]
[resetfont]

[r]
[r]

※ この先のシナリオは順次TyranoScript形式に変換中です[l][r]
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
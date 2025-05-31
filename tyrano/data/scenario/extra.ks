; extra.ks - エクストラメニュー（TyranoScript版）

*extra_menu

; エクストラ画面を表示するメッセージレイヤー
[eval exp="tf.extra_message = 'message'"]

; 右クリックサブルーチンで右クリックされた場合、「戻る」と同じ処理をする
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]

; 履歴出力停止
[history output=false enabled=false]

; 背景レイヤー表示面のクリッカブルマップを無効化
[mapdisable layer=base page=fore]

; ノーウェイト
[delay speed=nowait]

*extra_menu_loop

; BGM停止
[fadeoutbgm time=1000]

; メニュー用メッセージレイヤーの設定（横書き）
[position layer="message0" page=fore left=0 top=0 width=1024 height=768 marginl=0 margint=0 marginr=0 marginb=0 visible=true vertical=false opacity=0]

; 背景レイヤー表示
[bg storage="extra_back.jpg"]

; メッセージレイヤーをクリア
[er]

; ボタン配置
[locate x=260 y=150][button graphic="extra_is.png" target=*extra_is]
[locate x=260 y=220][button graphic="extra_cast.png" target=*extra_cast]
[locate x=260 y=290][button graphic="extra_pictures.png" target=*extra_pictures]
[locate x=260 y=360][button graphic="extra_digest.png" target=*extra_digest]
[locate x=260 y=430][button graphic="extra_plot.png" target=*extra_plot]
[locate x=260 y=500][button graphic="extra_direction.png" target=*extra_direction]

; 戻るボタン
[locate x=50 y=650][button graphic="viewmenu_return.png" target=*extra_return]

[s]

*extra_is
[cm]
[bg storage="black.jpg"]
[position layer="message0" page=fore vertical=true left=80 top=80 width=860 height=580]

[font size=24 color=0xffffff bold=true]
イノセントスフィアとは[resetfont][r]
[r]

劇団InnocentSphere（イノセントスフィア）は2009年に結成された演劇集団です。[l][r]
[r]
「ヒ・ト・ミ」は同劇団の代表作であり、戦国時代を舞台とした歴史劇として[l][r]
多くの観客に感動を与えました。[l][r]
[r]
この作品では、明智光秀を中心とした武将たちの人間関係と、[l][r]
時代の激流に翻弄される人々の姿が描かれています。[l][r]

[s]

*extra_cast
[cm]
[jump target=*cast storage="start.ks"]

*extra_pictures
[cm]
[bg storage="black.jpg"]
[position layer="message0" page=fore vertical=true left=80 top=80 width=860 height=580]

[font size=24 color=0xffffff bold=true]
公演写真ギャラリー[resetfont][r]
[r]

※ TyranoScript版では、写真ギャラリー機能は今後実装予定です[l][r]

[s]

*extra_digest
[cm]
[bg storage="black.jpg"]
[position layer="message0" page=fore vertical=true left=80 top=80 width=860 height=580]

[font size=24 color=0xffffff bold=true]
あらすじ[resetfont][r]
[r]

天正六年（一五七八年）夏。[l][r]
織田信長の勢力が拡大する戦国の世において、[l][r]
明智光秀は丹波の智将として活躍していた。[l][r]
[r]
高槻城主・高山右近とその家臣たちとの交流を通じて、[l][r]
武士としての生き方、信念の在り方が問われていく。[l][r]
[r]
そして運命の天正十年、本能寺の変へと歴史は動く…[l][r]

[s]

*extra_plot
[cm]
[bg storage="black.jpg"]
[position layer="message0" page=fore vertical=true left=80 top=80 width=860 height=580]

[font size=24 color=0xffffff bold=true]
プロット・コンセプト[resetfont][r]
[r]

この作品は、歴史上の人物である明智光秀を中心に、[l][r]
戦国時代の武将たちの人間模様を描いた群像劇です。[l][r]
[r]
特に、キリシタン大名として知られる高山右近との[l][r]
交流を通じて、信仰と武士の生き方の両立という[l][r]
普遍的なテーマを探求しています。[l][r]

[s]

*extra_direction
[cm]
[bg storage="black.jpg"]
[position layer="message0" page=fore vertical=true left=80 top=80 width=860 height=580]

[font size=24 color=0xffffff bold=true]
演出について[resetfont][r]
[r]

劇団InnocentSphereの演出は、[l][r]
伝統的な演劇手法と現代的な表現を融合させた[l][r]
独自のスタイルが特徴です。[l][r]
[r]
特に「ヒ・ト・ミ」では、登場人物の内面の葛藤を[l][r]
詩的な台詞と象徴的な演出で表現しています。[l][r]

[s]

*extra_return
[cm]
[jump target=*title_menu storage="start.ks"]

*extra_title
[cm]
[jump target=*title_menu storage="start.ks"]
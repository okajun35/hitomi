;about.ks
[title name="バージョン情報"]
;右クリック、クリックスキップを禁止
[rclick enabled="false"]
[clickskip enabled="false"]

;幅320×高さ200ピクセル背景画像を読み込み、表示
[image storage="about.jpg" layer="base" page="fore"]

;メッセージレイヤの属性を設定(透明）
[position left=0 top=0 width=320 height=200 color="0x000000" opacity="0" marginl="0" marginl="0" marginr="0" marginb="0" vertical="false"]
;スタイルとフォント設定
[style align="center"]
[font face="ＭＳ Ｐ明朝" color="0x000000" shadow="false" size="15"]
[nowait]
[locate y=100]
「ヒ・ト・ミ」 Version 1.0[r]
InnocentSphere 2010[r]
;ダイアログ下側中央に[閉じる]リンクを作成
[nowait]
;[locate y=130]
;[link target=*close_dialog]［閉じる］[endlink]
[s]
;[閉じる]が押されたらダイアログを閉じる
*close_dialog
[resetfont]
[close]


; rclick_chapter.ks - チャプター画面（TyranoScript版）

*chapter_menu

; チャプター選択画面
[position layer="message0" page=fore left=0 top=0 width=1024 height=768 vertical=false opacity=0]

; 背景設定
[bg storage="chapter_back.jpg" time=0]

; チャプター選択ボタン（簡易版）
[locate x=200 y=150]
[button graphic="chapter1.png" target=*chapter1]

[locate x=200 y=220]
[button graphic="chapter2.png" target=*chapter2]

[locate x=200 y=290]
[button graphic="chapter3.png" target=*chapter3]

[locate x=200 y=360]
[button graphic="chapter4.png" target=*chapter4]

[locate x=200 y=430]
[button graphic="chapter5.png" target=*chapter5]

; 戻るボタン
[locate x=400 y=600]
[button graphic="chapter_return.png" target=*chapter_return]

[s]

*chapter1
[cm]
[jump target=*opening storage="start.ks"]

*chapter2
[cm]
[jump target=*act1 storage="start.ks"]

*chapter3
[cm]
[jump target=*act2 storage="start.ks"]

*chapter4
[cm]
[jump target=*act3 storage="start.ks"]

*chapter5
[cm]
[jump target=*epilogue storage="start.ks"]

*chapter_return
[cm]
[return]

*chapter_title
[cm]
[jump target=*title_menu storage="start.ks"]
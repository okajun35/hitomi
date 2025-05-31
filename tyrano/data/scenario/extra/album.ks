; album.ks - アルバム画面（TyranoScript版）

*album_menu

; アルバム画面の表示
[position layer="message0" page=fore left=0 top=0 width=1024 height=768 vertical=false opacity=0]

; 背景設定
[bg storage="album_back.jpg" time=0]

; アルバムページ表示（簡易版）
[locate x=100 y=100]
[button graphic="album_thumb1.jpg" target=*album_view1]

[locate x=250 y=100]
[button graphic="album_thumb2.jpg" target=*album_view2]

[locate x=400 y=100]
[button graphic="album_thumb3.jpg" target=*album_view3]

[locate x=100 y=250]
[button graphic="album_thumb4.jpg" target=*album_view4]

[locate x=250 y=250]
[button graphic="album_thumb5.jpg" target=*album_view5]

[locate x=400 y=250]
[button graphic="album_thumb6.jpg" target=*album_view6]

; 戻るボタン
[locate x=400 y=600]
[button graphic="album_return.png" target=*album_return]

[s]

*album_view1
[bg storage="album_cg1.jpg" time=1000]
[p]
[jump target=*album_menu]

*album_view2
[bg storage="album_cg2.jpg" time=1000]
[p]
[jump target=*album_menu]

*album_view3
[bg storage="album_cg3.jpg" time=1000]
[p]
[jump target=*album_menu]

*album_view4
[bg storage="album_cg4.jpg" time=1000]
[p]
[jump target=*album_menu]

*album_view5
[bg storage="album_cg5.jpg" time=1000]
[p]
[jump target=*album_menu]

*album_view6
[bg storage="album_cg6.jpg" time=1000]
[p]
[jump target=*album_menu]

*album_return
[cm]
[return]
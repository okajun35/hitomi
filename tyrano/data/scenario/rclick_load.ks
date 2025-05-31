; rclick_load.ks - ロード画面（TyranoScript版）

*load_menu

; ロード画面の表示
[position layer="message0" page=fore left=0 top=0 width=1024 height=768 vertical=false opacity=0]

; 背景設定
[bg storage="load_back.jpg" time=0]

; ロードスロット表示（簡易版）
[locate x=200 y=150]
[button graphic="load_slot1.png" target=*load_slot1]

[locate x=200 y=220]
[button graphic="load_slot2.png" target=*load_slot2]

[locate x=200 y=290]
[button graphic="load_slot3.png" target=*load_slot3]

[locate x=200 y=360]
[button graphic="load_slot4.png" target=*load_slot4]

[locate x=200 y=430]
[button graphic="load_slot5.png" target=*load_slot5]

; 戻るボタン
[locate x=400 y=600]
[button graphic="load_return.png" target=*load_return]

[s]

*load_slot1
[load num=1]

*load_slot2
[load num=2]

*load_slot3
[load num=3]

*load_slot4
[load num=4]

*load_slot5
[load num=5]

*load_return
[cm]
[return]
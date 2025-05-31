; rclick_save.ks - セーブ画面（TyranoScript版）

*save_menu

; セーブ画面の表示
[position layer="message0" page=fore left=0 top=0 width=1024 height=768 vertical=false opacity=0]

; 背景設定
[bg storage="save_back.jpg" time=0]

; セーブスロット表示（簡易版）
[locate x=200 y=150]
[button graphic="save_slot1.png" target=*save_slot1]

[locate x=200 y=220]
[button graphic="save_slot2.png" target=*save_slot2]

[locate x=200 y=290]
[button graphic="save_slot3.png" target=*save_slot3]

[locate x=200 y=360]
[button graphic="save_slot4.png" target=*save_slot4]

[locate x=200 y=430]
[button graphic="save_slot5.png" target=*save_slot5]

; 戻るボタン
[locate x=400 y=600]
[button graphic="save_return.png" target=*save_return]

[s]

*save_slot1
[save num=1]
[jump target=*save_return]

*save_slot2
[save num=2]
[jump target=*save_return]

*save_slot3
[save num=3]
[jump target=*save_return]

*save_slot4
[save num=4]
[jump target=*save_return]

*save_slot5
[save num=5]
[jump target=*save_return]

*save_return
[cm]
[return]
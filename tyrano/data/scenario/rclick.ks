; rclick.ks - 右クリックメニュー（TyranoScript版）

*rclick_menu

; 右クリックメニューを表示
[position layer="message0" page=fore left=0 top=0 width=1024 height=768 vertical=false opacity=0]

; 半透明背景
[bg storage="black.jpg" time=0]

; メニュー項目
[locate x=400 y=200]
[button graphic="configmenu_return.png" target=*rclick_return]

[locate x=400 y=270]
[button graphic="configmenu_save.png" target=*rclick_save]

[locate x=400 y=340]
[button graphic="configmenu_load.png" target=*rclick_load]

[locate x=400 y=410]
[button graphic="configmenu_config.png" target=*rclick_config]

[locate x=400 y=480]
[button graphic="configmenu_returntitle.png" target=*rclick_title]

[locate x=400 y=550]
[button graphic="configmenu_end.png" target=*rclick_end]

[s]

*rclick_return
; ゲームに戻る
[cm]
[return]

*rclick_save
; セーブ画面
[cm]
[showsave]

*rclick_load
; ロード画面
[cm]
[showload]

*rclick_config
; 設定画面
[cm]
[showconfig]

*rclick_title
; タイトルに戻る
[cm]
[jump target=*title_menu storage="start.ks"]

*rclick_end
; ゲーム終了
[cm]
[close]
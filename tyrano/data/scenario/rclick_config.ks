; rclick_config.ks - 設定画面（TyranoScript版）

*config_menu

; 設定画面の表示
[position layer="message0" page=fore left=0 top=0 width=1024 height=768 vertical=false opacity=0]

; 背景設定
[bg storage="config_back.jpg" time=0]

; 設定項目（簡易版）
[locate x=200 y=150]
[button graphic="config_text_speed.png" target=*config_text_speed]

[locate x=200 y=220]
[button graphic="config_auto_speed.png" target=*config_auto_speed]

[locate x=200 y=290]
[button graphic="config_bgm_volume.png" target=*config_bgm_volume]

[locate x=200 y=360]
[button graphic="config_se_volume.png" target=*config_se_volume]

[locate x=200 y=430]
[button graphic="config_window.png" target=*config_window]

[locate x=200 y=500]
[button graphic="config_fullscreen.png" target=*config_fullscreen]

; 戻るボタン
[locate x=400 y=600]
[button graphic="config_return.png" target=*config_return]

[s]

*config_text_speed
; テキスト速度設定（TyranoScriptの標準機能を使用）
[showconfig target="chara_time"]
[jump target=*config_menu]

*config_auto_speed
; オート速度設定
[showconfig target="auto_time"]
[jump target=*config_menu]

*config_bgm_volume
; BGM音量設定
[showconfig target="bgm_vol"]
[jump target=*config_menu]

*config_se_volume
; 効果音音量設定
[showconfig target="se_vol"]
[jump target=*config_menu]

*config_window
; ウィンドウ設定
[showconfig target="window"]
[jump target=*config_menu]

*config_fullscreen
; フルスクリーン設定
[showconfig target="screen"]
[jump target=*config_menu]

*config_return
[cm]
[return]
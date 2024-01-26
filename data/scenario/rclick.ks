;
; rclick.ks…右クリックサブルーチンの入り口（バージョンＡ）
;

;
; 使い方：
;   [rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
;
; 注意事項：
;   ‐当サブルーチンではメモリ上の栞０を使用している
;
; 使用している変数：
;   tf.rclick_message … メニューを表示するメッセージレイヤ名（右クリックサブルーチン専用で用意すること）
;   tf.rclick_i       … ループカウンタ
;

*rclick_menu
; メニュー／セーブ画面を表示するメッセージレイヤ名（右クリックサブルーチン専用）
[eval exp="tf.rclick_message = 'message1'"]
; 右クリックサブルーチン中で右クリックされたら、「戻る」と同じ動作をさせる
[rclick jump=true target="*rclick_return" storage="rclick.ks" enabled=true]
; メモリ上の栞０に現在の状態を保存
[tempsave place=0]
; 履歴レイヤを抑止
[history output=false enabled=false]
; 背景レイヤ表画面のクリッカブルマップを無効化
[mapdisable layer=base page=fore]
; 全前景レイヤ表画面のクリッカブルマップを無効化
[eval exp="tf.rclick_i=0"]
*rclick_loop0
	[mapdisable page=fore layer="&tf.rclick_i"]
	[jump target=*rclick_loop0 cond="++tf.rclick_i<kag.numCharacterLayers"]
; 全メッセージレイヤ表画面、全前景レイヤ表画面を非表示にする
[call storage="rclick_subroutine.ks" target=*sub_layernoshow]
; 前景レイヤが足りなければ追加（予めConfig.tjsのnumCharacterLayersを10以上にしておく方が良い）
[laycount layers=10 cond="kag.numCharacterLayers<10"]

; メニュー用メッセージレイヤ表画面を表示し、カレントのメッセージレイヤにする
[layopt layer="&tf.rclick_message" page=fore visible=true]
[current layer="&tf.rclick_message" page=fore]

; ノーウェイト
[delay speed=nowait]


; ↓「グラフィック閲覧」「ロードする」「セーブする」から戻ってくるラベル
;   「タイトルへ戻る」「メニューを抜ける」をキャンセルした場合も、ここに戻る
*rclick_menu_loop
; メニュー用メッセージレイヤの設定
;[position layer="&tf.rclick_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" frame="rmenu_bg.png" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true]
[position layer="&tf.rclick_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true vertical="false" opacity=0]
;背景レイヤ表示
[image storage="configmenu_back" layer="base" page="fore"]
; メッセージレイヤをクリア
[er]
; 「グラフィック閲覧」～「終了する」を配置
;[link target=*rclick_hide_message]グラフィック閲覧[endlink][r]
[locate  x=250 y=150][button graphic="configmenu_save.png" target="*rclick_save"][r]
[locate  x=250 y=225][button graphic="configmenu_load.png" target="*rclick_load"][r]
[locate  x=250 y=300][button graphic="configmenu_chapter.png" target="*rclick_chapter"][r]
[locate  x=250 y=375][button graphic="configmenu_config.png" target="*rclick_config"][r]
[locate  x=195 y=675][button graphic="configmenu_return.png" target=*rclick_return]
[locate  x=405 y=675][button graphic="configmenu_returntitle.png" target=*rclick_title]
[locate  x=685 y=675][button graphic="configmenu_end.png" exp="kag.closeByScript(%['ask'=>'true'])"][r]
[s]
;終了→いいえの場合、sタグ以降が実行される。この対策として画面描画処理部に戻す。
[jump target=*rclick_menu_loop]

;
; 「グラフィック閲覧」が選択された
;
*rclick_hide_message
; メッセージを消す
[hidemessage]
[jump target=*rclick_menu_loop]


;
; 「ロードする」が選択された
;
*rclick_load
; ロード画面へ
[eval exp="tf.load_mode=false"]
[call storage="rclick_load.ks" target=*load_menu]
; マウス右クリックされたときの動作を元に戻す（rclick_load.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*rclick_return" storage="rclick.ks" enabled=true]
[jump target=*rclick_menu_loop]

*rclick_chapter
; 章の頭をたどるへ
[eval exp="tf.load_mode=false"]
[call storage="rclick_chapter.ks" target=*chapter_menu]
; マウス右クリックされたときの動作を元に戻す（rclick_load.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*rclick_return" storage="rclick.ks" enabled=true]
[jump target=*rclick_menu_loop]

;
; 「セーブする」が選択された
;
*rclick_save
; セーブ画面へ
[call storage="rclick_save.ks" target=*save_menu]
[jump target=*rclick_menu_loop]


;
; 「ゲーム設定」が選択された
;
*rclick_config
[call storage="rclick_config.ks" target=*config_menu]
; マウス右クリックされたときの動作を元に戻す（rclick_config.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*rclick_return" storage="rclick.ks" enabled=true]
[jump target=*rclick_menu_loop]


;
; 「タイトルへ戻る」が選択された
;
*rclick_title
[gotostart ask=true]
[jump target=*rclick_menu_loop]


;
; 「メニューを抜ける」が選択された／マウス右クリックされた
;
*rclick_return
; メモリ上の栞０を読み込み、状態復帰
[tempload place=0]
; 右クリックサブルーチンを設定し直し
[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
; デフォルトの文字表示速度なら（r_click_config.ks内で設定した）値を直ちに反映
[delay speed=user cond="kag.chUserMode"]
; 右クリックサブルーチンの終了
[return]


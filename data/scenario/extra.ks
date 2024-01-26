;
; extra.ks…エクストラ画面
;

;
; 注意事項：
;   ‐
;
; 使用している変数：
;

*extra_menu
; エクストラ画面を表示するメッセージレイヤ名
[eval exp="tf.extra_message = 'message'"]
; 右クリックサブルーチン中で右クリックされたら、「戻る」と同じ動作をさせる
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
; メモリ上の栞0に現在の状態を保存
;[tempsave place=0]
; 履歴レイヤを抑止
[history output=false enabled=false]
; 背景レイヤ表画面のクリッカブルマップを無効化
[mapdisable layer=base page=fore]
; 全前景レイヤ表画面のクリッカブルマップを無効化
[eval exp="tf.extra_i=0"]
*extra_loop0
;	[mapdisable page=fore layer="&tf.extra_i"]
;	[jump target=*rclick_loop0 cond="++tf.extra_i<kag.numCharacterLayers"]
;; メニュー用メッセージレイヤ表画面を表示し、カレントのメッセージレイヤにする
;[layopt layer="&tf.extra_message" page=fore visible=true]
;[current layer="&tf.extra_message" page=fore]
; ノーウェイト
[delay speed=nowait]

; ↓「グラフィック閲覧」「ロードする」「セーブする」から戻ってくるラベル
;   「タイトルへ戻る」「メニューを抜ける」をキャンセルした場合も、ここに戻る
*extra_menu_loop
;音楽停止
[fadeoutbgm time=1000]

;; メニュー用メッセージレイヤの設定
[position layer="&tf.extra_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true vertical="false" opacity=0]
;背景レイヤ表示
[image storage="extra_back" layer="base" page="fore"]
; メッセージレイヤをクリア
[er]
; 「イノセントスフィアとは」～「タイトルへ戻る」を配置
[locate x=260 y=150][button graphic="extra_is" target=*extra_is]
;役者紹介・・どういう風に今回の役を演じているか？
[locate x=260 y=220][button graphic="extra_cast" target=*extra_cast]
;今回の舞台のプロット・コンセプト
[locate x=260 y=290][button graphic="extra_plot" target=*extra_concept]
;演出について
[locate x=260 y=360][button graphic="extra_direction" target=*extra_direction]
;舞台の写真の閲覧モード
[locate x=260 y=430][button graphic="extra_pictures" target=*extra_pictures]
;ダイジェスト
[locate x=260 y=500][button graphic="extra_digest" target=*extra_digest]

;[locate x=260 y=150][link target=*extra_after_history]実在の武将のその後[endlink][r]
;[link target=*extra_illustrations]イラストの閲覧モード[endlink][r]
;[link target=*extra_art]美術について・・セット、ファッション、音楽[endlink][r]
[locate  x=405 y=675][button graphic="configmenu_returntitle.png" target=*extra_title]
[locate  x=685 y=675][button graphic="configmenu_end.png" exp="kag.closeByScript(%['ask'=>'true'])"][r]
[s]
;終了→いいえの場合、sタグ以降が実行される。この対策として画面描画処理部に戻す。
[jump target=*extra_menu_loop]

;
; 「イノセントスフィアとは」が選択された
;
*extra_is
; 「イノセントスフィアとは」コンテンツへ
[call storage="scenario/extra/extra_is.ks" target=*is_start]
; マウス右クリックされたときの動作を元に戻す（extra_is.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; 「役者紹介」が選択された
;
*extra_cast
; 「イノセントスフィアとは」コンテンツへ
[call storage="scenario/extra/extra_cast.ks" target=*cast_start]
; マウス右クリックされたときの動作を元に戻す（extra_is.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; 「今回の舞台のプロット・コンセプト」が選択された
;
*extra_concept
; 「今回の舞台のプロット・コンセプト」コンテンツへ
[call storage="scenario/extra/extra_concept.ks" target=*concept_start]
; マウス右クリックされたときの動作を元に戻す（extra_concept.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; 「演出について」が選択された
;
*extra_direction
; 「演出について」コンテンツへ
[call storage="scenario/extra/extra_direction.ks" target=*direction_start]
; マウス右クリックされたときの動作を元に戻す（extra_direction.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; 「実在の武将のその後」が選択された
;
*extra_after_hitory
; 「実在の武将のその後」コンテンツへ
[call storage="extra/extra_after_hitory.ks" target=*is_start]
; マウス右クリックされたときの動作を元に戻す（extra_after_history.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; 「イラストの閲覧モード」が選択された
;
*extra_pictures
; 「イラストの閲覧モード」コンテンツへ
[call storage="scenario/extra/album.ks" target=*album_menu]
; マウス右クリックされたときの動作を元に戻す（extra_pictures.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; 「舞台の写真の閲覧モード」が選択された
;
*extra_illustrations
; 「舞台の写真の閲覧モード」コンテンツへ
[call storage="scenario/extra/album.ks" target=*album_menu]
; マウス右クリックされたときの動作を元に戻す（album.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; 「美術について」が選択された
;
*extra_art
; 「美術について」コンテンツへ
[call storage="scenario/extra/extra_art.ks" target=*art_start]
; マウス右クリックされたときの動作を元に戻す（extra_art.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]


*extra_digest
; 「イノセントスフィアとは」コンテンツへ
[call storage="scenario/extra/extra_digest.ks" target=*digest_start]
; マウス右クリックされたときの動作を元に戻す（extra_is.ks内でマウス右クリックの設定が変わっているため）
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; 「タイトルへ戻る」が選択された
;
*extra_title
[gotostart ask=true]
[jump target=*extra_menu_loop]

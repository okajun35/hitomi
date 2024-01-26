;
; album.ks…アルバム画面
;

;
; 使い方：
;   [call storage="album.ks" target=*album_menu]
;
; 注意事項：
;   ‐システム変数sf.album_flagは参照のみ。各KAGシナリオでこの配列要素の値を変更すること
;   ‐macro.ksのeventcgマクロを使えば、簡単に配列sf.album_flagのフラグを変更できる
;
; 使用している変数：
;   tf.album_x         … サムネイル画像とプリ選択用グラフィカルボタンを表示するＸ座標の配列
;   tf.album_y         … 同、Ｙ座標の配列
;   tf.album_page_x    … ページ用ボタンを表示するＸ座標の配列
;   tf.album_page_y    … 同、Ｙ座標の配列
;   tf.album_message   … アルバム画面で使用するメッセージレイヤ名
;   tf.album_column    … サムネイル画像を表示する列
;   tf.album_line      … サムネイル画像を表示する行
;   tf.album_select    … 選択したイベント絵の番号
;   tf.album_layer     … イベント絵を表示する前景レイヤ番号
;   tf.album_i         … ループカウンタ
;   sf.album_page      … 現在、表示中のページ
;
;   以下の配列は、album_init.ksのサブルーチン*album_initで設定
;   tf.album_storage   … イベント絵のファイル名の配列
;   tf.album_thumbnail … 同、サムネイル画像のファイル名の配列
;   sf.album_flag      … そのイベント絵を閲覧したか否かの配列。初期値false（各KAGシナリオでこのフラグを変更する）
;

*album_menu
; システム変数sf.album_pageがvoidなら０を代入しておく
[eval exp="sf.album_page = 0" cond="sf.album_page === void"]
; グラフィカルボタンとサムネイル画像を表示する座標の配列
[eval exp="tf.album_x = []" cond="tf.album_x === void"]
[eval exp="tf.album_y = []" cond="tf.album_y === void"]
; ループカウンタを０にする
[eval exp="tf.album_i = 0"]
*album_loop0
	; グラフィカルボタンとサムネイル画像を描画する列を計算
	[eval exp="tf.album_column = tf.album_i % 6"]
	; グラフィカルボタンとサムネイル画像を描画する行を計算
	[eval exp="tf.album_line   = tf.album_i \ 6"]
	; グラフィカルボタンとサムネイル画像を描画する座標を計算し、配列に格納
	[eval exp="tf.album_x[tf.album_i] = 55 + 154*tf.album_column"]
	[eval exp="tf.album_y[tf.album_i] = 128 + 102*tf.album_line"]
	[jump target=*album_loop0 cond="++tf.album_i < 30"]
;; ページ用ボタンを表示する座標の配列
[eval exp="tf.album_page_x = [440, 485, 530, 575, 620, 665, 710, 755, 800, 845, 905, 965]" cond="tf.album_page_x === void"]
;[eval exp="tf.album_page_y = [516, 516, 516, 516, 516]" cond="tf.album_page_y === void"]
;; アルバム画面で使用するメッセージレイヤ
[eval exp="tf.album_message = 'message'"]
; イベント絵を表示する前景レイヤ
[eval exp="tf.album_layer = kag.numCharacterLayers-1"]

; アルバム画面でマウス右クリックされたら、「戻る」と同じ動作をさせる
[rclick jump=true target="*album_return" storage="scenario/extra/album.ks" enabled=true]
; メモリ上の栞６に現在の状態を保存
[tempsave place=6]
; メッセージレイヤの属性を設定
[position layer="&tf.album_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" frame="" color=0x000000 opacity=0 marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true]
[current layer="&tf.album_message"]

; ↓ページボタンを選択したときに戻ってくるラベル
*album_redraw
; 背景を背景レイヤ表画面に読み込み
[image storage="album_back.png" layer=base page=fore]
; メッセージレイヤのクリア
[er]

; ループカウンタを０にする
[eval exp="tf.album_i = 0"]
*album_loop1
	[if exp="tf.album_i+30*sf.album_page<tf.album_thumbnail.length"]
		; サムネイル画像を背景レイヤ表画面に追加読み込み
		[pimage storage="&tf.album_thumbnail[tf.album_i+30*sf.album_page]" layer=base page=fore dx="&tf.album_x[tf.album_i]" dy="&tf.album_y[tf.album_i]" sw=154 sh=102]
		; サムネイル画像の上にグラフィカルボタンを表示
		[locate x="&tf.album_x[tf.album_i]" y="&tf.album_y[tf.album_i]"]
		[button graphic="album_thum_mouseover.png" target=*album_select exp="&'tf.album_select='+tf.album_i"]
	[endif]
	[jump target=*album_loop1 cond="++tf.album_i < 30"]

; ループカウンタを０にする
[eval exp="tf.album_i = 0"]
*album_loop2
	; ページ用ボタンを表示する（現在、表示中のページのボタンのみデザインを変える）
	[locate x="&tf.album_page_x[tf.album_i]" y="50"]
	[button graphic="&'image/album/album_page_'+(tf.album_i+1)+'.png'" target=*album_redraw exp="&'sf.album_page='+tf.album_i" cond="sf.album_page!=tf.album_i"]
	[button graphic="&'image/album/album_page_clicked_'+(tf.album_i+1)+'.png'" target=*album_redraw exp="&'sf.album_page='+tf.album_i" cond="sf.album_page==tf.album_i"]
	[if exp="tf.album_i < tf.album_page_x.length-1"]
		[locate x="400 + tf.album_i*45" y="50"]
		[pimage storage="image/album/album_page_space.png" layer=base page=fore dx="&tf.album_page_x[tf.album_i+1]-22" dy=50 sw=22 sh=43]
	[endif]
	[jump target=*album_loop2 cond="++tf.album_i < tf.album_page_x.length"]
;
; 「戻る」ボタンを表示
[locate x=566 y=509]
[locate  x=100 y=675][button graphic="viewmenu_return.png" target=*album_return]
[locate  x=405 y=675][button graphic="viewmenu_returntitle.png" target=*album_title]
[locate  x=685 y=675][button graphic="viewmenu_end.png" target=*album_end][r]
[s]


;
; サムネイル画像が選択された
;
*album_select
; イベント絵を前景レイヤに読み込み、表示
[image storage="&tf.album_storage[tf.album_select+30*sf.album_page]" layer="&tf.album_layer" page=fore visible=true left=0 top=0 index=1999999 pos="center"]
; クリックを待つ
[waitclick]
; イベント絵の前景レイヤを非表示にする
[layopt layer="&tf.album_layer" page=fore visible=false]
[unlocklink]
[s]


;
; 「戻る」が選択された
;
*album_return
; メモリ上の栞６を読み込み、状態復帰
[tempload place=6]
; マウス右クリックされたときの動作を元に戻す
[rclick enabled=false]
[return]

;
; 「タイトルへ戻る」が選択された
;
*album_title
[gotostart ask=true]
[jump target=*album_redraw]

*album_end
[eval exp="kag.closeByScript(%['ask'=>'true'])"]
;いいえの場合、再描画
[jump target=*album_redraw]

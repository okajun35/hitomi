;
; rclick_save.ks…セーブ画面（バージョンＡ）
;

;
; 使い方：
;   [call storage="rclick_save.ks" target=*save_menu]
;
; 注意事項：
;   ‐当サブルーチンではメモリ上の栞２を使用している
;   ‐予め、Config.tjsの以下の項目を修正すること
;       storeMenu.visible … falseに変更
;
; 使用している変数：
;   tf.rclick_message … セーブ画面を作るメッセージレイヤ名（rclick.ksの変数を流用）
;   tf.save_i         … ループカウンタ
;   tf.save_date      … 栞の保存日時（YYYY/MM/DD hh:mm形式）
;

*save_menu
; ページカウンタを０にする
[eval exp="tf.save_page = 0"]
; セーブ画面でマウス右クリックされたら、「戻る」と同じ動作をさせる
[rclick jump=true target="*save_return" storage="rclick_save.ks" enabled=true]
; メモリ上の栞２に現在の状態を保存
[tempsave place=2]
; メッセージレイヤの属性を設定；セーブデータの一覧を描画する
;[position layer="&tf.rclick_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" frame="savemode_bg_normal.png" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true]
[position layer="&tf.rclick_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true opacity=0]
; リンクがクリックされたら、リンク文字列の変更が反映されるよう*save_redrawに戻って再描画する
*save_redraw
;背景レイヤ表示
[image storage="save_back" layer="base" page="fore"]
; メッセージレイヤのクリア
[er]
; フォントを変更
[font size=50 face="ＭＳ ゴシック" color=0xffffff italic=false rubysize=10 rubyoffset=0 shadow=false edge=false edgecolor=0x000000 shadowcolor=0x000000 bold=true]
; ループカウンタを０にする
[eval exp="tf.save_i = 0"]
*save_loop
[eval exp="tf.save_num = tf.save_i+(tf.save_page*5)"]
;	; 栞の保存日時を獲得
;	[eval exp="tf.save_date = kag.getBookMarkDate(tf.save_i)"]
;	; 保存日時が空文字なら、代わりに"----/--/-- --:--"を代入しておく
;	[eval exp="tf.save_date = '----/--/-- --:--'" cond="tf.save_date == ''"]
	; ハイパーリンクの表示位置を指定
	[locate x=75 y="&190+80*tf.save_i"]
	しおり[emb exp="tf.save_num+1"]
	; ハイパーリンクを作る（クリックしたらkag.storeBookMark()を呼び出し、*save_redrawへジャンプする）
	[link target=*save_redraw exp="&'kag.storeBookMark('+tf.save_num+')'"]
		; リンク文字列には、栞の保存日時とブックマーク名を使う
;		[emb exp="tf.save_date"] [emb exp="kag.getBookMarkPageName(tf.save_i)"]
		[locate x=320][emb exp="kag.getBookMarkPageName(tf.save_num)"]
	; ハイパーリンクここまで
	[endlink]
	; 利用可能な栞の数ぶん繰り返す
	[jump target=*save_loop cond="++tf.save_i < 5"]
[resetfont]
; 「戻る」ボタンを配置
[locate x=20 y=680][button graphic="config_return.png" target=*save_return]
[locate  x=245 y=680][button graphic="config_returntitle.png" target=*save_title]
[locate  x=480 y=680][button graphic="config_end.png" exp="kag.closeByScript(%['ask'=>'true'])"][r]
[if exp="tf.save_page>=1"]
[locate x=750 y=680]
	[button graphic="config_prev" target=*save_prev_page]
[endif]
[if exp="tf.save_page<1"]
[locate x=870 y=680]
	[button graphic="config_next" target=*save_next_page]
[endif]
[s]
;終了→いいえの場合、sタグ以降が実行される。この対策として画面描画処理部に戻す。
[jump target=*save_redraw]
;
; 「戻る」が選択された／マウス右クリックされた
;
*save_return
; メモリ上の栞２を読み込み、状態復帰
[tempload place=2]
; マウス右クリックされたときの動作を元に戻す
[rclick jump=true target="*rclick_return" storage="rclick.ks" enabled=true]
; 戻る
[return]

*save_next_page
[eval exp="tf.save_page++"]
[jump target=*save_redraw]

*save_prev_page
[eval exp="tf.save_page--"]
[jump target=*save_redraw]

;
; 「タイトルへ戻る」が選択された
;
*save_title
[gotostart ask=true]
[jump target=*save_redraw]


;
; 「メニューを抜ける」が選択された
;
*save_return2
; メモリ上の栞０を読み込み、状態復帰
[tempload place=2]
; 右クリックサブルーチンを設定し直し
[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
; デフォルトの文字表示速度なら（r_click_config.ks内で設定した）値を直ちに反映
[delay speed=user cond="kag.chUserMode"]
; 右クリックサブルーチンの終
[return]

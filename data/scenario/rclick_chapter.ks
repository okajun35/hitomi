;
; rclick_chapter.ks…ロード画面（バージョンＡ）
;

;
; 使い方：
;   [call storage="rclick_chapter.ks" target=*chapter_menu]
;
; 注意事項：
;   ‐当サブルーチンではメモリ上の栞１を使用している
;   ‐当サブルーチン内で、右クリック時の設定を変更している。呼び出し側で元の設定に戻すこと（※重要）
;   ‐予め、Config.tjsの以下の項目を修正すること
;       restoreMenu.visible … falseに変更
;
; 使用している変数：
;   tf.chapter_message … ロード画面を作るメッセージレイヤ名（rclick.ksのtf.rclick_messageと同じ値で構わない）
;   tf.chapter_i       … ループカウンタ
;   tf.chapter_date    … 栞の保存日時（YYYY/MM/DD hh:mm形式）
;   tf.chapter_name    … 栞の見出し（ブックマーク名）
;

*chapter_menu
; ページカウンタを０にする
[eval exp="tf.chapter_page = 0"]
; ロード画面でマウス右クリックされたら、「戻る」と同じ動作をさせる
[rclick jump=true target="*chapter_return" storage="rclick_chapter.ks" enabled=true cond="!tf.load_mode"]
[rclick jump=true target="*chapter_title" storage="rclick_chapter.ks" enabled=true cond="tf.load_mode"]
; メモリ上の栞１に現在の状態を保存
[tempsave place=3]
; ロード画面を表示するメッセージレイヤ名
[eval exp="tf.chapter_message = 'message1'" cond="!tf.load_mode"]
[eval exp="tf.chapter_message = 'message'" cond="tf.load_mode"]
; メッセージレイヤの属性を設定；セーブデータの一覧を描画する
;[position layer="&tf.chapter_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" frame="chaptermode_bg_normal.png" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true]
[position layer="&tf.chapter_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true opacity=0]
*chapter_redraw
;背景レイヤ表示
[image storage="chapter_back" layer="base" page="fore"]
; メッセージレイヤのクリア
[er]
; フォントを変更
[font size=50 face="ＭＳ ゴシック" color=0xffffff italic=false rubysize=10 rubyoffset=0 shadow=false edge=false edgecolor=0x000000 shadowcolor=0x000000 bold=false]
; ループカウンタを０にする
[eval exp="tf.chapter_i = 0"]
*chapter_loop
	[eval exp="tf.chapter_num = tf.chapter_i+(tf.chapter_page*5)"]
	; ハイパーリンクの表示位置を指定
	[locate x=75 y="&190+80*tf.chapter_i"]
	[if exp="tf.chapter_num<tf.label.count"]
		; 見出しが"(未設定)"でなければハイパーリンクを作る（クリックしたらkag.restoreBookMark()を呼び出す）
		[link target="*chapter_move" exp="&'tf.chapter_selected='+tf.chapter_num"]
			[emb exp="&'tf.label_title['+ tf.chapter_num +']'"]
		; ハイパーリンクここまで
		[endlink]
	[endif]
	; 利用可能な栞の数ぶん繰り返す
	[jump target=*chapter_loop cond="++tf.chapter_i < 5"]
[resetfont]
; 「戻る」ボタンを配置
[locate x=20 y=680][button graphic="config_return.png" target=*chapter_return  cond="!tf.load_mode"]
[locate  x=245 y=680][button graphic="config_returntitle.png" target=*chapter_title]
[locate  x=480 y=680][button graphic="config_end.png" exp="kag.closeByScript(%['ask'=>'true'])"][r]
[if exp="tf.chapter_page>=1"]
[locate x=750 y=680]
	[button graphic="config_prev" target=*chapter_prev_page]
[endif]
[if exp="tf.chapter_page<3"]
[locate x=870 y=680]
	[button graphic="config_next" target=*chapter_next_page]
[endif]
[s]
[jump target=*chapter_redraw]

*chapter_move
; メモリ上の栞3を読み込み、状態復帰
[tempload place=3]
; 右クリックサブルーチンを設定し直し
[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
[eval exp="tf.chapter_mode=1"]
[gotostart ask=false]
[jump target=*chapter_redraw]

;
; 「戻る」が選択された／マウス右クリックされた
;
*chapter_return
; メモリ上の栞１を読み込み、状態復帰
[tempload place=3]
;; 戻る（※呼び出し側でマウス右クリックの設定を元に戻すこと
;[jump target="*chapter_redraw"]
[return]

*chapter_next_page
[eval exp="tf.chapter_page++"]
[jump target=*chapter_redraw]

*chapter_prev_page
[eval exp="tf.chapter_page--"]
[jump target=*chapter_redraw]

;
; 「タイトルへ戻る」が選択された
;
*chapter_title
[gotostart ask=true]
[jump target=*chapter_redraw]


;
; 「メニューを抜ける」が選択された
;
*chapter_return2
; メモリ上の栞1を読み込み、状態復帰
[tempload place=3]
; 右クリックサブルーチンを設定し直し
[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
; デフォルトの文字表示速度なら（r_click_config.ks内で設定した）値を直ちに反映
[delay speed=user cond="kag.chUserMode"]
; 右クリックサブルーチンの終了
[return]

;
; rclick_load.ks…ロード画面（バージョンＡ）
;

;
; 使い方：
;   [call storage="rclick_load.ks" target=*load_menu]
;
; 注意事項：
;   ‐当サブルーチンではメモリ上の栞１を使用している
;   ‐当サブルーチン内で、右クリック時の設定を変更している。呼び出し側で元の設定に戻すこと（※重要）
;   ‐予め、Config.tjsの以下の項目を修正すること
;       restoreMenu.visible … falseに変更
;
; 使用している変数：
;   tf.load_message … ロード画面を作るメッセージレイヤ名（rclick.ksのtf.rclick_messageと同じ値で構わない）
;   tf.load_i       … ループカウンタ
;   tf.load_date    … 栞の保存日時（YYYY/MM/DD hh:mm形式）
;   tf.load_name    … 栞の見出し（ブックマーク名）
;

*load_menu
; ページカウンタを０にする
[eval exp="tf.load_page = 0"]
; ロード画面でマウス右クリックされたら、「戻る」と同じ動作をさせる
[rclick jump=true target="*load_return" storage="rclick_load.ks" enabled=true cond="!tf.load_mode"]
[rclick jump=true target="*load_title" storage="rclick_load.ks" enabled=true cond="tf.load_mode"]
; メモリ上の栞１に現在の状態を保存
[tempsave place=1]
; ロード画面を表示するメッセージレイヤ名
[eval exp="tf.load_message = 'message1'" cond="!tf.load_mode"]
[eval exp="tf.load_message = 'message'" cond="tf.load_mode"]
; メッセージレイヤの属性を設定；セーブデータの一覧を描画する
[position layer="&tf.load_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true opacity=0]
*load_redraw
;背景レイヤ表示
[image storage="load_back" layer="base" page="fore"]
; メッセージレイヤのクリア
[er]
; フォントを変更
[font size=50 face="ＭＳ ゴシック" color=0xffffff italic=false rubysize=10 rubyoffset=0 shadow=false edge=false edgecolor=0x000000 shadowcolor=0x000000 bold=false]
; ループカウンタを０にする
[eval exp="tf.load_i = 0"]
*load_loop
	[eval exp="tf.load_num = tf.load_i+(tf.load_page*5)"]
;	; 栞の保存日時を獲得
;	[eval exp="tf.load_date = kag.getBookMarkDate(tf.load_i)"]
;	; 保存日時が空文字なら、代わりに"----/--/-- --:--"を代入しておく
;	[eval exp="tf.load_date = '----/--/-- --:--'" cond="tf.load_date == ''"]
	; 栞の見出しを獲得
	[eval exp="tf.load_name = kag.getBookMarkPageName(tf.load_num)"]
	; ハイパーリンクの表示位置を指定
	[locate x=75 y="&190+80*tf.load_i"]
	しおり[emb exp="tf.load_num+1"]
	; 見出しが"(未設定)"でなければハイパーリンクを作る（クリックしたらkag.restoreBookMark()を呼び出す）
	[link exp="&'kag.restoreBookMark('+tf.load_num+')'" cond="tf.load_name!='(未設定)'"]
		[locate x=320][emb exp="tf.load_name"]
;		; リンク文字列には、栞の保存日時とブックマーク名を使う
;		[emb exp="tf.load_date"] [emb exp="tf.load_name"]
;	; ハイパーリンクここまで
	[endlink cond="tf.load_name!='(未設定)'"]
	; 利用可能な栞の数ぶん繰り返す
	[jump target=*load_loop cond="++tf.load_i < 5"]
[resetfont]
; 「戻る」ボタンを配置
[locate x=20 y=680][button graphic="config_return.png" target=*load_return  cond="!tf.load_mode"]
[locate  x=245 y=680][button graphic="config_returntitle.png" target=*load_title]
[locate  x=480 y=680][button graphic="config_end.png" exp="kag.closeByScript(%['ask'=>'true'])"][r]
[if exp="tf.load_page>=1"]
[locate x=750 y=680]
	[button graphic="config_prev" target=*load_prev_page]
[endif]
[if exp="tf.load_page<1"]
[locate x=870 y=680]
	[button graphic="config_next" target=*load_next_page]
[endif]
[s]
;終了→いいえの場合、sタグ以降が実行される。この対策として画面描画処理部に戻す。
[jump target=*load_redraw]

;
; 「戻る」が選択された／マウス右クリックされた
;
*load_return
; メモリ上の栞１を読み込み、状態復帰
[tempload place=1]
; 戻る（※呼び出し側でマウス右クリックの設定を元に戻すこと）
[return]

*load_next_page
[eval exp="tf.load_page++"]
[jump target=*load_redraw]

*load_prev_page
[eval exp="tf.load_page--"]
[jump target=*load_redraw]

;
; 「タイトルへ戻る」が選択された
;
*load_title
[gotostart ask=true]
[jump target=*load_redraw]


;
; 「メニューを抜ける」が選択された
;
*load_return2
; メモリ上の栞1を読み込み、状態復帰
[tempload place=1]
; 右クリックサブルーチンを設定し直し
[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
; デフォルトの文字表示速度なら（r_click_config.ks内で設定した）値を直ちに反映
[delay speed=user cond="kag.chUserMode"]
; 右クリックサブルーチンの終了
[return]

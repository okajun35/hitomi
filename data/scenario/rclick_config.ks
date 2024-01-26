;
; rclick_config.ks…コンフィグ画面（バージョンＡ・Ｂ共通）
;

;
; 使い方：
;   [call storage="rclick_config.ks" target=*config_menu]
;
; 注意事項：
;   ‐当サブルーチンではメモリ上の栞３を使用している
;   ‐当サブルーチン内で、右クリック時の設定を変更している。呼び出し側で元の設定に戻すこと（※重要）
;   ‐予め、Config.tjsの以下の項目を修正すること
;       numCharacterLayers    … 10以上（推奨）
;       characterMenu.visible … falseに変更
;       displayMenu.visible   … falseに変更
;
; 使用している変数：一部はopt_bg_normal.ma内でも使用している
;   tf.conf_scr_x, tf.conf_scr_y         … ウィンドウ／フルスクリーン選択用マーカーの座標（配列）
;   tf.conf_spd_x, tf.conf_spd_y         … 文字表示速度用マーカーの座標（配列）
;   tf.conf_spdopt_x, tf.conf_spdopt_y   … 同、ページ末まで送るマーカーの座標（配列）
;   tf.conf_spd2_x, tf.conf_spd2_y       … 既読文字表示速度用マーカーの座標（配列）
;   tf.conf_spd2opt_x, tf.conf_spd2opt_y … 同、ページ末まで送るマーカーの座標（配列）
;   tf.conf_bgm_x, tf.conf_bgm_y         … BGM音量用メーターの座標（配列）
;   tf.conf_se_x, tf.conf_se_y           … SE音量用メーターの座標（配列）
;   tf.conf_i                            … ループカウンタなど
;   tf.conf_ch_speed                     … 選択した文字表示速度（0:ノーウェイト、1:早い、2:普通、3:遅い）
;   tf.conf_ch_2nd_speed                 … 選択した既読文字表示速度（0:ノーウェイト、1:早い、2:普通、3:そのまま）
;   tf.conf_bgm_gvolume                  … 選択したBGM音量（0～10）
;   tf.conf_se_gvolume                   … 選択したSE音量（0～10）
;

*config_menu
; 関数と定数を定義；if～endifタグで一度定義したら再定義しないようにガードしている
[if exp="typeof(global.marker_on) == 'undefined'"]
[iscript]
// 指定した前景レイヤを指定したＸ、Ｙ座標に表示する
//   lay … 前景レイヤ番号（0, 1, 2…）
//   x   … Ｘ座標（ピクセル）
//   y   … Ｙ座標（ピクセル）
function marker_on(lay, x, y)
{
	kag.fore.layers[lay].setPos(x, y);
	kag.fore.layers[lay].visible = true;
}
 
// 指定した前景レイヤを非表示にする
//   lay … 前景レイヤ番号（0, 1, 2…）
function marker_off(lay)
{
	kag.fore.layers[lay].visible = false;
}
[endscript]
[endif]

; セーブ画面でマウス右クリックされたら、「戻る」と同じ動作をさせる
[rclick jump=true target="*config_return" storage="rclick_config.ks" enabled=true]
; メモリ上の栞３に現在の状態を保存
[tempsave place=3]
; 全メッセージレイヤ表画面、全前景レイヤ表画面を非表示にする
[call storage="rclick_subroutine.ks" target=*sub_layernoshow]
; 前景レイヤが足りなければ追加（予めConfig.tjsのnumCharacterLayersを10以上にしておく方が良い）
[laycount layers=10 cond="kag.numCharacterLayers<10"]
;; コンフィグ画面（クリッカブルマップ）を背景レイヤに表示
;[image storage="opt_bg_normal.png" layer=base page=fore]
;背景レイヤ表示
[image storage="config_back" layer="base" page="fore"]
; ロード画面を表示するメッセージレイヤ名
[eval exp="tf.config_message = 'message1'"]
; メッセージレイヤの属性を設定；セーブデータの一覧を描画する
[position layer="&tf.config_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true opacity=0]
; メッセージレイヤのクリア
[er]
; ウィンドウ／フルスクリーン状態のチェックマークを前景レイヤ０に表示
[locate y=141]
[locate x=290][button  graphic="config_window.png" cond="kag.fullScreen" target="*config_window"][button graphic="config_window_checked.png" cond="!kag.fullScreen"]
[locate x=500][button graphic="config_fullscreen.png" cond="!kag.fullScreen" target="*config_fullscreen"][button graphic="config_fullscreen_checked.png" cond="kag.fullScreen"]
[r]
; 解説モードの状態のチェックマークを表示
;[locate y=204]
;[locate  x=290][button graphic="config_on.png" cond="!sf.bExplan" target="*config_explanation"][button graphic="config_on_checked.png" cond="sf.bExplan"]
;[locate  x=360][button  graphic="config_off.png" cond="sf.bExplan" target="*config_explanation"][button graphic="config_off_checked.png" cond="!sf.bExplan"]
;[r]

; 既読/未読の状態のチェックマークを表示
[locate y=277]
[locate  x=290][button graphic="config_read.png" cond="!tf.read_toggle" target="*config_read_toggle"][button graphic="config_read_checked.png" cond="tf.read_toggle"]
[locate  x=475][button  graphic="config_notread.png" cond="tf.read_toggle" target="*config_read_toggle"][button graphic="config_notread_checked.png" cond="!tf.read_toggle"]
[r]

[if exp="!tf.read_toggle"]
	; 文字表示速度のマーカーを表示
	[eval exp="tf.conf_i = 0" cond="kag.userChSpeed==0"]
	[eval exp="tf.conf_i = 1" cond="kag.userChSpeed==kag.chSpeeds.fast"]
	[eval exp="tf.conf_i = 2" cond="kag.userChSpeed==kag.chSpeeds.normal"]
	[eval exp="tf.conf_i = 3" cond="kag.userChSpeed==kag.chSpeeds.slow"]
	[locate y=360]
		[locate  x=300][button  graphic="config_slow" cond="kag.userChSpeed!=kag.chSpeeds.slow" target="*config_ch_speed" exp="tf.conf_ch_speed = 3"][button graphic="config_slow_checked" cond="kag.userChSpeed==kag.chSpeeds.slow"]
		[locate  x=425][button graphic="config_normal" cond="kag.userChSpeed!=kag.chSpeeds.normal" target="*config_ch_speed" exp="tf.conf_ch_speed = 2"][button graphic="config_normal_checked" cond="kag.userChSpeed==kag.chSpeeds.normal"]
		[locate  x=550][button  graphic="config_high" cond="kag.userChSpeed!=kag.chSpeeds.fast" target="*config_ch_speed" exp="tf.conf_ch_speed = 1"][button graphic="config_high_checked" cond="kag.userChSpeed==kag.chSpeeds.fast"]
		[locate  x=675][button graphic="config_nowait" cond="kag.userChSpeed!=0" target="*config_ch_speed" exp="tf.conf_ch_speed = 0"][button graphic="config_nowait_checked" cond="kag.userChSpeed==0"]
;		[locate  x=460]| ページ末まで送る [button  graphic="opt_checkbox_precheck.png" cond="!kag.chNonStopToPageBreak" target="*config_ch_non_stop"][button graphic="opt_checkbox_checked.png" cond="kag.chNonStopToPageBreak"] [r]
[else]
	; 既読文字表示速度のマーカーを表示
	[eval exp="tf.conf_i = 0" cond="kag.userCh2ndSpeed==0"]
	[eval exp="tf.conf_i = 1" cond="kag.userCh2ndSpeed==kag.chSpeeds.fast"]
	[eval exp="tf.conf_i = 2" cond="kag.userCh2ndSpeed==kag.chSpeeds.normal"]
	[eval exp="tf.conf_i = 3" cond="kag.userCh2ndSpeed==-1"]
	[locate y=360]
		[locate  x=300][button  graphic="config_slow" cond="kag.userCh2ndSpeed!=-1" target="*config_ch_2nd_speed" exp="tf.conf_ch_2nd_speed = 3"][button graphic="config_slow_checked" cond="kag.userCh2ndSpeed==-1"]
		[locate  x=425][button graphic="config_normal" cond="kag.userCh2ndSpeed!=kag.chSpeeds.normal" target="*config_ch_2nd_speed" exp="tf.conf_ch_2nd_speed = 2"][button graphic="config_normal_checked" cond="kag.userCh2ndSpeed==kag.chSpeeds.normal"]
		[locate  x=550][button  graphic="config_high" cond="kag.userCh2ndSpeed!=kag.chSpeeds.fast" target="*config_ch_2nd_speed" exp="tf.conf_ch_2nd_speed = 1"][button graphic="config_high_checked" cond="kag.userCh2ndSpeed==kag.chSpeeds.fast"]
		[locate  x=675][button graphic="config_nowait" cond="kag.userCh2ndSpeed!=0" target="*config_ch_2nd_speed" exp="tf.conf_ch_2nd_speed = 0"][button graphic="config_nowait_checked" cond="kag.userCh2ndSpeed==0"]
;		[locate  x=460]| ページ末まで送る [button  graphic="opt_checkbox_precheck.png" cond="!kag.ch2ndNonStopToPageBreak" target="*config_ch_2nd_non_stop"][button graphic="opt_checkbox_checked.png" cond="kag.ch2ndNonStopToPageBreak"] [r]
[endif]
[r]
;BGM
[locate  y=431]
[locate  x=285][button graphic="config_0.png" cond="kag.bgm.currentBuffer.volume2\1000!=0" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 0"][button graphic="config_0_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==0"]
[locate  x=335][button graphic="config_1.png" cond="kag.bgm.currentBuffer.volume2\1000!=10" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 10"][button graphic="config_1_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==10"]
[locate  x=385][button graphic="config_2.png" cond="kag.bgm.currentBuffer.volume2\1000!=20" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 20"][button graphic="config_2_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==20"]
[locate  x=435][button graphic="config_3.png" cond="kag.bgm.currentBuffer.volume2\1000!=30" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 30"][button graphic="config_3_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==30"]
[locate  x=485][button graphic="config_4.png" cond="kag.bgm.currentBuffer.volume2\1000!=40" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 40"][button graphic="config_4_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==40"]
[locate  x=535][button graphic="config_5.png" cond="kag.bgm.currentBuffer.volume2\1000!=50" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 50"][button graphic="config_5_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==50"]
[locate  x=585][button graphic="config_6.png" cond="kag.bgm.currentBuffer.volume2\1000!=60" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 60"][button graphic="config_6_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==60"]
[locate  x=635][button graphic="config_7.png" cond="kag.bgm.currentBuffer.volume2\1000!=70" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 70"][button graphic="config_7_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==70"]
[locate  x=685][button graphic="config_8.png" cond="kag.bgm.currentBuffer.volume2\1000!=80" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 80"][button graphic="config_8_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==80"]
[locate  x=735][button graphic="config_9.png" cond="kag.bgm.currentBuffer.volume2\1000!=90" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 90"][button graphic="config_9_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==90"]
[locate  x=785][button graphic="config_10.png" cond="kag.bgm.currentBuffer.volume2\1000!=100" target="*config_bgm_gvolume" exp="tf.conf_bgm_gvolume = 100"][button graphic="config_10_checked.png" cond="kag.bgm.currentBuffer.volume2\1000==100"]
[r]
;SE
[locate  y=501]
[locate  x=285][button graphic="config_0.png" cond="kag.se[1].volume2\1000!=0" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 0"][button graphic="config_0_checked.png" cond="kag.se[1].volume2\1000==0"]
[locate  x=335][button graphic="config_1.png" cond="kag.se[1].volume2\1000!=10" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 10"][button graphic="config_1_checked.png" cond="kag.se[1].volume2\1000==10"]
[locate  x=385][button graphic="config_2.png" cond="kag.se[1].volume2\1000!=20" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 20"][button graphic="config_2_checked.png" cond="kag.se[1].volume2\1000==20"]
[locate  x=435][button graphic="config_3.png" cond="kag.se[1].volume2\1000!=30" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 30"][button graphic="config_3_checked.png" cond="kag.se[1].volume2\1000==30"]
[locate  x=485][button graphic="config_4.png" cond="kag.se[1].volume2\1000!=40" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 40"][button graphic="config_4_checked.png" cond="kag.se[1].volume2\1000==40"]
[locate  x=535][button graphic="config_5.png" cond="kag.se[1].volume2\1000!=50" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 50"][button graphic="config_5_checked.png" cond="kag.se[1].volume2\1000==50"]
[locate  x=585][button graphic="config_6.png" cond="kag.se[1].volume2\1000!=60" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 60"][button graphic="config_6_checked.png" cond="kag.se[1].volume2\1000==60"]
[locate  x=635][button graphic="config_7.png" cond="kag.se[1].volume2\1000!=70" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 70"][button graphic="config_7_checked.png" cond="kag.se[1].volume2\1000==70"]
[locate  x=685][button graphic="config_8.png" cond="kag.se[1].volume2\1000!=80" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 80"][button graphic="config_8_checked.png" cond="kag.se[1].volume2\1000==80"]
[locate  x=735][button graphic="config_9.png" cond="kag.se[1].volume2\1000!=90" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 90"][button graphic="config_9_checked.png" cond="kag.se[1].volume2\1000==90"]
[locate  x=785][button graphic="config_10.png" cond="kag.se[1].volume2\1000!=100" target="*config_se_gvolume" exp="tf.conf_se_gvolume = 100"][button graphic="config_10_checked.png" cond="kag.se[1].volume2\1000==100"]
;音声
[locate  y=576]
[locate  x=285][button graphic="config_0.png" cond="kag.se[0].volume2\1000!=0" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 0"][button graphic="config_0_checked.png" cond="kag.se[0].volume2\1000==0"]
[locate  x=335][button graphic="config_1.png" cond="kag.se[0].volume2\1000!=10" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 10"][button graphic="config_1_checked.png" cond="kag.se[0].volume2\1000==10"]
[locate  x=385][button graphic="config_2.png" cond="kag.se[0].volume2\1000!=20" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 20"][button graphic="config_2_checked.png" cond="kag.se[0].volume2\1000==20"]
[locate  x=435][button graphic="config_3.png" cond="kag.se[0].volume2\1000!=30" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 30"][button graphic="config_3_checked.png" cond="kag.se[0].volume2\1000==30"]
[locate  x=485][button graphic="config_4.png" cond="kag.se[0].volume2\1000!=40" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 40"][button graphic="config_4_checked.png" cond="kag.se[0].volume2\1000==40"]
[locate  x=535][button graphic="config_5.png" cond="kag.se[0].volume2\1000!=50" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 50"][button graphic="config_5_checked.png" cond="kag.se[0].volume2\1000==50"]
[locate  x=585][button graphic="config_6.png" cond="kag.se[0].volume2\1000!=60" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 60"][button graphic="config_6_checked.png" cond="kag.se[0].volume2\1000==60"]
[locate  x=635][button graphic="config_7.png" cond="kag.se[0].volume2\1000!=70" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 70"][button graphic="config_7_checked.png" cond="kag.se[0].volume2\1000==70"]
[locate  x=685][button graphic="config_8.png" cond="kag.se[0].volume2\1000!=80" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 80"][button graphic="config_8_checked.png" cond="kag.se[0].volume2\1000==80"]
[locate  x=735][button graphic="config_9.png" cond="kag.se[0].volume2\1000!=90" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 90"][button graphic="config_9_checked.png" cond="kag.se[0].volume2\1000==90"]
[locate  x=785][button graphic="config_10.png" cond="kag.se[0].volume2\1000!=100" target="*config_vo_gvolume" exp="tf.conf_vo_gvolume = 100"][button graphic="config_10_checked.png" cond="kag.se[0].volume2\1000==100"]

[r]
; 「戻る」ボタンを配置
[locate x=20 y=680][button graphic="config_return.png" target=*config_return  cond="!tf.load_mode"]
[locate  x=245 y=680][button graphic="config_returntitle.png" target=*config_title]
[locate  x=480 y=680][button graphic="config_end.png" exp="kag.closeByScript(%['ask'=>'true'])"][r]
[s]
;終了→いいえの場合、sタグ以降が実行される。この対策として画面描画処理部に戻す。
[jump target=*config_menu]

;
; 「ウィンドウ」が選択された
;
*config_window
; ウィンドウ表示にする
[eval exp="kag.onWindowedMenuItemClick(kag)"]
[jump target=*config_menu]
;[s]


;
; 「フルスクリーン」が選択された
;
*config_fullscreen
; フルスクリーンにする
[eval exp="kag.onFullScreenMenuItemClick(kag)"]
[jump target=*config_menu]
;[s]

; 既読・未読がクリックされた
;
*config_read_toggle
[if exp="tf.read_toggle"]
	[eval exp="tf.read_toggle=0"]
[else]
	[eval exp="tf.read_toggle=1"]
[endif]
[jump target=*config_menu]

;
; 文字表示速度が選択された
;
*config_ch_speed
;; マーカーの表示位置を変更
;[layopt layer=1 page=fore visible=true left="&tf.conf_spd_x[tf.conf_ch_speed]" top="&tf.conf_spd_y[tf.conf_ch_speed]"]
;; 文字表示速度を変更
[eval exp="kag.chNoWaitMenuItem.click()" cond="tf.conf_ch_speed == 0"]
[eval exp="kag.chFastMenuItem.click()" cond="tf.conf_ch_speed == 1"]
[eval exp="kag.chNormalMenuItem.click()" cond="tf.conf_ch_speed == 2"]
[eval exp="kag.chSlowMenuItem.click()" cond="tf.conf_ch_speed == 3"]
[jump target=*config_menu]
;[s]


;
; 文字表示速度で「ページ末まで一気に」が選択された
;
*config_ch_non_stop
;; 現在の状態に従って、チェックマークを表示／非表示
;[layopt layer=2 page=fore visible="&!kag.chNonStopToPageBreak"]
;; 「ページ末まで一気に」の設定を変更
[eval exp="kag.onChNonStopToPageBreakItemClick(kag)"]
[jump target=*config_menu]
;[s]


;
; 既読文字表示速度が選択された
;
*config_ch_2nd_speed
;; マーカーの表示位置を変更
;[layopt layer=3 page=fore visible=true left="&tf.conf_spd2_x[tf.conf_ch_2nd_speed]" top="&tf.conf_spd2_y[tf.conf_ch_2nd_speed]"]
;; 既読文字表示速度を変更
[eval exp="kag.ch2ndNoWaitMenuItem.click()" cond="tf.conf_ch_2nd_speed == 0"]
[eval exp="kag.ch2ndFastMenuItem.click()" cond="tf.conf_ch_2nd_speed == 1"]
[eval exp="kag.ch2ndNormalMenuItem.click()" cond="tf.conf_ch_2nd_speed == 2"]
[eval exp="kag.ch2ndNoChangeMenuItem.click()" cond="tf.conf_ch_2nd_speed == 3"]
[jump target=*config_menu]
;[s]


;
; 既読文字表示速度で「ページ末まで一気に」が選択された
;
*config_ch_2nd_non_stop
;; 現在の状態に従って、チェックマークを表示／非表示
;[layopt layer=4 page=fore visible="&!kag.ch2ndNonStopToPageBreak"]
; 「ページ末まで一気に」の設定を変更
[eval exp="kag.onCh2ndNonStopToPageBreakItemClick(kag)"]
[jump target=*config_menu]
;[s]


;
; BGM音量メーターがクリックされた
;
*config_bgm_gvolume
; マーカーの表示位置を変更
;[layopt layer=5 page=fore visible=true left="&tf.conf_bgm_x[tf.conf_bgm_gvolume\10]" top="&tf.conf_bgm_y[tf.conf_bgm_gvolume\10]"]
; BGMの大域音量を変更
[bgmopt gvolume="&tf.conf_bgm_gvolume"]
[jump target=*config_menu]
;[s]

;
; 効果音音量メーターがクリックされた
;
*config_se_gvolume
; 全効果音(0トラックの音声除く)の大域音量を変更
[eval exp="tf.conf_i=1"]
*config_se_gvolume_loop
	[seopt buf="&tf.conf_i" gvolume="&tf.conf_se_gvolume"]
	[jump target=*config_se_gvolume_loop cond="++tf.conf_i<kag.numSEBuffers"]
[jump target=*config_menu]
;[s]

;
; 音声音量メーターがクリックされた
;
*config_vo_gvolume
; トラック0の大域音量を変更
[seopt buf=0 gvolume="&tf.conf_vo_gvolume"]
[jump target=*config_menu]
;[s]

;
; 解説モードがクリックされた
;
*config_explanation
[if exp="sf.bExplan"]
	[eval exp="sf.bExplan=0"]
[else]
	[eval exp="sf.bExplan=1"]
[endif]
[jump target=*config_menu]

;
; 「戻る」が選択された／マウス右クリックされた
;
*config_return
; メモリ上の栞３を読み込み、状態復帰
[tempload place=3]
; 戻る（※呼び出し側でマウス右クリックの設定を元に戻すこと）
[return]

;
; 「タイトルへ戻る」が選択された
;
*config_title
[gotostart ask=true]
[jump target=*config_menu]

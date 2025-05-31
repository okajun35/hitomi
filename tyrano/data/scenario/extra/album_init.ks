; album_init.ks - アルバム初期化（TyranoScript版）

*album_init

; アルバムフラグの初期化
[eval exp="f.album_flag = f.album_flag || []"]

; アルバムページ設定
[eval exp="f.album_page = 0"]

; 初期設定完了
[return]
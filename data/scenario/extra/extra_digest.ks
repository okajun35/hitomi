*digest_start|「ヒ・ト・ミ」舞台のダイジェスト映像

; ノーウェイト
[delay speed=nowait]

; マウス右クリックされたら、「戻る」と同じ動作をさせる
[rclick jump=true target="*extra_digest_return" storage="scenario/extra/extra_digest.ks" enabled=true]

[loadplugin module ="krmovie.dll"]
;[layopt layer="message0" page="fore" visible="false"]
[video visible="true" left=0 top=0 width=1024 height=768]
[openvideo storage=digest.wmv]
[playvideo]

[wv canskip="false"]

;[layopt layer="message0" page="fore" visible="true"]

[cm]
[resetstyle]
;[jump storage="extra.ks" target=*extra_menu]

*extra_digest_return
; マウス右クリックされたときの動作を元に戻す
[rclick enabled=false]
[return]

*digest_start|�u�q�E�g�E�~�v����̃_�C�W�F�X�g�f��

; �m�[�E�F�C�g
[delay speed=nowait]

; �}�E�X�E�N���b�N���ꂽ��A�u�߂�v�Ɠ��������������
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
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂�
[rclick enabled=false]
[return]

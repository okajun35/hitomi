;
; rclick_config.ks�c�R���t�B�O��ʁi�o�[�W�����`�E�a���ʁj
;

;
; �g�����F
;   [call storage="rclick_config.ks" target=*config_menu]
;
; ���ӎ����F
;   �]���T�u���[�`���ł̓�������̞x�R���g�p���Ă���
;   �]���T�u���[�`�����ŁA�E�N���b�N���̐ݒ��ύX���Ă���B�Ăяo�����Ō��̐ݒ�ɖ߂����Ɓi���d�v�j
;   �]�\�߁AConfig.tjs�̈ȉ��̍��ڂ��C�����邱��
;       numCharacterLayers    �c 10�ȏ�i�����j
;       characterMenu.visible �c false�ɕύX
;       displayMenu.visible   �c false�ɕύX
;
; �g�p���Ă���ϐ��F�ꕔ��opt_bg_normal.ma���ł��g�p���Ă���
;   tf.conf_scr_x, tf.conf_scr_y         �c �E�B���h�E�^�t���X�N���[���I��p�}�[�J�[�̍��W�i�z��j
;   tf.conf_spd_x, tf.conf_spd_y         �c �����\�����x�p�}�[�J�[�̍��W�i�z��j
;   tf.conf_spdopt_x, tf.conf_spdopt_y   �c ���A�y�[�W���܂ő���}�[�J�[�̍��W�i�z��j
;   tf.conf_spd2_x, tf.conf_spd2_y       �c ���Ǖ����\�����x�p�}�[�J�[�̍��W�i�z��j
;   tf.conf_spd2opt_x, tf.conf_spd2opt_y �c ���A�y�[�W���܂ő���}�[�J�[�̍��W�i�z��j
;   tf.conf_bgm_x, tf.conf_bgm_y         �c BGM���ʗp���[�^�[�̍��W�i�z��j
;   tf.conf_se_x, tf.conf_se_y           �c SE���ʗp���[�^�[�̍��W�i�z��j
;   tf.conf_i                            �c ���[�v�J�E���^�Ȃ�
;   tf.conf_ch_speed                     �c �I�����������\�����x�i0:�m�[�E�F�C�g�A1:�����A2:���ʁA3:�x���j
;   tf.conf_ch_2nd_speed                 �c �I���������Ǖ����\�����x�i0:�m�[�E�F�C�g�A1:�����A2:���ʁA3:���̂܂܁j
;   tf.conf_bgm_gvolume                  �c �I������BGM���ʁi0�`10�j
;   tf.conf_se_gvolume                   �c �I������SE���ʁi0�`10�j
;

*config_menu
; �֐��ƒ萔���`�Gif�`endif�^�O�ň�x��`������Ē�`���Ȃ��悤�ɃK�[�h���Ă���
[if exp="typeof(global.marker_on) == 'undefined'"]
[iscript]
// �w�肵���O�i���C�����w�肵���w�A�x���W�ɕ\������
//   lay �c �O�i���C���ԍ��i0, 1, 2�c�j
//   x   �c �w���W�i�s�N�Z���j
//   y   �c �x���W�i�s�N�Z���j
function marker_on(lay, x, y)
{
	kag.fore.layers[lay].setPos(x, y);
	kag.fore.layers[lay].visible = true;
}
 
// �w�肵���O�i���C�����\���ɂ���
//   lay �c �O�i���C���ԍ��i0, 1, 2�c�j
function marker_off(lay)
{
	kag.fore.layers[lay].visible = false;
}
[endscript]
[endif]

; �Z�[�u��ʂŃ}�E�X�E�N���b�N���ꂽ��A�u�߂�v�Ɠ��������������
[rclick jump=true target="*config_return" storage="rclick_config.ks" enabled=true]
; ��������̞x�R�Ɍ��݂̏�Ԃ�ۑ�
[tempsave place=3]
; �S���b�Z�[�W���C���\��ʁA�S�O�i���C���\��ʂ��\���ɂ���
[call storage="rclick_subroutine.ks" target=*sub_layernoshow]
; �O�i���C��������Ȃ���Βǉ��i�\��Config.tjs��numCharacterLayers��10�ȏ�ɂ��Ă��������ǂ��j
[laycount layers=10 cond="kag.numCharacterLayers<10"]
;; �R���t�B�O��ʁi�N���b�J�u���}�b�v�j��w�i���C���ɕ\��
;[image storage="opt_bg_normal.png" layer=base page=fore]
;�w�i���C���\��
[image storage="config_back" layer="base" page="fore"]
; ���[�h��ʂ�\�����郁�b�Z�[�W���C����
[eval exp="tf.config_message = 'message1'"]
; ���b�Z�[�W���C���̑�����ݒ�G�Z�[�u�f�[�^�̈ꗗ��`�悷��
[position layer="&tf.config_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true opacity=0]
; ���b�Z�[�W���C���̃N���A
[er]
; �E�B���h�E�^�t���X�N���[����Ԃ̃`�F�b�N�}�[�N��O�i���C���O�ɕ\��
[locate y=141]
[locate x=290][button  graphic="config_window.png" cond="kag.fullScreen" target="*config_window"][button graphic="config_window_checked.png" cond="!kag.fullScreen"]
[locate x=500][button graphic="config_fullscreen.png" cond="!kag.fullScreen" target="*config_fullscreen"][button graphic="config_fullscreen_checked.png" cond="kag.fullScreen"]
[r]
; ������[�h�̏�Ԃ̃`�F�b�N�}�[�N��\��
;[locate y=204]
;[locate  x=290][button graphic="config_on.png" cond="!sf.bExplan" target="*config_explanation"][button graphic="config_on_checked.png" cond="sf.bExplan"]
;[locate  x=360][button  graphic="config_off.png" cond="sf.bExplan" target="*config_explanation"][button graphic="config_off_checked.png" cond="!sf.bExplan"]
;[r]

; ����/���ǂ̏�Ԃ̃`�F�b�N�}�[�N��\��
[locate y=277]
[locate  x=290][button graphic="config_read.png" cond="!tf.read_toggle" target="*config_read_toggle"][button graphic="config_read_checked.png" cond="tf.read_toggle"]
[locate  x=475][button  graphic="config_notread.png" cond="tf.read_toggle" target="*config_read_toggle"][button graphic="config_notread_checked.png" cond="!tf.read_toggle"]
[r]

[if exp="!tf.read_toggle"]
	; �����\�����x�̃}�[�J�[��\��
	[eval exp="tf.conf_i = 0" cond="kag.userChSpeed==0"]
	[eval exp="tf.conf_i = 1" cond="kag.userChSpeed==kag.chSpeeds.fast"]
	[eval exp="tf.conf_i = 2" cond="kag.userChSpeed==kag.chSpeeds.normal"]
	[eval exp="tf.conf_i = 3" cond="kag.userChSpeed==kag.chSpeeds.slow"]
	[locate y=360]
		[locate  x=300][button  graphic="config_slow" cond="kag.userChSpeed!=kag.chSpeeds.slow" target="*config_ch_speed" exp="tf.conf_ch_speed = 3"][button graphic="config_slow_checked" cond="kag.userChSpeed==kag.chSpeeds.slow"]
		[locate  x=425][button graphic="config_normal" cond="kag.userChSpeed!=kag.chSpeeds.normal" target="*config_ch_speed" exp="tf.conf_ch_speed = 2"][button graphic="config_normal_checked" cond="kag.userChSpeed==kag.chSpeeds.normal"]
		[locate  x=550][button  graphic="config_high" cond="kag.userChSpeed!=kag.chSpeeds.fast" target="*config_ch_speed" exp="tf.conf_ch_speed = 1"][button graphic="config_high_checked" cond="kag.userChSpeed==kag.chSpeeds.fast"]
		[locate  x=675][button graphic="config_nowait" cond="kag.userChSpeed!=0" target="*config_ch_speed" exp="tf.conf_ch_speed = 0"][button graphic="config_nowait_checked" cond="kag.userChSpeed==0"]
;		[locate  x=460]| �y�[�W���܂ő��� [button  graphic="opt_checkbox_precheck.png" cond="!kag.chNonStopToPageBreak" target="*config_ch_non_stop"][button graphic="opt_checkbox_checked.png" cond="kag.chNonStopToPageBreak"] [r]
[else]
	; ���Ǖ����\�����x�̃}�[�J�[��\��
	[eval exp="tf.conf_i = 0" cond="kag.userCh2ndSpeed==0"]
	[eval exp="tf.conf_i = 1" cond="kag.userCh2ndSpeed==kag.chSpeeds.fast"]
	[eval exp="tf.conf_i = 2" cond="kag.userCh2ndSpeed==kag.chSpeeds.normal"]
	[eval exp="tf.conf_i = 3" cond="kag.userCh2ndSpeed==-1"]
	[locate y=360]
		[locate  x=300][button  graphic="config_slow" cond="kag.userCh2ndSpeed!=-1" target="*config_ch_2nd_speed" exp="tf.conf_ch_2nd_speed = 3"][button graphic="config_slow_checked" cond="kag.userCh2ndSpeed==-1"]
		[locate  x=425][button graphic="config_normal" cond="kag.userCh2ndSpeed!=kag.chSpeeds.normal" target="*config_ch_2nd_speed" exp="tf.conf_ch_2nd_speed = 2"][button graphic="config_normal_checked" cond="kag.userCh2ndSpeed==kag.chSpeeds.normal"]
		[locate  x=550][button  graphic="config_high" cond="kag.userCh2ndSpeed!=kag.chSpeeds.fast" target="*config_ch_2nd_speed" exp="tf.conf_ch_2nd_speed = 1"][button graphic="config_high_checked" cond="kag.userCh2ndSpeed==kag.chSpeeds.fast"]
		[locate  x=675][button graphic="config_nowait" cond="kag.userCh2ndSpeed!=0" target="*config_ch_2nd_speed" exp="tf.conf_ch_2nd_speed = 0"][button graphic="config_nowait_checked" cond="kag.userCh2ndSpeed==0"]
;		[locate  x=460]| �y�[�W���܂ő��� [button  graphic="opt_checkbox_precheck.png" cond="!kag.ch2ndNonStopToPageBreak" target="*config_ch_2nd_non_stop"][button graphic="opt_checkbox_checked.png" cond="kag.ch2ndNonStopToPageBreak"] [r]
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
;����
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
; �u�߂�v�{�^����z�u
[locate x=20 y=680][button graphic="config_return.png" target=*config_return  cond="!tf.load_mode"]
[locate  x=245 y=680][button graphic="config_returntitle.png" target=*config_title]
[locate  x=480 y=680][button graphic="config_end.png" exp="kag.closeByScript(%['ask'=>'true'])"][r]
[s]
;�I�����������̏ꍇ�As�^�O�ȍ~�����s�����B���̑΍�Ƃ��ĉ�ʕ`�揈�����ɖ߂��B
[jump target=*config_menu]

;
; �u�E�B���h�E�v���I�����ꂽ
;
*config_window
; �E�B���h�E�\���ɂ���
[eval exp="kag.onWindowedMenuItemClick(kag)"]
[jump target=*config_menu]
;[s]


;
; �u�t���X�N���[���v���I�����ꂽ
;
*config_fullscreen
; �t���X�N���[���ɂ���
[eval exp="kag.onFullScreenMenuItemClick(kag)"]
[jump target=*config_menu]
;[s]

; ���ǁE���ǂ��N���b�N���ꂽ
;
*config_read_toggle
[if exp="tf.read_toggle"]
	[eval exp="tf.read_toggle=0"]
[else]
	[eval exp="tf.read_toggle=1"]
[endif]
[jump target=*config_menu]

;
; �����\�����x���I�����ꂽ
;
*config_ch_speed
;; �}�[�J�[�̕\���ʒu��ύX
;[layopt layer=1 page=fore visible=true left="&tf.conf_spd_x[tf.conf_ch_speed]" top="&tf.conf_spd_y[tf.conf_ch_speed]"]
;; �����\�����x��ύX
[eval exp="kag.chNoWaitMenuItem.click()" cond="tf.conf_ch_speed == 0"]
[eval exp="kag.chFastMenuItem.click()" cond="tf.conf_ch_speed == 1"]
[eval exp="kag.chNormalMenuItem.click()" cond="tf.conf_ch_speed == 2"]
[eval exp="kag.chSlowMenuItem.click()" cond="tf.conf_ch_speed == 3"]
[jump target=*config_menu]
;[s]


;
; �����\�����x�Łu�y�[�W���܂ň�C�Ɂv���I�����ꂽ
;
*config_ch_non_stop
;; ���݂̏�Ԃɏ]���āA�`�F�b�N�}�[�N��\���^��\��
;[layopt layer=2 page=fore visible="&!kag.chNonStopToPageBreak"]
;; �u�y�[�W���܂ň�C�Ɂv�̐ݒ��ύX
[eval exp="kag.onChNonStopToPageBreakItemClick(kag)"]
[jump target=*config_menu]
;[s]


;
; ���Ǖ����\�����x���I�����ꂽ
;
*config_ch_2nd_speed
;; �}�[�J�[�̕\���ʒu��ύX
;[layopt layer=3 page=fore visible=true left="&tf.conf_spd2_x[tf.conf_ch_2nd_speed]" top="&tf.conf_spd2_y[tf.conf_ch_2nd_speed]"]
;; ���Ǖ����\�����x��ύX
[eval exp="kag.ch2ndNoWaitMenuItem.click()" cond="tf.conf_ch_2nd_speed == 0"]
[eval exp="kag.ch2ndFastMenuItem.click()" cond="tf.conf_ch_2nd_speed == 1"]
[eval exp="kag.ch2ndNormalMenuItem.click()" cond="tf.conf_ch_2nd_speed == 2"]
[eval exp="kag.ch2ndNoChangeMenuItem.click()" cond="tf.conf_ch_2nd_speed == 3"]
[jump target=*config_menu]
;[s]


;
; ���Ǖ����\�����x�Łu�y�[�W���܂ň�C�Ɂv���I�����ꂽ
;
*config_ch_2nd_non_stop
;; ���݂̏�Ԃɏ]���āA�`�F�b�N�}�[�N��\���^��\��
;[layopt layer=4 page=fore visible="&!kag.ch2ndNonStopToPageBreak"]
; �u�y�[�W���܂ň�C�Ɂv�̐ݒ��ύX
[eval exp="kag.onCh2ndNonStopToPageBreakItemClick(kag)"]
[jump target=*config_menu]
;[s]


;
; BGM���ʃ��[�^�[���N���b�N���ꂽ
;
*config_bgm_gvolume
; �}�[�J�[�̕\���ʒu��ύX
;[layopt layer=5 page=fore visible=true left="&tf.conf_bgm_x[tf.conf_bgm_gvolume\10]" top="&tf.conf_bgm_y[tf.conf_bgm_gvolume\10]"]
; BGM�̑�批�ʂ�ύX
[bgmopt gvolume="&tf.conf_bgm_gvolume"]
[jump target=*config_menu]
;[s]

;
; ���ʉ����ʃ��[�^�[���N���b�N���ꂽ
;
*config_se_gvolume
; �S���ʉ�(0�g���b�N�̉�������)�̑�批�ʂ�ύX
[eval exp="tf.conf_i=1"]
*config_se_gvolume_loop
	[seopt buf="&tf.conf_i" gvolume="&tf.conf_se_gvolume"]
	[jump target=*config_se_gvolume_loop cond="++tf.conf_i<kag.numSEBuffers"]
[jump target=*config_menu]
;[s]

;
; �������ʃ��[�^�[���N���b�N���ꂽ
;
*config_vo_gvolume
; �g���b�N0�̑�批�ʂ�ύX
[seopt buf=0 gvolume="&tf.conf_vo_gvolume"]
[jump target=*config_menu]
;[s]

;
; ������[�h���N���b�N���ꂽ
;
*config_explanation
[if exp="sf.bExplan"]
	[eval exp="sf.bExplan=0"]
[else]
	[eval exp="sf.bExplan=1"]
[endif]
[jump target=*config_menu]

;
; �u�߂�v���I�����ꂽ�^�}�E�X�E�N���b�N���ꂽ
;
*config_return
; ��������̞x�R��ǂݍ��݁A��ԕ��A
[tempload place=3]
; �߂�i���Ăяo�����Ń}�E�X�E�N���b�N�̐ݒ�����ɖ߂����Ɓj
[return]

;
; �u�^�C�g���֖߂�v���I�����ꂽ
;
*config_title
[gotostart ask=true]
[jump target=*config_menu]

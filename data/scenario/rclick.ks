;
; rclick.ks�c�E�N���b�N�T�u���[�`���̓�����i�o�[�W�����`�j
;

;
; �g�����F
;   [rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
;
; ���ӎ����F
;   �]���T�u���[�`���ł̓�������̞x�O���g�p���Ă���
;
; �g�p���Ă���ϐ��F
;   tf.rclick_message �c ���j���[��\�����郁�b�Z�[�W���C�����i�E�N���b�N�T�u���[�`����p�ŗp�ӂ��邱�Ɓj
;   tf.rclick_i       �c ���[�v�J�E���^
;

*rclick_menu
; ���j���[�^�Z�[�u��ʂ�\�����郁�b�Z�[�W���C�����i�E�N���b�N�T�u���[�`����p�j
[eval exp="tf.rclick_message = 'message1'"]
; �E�N���b�N�T�u���[�`�����ŉE�N���b�N���ꂽ��A�u�߂�v�Ɠ��������������
[rclick jump=true target="*rclick_return" storage="rclick.ks" enabled=true]
; ��������̞x�O�Ɍ��݂̏�Ԃ�ۑ�
[tempsave place=0]
; �������C����}�~
[history output=false enabled=false]
; �w�i���C���\��ʂ̃N���b�J�u���}�b�v�𖳌���
[mapdisable layer=base page=fore]
; �S�O�i���C���\��ʂ̃N���b�J�u���}�b�v�𖳌���
[eval exp="tf.rclick_i=0"]
*rclick_loop0
	[mapdisable page=fore layer="&tf.rclick_i"]
	[jump target=*rclick_loop0 cond="++tf.rclick_i<kag.numCharacterLayers"]
; �S���b�Z�[�W���C���\��ʁA�S�O�i���C���\��ʂ��\���ɂ���
[call storage="rclick_subroutine.ks" target=*sub_layernoshow]
; �O�i���C��������Ȃ���Βǉ��i�\��Config.tjs��numCharacterLayers��10�ȏ�ɂ��Ă��������ǂ��j
[laycount layers=10 cond="kag.numCharacterLayers<10"]

; ���j���[�p���b�Z�[�W���C���\��ʂ�\�����A�J�����g�̃��b�Z�[�W���C���ɂ���
[layopt layer="&tf.rclick_message" page=fore visible=true]
[current layer="&tf.rclick_message" page=fore]

; �m�[�E�F�C�g
[delay speed=nowait]


; ���u�O���t�B�b�N�{���v�u���[�h����v�u�Z�[�u����v����߂��Ă��郉�x��
;   �u�^�C�g���֖߂�v�u���j���[�𔲂���v���L�����Z�������ꍇ���A�����ɖ߂�
*rclick_menu_loop
; ���j���[�p���b�Z�[�W���C���̐ݒ�
;[position layer="&tf.rclick_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" frame="rmenu_bg.png" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true]
[position layer="&tf.rclick_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true vertical="false" opacity=0]
;�w�i���C���\��
[image storage="configmenu_back" layer="base" page="fore"]
; ���b�Z�[�W���C�����N���A
[er]
; �u�O���t�B�b�N�{���v�`�u�I������v��z�u
;[link target=*rclick_hide_message]�O���t�B�b�N�{��[endlink][r]
[locate  x=250 y=150][button graphic="configmenu_save.png" target="*rclick_save"][r]
[locate  x=250 y=225][button graphic="configmenu_load.png" target="*rclick_load"][r]
[locate  x=250 y=300][button graphic="configmenu_chapter.png" target="*rclick_chapter"][r]
[locate  x=250 y=375][button graphic="configmenu_config.png" target="*rclick_config"][r]
[locate  x=195 y=675][button graphic="configmenu_return.png" target=*rclick_return]
[locate  x=405 y=675][button graphic="configmenu_returntitle.png" target=*rclick_title]
[locate  x=685 y=675][button graphic="configmenu_end.png" exp="kag.closeByScript(%['ask'=>'true'])"][r]
[s]
;�I�����������̏ꍇ�As�^�O�ȍ~�����s�����B���̑΍�Ƃ��ĉ�ʕ`�揈�����ɖ߂��B
[jump target=*rclick_menu_loop]

;
; �u�O���t�B�b�N�{���v���I�����ꂽ
;
*rclick_hide_message
; ���b�Z�[�W������
[hidemessage]
[jump target=*rclick_menu_loop]


;
; �u���[�h����v���I�����ꂽ
;
*rclick_load
; ���[�h��ʂ�
[eval exp="tf.load_mode=false"]
[call storage="rclick_load.ks" target=*load_menu]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��irclick_load.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*rclick_return" storage="rclick.ks" enabled=true]
[jump target=*rclick_menu_loop]

*rclick_chapter
; �͂̓������ǂ��
[eval exp="tf.load_mode=false"]
[call storage="rclick_chapter.ks" target=*chapter_menu]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��irclick_load.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*rclick_return" storage="rclick.ks" enabled=true]
[jump target=*rclick_menu_loop]

;
; �u�Z�[�u����v���I�����ꂽ
;
*rclick_save
; �Z�[�u��ʂ�
[call storage="rclick_save.ks" target=*save_menu]
[jump target=*rclick_menu_loop]


;
; �u�Q�[���ݒ�v���I�����ꂽ
;
*rclick_config
[call storage="rclick_config.ks" target=*config_menu]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��irclick_config.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*rclick_return" storage="rclick.ks" enabled=true]
[jump target=*rclick_menu_loop]


;
; �u�^�C�g���֖߂�v���I�����ꂽ
;
*rclick_title
[gotostart ask=true]
[jump target=*rclick_menu_loop]


;
; �u���j���[�𔲂���v���I�����ꂽ�^�}�E�X�E�N���b�N���ꂽ
;
*rclick_return
; ��������̞x�O��ǂݍ��݁A��ԕ��A
[tempload place=0]
; �E�N���b�N�T�u���[�`����ݒ肵����
[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
; �f�t�H���g�̕����\�����x�Ȃ�ir_click_config.ks���Őݒ肵���j�l�𒼂��ɔ��f
[delay speed=user cond="kag.chUserMode"]
; �E�N���b�N�T�u���[�`���̏I��
[return]


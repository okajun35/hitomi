;
; album.ks�c�A���o�����
;

;
; �g�����F
;   [call storage="album.ks" target=*album_menu]
;
; ���ӎ����F
;   �]�V�X�e���ϐ�sf.album_flag�͎Q�Ƃ̂݁B�eKAG�V�i���I�ł��̔z��v�f�̒l��ύX���邱��
;   �]macro.ks��eventcg�}�N�����g���΁A�ȒP�ɔz��sf.album_flag�̃t���O��ύX�ł���
;
; �g�p���Ă���ϐ��F
;   tf.album_x         �c �T���l�C���摜�ƃv���I��p�O���t�B�J���{�^����\������w���W�̔z��
;   tf.album_y         �c ���A�x���W�̔z��
;   tf.album_page_x    �c �y�[�W�p�{�^����\������w���W�̔z��
;   tf.album_page_y    �c ���A�x���W�̔z��
;   tf.album_message   �c �A���o����ʂŎg�p���郁�b�Z�[�W���C����
;   tf.album_column    �c �T���l�C���摜��\�������
;   tf.album_line      �c �T���l�C���摜��\������s
;   tf.album_select    �c �I�������C�x���g�G�̔ԍ�
;   tf.album_layer     �c �C�x���g�G��\������O�i���C���ԍ�
;   tf.album_i         �c ���[�v�J�E���^
;   sf.album_page      �c ���݁A�\�����̃y�[�W
;
;   �ȉ��̔z��́Aalbum_init.ks�̃T�u���[�`��*album_init�Őݒ�
;   tf.album_storage   �c �C�x���g�G�̃t�@�C�����̔z��
;   tf.album_thumbnail �c ���A�T���l�C���摜�̃t�@�C�����̔z��
;   sf.album_flag      �c ���̃C�x���g�G���{���������ۂ��̔z��B�����lfalse�i�eKAG�V�i���I�ł��̃t���O��ύX����j
;

*album_menu
; �V�X�e���ϐ�sf.album_page��void�Ȃ�O�������Ă���
[eval exp="sf.album_page = 0" cond="sf.album_page === void"]
; �O���t�B�J���{�^���ƃT���l�C���摜��\��������W�̔z��
[eval exp="tf.album_x = []" cond="tf.album_x === void"]
[eval exp="tf.album_y = []" cond="tf.album_y === void"]
; ���[�v�J�E���^���O�ɂ���
[eval exp="tf.album_i = 0"]
*album_loop0
	; �O���t�B�J���{�^���ƃT���l�C���摜��`�悷�����v�Z
	[eval exp="tf.album_column = tf.album_i % 6"]
	; �O���t�B�J���{�^���ƃT���l�C���摜��`�悷��s���v�Z
	[eval exp="tf.album_line   = tf.album_i \ 6"]
	; �O���t�B�J���{�^���ƃT���l�C���摜��`�悷����W���v�Z���A�z��Ɋi�[
	[eval exp="tf.album_x[tf.album_i] = 55 + 154*tf.album_column"]
	[eval exp="tf.album_y[tf.album_i] = 128 + 102*tf.album_line"]
	[jump target=*album_loop0 cond="++tf.album_i < 30"]
;; �y�[�W�p�{�^����\��������W�̔z��
[eval exp="tf.album_page_x = [440, 485, 530, 575, 620, 665, 710, 755, 800, 845, 905, 965]" cond="tf.album_page_x === void"]
;[eval exp="tf.album_page_y = [516, 516, 516, 516, 516]" cond="tf.album_page_y === void"]
;; �A���o����ʂŎg�p���郁�b�Z�[�W���C��
[eval exp="tf.album_message = 'message'"]
; �C�x���g�G��\������O�i���C��
[eval exp="tf.album_layer = kag.numCharacterLayers-1"]

; �A���o����ʂŃ}�E�X�E�N���b�N���ꂽ��A�u�߂�v�Ɠ��������������
[rclick jump=true target="*album_return" storage="scenario/extra/album.ks" enabled=true]
; ��������̞x�U�Ɍ��݂̏�Ԃ�ۑ�
[tempsave place=6]
; ���b�Z�[�W���C���̑�����ݒ�
[position layer="&tf.album_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" frame="" color=0x000000 opacity=0 marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true]
[current layer="&tf.album_message"]

; ���y�[�W�{�^����I�������Ƃ��ɖ߂��Ă��郉�x��
*album_redraw
; �w�i��w�i���C���\��ʂɓǂݍ���
[image storage="album_back.png" layer=base page=fore]
; ���b�Z�[�W���C���̃N���A
[er]

; ���[�v�J�E���^���O�ɂ���
[eval exp="tf.album_i = 0"]
*album_loop1
	[if exp="tf.album_i+30*sf.album_page<tf.album_thumbnail.length"]
		; �T���l�C���摜��w�i���C���\��ʂɒǉ��ǂݍ���
		[pimage storage="&tf.album_thumbnail[tf.album_i+30*sf.album_page]" layer=base page=fore dx="&tf.album_x[tf.album_i]" dy="&tf.album_y[tf.album_i]" sw=154 sh=102]
		; �T���l�C���摜�̏�ɃO���t�B�J���{�^����\��
		[locate x="&tf.album_x[tf.album_i]" y="&tf.album_y[tf.album_i]"]
		[button graphic="album_thum_mouseover.png" target=*album_select exp="&'tf.album_select='+tf.album_i"]
	[endif]
	[jump target=*album_loop1 cond="++tf.album_i < 30"]

; ���[�v�J�E���^���O�ɂ���
[eval exp="tf.album_i = 0"]
*album_loop2
	; �y�[�W�p�{�^����\������i���݁A�\�����̃y�[�W�̃{�^���̂݃f�U�C����ς���j
	[locate x="&tf.album_page_x[tf.album_i]" y="50"]
	[button graphic="&'image/album/album_page_'+(tf.album_i+1)+'.png'" target=*album_redraw exp="&'sf.album_page='+tf.album_i" cond="sf.album_page!=tf.album_i"]
	[button graphic="&'image/album/album_page_clicked_'+(tf.album_i+1)+'.png'" target=*album_redraw exp="&'sf.album_page='+tf.album_i" cond="sf.album_page==tf.album_i"]
	[if exp="tf.album_i < tf.album_page_x.length-1"]
		[locate x="400 + tf.album_i*45" y="50"]
		[pimage storage="image/album/album_page_space.png" layer=base page=fore dx="&tf.album_page_x[tf.album_i+1]-22" dy=50 sw=22 sh=43]
	[endif]
	[jump target=*album_loop2 cond="++tf.album_i < tf.album_page_x.length"]
;
; �u�߂�v�{�^����\��
[locate x=566 y=509]
[locate  x=100 y=675][button graphic="viewmenu_return.png" target=*album_return]
[locate  x=405 y=675][button graphic="viewmenu_returntitle.png" target=*album_title]
[locate  x=685 y=675][button graphic="viewmenu_end.png" target=*album_end][r]
[s]


;
; �T���l�C���摜���I�����ꂽ
;
*album_select
; �C�x���g�G��O�i���C���ɓǂݍ��݁A�\��
[image storage="&tf.album_storage[tf.album_select+30*sf.album_page]" layer="&tf.album_layer" page=fore visible=true left=0 top=0 index=1999999 pos="center"]
; �N���b�N��҂�
[waitclick]
; �C�x���g�G�̑O�i���C�����\���ɂ���
[layopt layer="&tf.album_layer" page=fore visible=false]
[unlocklink]
[s]


;
; �u�߂�v���I�����ꂽ
;
*album_return
; ��������̞x�U��ǂݍ��݁A��ԕ��A
[tempload place=6]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂�
[rclick enabled=false]
[return]

;
; �u�^�C�g���֖߂�v���I�����ꂽ
;
*album_title
[gotostart ask=true]
[jump target=*album_redraw]

*album_end
[eval exp="kag.closeByScript(%['ask'=>'true'])"]
;�������̏ꍇ�A�ĕ`��
[jump target=*album_redraw]

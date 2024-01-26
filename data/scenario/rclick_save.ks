;
; rclick_save.ks�c�Z�[�u��ʁi�o�[�W�����`�j
;

;
; �g�����F
;   [call storage="rclick_save.ks" target=*save_menu]
;
; ���ӎ����F
;   �]���T�u���[�`���ł̓�������̞x�Q���g�p���Ă���
;   �]�\�߁AConfig.tjs�̈ȉ��̍��ڂ��C�����邱��
;       storeMenu.visible �c false�ɕύX
;
; �g�p���Ă���ϐ��F
;   tf.rclick_message �c �Z�[�u��ʂ���郁�b�Z�[�W���C�����irclick.ks�̕ϐ��𗬗p�j
;   tf.save_i         �c ���[�v�J�E���^
;   tf.save_date      �c �x�̕ۑ������iYYYY/MM/DD hh:mm�`���j
;

*save_menu
; �y�[�W�J�E���^���O�ɂ���
[eval exp="tf.save_page = 0"]
; �Z�[�u��ʂŃ}�E�X�E�N���b�N���ꂽ��A�u�߂�v�Ɠ��������������
[rclick jump=true target="*save_return" storage="rclick_save.ks" enabled=true]
; ��������̞x�Q�Ɍ��݂̏�Ԃ�ۑ�
[tempsave place=2]
; ���b�Z�[�W���C���̑�����ݒ�G�Z�[�u�f�[�^�̈ꗗ��`�悷��
;[position layer="&tf.rclick_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" frame="savemode_bg_normal.png" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true]
[position layer="&tf.rclick_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true opacity=0]
; �����N���N���b�N���ꂽ��A�����N������̕ύX�����f�����悤*save_redraw�ɖ߂��čĕ`�悷��
*save_redraw
;�w�i���C���\��
[image storage="save_back" layer="base" page="fore"]
; ���b�Z�[�W���C���̃N���A
[er]
; �t�H���g��ύX
[font size=50 face="�l�r �S�V�b�N" color=0xffffff italic=false rubysize=10 rubyoffset=0 shadow=false edge=false edgecolor=0x000000 shadowcolor=0x000000 bold=true]
; ���[�v�J�E���^���O�ɂ���
[eval exp="tf.save_i = 0"]
*save_loop
[eval exp="tf.save_num = tf.save_i+(tf.save_page*5)"]
;	; �x�̕ۑ��������l��
;	[eval exp="tf.save_date = kag.getBookMarkDate(tf.save_i)"]
;	; �ۑ��������󕶎��Ȃ�A�����"----/--/-- --:--"�������Ă���
;	[eval exp="tf.save_date = '----/--/-- --:--'" cond="tf.save_date == ''"]
	; �n�C�p�[�����N�̕\���ʒu���w��
	[locate x=75 y="&190+80*tf.save_i"]
	������[emb exp="tf.save_num+1"]
	; �n�C�p�[�����N�����i�N���b�N������kag.storeBookMark()���Ăяo���A*save_redraw�փW�����v����j
	[link target=*save_redraw exp="&'kag.storeBookMark('+tf.save_num+')'"]
		; �����N������ɂ́A�x�̕ۑ������ƃu�b�N�}�[�N�����g��
;		[emb exp="tf.save_date"] [emb exp="kag.getBookMarkPageName(tf.save_i)"]
		[locate x=320][emb exp="kag.getBookMarkPageName(tf.save_num)"]
	; �n�C�p�[�����N�����܂�
	[endlink]
	; ���p�\�Ȟx�̐��Ԃ�J��Ԃ�
	[jump target=*save_loop cond="++tf.save_i < 5"]
[resetfont]
; �u�߂�v�{�^����z�u
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
;�I�����������̏ꍇ�As�^�O�ȍ~�����s�����B���̑΍�Ƃ��ĉ�ʕ`�揈�����ɖ߂��B
[jump target=*save_redraw]
;
; �u�߂�v���I�����ꂽ�^�}�E�X�E�N���b�N���ꂽ
;
*save_return
; ��������̞x�Q��ǂݍ��݁A��ԕ��A
[tempload place=2]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂�
[rclick jump=true target="*rclick_return" storage="rclick.ks" enabled=true]
; �߂�
[return]

*save_next_page
[eval exp="tf.save_page++"]
[jump target=*save_redraw]

*save_prev_page
[eval exp="tf.save_page--"]
[jump target=*save_redraw]

;
; �u�^�C�g���֖߂�v���I�����ꂽ
;
*save_title
[gotostart ask=true]
[jump target=*save_redraw]


;
; �u���j���[�𔲂���v���I�����ꂽ
;
*save_return2
; ��������̞x�O��ǂݍ��݁A��ԕ��A
[tempload place=2]
; �E�N���b�N�T�u���[�`����ݒ肵����
[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
; �f�t�H���g�̕����\�����x�Ȃ�ir_click_config.ks���Őݒ肵���j�l�𒼂��ɔ��f
[delay speed=user cond="kag.chUserMode"]
; �E�N���b�N�T�u���[�`���̏I
[return]

;
; rclick_load.ks�c���[�h��ʁi�o�[�W�����`�j
;

;
; �g�����F
;   [call storage="rclick_load.ks" target=*load_menu]
;
; ���ӎ����F
;   �]���T�u���[�`���ł̓�������̞x�P���g�p���Ă���
;   �]���T�u���[�`�����ŁA�E�N���b�N���̐ݒ��ύX���Ă���B�Ăяo�����Ō��̐ݒ�ɖ߂����Ɓi���d�v�j
;   �]�\�߁AConfig.tjs�̈ȉ��̍��ڂ��C�����邱��
;       restoreMenu.visible �c false�ɕύX
;
; �g�p���Ă���ϐ��F
;   tf.load_message �c ���[�h��ʂ���郁�b�Z�[�W���C�����irclick.ks��tf.rclick_message�Ɠ����l�ō\��Ȃ��j
;   tf.load_i       �c ���[�v�J�E���^
;   tf.load_date    �c �x�̕ۑ������iYYYY/MM/DD hh:mm�`���j
;   tf.load_name    �c �x�̌��o���i�u�b�N�}�[�N���j
;

*load_menu
; �y�[�W�J�E���^���O�ɂ���
[eval exp="tf.load_page = 0"]
; ���[�h��ʂŃ}�E�X�E�N���b�N���ꂽ��A�u�߂�v�Ɠ��������������
[rclick jump=true target="*load_return" storage="rclick_load.ks" enabled=true cond="!tf.load_mode"]
[rclick jump=true target="*load_title" storage="rclick_load.ks" enabled=true cond="tf.load_mode"]
; ��������̞x�P�Ɍ��݂̏�Ԃ�ۑ�
[tempsave place=1]
; ���[�h��ʂ�\�����郁�b�Z�[�W���C����
[eval exp="tf.load_message = 'message1'" cond="!tf.load_mode"]
[eval exp="tf.load_message = 'message'" cond="tf.load_mode"]
; ���b�Z�[�W���C���̑�����ݒ�G�Z�[�u�f�[�^�̈ꗗ��`�悷��
[position layer="&tf.load_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true opacity=0]
*load_redraw
;�w�i���C���\��
[image storage="load_back" layer="base" page="fore"]
; ���b�Z�[�W���C���̃N���A
[er]
; �t�H���g��ύX
[font size=50 face="�l�r �S�V�b�N" color=0xffffff italic=false rubysize=10 rubyoffset=0 shadow=false edge=false edgecolor=0x000000 shadowcolor=0x000000 bold=false]
; ���[�v�J�E���^���O�ɂ���
[eval exp="tf.load_i = 0"]
*load_loop
	[eval exp="tf.load_num = tf.load_i+(tf.load_page*5)"]
;	; �x�̕ۑ��������l��
;	[eval exp="tf.load_date = kag.getBookMarkDate(tf.load_i)"]
;	; �ۑ��������󕶎��Ȃ�A�����"----/--/-- --:--"�������Ă���
;	[eval exp="tf.load_date = '----/--/-- --:--'" cond="tf.load_date == ''"]
	; �x�̌��o�����l��
	[eval exp="tf.load_name = kag.getBookMarkPageName(tf.load_num)"]
	; �n�C�p�[�����N�̕\���ʒu���w��
	[locate x=75 y="&190+80*tf.load_i"]
	������[emb exp="tf.load_num+1"]
	; ���o����"(���ݒ�)"�łȂ���΃n�C�p�[�����N�����i�N���b�N������kag.restoreBookMark()���Ăяo���j
	[link exp="&'kag.restoreBookMark('+tf.load_num+')'" cond="tf.load_name!='(���ݒ�)'"]
		[locate x=320][emb exp="tf.load_name"]
;		; �����N������ɂ́A�x�̕ۑ������ƃu�b�N�}�[�N�����g��
;		[emb exp="tf.load_date"] [emb exp="tf.load_name"]
;	; �n�C�p�[�����N�����܂�
	[endlink cond="tf.load_name!='(���ݒ�)'"]
	; ���p�\�Ȟx�̐��Ԃ�J��Ԃ�
	[jump target=*load_loop cond="++tf.load_i < 5"]
[resetfont]
; �u�߂�v�{�^����z�u
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
;�I�����������̏ꍇ�As�^�O�ȍ~�����s�����B���̑΍�Ƃ��ĉ�ʕ`�揈�����ɖ߂��B
[jump target=*load_redraw]

;
; �u�߂�v���I�����ꂽ�^�}�E�X�E�N���b�N���ꂽ
;
*load_return
; ��������̞x�P��ǂݍ��݁A��ԕ��A
[tempload place=1]
; �߂�i���Ăяo�����Ń}�E�X�E�N���b�N�̐ݒ�����ɖ߂����Ɓj
[return]

*load_next_page
[eval exp="tf.load_page++"]
[jump target=*load_redraw]

*load_prev_page
[eval exp="tf.load_page--"]
[jump target=*load_redraw]

;
; �u�^�C�g���֖߂�v���I�����ꂽ
;
*load_title
[gotostart ask=true]
[jump target=*load_redraw]


;
; �u���j���[�𔲂���v���I�����ꂽ
;
*load_return2
; ��������̞x1��ǂݍ��݁A��ԕ��A
[tempload place=1]
; �E�N���b�N�T�u���[�`����ݒ肵����
[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
; �f�t�H���g�̕����\�����x�Ȃ�ir_click_config.ks���Őݒ肵���j�l�𒼂��ɔ��f
[delay speed=user cond="kag.chUserMode"]
; �E�N���b�N�T�u���[�`���̏I��
[return]

;
; rclick_chapter.ks�c���[�h��ʁi�o�[�W�����`�j
;

;
; �g�����F
;   [call storage="rclick_chapter.ks" target=*chapter_menu]
;
; ���ӎ����F
;   �]���T�u���[�`���ł̓�������̞x�P���g�p���Ă���
;   �]���T�u���[�`�����ŁA�E�N���b�N���̐ݒ��ύX���Ă���B�Ăяo�����Ō��̐ݒ�ɖ߂����Ɓi���d�v�j
;   �]�\�߁AConfig.tjs�̈ȉ��̍��ڂ��C�����邱��
;       restoreMenu.visible �c false�ɕύX
;
; �g�p���Ă���ϐ��F
;   tf.chapter_message �c ���[�h��ʂ���郁�b�Z�[�W���C�����irclick.ks��tf.rclick_message�Ɠ����l�ō\��Ȃ��j
;   tf.chapter_i       �c ���[�v�J�E���^
;   tf.chapter_date    �c �x�̕ۑ������iYYYY/MM/DD hh:mm�`���j
;   tf.chapter_name    �c �x�̌��o���i�u�b�N�}�[�N���j
;

*chapter_menu
; �y�[�W�J�E���^���O�ɂ���
[eval exp="tf.chapter_page = 0"]
; ���[�h��ʂŃ}�E�X�E�N���b�N���ꂽ��A�u�߂�v�Ɠ��������������
[rclick jump=true target="*chapter_return" storage="rclick_chapter.ks" enabled=true cond="!tf.load_mode"]
[rclick jump=true target="*chapter_title" storage="rclick_chapter.ks" enabled=true cond="tf.load_mode"]
; ��������̞x�P�Ɍ��݂̏�Ԃ�ۑ�
[tempsave place=3]
; ���[�h��ʂ�\�����郁�b�Z�[�W���C����
[eval exp="tf.chapter_message = 'message1'" cond="!tf.load_mode"]
[eval exp="tf.chapter_message = 'message'" cond="tf.load_mode"]
; ���b�Z�[�W���C���̑�����ݒ�G�Z�[�u�f�[�^�̈ꗗ��`�悷��
;[position layer="&tf.chapter_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" frame="chaptermode_bg_normal.png" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true]
[position layer="&tf.chapter_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true opacity=0]
*chapter_redraw
;�w�i���C���\��
[image storage="chapter_back" layer="base" page="fore"]
; ���b�Z�[�W���C���̃N���A
[er]
; �t�H���g��ύX
[font size=50 face="�l�r �S�V�b�N" color=0xffffff italic=false rubysize=10 rubyoffset=0 shadow=false edge=false edgecolor=0x000000 shadowcolor=0x000000 bold=false]
; ���[�v�J�E���^���O�ɂ���
[eval exp="tf.chapter_i = 0"]
*chapter_loop
	[eval exp="tf.chapter_num = tf.chapter_i+(tf.chapter_page*5)"]
	; �n�C�p�[�����N�̕\���ʒu���w��
	[locate x=75 y="&190+80*tf.chapter_i"]
	[if exp="tf.chapter_num<tf.label.count"]
		; ���o����"(���ݒ�)"�łȂ���΃n�C�p�[�����N�����i�N���b�N������kag.restoreBookMark()���Ăяo���j
		[link target="*chapter_move" exp="&'tf.chapter_selected='+tf.chapter_num"]
			[emb exp="&'tf.label_title['+ tf.chapter_num +']'"]
		; �n�C�p�[�����N�����܂�
		[endlink]
	[endif]
	; ���p�\�Ȟx�̐��Ԃ�J��Ԃ�
	[jump target=*chapter_loop cond="++tf.chapter_i < 5"]
[resetfont]
; �u�߂�v�{�^����z�u
[locate x=20 y=680][button graphic="config_return.png" target=*chapter_return  cond="!tf.load_mode"]
[locate  x=245 y=680][button graphic="config_returntitle.png" target=*chapter_title]
[locate  x=480 y=680][button graphic="config_end.png" exp="kag.closeByScript(%['ask'=>'true'])"][r]
[if exp="tf.chapter_page>=1"]
[locate x=750 y=680]
	[button graphic="config_prev" target=*chapter_prev_page]
[endif]
[if exp="tf.chapter_page<3"]
[locate x=870 y=680]
	[button graphic="config_next" target=*chapter_next_page]
[endif]
[s]
[jump target=*chapter_redraw]

*chapter_move
; ��������̞x3��ǂݍ��݁A��ԕ��A
[tempload place=3]
; �E�N���b�N�T�u���[�`����ݒ肵����
[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
[eval exp="tf.chapter_mode=1"]
[gotostart ask=false]
[jump target=*chapter_redraw]

;
; �u�߂�v���I�����ꂽ�^�}�E�X�E�N���b�N���ꂽ
;
*chapter_return
; ��������̞x�P��ǂݍ��݁A��ԕ��A
[tempload place=3]
;; �߂�i���Ăяo�����Ń}�E�X�E�N���b�N�̐ݒ�����ɖ߂�����
;[jump target="*chapter_redraw"]
[return]

*chapter_next_page
[eval exp="tf.chapter_page++"]
[jump target=*chapter_redraw]

*chapter_prev_page
[eval exp="tf.chapter_page--"]
[jump target=*chapter_redraw]

;
; �u�^�C�g���֖߂�v���I�����ꂽ
;
*chapter_title
[gotostart ask=true]
[jump target=*chapter_redraw]


;
; �u���j���[�𔲂���v���I�����ꂽ
;
*chapter_return2
; ��������̞x1��ǂݍ��݁A��ԕ��A
[tempload place=3]
; �E�N���b�N�T�u���[�`����ݒ肵����
[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
; �f�t�H���g�̕����\�����x�Ȃ�ir_click_config.ks���Őݒ肵���j�l�𒼂��ɔ��f
[delay speed=user cond="kag.chUserMode"]
; �E�N���b�N�T�u���[�`���̏I��
[return]

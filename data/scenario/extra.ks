;
; extra.ks�c�G�N�X�g�����
;

;
; ���ӎ����F
;   �]
;
; �g�p���Ă���ϐ��F
;

*extra_menu
; �G�N�X�g����ʂ�\�����郁�b�Z�[�W���C����
[eval exp="tf.extra_message = 'message'"]
; �E�N���b�N�T�u���[�`�����ŉE�N���b�N���ꂽ��A�u�߂�v�Ɠ��������������
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
; ��������̞x0�Ɍ��݂̏�Ԃ�ۑ�
;[tempsave place=0]
; �������C����}�~
[history output=false enabled=false]
; �w�i���C���\��ʂ̃N���b�J�u���}�b�v�𖳌���
[mapdisable layer=base page=fore]
; �S�O�i���C���\��ʂ̃N���b�J�u���}�b�v�𖳌���
[eval exp="tf.extra_i=0"]
*extra_loop0
;	[mapdisable page=fore layer="&tf.extra_i"]
;	[jump target=*rclick_loop0 cond="++tf.extra_i<kag.numCharacterLayers"]
;; ���j���[�p���b�Z�[�W���C���\��ʂ�\�����A�J�����g�̃��b�Z�[�W���C���ɂ���
;[layopt layer="&tf.extra_message" page=fore visible=true]
;[current layer="&tf.extra_message" page=fore]
; �m�[�E�F�C�g
[delay speed=nowait]

; ���u�O���t�B�b�N�{���v�u���[�h����v�u�Z�[�u����v����߂��Ă��郉�x��
;   �u�^�C�g���֖߂�v�u���j���[�𔲂���v���L�����Z�������ꍇ���A�����ɖ߂�
*extra_menu_loop
;���y��~
[fadeoutbgm time=1000]

;; ���j���[�p���b�Z�[�W���C���̐ݒ�
[position layer="&tf.extra_message" page=fore left=0 top=0 width="&kag.scWidth" height="&kag.scHeight" marginl=0 margint=0 marginr=0 marginb=0 draggable=false visible=true vertical="false" opacity=0]
;�w�i���C���\��
[image storage="extra_back" layer="base" page="fore"]
; ���b�Z�[�W���C�����N���A
[er]
; �u�C�m�Z���g�X�t�B�A�Ƃ́v�`�u�^�C�g���֖߂�v��z�u
[locate x=260 y=150][button graphic="extra_is" target=*extra_is]
;���ҏЉ�E�E�ǂ��������ɍ���̖��������Ă��邩�H
[locate x=260 y=220][button graphic="extra_cast" target=*extra_cast]
;����̕���̃v���b�g�E�R���Z�v�g
[locate x=260 y=290][button graphic="extra_plot" target=*extra_concept]
;���o�ɂ���
[locate x=260 y=360][button graphic="extra_direction" target=*extra_direction]
;����̎ʐ^�̉{�����[�h
[locate x=260 y=430][button graphic="extra_pictures" target=*extra_pictures]
;�_�C�W�F�X�g
[locate x=260 y=500][button graphic="extra_digest" target=*extra_digest]

;[locate x=260 y=150][link target=*extra_after_history]���݂̕����̂��̌�[endlink][r]
;[link target=*extra_illustrations]�C���X�g�̉{�����[�h[endlink][r]
;[link target=*extra_art]���p�ɂ��āE�E�Z�b�g�A�t�@�b�V�����A���y[endlink][r]
[locate  x=405 y=675][button graphic="configmenu_returntitle.png" target=*extra_title]
[locate  x=685 y=675][button graphic="configmenu_end.png" exp="kag.closeByScript(%['ask'=>'true'])"][r]
[s]
;�I�����������̏ꍇ�As�^�O�ȍ~�����s�����B���̑΍�Ƃ��ĉ�ʕ`�揈�����ɖ߂��B
[jump target=*extra_menu_loop]

;
; �u�C�m�Z���g�X�t�B�A�Ƃ́v���I�����ꂽ
;
*extra_is
; �u�C�m�Z���g�X�t�B�A�Ƃ́v�R���e���c��
[call storage="scenario/extra/extra_is.ks" target=*is_start]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��iextra_is.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; �u���ҏЉ�v���I�����ꂽ
;
*extra_cast
; �u�C�m�Z���g�X�t�B�A�Ƃ́v�R���e���c��
[call storage="scenario/extra/extra_cast.ks" target=*cast_start]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��iextra_is.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; �u����̕���̃v���b�g�E�R���Z�v�g�v���I�����ꂽ
;
*extra_concept
; �u����̕���̃v���b�g�E�R���Z�v�g�v�R���e���c��
[call storage="scenario/extra/extra_concept.ks" target=*concept_start]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��iextra_concept.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; �u���o�ɂ��āv���I�����ꂽ
;
*extra_direction
; �u���o�ɂ��āv�R���e���c��
[call storage="scenario/extra/extra_direction.ks" target=*direction_start]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��iextra_direction.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; �u���݂̕����̂��̌�v���I�����ꂽ
;
*extra_after_hitory
; �u���݂̕����̂��̌�v�R���e���c��
[call storage="extra/extra_after_hitory.ks" target=*is_start]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��iextra_after_history.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; �u�C���X�g�̉{�����[�h�v���I�����ꂽ
;
*extra_pictures
; �u�C���X�g�̉{�����[�h�v�R���e���c��
[call storage="scenario/extra/album.ks" target=*album_menu]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��iextra_pictures.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; �u����̎ʐ^�̉{�����[�h�v���I�����ꂽ
;
*extra_illustrations
; �u����̎ʐ^�̉{�����[�h�v�R���e���c��
[call storage="scenario/extra/album.ks" target=*album_menu]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��ialbum.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; �u���p�ɂ��āv���I�����ꂽ
;
*extra_art
; �u���p�ɂ��āv�R���e���c��
[call storage="scenario/extra/extra_art.ks" target=*art_start]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��iextra_art.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]


*extra_digest
; �u�C�m�Z���g�X�t�B�A�Ƃ́v�R���e���c��
[call storage="scenario/extra/extra_digest.ks" target=*digest_start]
; �}�E�X�E�N���b�N���ꂽ�Ƃ��̓�������ɖ߂��iextra_is.ks���Ń}�E�X�E�N���b�N�̐ݒ肪�ς���Ă��邽�߁j
[rclick jump=true target="*extra_title" storage="extra.ks" enabled=true]
[jump target=*extra_menu_loop]

;
; �u�^�C�g���֖߂�v���I�����ꂽ
;
*extra_title
[gotostart ask=true]
[jump target=*extra_menu_loop]

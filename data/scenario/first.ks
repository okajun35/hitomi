*title_menu|�^�C�g��
[loadplugin module="wuvorbis.dll"]
[loadplugin module="krmovie.dll"]


[startanchor]
[eval exp="tf.label = ['*start','*cast','*story_011','*story_012','*story_013','*story_01','*story_02','*story_03','*story_04','*story_05','*story_06','*story_07','*story_08','*story_09','*story_10','*story_11','*story_12','*story_13','*story_14','*story_15']"]
[eval exp="tf.label_title = ['�X�^�[�g','����E�z��','�Z���� �m�Ï�','�Z�\��� ���y��E���','�Z�\�O�� ������','���@������','���@�L����','�O��@���E�Z�p���E����','�l��@���E�Z���͌��E���Y��','�܏�@�S','�Z��@���Ώ�','����@�ߍ]�@���J','����@���Ώ�@���Ώ鉺�̕����\�\�B','���@�ߍ]�@���n','�\��@���y��','�\���@�ߍ]�E�R��','�\���@�ߍ]�E���y�鉺','�\�O�� ���y�ߍx �L�� �֏�','�\�l��@���y��','�\�܏�@�{�\��']"]
[call storage="scenario/extra/album_init.ks" target=*album_init]
[cm]

; ���b�Z�[�W�����ւ̏o�͂��~���A�\���s�ɂ���

[history output=false enabled=false]

; �x�ɂ͂��߂Ȃ�����

[disablestore store=true]

[rclick enabled="false"]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]


;�Z���t�Đ�
;[playse buf="0" storage="sound/voice/catch.ogg" ]

[image storage="image/rogo2.jpg" layer=base page="fore" visible="false" top="0"]
[image storage="image/rogo.jpg" layer=base page="back" visible="false" top="0"]
[wait time=1000]
[trans layer=base time=4000 method=crossfade]
[wt]



[image storage="image/rogo.jpg" layer=base page="fore" visible="false" top="0"]
[image storage="image/rogo2.jpg" layer=base page="back" visible="false" top="0"]
[wait time=1000]
[trans layer=base time=2000 method=crossfade]
[wt]
[wait time="1000"]


; �ȍ~�̓^�C�g�����j���[���
*title_menu|�^�C�g�����j���[
[startanchor]
[if exp="tf.chapter_mode"]
	[eval exp="tf.chapter_mode=0"]
	[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
	[position layer=message0 page=fore opacity=128 vertical="true"]
	[delay speed=user]
	; �x�ɂ͂��߂�悤�ɂ���
	[disablestore store=false]
	; ���b�Z�[�W�����ւ̏o�͂��ĊJ�A�\���ɂ���
	[history output=true enabled=true]
	[jump target="&tf.label[tf.chapter_selected]"]
[endif]
[disablestore store="true" restore="false"]
[rclick enabled="false"]

;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/�M��.ogg" loop="true"]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[ws buf=0 canskip="false"]

[image storage="image/title2/�^�C�g��2.bmp" layer=base page="fore"]

[position layer=message0 page=fore opacity=0 vertical="false"]



[tempsave place=0]
; �������C����}�~
[history output=false enabled=false]
; �w�i���C���\��ʂ̃N���b�J�u���}�b�v�𖳌���
[mapdisable layer=base page=fore]
; �S�O�i���C���\��ʂ̃N���b�J�u���}�b�v�𖳌���
; ���j���[�p���b�Z�[�W���C���\��ʂ�\�����A�J�����g�̃��b�Z�[�W���C���ɂ���
;[layopt layer="&tf.rclick_message" page=fore visible=true]
;[current layer="&tf.rclick_message" page=fore]


[delay speed=nowait]
*title_menu_loop
[er]


[locate x = 40 y=0]
[button graphic="image/title2/start.png" target=*restore hint="�͂��߂���"]

[locate x = 40 y=70]
;[button graphic="image/title2/load.png" jump storage="rclick_load2.ks" target=*load_menu2 hint="�Â�����"]
[button graphic="image/title2/load.png" storage="rclick_load.ks" target=*load_menu exp="tf.load_mode=true" hint="�Â�����"]
[locate x = 40 y=140]
[button graphic="image/title2/chaptar.png" storage="rclick_chapter.ks" target=*chapter_menu exp="tf.load_mode=true" hint="�e�͂̓�����"]

[locate x = 40 y=210]
[button graphic="image/title2/extla.png" storage="extra.ks" target=*extra_menu hint="�G�N�X�g��"]

[locate x = 40 y=280]
[button graphic="image/title2/end.png" exp="kag.closeByScript(%['ask'=>'true'])" hint="�I��"]



;[style align=center]
;
;[font size =40 face ="�����˓�s����" color=0x000000 bold="true"  shadow="false"]
;[link target=*restore]�͂��߂���[endlink][r]
;[link target=*restore]�Â�����[endlink][r]
;[link target=*restore]�G�N�X�g��[endlink][r]
;
;[link exp="kag.close()"]�I��[endlink]

[s]
;�I�����������̏ꍇ�As�^�O�ȍ~�����s�����B���̑΍�Ƃ��ĉ�ʕ`�揈�����ɖ߂��B
[jump target=*title_menu_loop]

[resetstyle]


;

; �ݒ�𕜋A

;

*restore

[rclick call=true target="*rclick_menu" storage="rclick.ks" enabled=true]
[position layer=message0 page=fore opacity=128 vertical="true"]



[delay speed=user]

; �x�ɂ͂��߂�悤�ɂ���

[disablestore store=false]

; ���b�Z�[�W�����ւ̏o�͂��ĊJ�A�\���ɂ���

[history output=true enabled=true]

;
*start|�X�^�[�g

; ���ۂ̃V�i���I��
;���y��~
[fadeoutbgm time=1000]
[cm]
[wait time=500]
;[image storage="taitole" layer="base" page="fore"]
[image storage="black2" layer="base" page="fore "visible="true" top="0"]
;[image storage="black" layer="base" page="fore" visible="true" top="0"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�ЂƂ͂����鎩�R�������ꂽ�Ƃ��A����̕s���Ȍ���Ƃ��̕s���R���ɋC�t���ł��낤�B
�l�Ԃ͉i���Ɏ��R�ł͗L�蓾�Ȃ��B�Ȃ��Ȃ�l�Ԃ͐����Ă���A�����Ȃ˂΂Ȃ炸�A
�����Đl�Ԃ͍l���邩�炾�B[l][r] 
                            �������w���_�x[l][r]
[r]


���͕s������΂��A�^������т܂��B���ׂĂ����܂񂵁A���ׂĂ�M���A���ׂĂ���
�҂��A�S�Ă�ς��E�т܂��B���͌����Đ₦�邱�Ƃ�����܂���B�a���̎����Ȃ��
������܂��B�ٌ��Ȃ�΂�݂܂��B�m���Ȃ�΂�����܂��B�c<����>�c���܂ł��c
����̂͐M�Ɗ�]�ƈ��ł��B���̒��ň�Ԃ�����Ă���͈̂��ł��B [l][r]
                            �R�����g���T    �P�R�͂S�߁`�P�R�� [l][r]
[r]

�m���ɂ͌��E������B�z���͂́A���E���݂��ށB [l][r]
                            �A���o�[�g�E�A�C���V���^�C�� [l][r][r]
[r]
[r]
�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\ [r]
[r][p]
[cm]
*cast|����E�z��
//[position layer=message0 page=fore opacity=128 vertical="true"]
[position layer=message0 page=fore opacity=128 vertical="true"]
[image storage="taitole" layer="base" page="fore"]
[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

����E�z��[resetfont] [r]
[r]

�y����z[l][r] 
�V�����N�i��܎���N�j �ے� �` �V���\�N�i�P�T�W�Q�j�N ���E�{�\��  [l][r]
[r][r]


�y�o��l���z [r]
�\�Y �c ��̖앐�m [r]

��T �c �������̑��� [r]

���� �c �������̑��l [r]

�݂� �c ��T�̖� [r]

�펵 �c �����̌Z�B���H�Ƃ��Ĉ��y�錚�݂Ɍg��� [r]
[r]
<�������̐l�X> [r]
���ܘY �c �������̑��l[r]
�΋g �c �������̑��l [r]
�� �c �������̑��l [r]
���] �c �������̑��l [r]
�Ƃ� �c �������̑��l [r]
[r]

<�L����> [r]
�r�ؑ��d �c �L������B�M���ɑ΂�������|��[r]
���� �c ���d�̍� [r]
[r]

<�Z�p��> [r]
���� �c �M���ɕ����E���ꂽ�� [r]
[r]

<���Ώ�> [r]
���R�E�� �c �r�ؑ��d�z���̕����B���Ώ��B�L���V�^���喼[r]
���X�^ �c ���R�E�߂̍� [r]
[r]

<���M���h����> [r]
�G�ꑷ�s �c �S�C�W��𗦂����p�̖��� [r]
�~�Q���s�� �c �M���ɓG�ӂ�����L���V�^�� [r]
���n���i��� �c �M���ɓG�ӂ�����L���V�^�� [r]
[r]

<���y�Z�~�i����> [r]
�p�E���O�� �c ���y�Z�~�i�����̃L���V�^�� [r]
[r]

<�D�c�R> [r]
���c�����q �c �D�c�E�L�b�z���̕��� [r]
�H�ďG�g �c �D�c�z���̕����B�����ɓV�������_��[r]
�����Y �c �D�c�R�̕��m[r]
�O�H���G �c �D�c�z���̕���[r]
����v �c �D�c�z���̕���[r]
���q���G �c �D�c�z���̕���[r]
�D�c�M�� �c �V�˂ƌĂ΂�A�V�������_���e��[r] 
[r]

�������̐l�X[r]
�l���̐l�X[r]
�\�Y�R�̐l�X[r]
�M���ÎE��̐l�X[r]
�D�c�R�̐l�X[r]
[r]
��[l] [p][cm]

*story_011|�Z���� �m�Ï�
[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
;[image storage="keikoba" layer="base" page=fore]

;[image storage="taitole" layer="base" page="fore" visible=]

[image storage="fgimage/1/_IS17189.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="sound/effect/P51�K��.ogg" loop="true"]

�Z���� �m�Ï�[resetfont] [r]
[r]

[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
;������[�h�e�L�X�g�Ăяo��
;[call target="*explan001" storage="explanation.ks" cond="sf.bExplan"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
����͍���F�̑f����B[l][r]
�J���O������҂����̓E�H�[�~���O�A�b�v�����A[l][r]
����ɕ���ɖ��҂������Ă����B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/1/itou.ogg" ]
�ɓ��D�@�@�@�@ [indent]
���҂̊F����A���݂܂��[��B�Ԃ��Ȃ��J�n���܂����A�����́A�������ߑ��́A
���̌m�Ï�ɂ�����̂��g���Ă���ĉ������B���肢���܁[���B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���낼��Əo�čs�����҂����B[r]
�\�Y���̖��҂���l�A����Ɏc��B[r]
�ނ͈�l�A�N�����Ȃ������ŕs�v�c�ȓ������n�߂�B[l][r]

[image storage="fgimage/2/_IS17200.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]

[image storage="fgimage/2/_IS17202.JPG" layer="1" page="fore" visible="true" top="50"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


���ǂ��ǂ����A�������Ȃ������\�\�\�\�B[endindent][l][r]
[r]

[image storage="fgimage/1/_IS17189.JPG" layer="1" page="fore" visible="true" top="50"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���҂������߂��ė���B���ғ������Y�A���҂����ɌĂт�����B[endindent][l][r]
[r]

�������Y�@�@�@[indent]
�݂Ȃ��񂱂�ɂ��́B[endindent][l][r]

���Ґ��l�@�@�@[indent]
����ɂ��̓@�B[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/1/2.ogg" ]
�������Y�@�@�@[indent]
�u�Ԃ��Ȃ��n�܂�܂��B�����̗͂́A�����镨��󋵁A�����Ȃ�����
��������悤�ɂł��܂��B�ł́c�A���̌����Ȃ����̂́A�ł�����̂�
���ł��傤���c�B�����݂͂�Ȃŗ͂����킹�āA�����ɂ��ǂ蒅���Ă݂����Ǝv���܂��B�A�C���V���^�C���͂��������܂����B�u�m���ɂ͌��E������B�z���͂͐��E���ݍ��ށB�v�v�B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�ꔭ�̌��ʉ��B
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/P34�h�[��.ogg" ]

����������҂����B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]


�������Y�@�@�@[indent]
����ł́A�J�n���܁[���B�F����A��낵�����˂������܁[���B[endindent][l][r]

���҂����@�@�@[indent]
��낵�����˂������܁[���B[endindent][l][r]

[image storage="fgimage/3/_IS32232.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/1/3.ogg" ]
�������Y�@�@�@[indent]
�͂����Ⴀ�X�^���o�[�C�I�ߑ��X�^���o�[�C�I�Z�b�g�X�^���o�[�C�I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�ߑ��A�Z�b�g�����҂����ɂ���ĉ^�э��܂��B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/1/4.ogg" ]
�������Y�@�@�@[indent]
�͂��s����[�I�n�C�A���[�C�A[endindent][l][r]
[ws buf=1 canskip="true"]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�X�^���o�C���I�������҂������U��B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/1/5.ogg" ]
�������Y�@�@�@[indent]
�X�^�[�g�I[endindent][l][r]
[ws buf=1 canskip="true"]

[r]


*story_012|�Z�\��� ���y��E���
[image storage="fgimage/3/_IS17213.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[stopbgm]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���҂������o�T���ƈߑ���|���A��Ăɐg�ɓZ���B[r]


;���y��~

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/P34�h�[��.ogg" ]

[image storage="fgimage/3/_IS32234.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



;���y�J�n
[bgmopt volume="50"]
[playbgm storage="bgm/ogg/�M��.ogg" loop="true"]
��ʂ͕���̕���ւƕς��B[endindent][l][r]
[r]


;[image storage="aduti" layer="base" page=fore]
[ws buf=0 canskip="true"]

[p][cm]


[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
�Z�\��� ���y��E���[resetfont][l][r][r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�M���ƁA���������Ɛb�����B[endindent][l][r]
[r]

[image storage="fgimage/3/_IS16671.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �M���@�@�@[indent]
�捏�A������肱�̈��y�ɋA��̐܁A�䂪��c�Ɋ�P�������A���̐M��
��S�����̂ɂ���ƈÎE����Ă��҂炪�����B�߂����҂�����Ɋ|���A
�z��͐ےÁA�������̑��y�S���̈�}�ƒm�ꂽ�B�������ܑ��ɔ�сA��
�̎c�}�A�ꑰ����Ƃ�����c�����j��E���B�����āA�߂����҂̌���
�炠��ʉ\���܂��U�炳�ꂽ�B���Ȃ������������y��ł��낤�c�B����
�\�̐^�������Ɗm���߂�B���̎肪������g�������āA���̈��y�ɕ���
�߂邱�Ƃ͒f���ċ�����B�悢�ȁB[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�������A���������삯����B[l]

;���y��~
[fadeoutbgm time=3000]
����ւ��悤�ɁA�̂Ƌ��ɁA���̈��̏�i�ցB[endindent][l][r]
;���ʉ��Đ�


*story_013|�Z�\�O�� ������
[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]

[image storage="fgimage/4/_IS16674.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[playse buf="0" storage="sound/song/NO36�o�����̉�.ogg" ]
[p][cm]


�Z�\�O�� ������[resetfont][l][r][r]
;[image storage="mura1" layer="base" page=fore]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�n����翂т����B[r]
��������̖��𗎂Ƃ��A���炳���ł����鑺�l�����B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/��T���l.ogg" loop="true"]

�@���ܘY�@�@�@[indent]
�����o��ȃ@�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]���݂��l�B[endindent][l][r]

�@���ܘY�@�@�@[indent]
�c���߂���Ƃ��͂����������ꂠ�����˂񂾂���A���݂̂����`�킹
��Ⴂ���񂾁B[endindent][l][r]

�@�@ ��T�@�@�@[indent]�q���͂�����ƗV�Ԃ̂���Ԃ̎d������B[endindent][l][r]

�@���ܘY�@�@�@[indent]
�o�����o���˃F�c�B�i�ς܂ꂽ�ĕU�����āj�n�@�c�A�܂��������񂾂���
��ł��A��藧�Ă�����Ⴀ�A�z��ė��̈���c�����Ⴍ��˂񂾂�
����c�B�i�݂�������j�����A�݂�A[endindent][l][r]

;[image storage="03" layer="base" page=fore]
     �݂� �@�@ [indent]
�܂��H[endindent][l][r]

�@�@ ��T�@�@�@[indent]�����A�҂��ĂȁB���ꌋ�킦����B[endindent][l][r]

     �݂� �@�@ [indent]
�c�����A��B[endindent][l][r]

[image storage="fgimage/4/_IS24222.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]�����킯�Ȃ��ȃ@�B�Ȃ��I�݂扽����.���炯�ŁB���߁A����؂�ɍs
���Ă��ȁI�c�������͓S�C����˃F����A�s���Ȃ�������I[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�����A�݂�A�����́B[endindent][l][r]

�@�@ ��T�@�@�@[indent]���߃F�͂����c�B�o�̌������������˃F�ł͂��Ⴌ����āA[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�ցH���߉������Ă�́B�݂�A�������ĕU�����đ�����Ƃ��͂��Ă���
�˃F�́B�e�L�����������݂ăF�ɂ��񂵂傤�񂵂���Ă���Ă�����A
�݂�Ȃł��܂��Ă�H�B[endindent][l][r]

     �݂� �@�@ [indent]
�c�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]�݂�A�ق�Ƃ��B[endindent][l][r]

     �݂� �@�@ [indent]
�i�ۂ�ۂ�Ɓj�A������˃F�l�A�܂���l�Ŏ�����
���񂾂�B��������Ƃ�Q�����ĂĂ��A����͂��s���΁A�˃F�l������
�ꏏ�ɂ��Ă�����Ǝv���Ă�B[endindent][l][r]


[image storage="fgimage/4/_IS16676.JPG" layer="1" page="fore" visible="true"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]�i�݂������āj�n���݂�H�B���߃F�ɂȂ񂩂�������A���̐��̂���
���ɂȂ�Č������炢�񂾂�B[endindent][l][r]

[image storage="fgimage/4/_IS16677.JPG" layer="1" page="fore" visible="true" top="50" left="0" ]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����o���݂�B��T�A���₷�悤�ɋY��̂��̂��B�V�ԓ�l�B[l][r]
[r]
[fadeoutbgm time=30]

;�Z���t�Đ�
[playse buf="0" storage="sound/song/�Ȃ܂��̂�����T�݂�.ogg" ]
[image storage="fgimage/4/_IS17236.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
�u�ꐢ�i�ЂƂ�j���i�ӂ���j�� ���΁i�����Ȃ܂��j[l][r]
�O�܂��܂����� �p�R�i�ނ��܁j��[l][r]
�΂̏���˂� �e�@�t[l][r]
�q�݂Ⴊ�� �������ڂ�ł��������B�v[endindent][l][r]
[r]

[ws buf=0 canskip="true"]

;���y�J�n
[playbgm storage="bgm/ogg/��T���l.ogg" loop="true"]


�@�@ ��T�@�@�@[indent]������������A�����A������҂��ĂȁB[endindent][l][r]

     �݂� �@�@ [indent]
����B[endindent][l][r]

[r]
;[image storage="mura1" layer="base" page=fore]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�ЂƂ�Y��̂��̂��Ȃ��瑐�𕪂��A�R�ɓ���B[endindent][l][r]



;���y��~
[fadeoutbgm time=3000]


;���y�J�n
[playbgm storage="bgm/ogg/�\�Y.ogg" loop="true"]

[image storage="fgimage/6/_IS16679.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[r]

�₪�ĎR���ɌÈ�˂������B[l][r]
��T�A��˂Ɍ������Ď�����킹�A���̗t�ɕ�񂾈���т����B
�����ǂ��A�U��Ԃ��ĕ����o�����Ƃ���A�R�T���ē]�ԁB��l�Ɏ�
�ɓ��ĂĂ������n�ʂɂ��ƁA�ˑR�A��˂��狩�Ԑ�����������B[endindent][l][r]
[r]
 
[image storage="fgimage/6/_IS17240.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
�ЂႠ�I���A���ꂾ�Ȃ������������Ă��R�_�l�̂�������Ă̂́B����
�܂��񂷂�܂���A�����ɏo�Ă����܂�����A���˂��������炽������
�肵�˃F�ŉ������I�i���j���킟���I���A������Ȃ炨�炾���ɂ��ĉ�
�����B���̒ʂ肾�I���܂ň�������Č��������������͂��ɗ��Ă��ł�
�F���I���̈���э��񂾂��Ă�A���炽�����q�G�H���ĉ䖝���Ĉꐶ
�����c���Ƃ��������B��������߃F�A����Ȃ��Ă����邾�Ȃ�āA�c��
����Ƌt�M���ł˃F���I[endindent][l][r]

[image storage="fgimage/6/_IS17245.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
�����I[endindent][l][r]

�@�@ ��T�@�@�@[indent]�Ђ��I[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�����A�}�I���������Ă�I[endindent][l][r]

�@�@ ��T�@�@�@[indent]�������c�A�Ȃ�Ĉ炿�̈����R�_�l���B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�Ƃ��ƂƂ�������o���I[endindent][l][r]

�@�@ ��T�@�@�@[indent]�ցH����c�A�������畷�����Ă�̂��H�l���H[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�l���I���^�����l�ԗl���I[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�Ȃ�ŗ��������������A����ȌÈ�˂ɁB������Ƒ҂��Ă�A�������Ă������I�i���������������Ă����R���قǂ��j�B[endindent][l][r]

;[image storage="04" layer="base" page=fore]
[image storage="fgimage/6/_IS16688.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
�悵�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]���߁A�炩�����낱��ȂƂ��Łc�B
�i�R����˂ɂ��낵�āj�c�͂������H
�܂����H�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�i�s�C���ɏ΂��j������c�A�u�`�E���Ă���B[endindent][l][r]

�@�@ ��T�@�@�@[indent]�i�R�������j�Ђ��B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�i�R�����݂����ˁj���H�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]�i�R�������グ�āj�Ђ��A�Ђ��A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�i�R���������Ɣ�я��j�����R���I�����Ă�I[endindent][l][r]

�@�@ ��T�@�@�@[indent]�����������A���߁c�앐�m���ȁB[endindent][l][r]

[image storage="fgimage/6/_IS17249.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
�앐�m�H[endindent][l][r]

�@�@ ��T�@�@�@[indent]���P���Ă����z�Ȃ񂾂�B��ŁA�����̂������������₟���đގ����āA
��˂񒆕������񂾂ȁA��ł�ŁA�������D�������炨�߃F���������ƁA
����т���Ă���Ă��񂾂ȁB�_�����_���A�o���ˁA�o���˃F���I[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/3/1.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�҂āI�c���O�����ŁA�����o���˃F�ƌ�����邼�B�i���𐟂܂��j�c����
����B�R�n���B�\�܁c�����\�A����������[�Ŗ\�����Ă�B�킶��
�˃F�c�A�E�����B[endindent][l][r]
[ws buf=0 canskip="true"]

;���y��~
[fadeoutbgm time=3000]


;���y�J�n
[playbgm storage="bgm/ogg/�퓬.ogg" loop="true"]

[playse buf="0" storage="sound/voice/3/2.ogg" ]
�@�@ ��T�@�@�@[indent]�i��l�ɑ��������j�c�΂��B�����R���Ă�I�i�삯�o���j�B[endindent][l][r]
[ws buf=0 canskip="true"]

[playse buf="0" storage="sound/voice/3/3.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�҂ăF�B�c����l�A�s���Ă������Y���H���Ď��ʂ������B[endindent][l][r]
[ws buf=0 canskip="true"]

[playse buf="0" storage="sound/voice/3/4.ogg" ]
�@�@ ��T�@�@�@[indent]
�i�����悤�ɗ���������j�݂�I[endindent][l][r]
[ws buf=0 canskip="true"]

[image storage="fgimage/6/_IS17258.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[image storage="fgimage/6/_IS17259.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/3/5.ogg" ]
[image storage="fgimage/6/_IS17261.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ �\�Y�@�@�@[indent]
�������낤�A������B������������o���Έꍏ�́A���O�̌����Ȃ�ɂ�
���Ă��B�G������̏\���\�A������Ȃ��u�`�̂߂��Ă���B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/3/6.ogg" ]
[image storage="fgimage/6/_IS32238.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
�������I���̎�̕R���A����I[endindent][l][r]
[ws buf=0 canskip="true"]

[r]



;[image storage="mura1" layer="base" page=fore]
[image storage="fgimage/8/_IS24399.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE���포.ogg" ]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
���҂��������l���P���A���X�ƌ��Ղ�ɂ�����[l][r]
�����ցA�\�Y�B[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
���O��c�A���̈��y�̐M�����̍��������H�B[endindent][l][r]

�@ ���҂P�@�@�@[indent]
�c�a��I[endindent][l][r]
[r]

[image storage="fgimage/8/_IS24234.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��Ăɏ\�Y�ɂ����镐�҂����B�u���ԂɎa��|����A
;���ʉ��J�n
[playse buf="1" storage="sound/effect/�a��4.ogg" ]
�U���Ă���[l][r]
[ws buf=1 canskip="true"]

�����ցA��T�B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

[image storage="fgimage/8/_IS16723.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ ��T�@�@�@[indent]
�݂�c�A�݂�I[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
��T�A�݂悪�c�A�D�c�̕��҂ɂ��܂��āI[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�݂悪�A�ǂ����āI[endindent][l][r]

     �Ƃ� �@�@ [indent]
�i�삯�o�����Ƃ����T�Ɂj���ʂ���B�Ƃ����ɔn�ŘA��Ă��ꂽ�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�݂�I�i�삯�o���j�B[endindent][l][r]


�@���ܘY�@�@�@[indent]
�i��T��}���āj�҂āI���s����A���O���a��E�����I[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�₾���I�������I[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�i�\����T��}���āj��T���A[endindent][l][r]



[image storage="fgimage/8/_IS17271.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
;���y�J�n
[playse buf="0" storage="sound/voice/4/1.ogg" ]
�@�@ ��T�@�@�@[indent]
�݂�c�A�݂�[�[�[���I[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���l�����̘r�̒��ŁA��T���ߒɂȋ��т�������[l][r]
���̎p���A�\�Y���A�T��Ō��߂Ă���B[l][r]


�Ó]�B[endindent][l][r]
[r]

;�t�F�[�h�A�E�g
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[image storage="fgimage/8/_IS17271.JPG"" layer="2" page="fore" visible="false" top="50"]
[image storage="fgimage/8/black681.jpg" layer="1" page="back" visible="false" top="50"]
[wait time=2000]
[trans layer="1" time=2000 method=crossfade]
[wt]

[fadeoutbgm time=2000]
[wait time=4000]
;���y��~

[wt]
;[cm]
;[image storage="05" layer="base" page=fore]
;�����͓���ɍ����ւ��ĕ\�����Ȃ���������
;�i���[�V�����Đ�
;[playse buf="0" storage="sound/voice/7.ogg" ]
;�@�@�@�@�@�@�@�@�@�@�@[indent]
;�I�[�v�j���O[l][r]
;�f���E�i���[�V�����Ƌ��ɁA�ߑ���g�ɓZ�������҂������o�ꂷ��B[l][r]
;[image storage="fgimage/9/_IS16696.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u�V�����N�A���͐헐�̂������ɂ������B���Ō���􂤐�𐧂��A
;�ߍ]�𒆐S�Ɉ�吨�͂�z�����̂́A�����̒����A�D�c�M���B�v�S[l][r]
;
;[image storage="fgimage/9/_IS16697.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u�ނ̌��ɏW���͖ҏ��m���̍ŋ��R��B[l][r]
;�D�c�̑o���A�H�ďG�g�A���q���G�B�v�Q[l][r]
;
;[image storage="fgimage/9/_IS16726.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u���d����s���̏d�b�A�O�H���G�A����v�B�v�Q[l][r]
;
;[image storage="fgimage/9/_IS16698.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u�m���̌R�t�A���c�����q�B�`�̐؎x�O�A���R�E�߁B�v�Q[l][r]
;
;[image storage="fgimage/9/_IS16729.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u�����̍˔\��i����D�c�R�́A
;�j�|�̐����œV������ւƓ˂��i�ށB�v�Q [l][r]
;
;
;�u����������ł��̖\���ɑς����ˁA
;�M���œ|����Ă�҂����������B�v�Q [l][r]
;�u�L������A�r�ؑ��d�B�G�ꑷ�s��s��̎҂����v�Q [l][r]
;�u���̑����̖��S�������́A�����̂Ȃ������Ȃ�����X�𑗂�B�v�Q [l][r]
;
;[image storage="fgimage/9/_IS17294.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u��������؂̐_�̋������A
;�����閯�̐S������ɂƂ炦�Ă������B�v�Q[l][r]
;
;[image storage="fgimage/9/_IS17295.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u�ےÂ̊����A�������ɏZ�܂��S���̎q�A��T�ƌ����v�Q [l][r]
;
;[image storage="fgimage/9/_IS16699.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u�ނ�̑O�ɓ˔@���ꂽ�A��̖앐�m�A�\�Y�v�Q [l][r]
;
;[image storage="fgimage/9/_IS17302.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u��l�͏\�Y�Ƌ��ɒD��ꂽ�Ƒ��A�݂�A�펵�����߂����߁A�v�Q[l][r]
;
;[image storage="fgimage/9/_IS17303.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u��H�A�e���D�c�M���̑҂A�ߍ]�A���y���ڎw���B�v�Q [l][r]
;
;[image storage="fgimage/9/_IS16732.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u�ނ�̍s����ɑ҂��󂯂�̂́A���~�̊�]�������̈ł��B�v�Q [l][r]
;
;[image storage="fgimage/9/_IS16732.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;�u�߂���߂��퍑�G���̖����A���A�؂��ė��Ƃ����v�Q 
;[image storage="fgimage/9/_IS17327.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[layopt layer="message" page="fore" visible="true"]
;[layopt layer="message" page="back" visible="true"]
;
;[ws buf=0 canskip="true"]
;
;
;[l][r]
;[p][cm]


[loadplugin module ="krmovie.dll"]
[layopt layer="message0" page="fore" visible="false"]
[video visible="true" left=0 top=0 width=1024 height=768]
[openvideo storage=op.wmv]
[playvideo]
[wv canskip="false"]
[layopt layer="message0" page="fore" visible="true"]
[cm]



*story_01|���@������
[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]

[image storage="fgimage/10/_IS16750.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/�߂���.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

���@������[resetfont][l][r]
[r]


[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�����̌�n�������鑺�l�����B[endindent][l][r]
[r]


�@�@�@�@�ʁ@�@�@[indent]
�Ƃ�A�ǂ��������B[endindent][l][r]

     �Ƃ� �@�@ [indent]
�ʖڂ��B�݂�ȏ����Y��Ȃ��Ă��B[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
�c�����̉����q���A�����Y���H���Ď���ł��B[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�c����͋C�̓ł������ȁB[endindent][l][r]

�@���ܘY�@�@�@[indent]
�i�΋g�Ɂj�ǂ�����A�V�P���ʂ��āB[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
��������肫��Ȃ��Ă�c�B[endindent][l][r]

�@���ܘY�@�@�@[indent]
���ߎd���˂�����B�����
�������Ȃ񂾂���B�Ȃ����]�B[endindent][l][r]

�@�@ ���]�@�@�@[indent]
����B�c����H �B[endindent][l][r]

�@���ܘY�@�@�@[indent]
���ߕ������Ă˂�����B�i�΋g�Ɂj
�O�������Ύ��̂ɏR�T��������B�l�l�̐������ɂɂ��������ڒ�
�i�Ƃ񂶂Ⴍ�j�����Ⴂ���˂��́B�������́A���S����
�c��ڍk���e���F�̐g�ƁA�a�l�ɍ����o���R���̐S�z
�������Ă�Ⴂ���́B[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�c����A�Ⴅ�˂��B[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
���╪���񂾂��ǂ�A�����q����������v�w�̂��ƍl�����ƂȂ񂾂��c�A[endindent][l][r]

     �Ƃ� �@�@ [indent]
�Y��ȁB���񂽂��������߂��Ƃ���ŁA���̎q�������Ԃ��ł��˂񂾁B[endindent][l][r]

�@���ܘY�@�@�@[indent]
�Ă������ďo���ł��˃F���ȁB[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
�i���ǔ[�����āj�c�܁A����Ⴛ�����B[endindent][l][r]
[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����ցA��T�A����ė���B[endindent][l][r]
[r]


[image storage="fgimage/10/_IS16756.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�ʁ@�@�@[indent]
��T�A[endindent][l][r]

�@���ܘY�@�@�@[indent]
������T�H�c�A�݂�͋C�̓ł������ȃ@�B���̍ہA�����͎��񂾂Ǝv
���Đ����؂��āA�ȁB[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�����c�B[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�ق�Ƃɂ����q���������ǂ˃F�c�B[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
�D�c�̕��҂ɂ��܂����Ƃ�������A�d���˃F�ȁB[endindent][l][r]

�@���ܘY�@�@�@[indent]
�d���˃F�d���˃F�A[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
��T�c�H �B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�����A����A[endindent][l][r]

     �Ƃ� �@�@ [indent]
�����݂�̂��ƍl����̂͂�߂ȁB��������Ă��������l���Ă��ƁA�F
�g��Ƃ��̖��݂Ă��ɁA�C���U��ĎR����g�B�������B���߃F�͍��A
�����ڂ̑O�̈�̂��Ƃ����l���Ă�Ⴂ���́B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c����B�������Ă���āB[endindent][l][r]

�@�@ ���]�@�@�@[indent]
����A�݂�̂������Ă���B[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
������A�݂�̕��U���ݎ�`������B[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
�������邩�A[endindent][l][r]

�@���ܘY�@�@�@[indent]
�����您�O��I��T�͉Ƃ��Ă����܂����񂾁A���O��N���Ƃɒu���Ă���I[endindent][l][r]

�@�@ �ꓯ�@�@�@[indent]
�i�͂��ƌ��t�ɋl�܂�j�c�B[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�����́c�A[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
���������āc�B[endindent][l][r]

�@���ܘY�@�@�@[indent]
�c�Ȃ񂾂�Ȃ񂾂�A[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
���߂�Ƃ��u���Ă��Ⴂ������˂����B[endindent][l][r]

�@���ܘY�@�@�@[indent]
�c�o�J���߃F�A�����́c�A���������R���ŁA�A�����񂾂����A[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�C�܂������فB[endindent][l][r]
[r]

[image storage="fgimage/10/_IS17343.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
������Ƃ݂�Ȃ��ĉ�����
�Ă񂾂�B����Ȃ񂩂��A�݂Ȃ�����Ȃ����O�Y���A
�g�d�̂������S���������̐S�z���Ă��Ȃ��āB������
��c�A������ǂ񂾂��炢����H�B[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�c��T�H�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
����͕��C����B����͂��̑��y�叫�A���얔�E�q��̖�����B������
�Ă�A���Ⴀ��ƕ������Ă���āB���A�e�Z�킪���Ȃ��Ȃ������āA�S
���͂����Ɠc��ڎ���āA�����Ă������Ă��Ȃ��Ⴂ���˂񂾁B�c��
��͂���ȁA���ꂵ���̂��Ƃł��傰������悤�Ȉ����̂��ʂ��Ă˃F
���ẴH�B[endindent][l][r]

�@�@ ���]�@�@�@[indent]
����B�c�悩�����悩�����B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�ł���A�c�ł��Ȃ�ŁA�Ȃ�ł����݂̂悾�����񂾁H�B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��������킹�鑺�l�����B�u��T�A�v�Ƃ炪��T�ɕ��݊��B[l][r]

;���y��~
[fadeoutbgm time=3000]

;���y�J�n
[playbgm storage="bgm/ogg/�\�Y.ogg" loop="true"]
[image storage="fgimage/11/_IS32324.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�����ցA���l�̑������Ƌ��ɁA�����𔛂�グ���\�Y�������B[l][r]
���l�����ɘE���������ďォ�狩�юU�炵�Ă���B[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
�Ƃ��ƂƉ^�ׁI�������˃F�ƁA���̘V���ڂ�u�b���a�����܂����I�@�B[endindent][l][r]

���l�����@�@�@[indent]
�i�����グ��j�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���������A����������˂���A���������I[endindent][l][r]

���l�����@�@�@[indent]
�i�����グ��j�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
��[���A�~�߂�I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�E���~�܂�B�\�Y������U�艺�낷�B[endindent][l][r]
[r]

���l�����@�@�@[indent]
�����I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����A�|��邪�A�����̐g�������ꂽ���ƂɋC�t���A�Q�ĂĘE����
�~���B[l][r]
���l�������Q��Ȃ��đ����������o���B[endindent][l][r]
[r]

�@���l�P�@�@�@ [indent]
���߃F�A����Ȃ��Ƃ��ĉ��̂��肾�I[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���̂�����āA���͂�����������̌i�F�A�q�݂�������������B[endindent][l][r]

�@���l�P�@�@�@ [indent]
�Ȃ��A[endindent][l][r]

���l�����@�@�@ [indent]
�i����������A�₢�̂₢�̑����j�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�i���������낵�j�����c�A�����ɏĂ��ꂽ�ȁB���ꂶ�Ⴝ���̖�������B
���������A[endindent][l][r]

�@�@ �����@�@�@[indent]
�Ђ��I[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�ǂ��񂢂��B[endindent][l][r]

�@�@ �����@�@�@[indent]
�c�H�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�z�猩���āA�t�������Ďa��Ȃ�˂��Ȃ�A[endindent][l][r]


�@�@ �����@�@�@[indent]
�فA�񕜂��Ȃ�ĂƂ�ł��˃F�B����Ȃ킴�킴���ɂɍs���悤�Ȑ^�����c�A���炽���́A�S�������B�S���͂��߃F�A���a�l�̂��߁A�����č���Ă�Ⴂ���񂾁B[endindent][l][r]

���l�����@�@�@ [indent]
�i���ӂ���j�B[endindent][l][r]

�@���ܘY�@�@�@[indent]
���Ƃ͂ƌ��₟���������A
�M�����𓢂��Ȃ�ăo�J������Ă��₪
�����̂������˂��񂾁A�Ȃ��B���a�l�Ɏ����������Ȃ�Ăȃ@
�C�����Ȃ񂾂�I[endindent][l][r]

���l�����@�@�@ [indent]
�i���ӂ���j�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�Ȃ�ŕS�����a�l�Ɏ����������Ⴂ���˂񂾁B[endindent][l][r]

�@���ܘY�@�@�@[indent]
���A����Ⴈ�߂��c�A���ł���I[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�Ȃ�ŁB[endindent][l][r]

�@���ܘY�@�@�@[indent]
���ł������ẮI����̐e�������̐e�������̐e�����݂�ȁA�������
�Ă���Ă��Ă񂾁B���߃F�݂Ă��ȏ����˂��앐�m�ɂᕪ����˂�
��I[endindent][l][r]

���l�����@�@�@ [indent]
�i���ӂ���j[endindent][l][r]


�@�@ �����@�@�@[indent]
���̔����͔N�ɍ����o����N�v���킸���Ȕp�ꑺ�B�F�E���ɂ���Ȃ���
�������ł��L��Ǝv��˂΂�����B[endindent][l][r]

���l�����@�@�@ [indent]
�i���ӂ���j[endindent][l][r]

�@���ܘY�@�@�@[indent]
�������̓e���F�݂����Ȏ�����앐�m����ƈ���Ă�A�Ȃ̐g�̒��A��
���Ƃ킫�܂��Đ����Ă񂾂��ẮB[endindent][l][r]

���l�����@�@�@ [indent]
�i�����Ă�����ƕ����j[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c���߃F��A�{�C�Ō����Ă�̂��B[endindent][l][r]

�@���ܘY�@�@�@[indent]
�����A�{�C���{�C��B�悵�A��������I[endindent][l][r]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
���l�����A�\�Y����艟�����悤�Ɣ�т�����[l][r]
�\�Y�A���̑����𔲂����B���l�A�����グ��ёނ��|���B[endindent][l][r]
[r]


[playse buf="0" storage="sound/voice/6/1.ogg" ]

[image storage="fgimage/11/_IS17356.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
���̓��͍l���邱�Ƃ����ʓy���ꂩ�B���O��͔ڋ��ȓ؂��B�k���ƌ���
����k���A�����o���ƌ�����፷���o���A�ڑł���Ă����̐g�̒�
�݂��犴���Ȃ��̂��B�͂�ꂽ�{�������̂Ȃ��ŁA�^����ꂽ��������
�݊k���ނ��ڂ邾���̖Ӂi�߂���j�̓؂�B[endindent][l][r]
[ws buf=0 canskip="true"]


�@�@ �΋g�@�@�@[indent]
�c���߁A���L���Ă񂾁A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���͂��O��݂����Ȕ��s�̌Q�ꂪ�匙���Ȃ̂�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A�������܂��T������B[endindent][l][r]
[r]

[image storage="fgimage/11/_IS17359.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
���A����̂������L�݂ăF�ɂ݂�݂挾���đ����ł邩��A�Ƃ�����
�o�Ă������Ǝv�������B���O��������Ɠ������B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c����A����Ȃ񂩁A�s���Ă������A[endindent][l][r]


�@�@ �\�Y�@�@�@[indent]
���H�B[endindent][l][r]


�@�@ ��T�@�@�@[indent]
�Ђ��B����c����A�ł��A���̑�����o��Ȃ�Ă���ȁA�l�������Ƃ��A[endindent][l][r]


�@�@ �\�Y�@�@�@[indent]
�Ȃ�l����ȁB���O�͂���
���ɂ����񑺂ł����؂Ƃ��Đ����Ď��ˁB[l][r]
�c���̉��Ȃ狁�߂���̂�����΁A�ז�������̂͂˂Ԃ�E���Ăł���ɓ���邪�ȁB[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
����A���Ⴀ�������남�߃F�́c�A�����~�����񂾁B[endindent][l][r]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/7/1.ogg" ]

[image storage="fgimage/11/_IS16760.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



�@�@ �\�Y�@�@�@[indent]
�c���̐��E��B���͂��̐��S�Ă���ɓ����B���̐�삯�Ɂc�A�܂���
���y�ł̂��΂�z���A�V�炩��������艺�낷�B[endindent][l][r]
[ws buf=0 canskip="true"]


�@�@ �����@�@�@[indent]
�c�܂����A���߃F���̐M�������A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���ɋ�����ꂽ���Ȃ���΁A���O��̏����ɕ������Ă������Ă����B��
�̗��s���́A�S�ɂȁB[endindent][l][r]
[r]

;���y��~
[fadeoutbgm time=3000]

;���y�J�n
[playbgm storage="sound/effect/P9��X.ogg" loop="true"]

[image storage="fgimage/12/_IS17366.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]




�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
��B�R��[l][r]
��l�����\�Y�̂��Ƃ��A����l�e�B��T�ł���[l][r]
�\�Y�A�C�t���A��T�����񂾑��ނ�
;���ʉ��J�n
[playse buf="1" storage="sound/effect/SE������3.ogg" ]
�ɐ΂����[l][r]
�쑾���j�̔ߖ��オ��B�ǂ��Ɠ|��C�������j�A�����B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

�@�@ �\�Y�@�@�@[indent]
�i�ˑR�|�ꍞ�񂾌����Ɂj���H�i�˘f���Ȃ�������낤�Ƃ���j�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
���̂��I�i�|�ꂽ�������C�ɂȂ�j���́A�������H���A���A[endindent][l][r]


�@�@ �\�Y�@�@�@[indent]
�Ȃ񂾁B[endindent][l][r]

[image storage="fgimage/12/_IS17367.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
�A��Ă��ĉ������B������ꏏ�Ɉ��y�ɁA[endindent][l][r]


�@�@ �\�Y�@�@�@[indent]
�i�\�킸�����o���j�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
���킟�I�i��l�Ɏ~�߂悤�Ƃ��Đ����]���ē�����΂��j����܂���
��܂���I�c����ǂ����Ă��݂�A��A��ăF�񂾁B���ނ�ꏏ�ɁA[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�i���Ԃ��āj�������̐g�Ȃ�́A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
��ꂢ���̂ɏ��̐g�Ȃ肶�Ⴂ���˃F�Ɓi���j�����āA�������炨��A
�����̂Ă�B��T����˂��A��T�傾�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�m�邩�B[endindent][l][r]

[image storage="fgimage/12/_IS16764.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
���߂��l�A���O�́A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���O�Ȃǂɖ���閼�͖����B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�����̂��c�A���Ⴀ�c�A���������A�i�A�h���u�Łj[endindent][l][r]
;�{�Ԃł̓g���E�N���[�Y�������B

�@�@ �\�Y�@�@�@[indent]
�\�Y���B��������Ƃ��ƂƑ��ɋA��B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
����A�A��˂��B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�A��B[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/7/2.ogg" ]
�@�@ ��T�@�@�@[indent]
�A��˂񂾁A���̑��ɂ́I�݂挩����܂ŁB���߂��񂾁B����ɁA��
�瑺�ɂ�����A�܂��������āA�݂�Ȃɖ��f�����邩������ˁB���߂�
�񂾁c�B����ɂ͂����A�݂悵���˂񂾁c�B[endindent][l][r]
[ws buf=0 canskip="true"]


�@�@ �\�Y�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �����@�@�@[indent]
�i�������܂������߂��j�B[endindent][l][r]


�@�@ �\�Y�@�@�@[indent]
�i�������сj�Ȃ�Ȃ񂾂����́A[endindent][l][r]


�@�@ ��T�@�@�@[indent]
�c�����A���������āA���N���O�ɑ�������A���Ă��Ă�
����Ă��́A���̂Đl�݂Ă��ɂ��Ă��z
�ł�A������Ȃ�ł���ȂƂ��ɂ���̂��A[endindent][l][r]


�@�@ �����@�@�@[indent]
�i�b���Ȃ���j���������F
�c�B���񂽕Ă����n���Έ��y�ɘA��Ă��Ă������āA�앐�m����B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c���I�H�B[endindent][l][r]



[image storage="fgimage/12/_IS17371.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �����@�@�@[indent]
���S���ȁB�i�z�܂���Ɂj���Ăł�����Ăł��˃F�c�B���Ă��B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�m�邩�B�����͉��������Ă�񂾁B[endindent][l][r]

�@�@ �����@�@�@[indent]
���ɂ͖펵���ČZ�M�����Ă�B�ꏏ�Ɉ��y���ĂĂ��񂾁B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�펵�c�B[endindent][l][r]

�@�@ �����@�@�@[indent]
���鎞�Z�M�A���̐M���ɏ|�˂��āA�S�ɂԂ����܂ꂿ�܂����c�B����l�A
�K�������ē����Ă����܂��Ă�H�c�B���ނ�c�B�����A��Ă��Ă����B�Z�M�A��߂��Ă񂾂�c�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
������݂���A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�A��B���O��܂Ƃ߂Ă������a�邼�B[endindent][l][r]

�@�@ �����@�@�@[indent]
�c���������B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�Ȃ炢���B[endindent][l][r]

�@�@ �����@�@�@[indent]
�b�ɂ��΁c�i�������݂��o���j���߃F�؂��D���Ȃ񂾂�B����������
�ۂ��A�Ăł��؂ł��D���ȕ����A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�o�J��Y�I�i�ĂƓ؂����j�B[endindent][l][r]
;���I�Ă�

�@�@ �����@�@�@[indent]
���߁A���Ă��Ƃ��񂾁I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����A�삯����B���΂炭���đ��ނ炩�畨���B[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
����������������Ƃ��ƂƁA[endindent][l][r]

[r]

[image storage="fgimage/13/_IS17374.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
���A����A�D�c�̕��m���������B[endindent][l][r]
[r]

�@�@ ���P�@�@�@[indent]
���O��A�������̘A�����B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���H[endindent][l][r]

�@�����Y�@�@�@[indent]
�i���𕪂��i�ݏo�āj���̋C�ɂ͂��ȁB����T���Ă�B�������̕S���A���얔�E�q��̖����B[endindent][l][r]

[r]
;���y��~
[fadeoutbgm time=3000]

[playse buf="1" storage="sound/effect/P12�S���h�[��.ogg" ]
;���y�J�n
[playbgm storage="bgm/ogg/���.ogg" loop="true"]


[image storage="fgimage/14/_IS24405.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]




�@�@�@�@�@�@�@�@�@�@�@[indent]
��z[l][r]
����v�A�D�c�̕��m���S���̒j�����₵�Ă���B[endindent][l][r]
[r]

�@�@ ��v�@�@�@[indent]
�Ƃ��ƂƓf���R���@�B��s�P�������̘A���͉����ɂ��񂾁B[endindent][l][r]

�@�@ �S���@�@�@[indent]
�i����f��������j[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��v�A�ق��ĕS�����������ܟB����B[l][r]
�S���A�����R�炵�A�₪�ď΂��o���B[endindent][l][r]
[r]

�@�@ �S���@�@�@[indent]
�o�債��B�܂��Ȃ����߂�����I����
�c�B���N�O�A�{�莛�Ƃ̐�Ŏ��񂾑��y�A
���얔�E�q��͂ȁc�A�D�c�Ƃ�]���������p�����̎�ɂ�
�Ă��c�B�R����˃F���c�B�����������̉�����������A���O��Ȃ�
���ЂƂ��܂���Ȃ��B[endindent][l][r]

�@�@ ��v�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �S���@�@�@[indent]
���܂��݂�c�B���O����c�A�����Ď���҂�������I[endindent][l][r]
[ws buf=1 canskip="true"]
[r]
;���y��~
[fadeoutbgm time=3000]

;���y�J�n
[playbgm storage="sound/effect/P9��X.ogg" loop="true"]

[image storage="fgimage/13/_IS17374.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�ĂсA�R���\�\�B[endindent][l][r]
[r]

�@�����Y�@�@�@[indent]
�悲��A�ےÁA�������Ɍ������A���E�q��̖���߂����B���c�A�N�[��
�s���ʎq���䂦�A���������΂���ŗv�̂����ʁB[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i�݂�̂��ƂƋC�t���j�c�I[endindent][l][r]

�@�����Y�@�@�@[indent]
�S�����̘b�ɂ��΁A���E�q��ɂ͂�����l�A���������炵���c�B���́A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�T���Ă�̂����̖��I�Ȃ炨�炪���ꂾ�I����A��Ă��Ă��ꍡ�����I
������A���ނ���c�A�݂�͎��R�ɂ��Ă���ĉ����G�I���̒ʂ肾�I��
��̂��Ƃ͂����A�ǂ����Ă���Ă��\��˃F����I[endindent][l][r]

�@�@ ���P�@�@�@[indent]
�c�����Y�l�A[endindent][l][r]

�@�����Y�@�@�@[indent]
�c�߂���B[endindent][l][r]


�@�@ �\�Y�@�@�@[indent]
�D�c�Ƃ�]���������p���Ɓc�H[endindent][l][r]

�@�����Y�@�@�@[indent]
�Ȃ񂾁c�A[endindent][l][r]

[stopbgm]
;���y�J�n
[playbgm storage="bgm/ogg/�퓬.ogg" loop="true"]

�@�@ �\�Y�@�@�@[indent]
���̖��c�A����������I[endindent][l][r]

�@�����Y�@�@�@[indent]
�M�l�I[endindent][l][r]

[r]

[image storage="fgimage/13/_IS16769.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�D�c�̕������Ə\�Y�A����ƂȂ�B�����ցA�����B[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
���߃F�A�Ă������Ǝv���Ă񂾁I�c�����H��������H
[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����ցA�V���Ȉ�c�B�r�ؑ��d�z���̕������B[endindent][l][r]
[r]

�@�@ ���Q�@�@�@[indent]
���̑������I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���Q�A���藐���\�Y�ƕ��m�A��T�ƌ����o�������āA[endindent][l][r]
[r]

�@�@ ���Q�@�@�@[indent]
�D�c�̕��ɒǂ��Ă�̂��B�c���������O�����A�Ă�͂��ɗ��Ă��ꂽ
�̂��B�ł������I�}���I�L���̏�͂����ڂ̑O��I[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�����H[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���������c�B[endindent][l][r]

�@�@ ���Q�@�@�@[indent]
�s���I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�����A�������ɔ����삯�o���B�\�Y�A���������������A[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
���������c�A���I[endindent][l][r]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A��T��ǂ��ċ삯�o���B����ɂ����ǂ��A�������삯����B[endindent][l][r]
[p][cm]


*story_02|���@�L����
;���y��~
[fadeoutbgm time=3000]


[image storage="fgimage/15/_IS16773.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/�����q.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
;[image storage="07" layer="base" page=fore]
���@�L����[resetfont][l][r]


[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�S�\�\�B�삯�ė����T�A�����B[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
�����A���߂ǂ����񂾁B��������炸�������񂾂͂�������A��������
�ǂ����āA[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i�����āj�������c�A[endindent][l][r]


�@�@ �����@�@�@[indent]
��T��A�ǂ����A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
������āA����ȈÂ��ĕ|�F�Ƃ��������̂��c�A[endindent][l][r]

�@�����q�@�@�@[indent]

����́A�������S���������B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i�����Ȃ���j�c�l������̂��H[endindent][l][r]

�@�����q�@�@�@[indent]

���O��A���y�ł͂Ȃ��ȁB[endindent][l][r]

�@�@ �����@�@�@[indent]
���A�����I���炽���͂��̔����́A[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/8/1.ogg" ]

�@�����q�@�@�@[indent]
�S�����B�Ȃ�Ȃ��̂��Ƒ����邩��o��B�����͊Ԃ��Ȃ�������B[endindent][l][r]

[ws buf=0 canskip="true"]

�@�@ �����@�@�@[indent]
�c������I�H[endindent][l][r]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/8/2.ogg" ]
[image storage="fgimage/15/_IS17388.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�����q�@�@�@[indent]
�����B�M�����ɖd�����N�����A������N���ď�𑱂��Ă��邪�A���r
�؂͊��Ɏ��ɋ����A��l��𓦂��p��T���Ă���B��̕������́A�z
�����𗊂݁A����q���Ă����ƌ����̂ɂȁc�B[endindent][l][r]
[ws buf=0 canskip="true"]


��T�E�����@�@[indent]
�c�B[endindent][l][r]

�@�����q�@�@�@[indent]
�Ԃ��Ȃ��D�c�́A�c������B[endindent][l][r]

�@�@ �����@�@�@[indent]
�s������T��I[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�҂āA���߂��͂ǂ����񂾂�A�ȃ@�A�ꏏ�ɓ�����ׁB
;���ʉ��J�n
[playse buf="1" storage="sound/effect/SE�S��1.ogg" ]
[endindent][l][r]
[ws buf=1 canskip="true"]

�@�@ �����@�@�@[indent]
���������āI�O��������~�����A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�ق��Ƃ��˂�����I�z�����Ă݂�I�����́A����ȕ����߂��Ă�
�̂ɁA���炽���̂��Ə����悤�Ƃ��Ă�A�����Ă����˂���I[endindent][l][r]

�@�����q�@�@�@[indent]
���͒��Ԃ������ɗ���B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�ق�Ƃ��B[endindent][l][r]

�@�����q�@�@�@[indent]
�����B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�����ăF�����ɁA[endindent][l][r]

�@�����q�@�@�@[indent]
�Ă���ȁB�c���͂���ȂƂ���ł͎��Ȃ�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

�@�����q�@�@�@[indent]
�s���B[endindent][l][r]

�@�@ �����@�@�@[indent]
�����I�s�����I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����A��T�̎��͂݁A����B[endindent][l][r]
[r]

�@�����q�@�@�@[indent]
�t���c�A�������Ȗ���B[endindent][l][r]
[r]

;���y��~
[fadeoutbgm time=3000]


�@�@�@�@�@�@�@�@�@�@�@[indent]
;[image storage="nagahama_arioka" layer="base" page=fore]


;���ʉ��Đ�
[playbgm storage="sound/effect/SEenpou��.ogg" ]
[image storage="black" layer="1" page="fore "visible="true" top="50"]

�~   �~   �~[r]
����E�V��\�\�B[r]
�ޕ�����e���A�U�h�̉��������B[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
�{���A��������肪�A�C�t������Ă��؂�܂ŗ����܂�����B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
���߂ǂ����񂾂�I[endindent][l][r]

�@�@ �����@�@�@[indent]
������˂���I�N�\�b�A����ȂƂ���ł̂��ꎀ��ł��܂邩�I[endindent][l][r]

[r]


;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE��q.ogg"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����悭�����J���錹���B[l][r]

[stopbgm]
[image storage="fgimage/16/_IS17394.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���y�J�n
[playbgm storage="bgm/ogg/����.ogg" loop="true"]
�삵�������|��A����グ��B�������W�܂�B[l][r]
[ws buf=1 canskip="true"]
�����A�҂����Ɖ���߂�B
[playse buf="1" storage="sound/effect/��CL1.ogg"]
[l][r]
[ws buf=1 canskip="true"]
���A���������J���A
[playse buf="1" storage="sound/effect/��OP2.ogg"]
�����A��T�������Ɉ������荞�ށB[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

�@�@ ���R�@�@�@ [indent]
�ǂ����A�Ԃ̐틵�́A[endindent][l][r]

��T�E�����@�@[indent]
���A�����A[endindent][l][r]

�@�@ ���R�@�@�@ [indent]
�v�킵���Ȃ��悤���ȁc�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
���́A����A[endindent][l][r]


�@�@ ���R�@�@�@ [indent]
�݂Ȃ܂Ō����ȁB�ł��ďo�悤�ɂ����̂Ђ������ł́A���C�ɓ����U��
���܂��B���d���A[endindent][l][r][r]


;[image storage="08" layer="base" page=fore]

[image storage="fgimage/16/_IS17398.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��i�ɍ���r�ؑ��d�B���̖T��ɐԎq����������B[r]
�Ɛb�A�����������d�ɒ��ڂ���B[endindent][l][r]
[r]

�@�@ ���d�@�@�@[indent]
��ނ𓾂�B�����Ȃ��́A���̑��d����ї����ɕ����A�P���a�ɒ���
���R�𗊂�ł��悤�B[endindent][l][r]

�@�@ ���S�@�@�@ [indent]
�c�a���񎩂�c�A[endindent][l][r]

�@�@ ���d�@�@�@[indent]
���̈�N�Ɨ]���A�x���ƂɎg�҂𑗂�ǂ��ї��͓������B�������낤�A
�ї����܂��D�c�ɋ����Ă���̂��B�S�𓯂�������ғ��m�G�����킹
��΁A�P���a�����̂��̎v�������݁A���������ӂ��Ă����ł��낤�B[endindent][l][r]

�@�@ ���S�@�@�@ [indent]
���ꂪ�����A���ꂵ������܂��B[endindent][l][r]

�@�@ ���R�@�@�@ [indent]
�a����A�댯�����ڂ݂����̂悤�ȁc�B[endindent][l][r]

�@�@ ���d�@�@�@[indent]
���S�����B���̑��d�A�K����ї��̕��𔺂����̏�ɖ߂��Ă���B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���܂ɂނ��ԕ������B[r]
���������d�̗l�q����͂ǂ����A���ւ̋������M����[l][r]
���̎��A�L�����畺�̑������B�u���z�I�v�u�}����I�v[r]

[image storage="fgimage/16/_IS17400.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

��������؂�|���A�\�Y���p�������B[r]
�g�\���镺�����B�Q�ĂĐg���B����T�ƌ����B[endindent][l][r]
[r]


�@�@ ���R�@�@�@ [indent]
�M�l�I���ҁI[endindent][l][r]


�@�@ ���S�@�@�@ [indent]
�܂����D�c�����ɍԂ�˔j���āc�I[endindent][l][r]


�@�@ ���R�@�@�@ [indent]
�a������肵��I[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���O��Ȃǂɋ����͂Ȃ��B�S������̓�l�A�ꂪ���̏�ɓ������B�l��
���ɒT�������A�c�����̂͂��̓V�炾���B�����ɂ���͂����B[endindent][l][r]

�@�@ ���S�@�@�@ [indent]
�c���̂��Ƃ��B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�Ƃڂ���ȁI[endindent][l][r]

�@�@ ���R�@�@�@ [indent]
�a�I�i����o��悤�����j[endindent][l][r]

[image storage="fgimage/16/_IS24231.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
������܂ŋ����邺�B�c�������A�d���Ƃ͎v���������ȃ@�A�r�ؓa�c�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A����������Ȃ���ӂ�����񂷁B[endindent][l][r]
[r]

�@�@ ���R�@�@�@ [indent]
�a�A�����͉��Ƃ��Ă��}���܂��B�����I[endindent][l][r]

[image storage="fgimage/16/_IS17398.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ���d�@�@�@[indent]
�����A�Q�邼�B[endindent][l][r]

     ���� �@�@  [indent]
�c�B[endindent][l][r]

�@�@ ���d�@�@�@[indent]
�������Ă���B���ɏ���o��̂��B�����I[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/9/1.ogg" ]
     ���� �@�@  [indent]
���͏�Ɏc��܂��B[endindent][l][r]
[ws buf=0 canskip="true"]

[image storage="fgimage/17/_IS24417.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ���d�@�@�@[indent]
�����A[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/9/2.ogg" ]
     ���� �@�@  [indent]
�a����X�Ȏq�𔺂�����o��΁A���̒��ɂ́A�a������̂Ăē�������
�v�����̂�����܂��傤�B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ ���d�@�@�@[indent]
�c������ȂǁA����ȁA[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/9/3.ogg" ]
[image storage="fgimage/17/_IS24419.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


     ���� �@�@  [indent]
�a�̋��ɂ��錈�ӂ͂܂��ƁB�c����Ǖ��Ƃ����������̎��ɋ����邱��
��ł́A���̋^�����u�a�̂悤�ɕ��̐S�ɑ��H���܂��B�^���a�ɜ��A
���̎v���Ɏ��߂��ꂽ���A�ނ���x���铔�΂̂悤�Ȑ�ӂ��A�a�̂�
�߂̒��`�̎��Ƃ����ւ�������܂��B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ ���S�@�@�@ [indent]
�����l�c�A[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/9/4.ogg" ]
     ���� �@�@  [indent]
�����c��΁A�K����a���߂��ė���ƕ������͐M���A��]�����Ă܂��B�����炱�����́A�����Ɏc��܂��B[endindent][l][r]

[r]
[ws buf=0 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����A���ɕ����Ԏq�𑺏d�ɑ����B[endindent][l][r]
[r]

[image storage="fgimage/17/_IS24242.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

     ���� �@�@  [indent]
�a�A�ꍏ�������ї��𔺂��A��ɂ��߂�Ȃ���܂��B[endindent][l][r]

�@�@ ���d�@�@�@[indent]
�c�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����������Ă����\�Y�������J���B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/10/1.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�ї��͂ǂ��������񂼁B�P���͏��F���a�K��B���̏�͊Ԃ��Ȃ�������B
���̐M�����̂��Ƃ��B��ɂ�����͈̂ꑰ�b���A���O�i�����j�����O��
�i�ꑰ���߁j���F�E����B�������O�A������񂩁A�����͓����邼�B[endindent][l][r]
[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/10/2.ogg" ]
     ���� �@�@  [indent]
�a�͓����܂��ʁB[endindent][l][r]
[ws buf=0 canskip="true"]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/10/3.ogg" ]
�@�@ �\�Y�@�@�@[indent]
���Ƃ��Ă��c�A���O��͊ԈႢ�Ȃ����ʁB[endindent][l][r]
[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/10/4.ogg" ]
     ���� �@�@  [indent]
�c���Ƃ��a���߂��ʂ����ɂ��̏邪������Ă��A���́A�a�ƁA�a��M
�����S�Ă̕������̌ւ�̂��߂ɁA���̖��A�����Ă��\���܂��ʁB[endindent][l][r]

[r]
[ws buf=0 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�l�X�͂����̌��t�ɑł���A�����Ȃ��B[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
�i���������j�r�؁c�A�Ȃ񂾂��̒��Ԃ́B�s���Ȃ�s���A�ǂ������O
�ɐ�͂Ȃ��B���O��͕������񂾂�B�Ȃ�Ȃ炱�̏�ł��O��܂Ƃ߂āA[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�T��̓�������\�Y�B[r]
��T�A�����グ���A����삯�o���A�����̎������B[endindent][l][r]
[r]

[image storage="fgimage/17/_IS16781.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/10/5.ogg" ]

�@�@ ��T�@�@�@[indent]
�c���Č������炢���̂��A������Ȃ����ǂ�c�A����A�P�l�̋��̂���
�z�������Ɓc�A[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ �\�Y�@�@�@[indent]
����ƌ��������c�B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�ɔ���\�Y�B�����ɁA�����������ē���B[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
�ӂ�����ȁI������Ɏ�o���͂����˂��B���߂��͐l�̋C����������
���v��˃F�⌌�����B�����Ȃ������I�������O�ɂ͕Ă͂��˂��I[endindent][l][r]


     ���� �@�@  [indent]
�i��T�ɐ��߂āj�c����Ȃ��ア���Ȃ����ǂ����ď�ɖ������񂾂̂�
���B�c���Ȃ��͓a�Ə���o�Ȃ����B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�ł��A[endindent][l][r]

     ���� �@�@  [indent]
�i���ɑ����j���̕����A[endindent][l][r]

�@�@ ���d�@�@�@[indent]
�c�����A[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/10/6.ogg" ]

[image storage="fgimage/17/_IS17407.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

     ���� �@�@  [indent]
�i���d�Ɍ������j�_�ł����̌���삪����񂱂Ƃ��B�a�c�A
���Ȃ���S����A�u���؁v�Ɏv���Ă���܂��c�B[endindent][l][r]

[r]
[ws buf=0 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�ƌ����������������B�������������ʑ��d�𑣂��B[endindent][l][r]
[r]

�@�@ ���S�@�@�@ [indent]
�a�A�������I[endindent][l][r]


�@�@ ��T�@�@�@[indent]
�����I�i�\�Y�Ɍ����������̘r�����j[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���d�Ƌ��ɁA��T�A�����A����B�\�Y�̑O�ɕ������������ǂ���B[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
�����c�A���O�炻����ނ��B�Ԃ����a�邼�I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�ƕ��������Փ˂���B[endindent][l][r]
[r]

[image storage="black" layer="1" page="fore "visible="true" top="50"]


;���y��~
[fadeoutbgm time=3000]
;���y�J�n
[playbgm storage="sound/effect/P9��X.ogg" loop="true"]
;[image storage="���n"layer="base" page=fore]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[r]
�Ԏq��������d�Ƌ��ɕ�����T�ƌ����B[r]
�����ցA���d�̔E�������B[endindent][l][r]
[r]

�@�@ �E�P �@�@�@[indent]
���d���B[endindent][l][r]

�@�@ ���d�@�@�@[indent]
�����B�����������B[endindent][l][r]

�@�@ �E�P �@�@�@[indent]
�D�c���ɕ߂�ꂽ���̖��A�����A���A�Z���͌��ɂď��Y�Ƃ̂��ƁB[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�����c�A�݂�c�B[endindent][l][r]

�@�@ ���d�@�@�@[indent]
�s���������B�����͂��z�Ɏ�点�悤�B�c�s���B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i���d�̂��ƂɊz�Â��j���a�l�c�A�ǂ����A�K���P�l�̌��ɁB[endindent][l][r]


[image storage="fgimage/17/_IS24246.JPG" layer="1" page="fore" visible="true"top="50" pos="center"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ���d�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �����@�@�@[indent]
�s�����A��T��I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�삯�����T�ƌ����A�E�B���d�A�����������A�Ăѕ����o���B[endindent][l][r]
[r][p][cm]



*story_03|�O��@���E�Z�p���E����

[image storage="fgimage/18/_IS16789.JPG" layer="1" page="fore" visible="true" top="50" left="0"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;���y��~
[fadeoutbgm time=3000]

;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/�݂�.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
�O��@���E�Z�p���E����[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���Â����ɁB[r]
�ӂ�ɁA���l�����̂����苃������O���������鐺�������B[endindent][l][r]
[r]

�@���l�P �@�@�@[indent]
�₩�܂����I�Â܂�񂩁I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���ɂ̋��Ők����݂�B�������P���މ�����������B[r]
�݂�A�C�ɂȂ�P���ޖ��ɕ��݊��B[endindent][l][r]
[r]

     �݂� �@�@ [indent]
���v���H[endindent][l][r]

[image storage="fgimage/18/_IS17418.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

     ���� �@�@ [indent]
�c�����ɂ͎��ʂƌ����ɁA�̂̐S�z���Ȃ����낤�B�c���Ȃ��A�o�Ɛ���
�ʂꂽ���B[endindent][l][r]

     �݂� �@�@ [indent]
�����c�A[endindent][l][r]

     ���� �@�@ [indent]
�Q���ł�����ɂ˃F�l�˃F�l����ł������B�c���́B[endindent][l][r]

     �݂� �@�@ [indent]
�c�݂�B[endindent][l][r]

     ���� �@�@ [indent]
���ʂ��B�������q���M���ɖd�����N�����a��B�䂪�g�����̗L�l��c�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�T��̍����̌��ɔE�B����玨�ł����A����n���ƁA���ʂ̌��ցB[endindent][l][r]
[r]

�@�@ �E�Q�@�@�@[indent]
���ʂ͂��邩�B[endindent][l][r]

     ���� �@�@ [indent]
���p���B[endindent][l][r]

[r]

�@�@ �E�Q�@�@�@[indent]
�b�͕t�����B�捏�`�����ʂ�A�����A���O�̐g���͈������B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�E�A����B[endindent][l][r]
[r]

     ���� �@�@ [indent]
�݂�A�����ȁB���̂��ʂ�
�ǂ����A�����̎��߂�Ƃ��悤���B[endindent][l][r]

     �݂� �@�@ [indent]
�i�����ɋ������j�c�ǂ������B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���ʁA����k�킹�΂��o���B[endindent][l][r]
[r]

[image storage="fgimage/18/_IS24429.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

     ���� �@�@ [indent]
�c�ǂ������A���B�݂�A�������䂦���̘S����o����邩�����邩�B��
�̐g�͌v���̓���Ƃ��āA���镐���̌��ɑ�����̂�B���͂⎄�͐l
�ł͂Ȃ��B�j�����̖�S�Ɨ~�ɘM�΂��؋��l�`��B����������ʐg��
�Ȃ낤�Ƃ��A�ǂ�قǂ̈Ⴂ�����낤�B[endindent][l][r]

     �݂� �@�@ [indent]
�c���߂��A���牽���m��˂��ŁA[endindent][l][r]

     ���� �@�@ [indent]
�c�����̂��B�����łȂ���΁A���̂��ʂ̊肢�͉ʂ����ʁB[endindent][l][r]

     �݂� �@�@ [indent]
�c�H[endindent][l][r]

     ���� �@�@ [indent]
�䕧�͂ǂ������̂��ʂ��������Ȃ悤�łȁB�킪�ꑰ��헐�śj������
��A���̐g�ɖ����ʘJ�P�̕a���ӂ�܂��������B�c�������̕a�������A
���̂��ʂ̍Ŋ��̉B�����B[endindent][l][r]

     �݂� �@�@ [indent]
�c�B[endindent][l][r]

     ���� �@�@ [indent]
�Ȃɂ��V����I�Ȃɂ�����I���͐�ɖ������A�v���̂��ߐl�̖�����
�Ƃ���j�����̂��Ƃɍs���A���̕a���܂��U�炵�Ă��B�C�t��������
�͊��ɒx���B�Ȃ̐g��I�ޕa�ɋ����������ю���ł����������c�B[endindent][l][r]

[r]

[image storage="fgimage/18/_IS17414.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�݂�A���t�𖳂����B�₪�Ă����Ƃ��ʂɌ����������J���B[endindent][l][r]
[r]

     �݂� �@�@ [indent]
���������͕�����˃F���ǁc�A���ʁA���߂��A
�炢�v�����Ă��񂾂ȁc�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�݂�A���ʂƉ䂪�g�̔߂��݂ɁA��𗎂Ƃ��B[endindent][l][r]
[r]

     ���� �@�@ [indent]
�c�݂�A[endindent][l][r]

     �݂� �@�@ [indent]
�c���߂��A����A���ʑO�Ɉ�x�ł��A�˃F�l�ɉ���������ȃ@�c�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���ʁA�Â��ɂ����苃���݂�����߂�B[endindent][l][r]
[p][cm]



*story_04|�l��@���E�Z���͌��E���Y��

[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[image storage="fgimage/19/_IS16795.JPG" layer="1" page="fore" visible="true" top="50"]
;���y��~
[fadeoutbgm time=3000]
;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="sound/effect/SE���K��C.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
;[image storage="kawara" layer="base" page=fore]
�l��@���E�Z���͌��E���Y��[resetfont][l][r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�Z���͌��͏��Y��O�ɁA�����l�����A���Ղ葛���ɂȂ��Ă���B[r]
�݂�`�𔄂�������B�u�k�t���K�҂��ɕق��ӂ邤�B[endindent][l][r]
[r]

�@�u�k�t�@�@�@[indent]
�������̘Z���̉͌��ɂē������́A���̈��y�ɂ܂��܂������`�l�ɋ|����������t���̍ȏ��A�Ȃ�тɂ��̎q��l�\�]�i�����イ��j���B
�߂��Ί���Ėڂɂ�����B���ꂪ���������t�ҋ��̖����̎p�I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����l����ĂɏW�܂�B�����ցA��T�ƌ����A�삯�ė���B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�i�T�����j�݂�́c�A�݂�́A[endindent][l][r]
[r]

[image storage="fgimage/19/_IS32252.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�Y�������ɉ�������A�l�̔g���J���B���̌������ɁA���z�ŕ�
��ꂽ���l�����B���̒��ɁA�����ꂽ�݂�̒����p�������B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�݂�c�A�݂�I[endindent][l][r]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�l�����������Y��ɋ삯�o�����Ƃ���B�K���Ŏ~�߂錹���B[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
���߃F�A����荞�񂾂�A�����悤�ɎE���ꂿ�܂����I[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�����񂾁I�݂�Ǝ��˂�Ȃ�A����͖{�]���I[endindent][l][r]


�@�Y���P �@�@�@[indent]
���B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�Y��ɔ�э��݁A�݂��_���Y���ɔ�т�����B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
��߂�I[endindent][l][r]

�@�Y���Q �@�@�@[indent]
�M�l�I[endindent][l][r]
[r]
[stopbgm]

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE�e.ogg" ]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�U���I�ȏe���������B
[ws buf=1 canskip="true"]
[playse buf="1" storage="sound/effect/SE�e.ogg" ]
���l�����͐g��k�킹�A���X�Ƃ��Ɛ؂��B[r]
�Y���Q�A��T��U��قǂ��A�e���\���A���B�����R���B[r]
��T�A�݂�̂��Ƃɋ삯���A��������B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

�@�@ ��T�@�@�@[indent]
�݂�c�A�݂�I[endindent][l][r]


�@�Y���P �@�@�@[indent]
�����A���҂��I[endindent][l][r]


�@�@ �����@�@�@[indent]
�i�Y��������}���j�҂��ĉ����F�I����F������҂��ĉ����F�I[endindent][l][r]

[r]

[image storage="fgimage/19/_IS24258.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��T���݂�̊�̕����𔍂����B�c����ƁA���ꂽ�̂́A���ʁB[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�c�݂�ł˃F�c�A�c�Ȃ�ŁA[endindent][l][r]


     ���� �@�@ [indent]
���Ȃ����o���c�B���c�B������Ă͂Ȃ�ʁB[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

     ���� �@�@ [indent]
�݂�́c�A�E�ɘA����S��E�����B�����c�A�݂�Ɠ���ւ�����B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c���߃F�A[endindent][l][r]

     ���� �@�@ [indent]
�Ă���ȁB�ǂ������Ȃ����ʐg��B[endindent][l][r]

[image storage="fgimage/19/_IS24434.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
�c�݂�͉����ɁA[endindent][l][r]

     ���� �@�@ [indent]
�i���U��j�c�s���B�ǂ����݂�ɁA�i���Ɛ؂��j[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i��R�Ɓj�c�݂�́c�A�����Ă�c�B�i�ӂ�Ɂj
�݂�I�c�݂�I[endindent][l][r]

[r]

[image storage="fgimage/19/_IS32243.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��������艟�������A�Y����������Ăɐ�T��߂���B[endindent][l][r]
[r]

�@�Y���P �@�@�@[indent]
���Y�͈ꎞ�i�����Ƃ��j���~�߁B�������A��čs���I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�݂͂�̖����ĂсA�����Ƌ��ɁA�Y�������ɘA��čs�����B[r]
���̎p�������錩���l�����B[r]
�����ցA���R�E�߂������B�T��̌Y���ɉ���獐����ƁA�Y����
��l���A��T�����̈�s��ǂ��ċ���B[r]
�E�߂͈�l�A�����Ă�����T����������������Ă���B[endindent][l][r]
[r]
[p][cm]



*story_05|�܏�@�S
;[image storage="rogoku" layer="base" page=fore]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[image storage="fgimage/20/_IS32257.JPG" layer="1" page="fore" visible="true" top="50"]

;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/�l�G.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
�܏�@�S[resetfont][l][r]

[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�ƌ����́A�S�ɍ��߂���B[r]
�����߂���\�\�B��T�ƌ����A�����ď\�Y�̏�i�̒f�ЁB[endindent][l][r]
[r]

[image storage="fgimage/20/_IS17434.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE�H1.ogg" ]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�s�\�Y�t�Â��ȏH�̐X�B��܎���N�A�\���B[l][r]
;���ʉ��Đ�
[playse buf="2" storage="sound/effect/SE��1.ogg" ]
�X�Őd������G�ꑷ�s�B�����֏\�Y�B[endindent][l][r]
[ws buf=2 canskip="true"]
[r]
�@�@ �\�Y�@�@�@[indent]
�G�ꑷ�s���B[endindent][l][r]

;[image storage="10" layer="base" page=fore]
�@�@ ���s�@�@�@[indent]
�i��u�̌�A�Γ�e���\���\�Y�Ɍ�����j
[playse buf="1" storage="sound/effect/SE�e�\��.ogg" ]
[endindent][l][r]
[ws buf=1 canskip="true"]

�@�@ �\�Y�@�@�@[indent]
�i�����āj���O�̗͂��؂肽���B���ɁA���y�̓z�𓢂��񂩁B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]


;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE�~1.ogg"]

[image storage="fgimage/20/_IS32257.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="rogoku" layer="base" page=fore]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�s��T�t�Ɋ��̓~�B��ܔ��Z�N�A�񌎁B[l][r]
����̉��B�~�̊����ɓ������T�B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/11/1.ogg" ]
�@�@ ��T�@�@�@[indent]
�݂�c�A�݂�c�B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]
[ws buf=1 canskip="true"]


;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE��.ogg"]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�s�����t�^�Ẳ��M�B��ܔ��Z�N�A�����B[l][r]
�S�̒��ɍ��݂�t���Ă��錹���B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/11/2.ogg" ]
�@�@ �����@�@�@[indent]
�O�S�Ǝl�\���c�B�n�@�c�B�{���I�Ƃ��ƂƎE���Ȃ�E���I�����A�o���I[endindent][l][r]
[r]
[ws buf=0 canskip="true"]
[ws buf=1 canskip="true"]

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE�H1.ogg" ]

[image storage="fgimage/20/_IS24268.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�s�\�Y�t�g�t�U�鏉�~�̐X�B��ܔ��Z�N�A�\�ꌎ�B[endindent][l][r]
[r]

�@�@ ���s�@�@�@[indent]
�ق��ڂ��ɎU�����S�C�O������Ƃ����W�܂����B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�ł������B[endindent][l][r]

�@�@ ���s�@�@�@[indent]
�{�莛���~�������܂��āA���Ƃ͂��炨�߃F�ɓq���邾����B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���̖��̂��Ƃ́B[endindent][l][r]

�@�@ ���s�@�@�@[indent]
�E�O���o�ŕ�������Ƃ邪�����Ƃ��B�ǂ����Ŏ��ɂ��炵���܂������ȁB[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c�B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE�J1.ogg" ]
[image storage="fgimage/20/_IS32257.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�s��T�t�~�J�̍��J�B��ܔ���N�A�Z���B[l][r]
��l�ڂ���ƋY��̂��̂���T�B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/11/3.ogg" ]
�@�@ ��T�@�@�@[indent]
�ЂƂ�ӂ���̂����Ȃ܂��c�A�݂܂��܂������ނ��܂Ɂc�A[endindent][l][r]
[r]
[ws buf=0 canskip="true"]
[ws buf=1 canskip="true"]


;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE�~2.ogg"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�s�����t����Ɛ�̐ς���~�B��ܔ���N�A�\�񌎁B[l][r]
���̍��݂𐔂��錹���B[endindent][l][r]
[r]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/11/4.ogg" ]
�@�@ �����@�@�@[indent]
�i�N�O�Ɓj���S�ƁA�l�\��c�B�Z�M�c�A�����Ă邩�c�B�Z�M�c�B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����A�ǂ��Ɠ|���B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/11/5.ogg" ]
�@�@ ��T�@�@�@[indent]
�����c�A���v���c�B[endindent][l][r]
[ws buf=0 canskip="true"]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/11/6.ogg" ]
�@�@ �����@�@�@[indent]
�����B[endindent][l][r]

[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/11/7.ogg" ]
�@�@ ��T�@�@�@[indent]
�������c�A���ɂ����̂��Ƃ�Ɛ݂̂ăF����B�����Ȉ���c��ڍk���āB
���オ��ᐅ���A�䂪�������አ���Ă��B����̂��ׂ����Ƃ�
�S�����̈�����Ă��ꂽ�B�����瑺�o���܂��ƁA����r�[�ɁA������
�炢����������Ȃ��Ă�c�B�S���ł˃F�z��݂͂�ȁA���Ŏ����̂��
�ׂ����Ƃ��͂����Ă񂾁H����c�A����������Ȃ��Ȃ����c�B������
��A�ǂ����񂾂낤�c�B[endindent][l][r]

[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/11/8.ogg" ]
�@�@ �����@�@�@[indent]
����c�A���߃F�ɂ��������Ă邱�Ƃ�����B[endindent][l][r]

[ws buf=0 canskip="true"]

�@�@ ��T�@�@�@[indent]
�H[endindent][l][r]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/11/9.ogg" ]
�@�@ �����@�@�@[indent]
���߃F�́A�݂�ɉ�ăF�B�����Z�M�ɉ�ăF�B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]
[ws buf=1 canskip="true"]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�ޕ�����΂̏��������������������B[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
�c�����������ƈႤ�B�c���悢��E�����̂��c�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�C�����ɐg���񂾏�������������A�S�̌����J����B
;���ʉ��J�n
[playse buf="1" storage="sound/effect/SE�S��2.ogg" ]
[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

�@ �~�Q���@�@�@[indent]
�����ŉ������B����l���A�V��ɂ��A�ꂵ�܂��B[endindent][l][r]
[p][cm]



*story_06|�Z��@���Ώ�
;[image storage="takatukijou" layer="base" page=fore]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[image storage="fgimage/21/_IS17445.JPG" layer="1" page="fore" visible="true" top="50"]

;���y��~
[fadeoutbgm time=3000]
[bgmopt volume="50"] 

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
�Z��@���Ώ�[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
���Ώ�V��B[l][r]
�����̐؎x�O�����������A
���R�E�߂Ƃ��̍ȁA���X�^�������B[l][r]
�����ցA�~�Q�������ɘA��
��ꂽ��T�A����������ė���B[endindent][l][r]
[r]

�@�@ �E�߁@�@�@[indent]
�ʂ��グ��B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i�z�������܂܁j���炽���c�A�����ŎE�����̂��H[endindent][l][r]


�@�@ �E�߁@�@�@[indent]
���Ȃ������͂����A���Y�ɋ����邱�Ƃ͂Ȃ��B[endindent][l][r]

��T�E�����@�@[indent]
�H[endindent][l][r]

�@�@���X�^�@�@�@[indent]
�䂪�a�́A�M�����������߂�Ƃ��悤�A�����v�炢�Ȃ������̂ł��B[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�����B�������̏�ɂ��l�̉\�ɕ������𗧂Ă�S�삪����B�u�Y��ɉ���
�������s���ҁv�̉\������܂ŁA�S�ɍ��߂Ď���҂��Ă����B[endindent][l][r]

�@�@���X�^�@�@�@[indent]
��N�ȏ���̊ԁA�S���Ăߒu�������ƁA�ǂ����������������B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
����ȁA�������Ȃ�āA���a�l�́A���A�����l�ɁA����Ȉ؂ꑽ�����ƁA�Ƃ�ł��˂��ł����B[endindent][l][r]

�@�@���X�^�@�@�@[indent]
�����H[endindent][l][r]

[image storage="fgimage/21/_IS16812.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �E�߁@�@�@[indent]
�c�\���x�ꂽ�B���͂��̍��Ώ���A���R�W���X�g�E�߁B�Ȃ̃��X�^���B[endindent][l][r]

�@�@���X�^�@�@�@[indent]
�i��l�ɓ��𐂂��j[endindent][l][r]


�@�@ �����@�@�@[indent]
�c�ق�ƂɁA�E�����ł˃F�̂��H[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�����B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c���a�l�A�Ȃ�ł��炽���������Ă��ꂽ�񂾁H[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�c�C�ɂȂ邩�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
������A����Ȃ��Ƃ́B�����c�A�������������ꂽ�悤�ȋC���Łc�A
�ςɂ��ꂽ�݂ăF�ȁA[endindent][l][r]

�@�@ �����@�@�@[indent]
�o�J���I���ꌾ���Ȃ�ςɕ�܂�邾�B[endindent][l][r]

�@�@���X�^�@�@�@[indent]
�����A�ςɂ܂܂��ł��B[endindent][l][r]

;���y�J�n
[playbgm storage="bgm/ogg/�����q.ogg" loop="true"]
[playbgm storage="bgm/ogg/�E��.ogg" loop="true"]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���Έꓯ�A�΂��B���̗l�q�ɕ��C�ɂƂ����T�ƌ����B[endindent][l][r]
[r]

[image storage="fgimage/21/_IS16820.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="12" layer="base" page=fore]

�@�@ �E�߁@�@�@[indent]
�i�΂��A��T�����āj�c�ǂ������B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�Ȃ񂩁A���炪��������������l������Ȃ�łȂ���������A[endindent][l][r]


�@�@���X�^�@�@�@[indent]
�����́A�a���ς��҂Ȃ̂ŁB[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�{�l�̑O���ጾ���܂��񂪁B[endindent][l][r]

���Έꓯ�@�@ [indent]
�i�a�₩�ɏ΂��j[endindent][l][r]

��T�E�����@�@[indent]
�i���R�Ɓj�c�B[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
���܂񂷂܂�A�Y��ɓa�l���ۂ����Ă݂��񂾂��A�ǂ��ɂ���肭�ł��Ȃ��āB
���X�^�̐\���ʂ肱�̉E�߁A���Ƃ��Ă͑�w�ȕς��҂̂悤�łȁB���O�����������v���H[endindent][l][r]

�Ɛb�����@�@�@[indent]
�v���܂��B�i�N�X�N�X�Ə΂��j[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/12/1.ogg" ]
�@�@ �E�߁@�@�@[indent]
�c�܂��m���ɏ��ƌ����΁A���C�Ȑ�D���΂���B�ł��ˁc�B���Ől
���E���̂��A�����Ől���ׂ��̂��A�ǂ��ɂ��D���ɂȂ�Ȃ��āB[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@���X�^�@�@�@[indent]
����ɏ��X�������́A�D�_���̌����Ă˃F�A[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/1.ogg" ]

�@�@ �E�߁@�@�@[indent]
�c�܃@����ł��A�i���t��I�сj�l���������Ǝv��
�C�������ǂ����Ă��̂Ă��Ȃ��Ăˁc�B���Ȃ�
�Y�񂾂�A[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@���X�^�@�@�@[indent]
����ł͈ꍑ���̎�Ȃǋ΂܂�ʁA����̂Ă�A�������̂Ă�A��
�Ԃ����Ă��[���ƒ������Ă��Ă��̂�ˁB[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/2.ogg" ]

[image storage="fgimage/21/_IS24282.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �E�߁@�@�@[indent]
����Ȏ��A���錾�t��m���ĂˁB�c�l���A���̐g���̂ĂĂ����҂�����
���^�Ɏv���т����ƁB�䂪�_�ł����́A�����l�����߂�ׂ��B��̓�
���Ɛ������B�ł����������ō��̐M���u���؁v�c�B[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/3.ogg" ]
�@�@ ��T�@�@�@[indent]
�i�͂��Ǝv��������j�u���؁v�c�B[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/5.ogg" ]
�@�@ �E�߁@�@�@[indent]
�܂��̖����A��ɂ̋����A�\������̈������A�u���v�B[endindent][l][r]
[ws buf=0 canskip="true"]

��T�E�����@�@[indent]
�c�B[endindent][l][r]


�@�@ �E�߁@�@�@[indent]
�c���̌��t�ɉ���ď��߂āA�����̂Ȃ��ł����Ƃ킾���܂��Ă����v��
���A�ԈႢ����Ȃ��Ǝv�����񂾂ȁB[endindent][l][r]

�@ �~�Q���@�@�@[indent]
���B���F�A�a�̌��u���v�̋����ɂ���ƁA�S�̏d�ׂ������ꂽ��ł��B[endindent][l][r]

[image storage="fgimage/21/_IS17456.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �����@�@�@[indent]
���a�l�A���񂽁c�A�؎x�O���B[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�����B�Ƃ͌����˂��c�A���̓��͐[���A�����āB����Ȏ��ɁA���̘Z��
�͌��ł��Ȃ������āA[endindent][l][r]

�@�@ ��T�@�@�@[indent]
���Ⴀ�I������A���A����A���݂̂悪��˃F�ڂɑ����Ă��Ǝv���ƁA
����Œ��ꒃ�ɂȂ��Ăł������Ă�肽���Ȃ�ł��I[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/6.ogg" ]
�@�@ �E�߁@�@�@[indent]
�c���ꂪ�A�����B[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/7.ogg" ]
�@�@ ��T�@�@�@[indent]
���Ⴀ�A���Ⴀ�I����݂���v���ȃ@�Ă��[���ƍl���Ă��ƁA���ł�
�����ꂵ���Ȃ�ł��I[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/8.ogg" ]
�@�@ �E�߁@�@�@[indent]
���ꂪ�A�����B[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/9.ogg" ]
�@�@ �����@�@�@[indent]
�����A�����펵�̂��ƍl�����Ƃǂ��ɂ������~�܂�Ȃ��Ȃ��āA������
������܂܋}�ɑ���ƁA�����ꂵ���Ȃ񂾁B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ �l�X�@�@�@[indent]
�c�B[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/10.ogg" ]
�@�@ �����@�@�@[indent]
������A�����H[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/11.ogg" ]
�@ �~�Q���@�@�@[indent]
������Ȃ��H[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/12.ogg" ]

[image storage="fgimage/21/_IS17462.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
���̂���I�݂�̂��Ƃ΂����l���āA�����Ƃ��S���̂Ă��܂�
�Ă�B���炸���ƁA���������������񂾂Ǝv���Ă��B�ł���������āA
�M�ɕ������ꂽ�݂Ă��ɂ݂�̂��ƍl�����܂��̂͂�A�����������Ƃ�
�͂˂񂾂ȁI[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/13.ogg" ]
�@�@ �E�߁@�@�@[indent]
���l�B���O�͂��̐S��M���A�����Ă䂯�Ηǂ��̂��B[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/14.ogg" ]
�@�@ ��T�@�@�@[indent]
�c���c�B[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/13/15.ogg" ]
�@�@ �����@�@�@[indent]
�c�����c�B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ �E�߁@�@�@[indent]
���Ȃ��A�����ȁB[endindent][l][r]

�@�@ �����@�@�@[indent]
�ւ��A�o�J�������Ⴂ���˃F��A���@�A[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
���Ȃ��ł͂Ȃ��A[endindent][l][r]

�@�@ �����@�@�@[indent]
���A�����H�c���������������Ă񂾂�B�����͂��E�ƁE���B���@��
�N���ꏏ�ɂ�����ł����B���񂽂̖ڂ́A�ӂ����Ȃ����[�́B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�͂��B[endindent][l][r]

�@�@ �����@�@�@[indent]
�����I���O���������́I�c
���A���̓�N�ԁA[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
���́A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c��T�ł��B[endindent][l][r]

�@�@ �����@�@�@[indent]
�����I���܁i���j�A��T�������́I[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c���������炢�����A���������͂߂Ȃ��Ă�A[endindent][l][r]

�@�@ �����@�@�@[indent]
��N�����I����ȁA�����Ȃ��������������낤���I���͂������牽��
�M���Đ����Ă��Ⴂ�񂾁I[endindent][l][r]

�@ �~�Q���@�@�@[indent]
������Ȃ��H[endindent][l][r]

�@�@ �����@�@�@[indent]
�����c�B[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
���Ȃ���̏Z�܂��͊��ɏ鉺�Ɏx�x�����B�_�̉������邱�̒n�ŁA
����Ƌx�ނ��悢�B���̋��Ɉ����A�Ђ��ƕ����ĂȁB[endindent][l][r]
[p][cm]



*story_07|����@�ߍ]�@���J
;���y�J�n
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[image storage="fgimage/22/_IS17481.JPG" layer="1" page="fore" visible="true" top="50"]
;���y��~
[fadeoutbgm time=3000]


[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/�G�g.ogg" loop="true"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
;[image storage="heiti" layer="base" page=fore]


[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
����@�ߍ]�@���J[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/P24��.ogg" ]

[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�H�ďG�g�A�������𔺂��A����{�点�����B[endindent][l][r]
[r]

�@�@ �G�g�@�@�@[indent]
���ōs�R���~�܂��Ă񂾂�I�N���~�߂��̂́I���l�͉y�I���₩�Ɉ�
�y�̐M�����񏊂ɒy���Q���Ȃ���Ȃ�˂��񂾂�I�܂����O�A���A�x
���A���A�g���Ȃ��A���Č��������񂾂�A���̉����I���������A����
�ǂ�������A�ǂ��ɉ��I�v�f������A���H���͉����H[endindent][l][r]

�@�@ ���T �@�@�@[indent]
������Ȃ������B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�����A���A�����H[endindent][l][r]

�@�@ ���U �@�@�@[indent]
�����A������Ȃ������B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
����B�����Ζ�Y�A�����M�^�M�^�ɂ��Ă������ȁI[endindent][l][r]

�@�@ ���V �@�@�@[indent]
�\���グ�܂��B���̐旎�΂ɂ��A�R�n�����~�߂�H���Ă���܂��B[endindent][l][r]

[image storage="fgimage/22/_IS17483.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �G�g�@�@�@[indent]
���΂��@�H[endindent][l][r]

[r]


[image storage="fgimage/23/_IS17486.JPG" layer="1" page="fore" visible="true" top="50" pos="left_center"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
�H�ČR�������낷�\�Y�A�����֑��s�B[endindent][l][r]
[r]

�@�@ ���s�@�@�@[indent]
�J�̏o���͍ǂ�������B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�悵�B�c���̐�q�̒J���z�̕���B�O��̋R�n����Œׂ��Γz�͊��S
�ɌǗ�����B[endindent][l][r]

�@�@ ���s�@�@�@[indent]
�񂾂ȁB�j�O���W�܂�������B[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/14/15.ogg" ]

[image storage="fgimage/23/_IS24289.JPG" layer="1" page="fore" visible="true" top="50" left="0"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ �\�Y�@�@�@[indent]
�c�����ŏG�g��ׂ��΁A���y�̓z�̕ЉH���͂��������B���悢�悱
��������̔e�Ƃ̎n�܂��B���s�A���O�̓S�C�O���B���O����삯��
�j���i�̂�Ɓj���グ��I[endindent][l][r]
[ws buf=0 canskip="true"]


�@�@ ���s�@�@�@[indent]
�����I���[�c�A�H�͐[�܂�A���͎���A���炟�镗�ɓ�����ƁA���R
�Ɨ܂��o�Ă��Ă��܂��B�v���o���ȃ@�B�����̖\�ꑾ�ہB���܂��ẮA[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���������I�s�����I[endindent][l][r]

[r]
[ws buf=1 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE_�R�Ɣn.ogg" ]
�H�ČR���A���΂��P���B�ԋ߂̋R�n�����X�ƒׂ����B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

�@�@ �G�g�@�@�@[indent]
�������I[endindent][l][r]

�@�@ ���T �@�@�@[indent]
�a�I��P�ł��I[endindent][l][r]

[r]

[playse buf="1" storage="sound/effect/SE�e��.ogg" ]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�e���������A�G�g�̕����������X�Ɠ|��Ă����B[endindent][l][r]
[r]

�@�@ �G�g�@�@�@[indent]
�Ȃ񂾂ƁI[endindent][l][r]
[ws buf=1 canskip="true"]

[r]

[image storage="fgimage/24/_IS17493.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����֏\�Y�ƁA���s�̓S�C���B�G�g�����͂ށB[endindent][l][r]
[r]

�@�@ �G�g�@�@�@[indent]
�c�N���I[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�H�Ē}�O��G�g�A���O���E���B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�c���ق����₪��B�ҋ��I[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���������N�����Ȃ��B�����̋R�n�͉��ʂŗ��������B�����͌Ǘ�������B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�i�{��Ɯ��ɐg��k�킹��j�c�B[endindent][l][r]

�@�@ ���s�@�@�@[indent]
�������Ⴄ��B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�҂āB�ՏI��O�ɉ����}�����Ƃ������B�c���͂ȁA���O
�ɉ������q�˂Ă݂����ƁA��X�v���Ă������Ƃ�����B���̕ԓ��䂪
�S�_��X�点���߂�΁A���O�̐������ɁA�l���ʂ��Ƃ������B[endindent][l][r]

�@�@ ���s�@�@�@[indent]
�c�������Ⴄ��B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�҂āB����i���Ɓj�A�������Ƃ��Ȃ񂾂�I[endindent][l][r]


�@�@ �G�g�@�@�@[indent]
�i�Ⴍ�j�����B�c���̖앐�m����B���ɂ��̗��ނ񂾂������킫��
�����B���͐D�c�R�����̕��𑩂˂铪��B�c�Ƃ��ƂƂ��������낳
����I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A�w�}���ēS�C���ɏe�����낳����B[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
�c���O�͂������y�̓z�̎r���z���āA���̓V�����l�镠�Â��肾�B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�i���Ǝ@���ق����΂݁j���̓V���A���O�͂ǂ����𓝂ׂ�����B[endindent][l][r]

[image storage="fgimage/24/_IS24449.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �G�g�@�@�@[indent]
�c�u�N�j�v���B�c���͖k�����A���̒n�Ŕn���d�������Đ����閯����
���Ƃ��A�y�n�Ɩ@�x�Ɛ��ō��̐��܂Ŕ��񂾂�B�l�ԂȂ񂼊F�������B
�e���F�𔛂���̋��݂Ȃ���A��������Ƃ��ł͖Œ��ꒃ�ɔ���ꂽ��
��B���̓N�j�œz��𔛂�グ�Ďx�z���Ă��B�����z��́A�E����
�ΉE�A���Ƃ����Ԃ��፶�ɑ���A���ł��̖���������A���s�̌Q���
�Ȃ��B[endindent][l][r]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/15/1.ogg" ]

[image storage="fgimage/24/_IS17497.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
�c���΂͂ǂ�S������̂��オ�����A�����B[endindent][l][r]
[ws buf=0 canskip="true"]


�@�@ �G�g�@�@�@[indent]
���A���A���O����������I�J�߂��t�����Ăނ����ራ����������Ă߁A[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/15/2.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�����A�Â��B[endindent][l][r]
[ws buf=0 canskip="true"]


�@�@ �G�g�@�@�@[indent]
�c�Â����H[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/15/3.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�����ꂨ�O�̌����u�N�j�v�͏�����B[endindent][l][r]
[ws buf=0 canskip="true"]


�@�@ �G�g�@�@�@[indent]
�c��ȁA�N�j�����Ȃ���āc�A[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/15/4.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�l�ԋ��̍��̍���͂��O�������قǋ�݂ł͂Ȃ��B�₪�ēz��͉�ɕ�
��B�Ȃ̐g�𔛂鍽�������B�N�j�������_���E�����ĂāA���g�Ő��E��
���҂����̎��オ����ė���B���ꂱ�����A�܂��Ƃ̐l�Ԃ̐��E��B[endindent][l][r]
[ws buf=0 canskip="true"]





�@�@ �G�g�@�@�@[indent]
�c�n�����Ă�B[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/15/5.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�΂��B�V�����������΂����̂́A�₪�Ė����ɏ΂���B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ �G�g�@�@�@[indent]
�c�B[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/15/6.ogg" ]
[image storage="fgimage/24/_IS17503.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
���͖����������O���̐S������ʁB���߂���͈̂�A���̐��E��B��
�͐V�����l�Ԃ��B�S�Ă̌Â����̂��u�`�󂵓V���𓝂ׂ��łɁA�����
���̐��E�A�܂�����Ȃ܂܁A�܂邲�Ɩ��ɂ���Ă��̂�B[endindent][l][r]
[ws buf=0 canskip="true"]


�@�@ �G�g�@�@�@[indent]
�c�����Ă₪��B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���������s�B[endindent][l][r]

�@�@ ���s�@�@�@[indent]
������B���߃F��B�����܂���B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�i�e�����������j�c�B[endindent][l][r]

[r]
;���y��~
[fadeoutbgm time=3000]


;���y�J�n
[playbgm storage="bgm/ogg/���.ogg" loop="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
[playse buf="1" storage="sound/effect/SE�e���؂�1.ogg" ]
���̎��A���؂鉹�Ƌ��ɁA�S�C�O�̈�l���|���B[l][r]
���C�ɂƂ���l�X�B[l][r]
[playse buf="1" storage="sound/effect/SE�e���؂�2.ogg" ]
����Ɉ�l�A�܂���l�A�S�C�O���|��Ă����B[endindent][l][r]
[ws buf=1 canskip="true"]
[r]

[image storage="fgimage/25/_IS17506.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ ���s�@�@�@[indent]
�����B�\����̕�ɁA�G�؉Z�i���Ă��������j�̊��w���I[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
��삩�I[endindent][l][r]

[r]


[image storage="fgimage/25/_IS17511.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
��̒�������A�\�Y�A�G�g�������낷����v�ƓS�C���B[endindent][l][r]

[image storage="fgimage/25/_IS17506.JPG" layer="1" page="fore" visible="true" top="50"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
[r]



�ޕ�������\�Y�����B[endindent][l][r]
[r]

�@�@ ���s�@�@�@[indent]
�L�蓾�˃F�B�\���悩��O�������ʐH��킷�Ȃ�āB[endindent][l][r]

[r]
[image storage="fgimage/25/_IS17511.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[r]
���ʂ���ɂ����j���u�c�u�c�ƈ�S�əꂫ�Ȃ��猻���[endindent][l][r]
[r]

�@�@ ��v�@�@�@[indent]
�����������B[endindent][l][r]

�@�@ �펵�@�@�@[indent]
�b�����A�����ܗЎO�сA�񂠂��B�k�Ɉꐡ�Ɠ�ИZ�сA[endindent][l][r]


�@�S�C���@�@�@[indent]
�i�O���̓S�C�����ꂼ��e���𓮂����j
;���ʉ��J�n
[playse buf="1" storage="sound/effect/SE�e�\��.ogg" ]
[endindent][l][r]
[ws buf=1 canskip="true"]


�@�@ �펵�@�@�@[indent]
���A����ɓ�тƈꎅ�A��
�A����ɔ����A�k�ցB[endindent][l][r]

�@�@ ��v�@�@�@[indent]
���āI[endindent][l][r]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE�e.ogg" ]
�e���B[endindent][l][r]
[r]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
[ws buf=1 canskip="true"]
�~   �~   �~[l][r]
[playse buf="1" storage="sound/effect/SE�e���؂�1.ogg" ]
���؂鉹�B��l�A�܂���l�|���S�C�O�B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

�@�@ ���s�@�@�@[indent]
��˃F�I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
[playse buf="1" storage="sound/effect/SE�e���؂�2.ogg" ]
���s�A�\�Y�ɔ�т��A���ɏe�e����炤�B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]
�@�@ �\�Y�@�@�@[indent]
�S�C���ɁA���������Ă�ȁc�B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�n�̂��ȂȂ����B���s�A�\�Y�ӂ�����グ��B[endindent][l][r]
[r]

�@�@ ���s�@�@�@[indent]
�ʖڂ��@�B�͂܂ꂿ�܂����B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�����A�ǂ������앐�m�c�A�������̈А��́A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ ���s�@�@�@[indent]
�����͗}����B����ǁB��A��́A���@���B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE����1.ogg" ]
���s�A���̉Ζ�ʂ𓊂���B�������B[l][r]
�Ђ�ޏG�g�B���̌��ɁA�\�Y�Ƒ��s�͎p�������B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

�@�@ �G�g�@�@�@[indent]
�ǂ��I�߂���I�u�b�E���I[endindent][l][r]
[r]

[image storage="fgimage/25/_IS16848.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�ǂ��ċ���G�g�B[l][r]
�~   �~   �~[endindent][l][r]
[r]

�@�@ ��v�@�@�@[indent]
����ł��̃G�e���ɑ݂�������Ă������B�c���ς�炸�����ȎZ�p��B[endindent][l][r]

�@�@ �펵�@�@�@[indent]
�c���������Ȃ������t�B[endindent][l][r]

�@�@ ��v�@�@�@[indent]
�M���������O�𐶂������󂪂悭�������B�펵��c�B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��v�A�펵�A���̏������B[endindent][l][r]
[p][cm]

*story_08|����@���Ώ鉺�̕����\�\
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;���y��~
[fadeoutbgm time=3000]

[image storage="fgimage/26/_IS17523.JPG" layer="1" page="fore" visible="true" top="50"]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���y�J�n
[bgmopt volume="50"] 

[playbgm storage="bgm/ogg/����.ogg" loop="true"]

[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]

����@���Ώ�@���Ώ鉺�̕����\�\�B[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



�@�@�@�@�@�@�@�@�@�@�@[indent]
���X�^�A��T�A������A��Ă���ė���B[endindent][l][r]
[r]

�@�@���X�^�@�@�@[indent]
����l�̂��Z���̂��ƁA�e�n�ɏZ�ސM�k��ʂ��A
�o�������̂��Ƃ𕷂��Ă݂܂��B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
���A���肪�Ƃ��������܂��B[endindent][l][r]

�@�@���X�^�@�@�@[indent]
�������M�������̏Z�܂��ł��B[endindent][l][r]

��T�E�����@ [indent]
�i���������n�����Q����j[endindent][l][r]


�@�@���X�^�@�@�@[indent]
���Z���̂��ƁA�C������łȂ�ʂƂ͎v���܂����A���͑ς��đ҂��܂�
�傤�B�������ɋF���Ă���܂��B�~�Q���A���n���i�A���Ƃ́B[endindent][l][r]

�~�Q���E���n���i�@[indent]
�͂��B[endindent][l][r]

�@�@ �����@�@�@[indent]
���ꂪ�A��ؕ����Ă���c�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i���ɒu���ꂽ�߂𒭂߂�j[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�a���M���ɂƂ��p�ӂ��ꂽHispania
�̔����ł��B�������ɂȂ�܂����H[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i���n���i�ɓ����甖��̃V���[����킹���j�c�ցA[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�悭���������ł��B[endindent][l][r]

�@���n���i�@�@�@[indent]
�ق�A�����ɁB�i��T�����Ɍ�������j[endindent][l][r]


�@�@ ��T�@�@�@[indent]
�i�������āA���������j�c�B[endindent][l][r]

�@���n���i�@�@�@[indent]
�����܂����B�M�����������̐M���ɁA������Ƒ���D��ꂽ�ƁB[endindent][l][r]

�@�@ �����@�@�@[indent]
�c�ւ��A���񂽁A[endindent][l][r]

�@ �~�Q���@�@�@[indent]
��X���A��������̂������܂����B[endindent][l][r]

�@�@ �����@�@�@[indent]
�����������̂��B[endindent][l][r]

�@ ���n���i�@�@ [indent]
�M�������̐g�̏�𕷂��A�܂�ő��l���Ǝv�����c�A[endindent][l][r]

�@ �~�Q���@�@�@[indent]
��낵����Ε����Ē����܂����A��X�́A������l�̂��Ƃ��B[endindent][l][r]

[r]

[image storage="fgimage/27/_IS17539.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���y��~
[fadeoutbgm time=3000]


;���y�J�n
[playbgm storage="bgm/ogg/�����q.ogg" loop="true"]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
�l�l���X�g�b�v���[�V�����ɂȂ�B[l][r]

;[image storage="01" layer="base" page=fore]
���Ώ�B[l][r]
���R�E�߂ɘA����A�O�H���G�A���c�����q�A�����B[endindent][l][r]
[r]

�@�@ ���G�@�@�@[indent]
���₟�A���΂͂����Ƃ���ł��ȃ@�B�X���ۂ��ƁA�_���ȋC�ɕ�܂��
��Ƃł��\���܂��傤���B�i�J�X�e����j����j�ȃ@�A���c�a�A[endindent][l][r]

�@�����q�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
���ڗ����̒O�H�a�ɁA���̂悤�Ɍ����Ē����ƁA[endindent][l][r]

�@�@ ���G�@�@�@[indent]
���₟�c�A�A���ł��ȁA���̂悤�Ȃ��̂Ɉ͂܂�Ă�ƁA��������w�A
�����l�ԂɂȂ����悤�ȐS���������܂��ȁB�i�΂��j�A�A�b�I[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�����A[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�i�O�Ɂj�˂��I[endindent][l][r]

�@�@ ���W�@�@�@ [indent]
�i����ė��Ă��������j[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�i�J�X�e������Ɂj����������ĂȂ���ˁI�o��ŗ�����H�����Ƃ��āB
���A�̎�����Ƃ��āB�i�΂��E������j[endindent][l][r]


�@�����q�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ ���G�@�@�@[indent]
����͂◈�đ��X�A�_�̋�������ʁA�ߐl�ɂȂ�Ƃ���ł����B�i�΂��j[endindent][l][r]


�@�@ �E�߁@�@�@[indent]
�i�Ǐ]�΂��j[endindent][l][r]


�@�@ ���G�@�@�@[indent]
�ߐl�ƌ����Ύ��ɉE�ߓa�A
���̊X�ɁA����ߐl�i�݂тƁj�𓽂��Ă����邩�ȁH[endindent][l][r]


�@�@ �E�߁@�@�@[indent]
�c�B[endindent][l][r]

�@�@ ���G�@�@�@[indent]
��N�O�A���Z���͌��ɉ����������j����l�A�ꂪ�A�s��������܂��Ă�
��܂��ĂȁB���̍��΂ɂ���Ƃ̉\���A[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�����ł��ȁA[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�Ȃ�ł����̖��A���������̘b�A�D�c�Ƃ�h�邪���閧���B�������Ă�
��Ƃ��B���̎҂𓽂��҂����߂ƁA�a�̌���������܂��ĂȁA[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�i���΂݁j���x�̂��z���́A���̉E�߂�₢�l�߂邽�߂ł����H[endindent][l][r]


�@�@ ���G�@�@�@[indent]
�����ҋ@�����Ă���B���̂܂܂��̍��΂̒��A��Ăɉ��߂����Ē�����
����낵�����ȁB�i������j�������A[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
���D���ɂȂ����B���̂悤�ȎҁA���̍��΂ɂ͒f���Ă���܂��ʁB[endindent][l][r]

[r]




[image storage="fgimage/26/_IS17526.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���y��~
[fadeoutbgm time=3000]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
�E�߁A�����q�A���G�̎p�͂��̂܂܁A�\���ˁA���A�֎q�ƂȂ�B[endindent][l][r]
[r]

;[image storage="takatuki" layer="base" page=fore]

;���y�J�n
[playbgm storage="bgm/ogg/����.ogg" loop="true"]

�@�@ ��T�@�@�@[indent]
����Łc�A[endindent][l][r]

�@���n���i�@�@�@[indent]
�v�͖�������c�̐�ɋ��o���ꂽ�ƕ����Ă���A���̏�����₿�܂����c�A[endindent][l][r]

�@ �~�Q���@�@�@[indent]
���̋��ł́A���ɗV���Ƃ��ĘA��o����A���̂܂܍s�����m�ꂸ�c�A[endindent][l][r]

�@�@ �����@�@�@[indent]
�c�B�i�������܂�ʎv���ɋ��ꗧ���オ��A���ꂽ�֎q�ɍ���j[endindent][l][r]

�@���n���i�@�@�@[indent]
�����O�N���o�̂ł����A���܂��ɋC�t���Ɨ܂��~�܂�Ȃ��Ȃ��āc�A[endindent][l][r]

�@ �~�Q���@�@�@[indent]
���̗����A�ʂ�͐��̏킾�ƕK���Ŏ����Ɍ����������āc�A�����o�Ă΁A
���̒���􂯂�悤�ȗ��������A���炢�ł����Ǝv�����̂ł����c�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

�@���n���i�@�@�@[indent]
�c���A�v���̂ł��B���X����̐l�Ԃ������Y�܂ꎀ�ʂ��̕����̒��ŁA
����قǂ܂łɈ�����l�Ə��荇�������Ƃ́A��Ղ��Ɓc�B[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�c�Ȃ̂ɁA���̊�Ղ��A�D����Ƃ́c�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�����A���t�𖳂����B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�݂�́c�A�������񂶂܂��Ă�̂��ȁc�A[endindent][l][r]

�@�@ �����@�@�@[indent]
�c�B[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�i�����j���������Ă��܂��B��X�̈�����҂��B�����Ă���ƐM���Ȃ�
��΁A���B�̂��̎v���͈�́A�����Ɍ�����΂����̂ł����B[endindent][l][r]

��T�E �����@ [indent]
�c�B[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�i�\���˂����āj�E�ߓa�قǂ̕��ł���΁A�S�Ă̖��𓙂���������[������������Ȃ̂ł��傤�B���̂悤�Ȗ��n�҂́A������l�ւ̈����т��̂�����t�B�c����ǁA���̂��߂Ȃ�A���̐g�ɂ��̐S�ɁA�ǂ̂悤��䅓�h�ꂪ�s�����Ă��\��Ȃ��B���̂��߂Ȃ�A�������́c�A[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����A�~�Q���̌��ӂɖ������������󂯂āA[endindent][l][r]
[r]
[image storage="fgimage/26/_IS16862.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �����@�@�@[indent]
�Ȃ񂾁A�Ȃɂ��񂾁A������ΌZ�M�̂��߂ɂȂ񂾁A[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�����c�A[endindent][l][r]

�@�@ �����@�@�@[indent]
������B���߃F�����͒m���Ă񂾁B�������炪���ׂ����ƂȂ̂����B[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�����A�����B[endindent][l][r]

�@���n���i�@�@�@[indent]
���ʂȂ��Ƃ́A�����āA[endindent][l][r]


�@�@ �����@�@�@[indent]
�R���A���@�o�J�����ǂ�A�ꌈ�߂��z�̊o��̓����͕����񂾂�B[endindent][l][r]

�~�Q���E���n���i�@[indent]
�c�B[endindent][l][r]

�@�@ �����@�@�@[indent]
���肢���B�B���˃F�ł����I[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�i���΂炭�ق��j�c���ꂪ�A�S���S�_�Ɍ�������̓����Ƃ��Ă��A[endindent][l][r]

�@�@ �����@�@�@[indent]
�\��˃F�B����S���S�_�ł��ܔ��c�ł��Z�M�̂��߂Ȃ�A�ǂ������āA[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�����c�B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~�Q���A���΂炭�ق�����A[endindent][l][r]
[r]

�@ �~�Q���@�@�@[indent]
������܂����B�ł͎Q��܂��傤�B�������́A���̂��߂ɁB[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�ƌ����A�~�Q���A���n���i�Ƌ��ɋ���B[l][r]
[r]
;���y��~
[fadeoutbgm time=3000]

;���y�J�n
[playbgm storage="bgm/ogg/�����q.ogg" loop="true"]

[image storage="fgimage/27/_IS17539.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="02" layer="base" page=fore]
�~   �~   �~[l][r]
[r]

���G�A��Ȃ��痧���オ��B[endindent][l][r]
[r]

�@�@ �E�߁@�@�@[indent]
�ǂ������A�O�H�a�B[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�c���̐����̊ԂɁA���̐g�ɉ������c�B�����ɂ������������s���܂����B[endindent][l][r]

�@�����q�@�@�@[indent]
��H�c�����ɂ���ł͂Ȃ����A[endindent][l][r]

�@�@ ���G�@�@�@[indent]
��A�������������I�ȈӖ�����Ȃ��A�{���c�A[endindent][l][r]

[image storage="fgimage/27/_IS16869.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�����q�@�@�@[indent]
���ɉE�ߓa�A[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�����A���c�a�������Ă��Ȃ����B[endindent][l][r]

�@�����q�@�@�@[indent]
�M���͂��̍��΂̖��ɁA�M�S�ɕz������Ă���Ƃ��B[endindent][l][r]

�@�@ ���G�@�@�@[indent]
���A�������H[endindent][l][r]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/16/1.ogg" ]
�@�@ �E�߁@�@�@[indent]
���Ȃ����A�ł����̋����ɂ��������H[endindent][l][r]
[ws buf=0 canskip="true"]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/16/2.ogg" ]
�@�����q�@�@�@[indent]
�����A�傢�ɁB�c���͂��̗L���̏�ŘS���Ă߂��A���̂悤�ȕs���
�g�ƂȂ�܂����B���͂��ł������ɂ������B���A�l�q�𒴂����傫��
�͂����𐶂������B�c�����v�������A�_�̑��݂��v���܂����B[endindent][l][r]
[ws buf=0 canskip="true"]


�@�@ �E�߁@�@�@[indent]
�ق��c�A[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/16/3.ogg" ]
�@�����q�@�@�@[indent]
�������c�A���̎Ⴋ�c�؂̔@�����́A�̂Ƌ��ɂ˂��Ȃ������悤�ŁA
�ǂ����Ă��c�A���Ƃ������̂����̕����D�ɗ����܂��ʁB[endindent][l][r]
[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/16/4.ogg" ]
�@�@ �E�߁@�@�@[indent]
�c�_�������鍕�c�a�Ȃ�A�قǂȂ����̍��ɂ������A[endindent][l][r]
[ws buf=0 canskip="true"]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/16/5.ogg" ]
�@�����q�@�@�@[indent]
�E�ߓa�ɂ��q�˂������B�b�ɂ��΁c�A��؂̏��R�s�T���́A�z���̂��߂ɂ�
���疜�ً̈��k�̖���j��E�����ƁB����́A���ł����B[endindent][l][r]
[ws buf=0 canskip="true"]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/16/6.ogg" ]
�@�@ �E�߁@�@�@[indent]
�_�̐��������������ɐ^�̋~����^����B���̋~�����L�߂邽�߂ɂ�
���ނ͉����C��n�����̂ł��B[endindent][l][r]
[ws buf=0 canskip="true"]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/16/7.ogg" ]
�@�����q�@�@�@[indent]
�����������ɑ����̌��������ꂽ�B�M�������łȂ����悤�ɁB
�E�ߓa�A����́A���ł����B[endindent][l][r]
[ws buf=0 canskip="true"]


�@�@ �E�߁@�@�@[indent]
�c�B[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/16/8.ogg" ]

[image storage="fgimage/27/_IS24461.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�����q�@�@�@[indent]
�M���͂��̍r�ؑ��d�d���̐܂�A���d�ɔw���A�L����̐l���ł��閅��
��q�i�����j�����Ȃ��邩�A�M�����ɔw���A���y�ɕ߂���ꂽ�l���̔�
�V�A���������Ȃ��邩�𔗂��āA���ǂ͏�������̂āA�Ƒ����A�M��
��M��������M�҂��������ł��̂ĂāA�����܂����ȁB�c�E�ߓa�A����
���M�����ō��̐M���ƌ��A���Ƃ������̂Ȃ̂ł����c�B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
��傷��E�߁B�K���Ō��t��a���A[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/16/9.ogg" ]
�@�@ �E�߁@�@�@[indent]
�c���c�a�A[endindent][l][r]
[ws buf=0 canskip="true"]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/16/10.ogg" ]
�@�����q�@�@�@[indent]
�E�ߓa�ł������̐^�������ʈ����A���͉��S�N�o�Ƃ��Ƃ��^�ɗ�����
������̂ł��傤���c�B�c������E�ߓa�́A�Z���͌��Őg��q���ď��Y
��ɋ삯�������Ƃ������ɁA�������̔ޕ��ɒ͂߂ʁA���̐^���𒼊ς�
���̂ł͂Ȃ����H�c���Ƃ����玄���A���̖��������Ƃ����A���Ă�
�������̂ł��ȁc�B[endindent][l][r]
[ws buf=0 canskip="true"]

[image storage="fgimage/27/_IS17542.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �E�߁@�@�@[indent]
�i��a�ɖ����j���c�a�c�A���x���\�����ʂ�A���͂��̂悤�Ȗ��ȂǁA[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����֊����q�̔E������B[endindent][l][r]
[r]

�@�@ �E�R�@�@�@[indent]
�\���グ�܂��B��̖�������Ǝv���鉮�~���͂��܂����B[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�I�c���c�a�A�M���́A[endindent][l][r]

�@�����q�@�@�@[indent]
�i�ق����΂݁j�c�B[endindent][l][r]

�@�@ �E�R�@�@�@[indent]
�c�������A���̎p������܂��ʁB[endindent][l][r]

�@�����q�@�@�@[indent]
�c�B[endindent][l][r]

[r]

[image storage="fgimage/27/_IS17547.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����q�A���G�A�E�тƋ��ɋ���B�E�߁A��l�ڂ���ٍl���A����B[endindent][l][r]
[p][cm]


*story_09|���@�ߍ]�@���n
;[image storage="13" layer="base" page=fore]
[image storage="fgimage/28/_IS16887.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;���y��~
[fadeoutbgm time=3000]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
���@�ߍ]�@���n[resetfont][l][r]
[r]
;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="sound/effect/P24��.ogg" loop="true"]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�~�Q���A���n���i�ɘA����A��T�A�����A����ė���B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�c�ǂ��܂ōs���񂾁B[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�Ԃ��Ȃ����B�i�ӂ�Ɂj�W�܂��Ă��邩�A�Z��o�������B[endindent][l][r]

�L���V�^�������@[indent]
�͂��B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����̃L���V�^���������W�܂�B[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
�Ȃ񂾁c�H[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�Љ��B��T�A�����B�ނ����X�Ɠ����߂��݂𕉂��҂������B[endindent][l][r]

�@�@ �����@�@�@[indent]
�c������݂�ȁA[endindent][l][r]

�@���n���i�@�@�@[indent]
�q��e�Z��A�v��Ȃ�D���܂����B[endindent][l][r]

�L���V�^���P�@[indent]
�i��T�Ɂj���Ȃ����c�A[endindent][l][r]

�L���V�^���Q�@[indent]
�i�����Ɂj�c������ȁB���񂽂�����������˂�����ȁB[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�݂�Ȃ悭�W�܂��Ă��ꂽ�B�ł͊F�̈�����҂������v���A���ɋF���
�����悤�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�~�Q���𒆐S�ɖڂ����L���V�^�������B[l][r]
��T�A�����͌˘f���Ȃ��������ɕ키�B[endindent][l][r]
[r]

�@ �~�Q���@�@�@[indent]
�V�̕��Ȃ�_��B�������ɏW�܂����Z��o���́A���ꂼ�ꈤ����҂�
�����A�D���A�߂��݂ɕ��Ă��܂��B[endindent][l][r]

[image storage="fgimage/28/_IS17555.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�����A�ڂ��J���Đl�X�����n���B[endindent][l][r]
[r]

�@ �~�Q���@�@�@[indent]
��������������҂����́A�������̐�����S�Ăł����B���ł����B����Ǎ��c�A���̈��͐S�����҂����ɂ���āA���c�ɑł��ӂ���Ă���܂��B�ǂ����_��B��X�̈�������肭�������B���Ƃ��n���̒J����ނƂ��A�M�������Ƌ��ɂ���āA���̈��ɁA����܂ʗ͂����s���������B[endindent][l][r]

�L���V�^�������@[indent]
�A�[�����B[endindent][l][r]

[r]
;���y��~
[fadeoutbgm time=3000]

;���y�J�n
[playbgm storage="bgm/ogg/�퓬.ogg" loop="true"]


[image storage="fgimage/29/_IS16891.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�L���V�^�������A�e�X�ɉׂ��g����B[endindent][l][r]
[r]

�@ �~�Q���@�@�@[indent]
�Ԃ��Ȃ��z��͂�����ʂ�B�c�U��I[endindent][l][r]

�L���V�^�������@[indent]
�͂��A�i�삯�o���A�h���b�Ɖ��𗧂ĂĖؔ���u���j[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�ǂ��Ȃ��Ă񂾁c�A[endindent][l][r]

�@ �~�Q���@�@�@[indent]
�킢�܂��傤�A���ɁB�i�ׂ�n���j[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�����c�A[endindent][l][r]

�@���n���i�@�@�@[indent]
�k���l���̋����ɁA�D�c�z���A����v���B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���R�̕��������B[endindent][l][r]
[r]

�@ �~�Q���@�@�@[indent]
���̐S�Ɉ��̉΂��₷�ȁB��������B���̈��̂��߂ɁA�E�C�̌���U��i��B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���R�̕��������i�ݗ���B[endindent][l][r]
[r]

�@ �~�Q���@�@�@[indent]
�s���I[endindent][l][r]

[r]

[image storage="fgimage/29/_IS32327.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�L���V�^�������A�����グ���X�ƁA��ɂ����Ζ�ʂ����B[l][r]
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE����1.ogg" ]
�������́A�Ζ�ʂɓ����f���A������΂���A�����グ��B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]


�@�@ ��T�@�@�@[indent]
�i���남��Ɓj�����c�A[endindent][l][r]

�@���n���i�@�@�@[indent]
�ǂ������̂ł��B�z�炳�����Ȃ���΁A�M�������̉����ȓ��X�́A�D��
��邱�Ƃ͂Ȃ������̂ł��B�z�炱�����c�A�M�������̈�����l��D��
���̂ł��I[endindent][l][r]

[r]


[image storage="fgimage/29/_IS24473.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����A���̌��t�ɒႭ�X��o���B�����āA�b�̂悤�ɋ삯�o���Ɖ�
��ʂ�����A���тƋ��ɔޕ��Ɍ��������蓊����B[l][r]
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE����2.ogg" ]
�h�H���I�y�􉹂Ƌ��ɁA�����̓������Ζ�ʂ����𐁂���΂��B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

[image storage="fgimage/29/_IS24472.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
�c�����c�A[endindent][l][r]

[r]

[image storage="fgimage/29/_IS32327.JPG" layer="1" page="fore" visible="true" top="50"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�������̉�����A����v�A�����B[endindent][l][r]
[r]

�@�@ ��v�@�@�@[indent]
�c���̈�v�̌R�ɃJ�`�R�~���܂����t�U������Y���͂ǂ��B�c���O��A��l�c�炸�h�^�}�������������I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A���������̎��͂��A�����������͂ށB[l][r]
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE�e��.ogg" ]
�����ցA����ɏe���B�����������X�ƎU���Ă䂭�B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

�@�@ ��T�@�@�@[indent]
�Ȃ񂾁A�ǂ��Ȃ��Ă񂾂�I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
����ƁA���A����\�Y����яo���B[endindent][l][r]
[r]



�@�@ �\�Y�@�@�@[indent]
����ƌ��������c�B���I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A���������Ȃ��|����T�̘r��͂ݏグ��B[endindent][l][r]
[r]

[image storage="fgimage/30/_IS17563.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ �\�Y�@�@�@[indent]
�c���炢��Ԃ��������₪���āB�i�����悤�Ƃ��Ȃ���T�Ɂj�c�����Ȃ��̂��H[endindent][l][r]

�@�@ ���s�@�@�@[indent]
�����A�\�Y�A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���邹���I[endindent][l][r]

�@�@ ���s�@�@�@[indent]
���ꌩ����āI[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c�����{���I�Ȃ񂾁I[endindent][l][r]

[r]

;���y��~
[fadeoutbgm time=3000]

;���y�J�n
[playbgm storage="bgm/ogg/�M��.ogg" loop="true"]


[image storage="fgimage/31/_IS16897.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="06" layer="base" page=fore]
�@�@�@�@�@�@�@�@�@�@�@[indent]
����߂����m�����B[l][r]
���̎����̔ޕ��ɁA�D�c�M���̎p���c�B[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
�i���|����j�c�D�c�A�M�����c�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ ���s�@�@�@[indent]
�܂�������ȂƂ��Ɂc�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�i�{��������点�j���̖�Y�c�A�u�`�E���Ă��I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A��T������A�M���Ɍ������ґR�Ƌ삯�o���čs���B[endindent][l][r]
[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
�삯��\�Y�B�u���ԂɐM���̌��ɗ��B[endindent][l][r][r]
[image storage="fgimage/31/_IS17576.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]




�@�@ �\�Y�@�@�@[indent]
�M�l�c�A���̎������c�A[endindent][l][r]

�@�@ �M���@�@�@[indent]
�������т��Ƃ͈��^�̋����c�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
����ς肨�O�̂͂��育�Ƃ��c�B[endindent][l][r]

�@�@ �M���@�@�@[indent]
���x�͉����A���炨�O���a��̂ĂĂ��B���N�̊ԉA�����Ƃ��āA����
���������O�ւ̉���B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c�Y�������Ƃ��B�a��̂Ă���̂͌Ȃ�B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A�����𔲂��A�M���ƌ����������B[endindent][l][r]
[r]

�@�@ �M���@�@�@[indent]
�c�ߍ��A���ɂ����O�������閈�ɚ��������E�̎p�������Ă�����B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�t���c�A���O�Ȃ񂼂ɁA[endindent][l][r]

[image storage="fgimage/31/_IS17568.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �M���@�@�@[indent]
�N�j�������c�A�������܂˂��_�X�������c�A�l�����̐g���q����؂̍�
����A���������ꂽ���E�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �M���@�@�@[indent]
�����A���̉������ʂ����̂́A���O�̌�������E�̂���ɂ��̐��B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���c�H[endindent][l][r]

[image storage="fgimage/31/_IS24302.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �M���@�@�@[indent]
�c�W�𖳂������l�Ԃ����́A�₪�Ď����B�ꎊ���̉��ƂȂ��B����
�Ȃ������ɂ��̐g���N�������ɋ����A�������N�������̍�����ǂŕ�
���B�ǂ�Ȍ��t�������ɂ͓͂��ʁB�������͊F�A�ޕ��̏�̉��ɔ�߂�
�ꂽ�A����ʎv����z�����A���L�΂����Ƃ�Y�ꋎ��B��ɊZ���
���삵���ǓƂȖ\�N���A����f�r���A�n�𖄂ߐs�����B���ꂪ�c�A���O
���]�ސ��E�́A�s������B[endindent][l][r]


�@�@ �\�Y�@�@�@[indent]
�i�M���̌��t�ɋ����āj�c
�ق����I[endindent][l][r]

[r]

[image storage="fgimage/31/_IS17579.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


;���y��~
[fadeoutbgm time=3000]



�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A�M���Ɏa�肩�����Ă������A�Ԃ蓢���ɂ����B[l][r]

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/P35�ꌂ.ogg" ]
���ɋ���Ȉꌂ���󂯁A���̈ӎ�����ԁB[endindent][l][r]
[r]
;[image storage="black" layer="base" page=fore]

;���y�J�n
[playbgm storage="bgm/ogg/����.ogg" loop="true"]

[image storage="fgimage/32/_IS17588.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[ws buf=1 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[r]
�\�Y�̌����\�\�B[l][r]
�G���̉��B�s�s�̌����B[l][r]
�\�Y�̎���ɁA����̎p�`�����������̐l�Ԃ������Ђ��߂��B[l][r]
��𔖉��ꂽ��тɊ����ꂽ�l�X���s�������A�|�ꂽ�҂��ӂȂ�
���ݒׂ��Ă����B�O�V���b�A�O�V���b�A�����܂�A�����˂���鉹�B[l][r]
�|�ꂽ�҂��z�����Ȃ���n�ɖ����Ă����B[l][r]
�\�Y�͂��̌��i�ɕs�C���Ȑ�ɂ������A���܂炸�����グ��B[endindent][l][r]
[r]


�@�@ �\�Y�@�@�@[indent]
�������O��́c�B������c�B����������I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�������ő�����U�邤�ƁA���̌��i�͖��̂悤�ɏ�����B[endindent][l][r]
[r]

;[image storage="heiti" layer="base" page=fore]
[image storage="fgimage/32/_IS16914.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]

;���y��~
[fadeoutbgm time=3000]

;���y�J�n
[playbgm storage="bgm/ogg/�퓬.ogg" loop="true"]

�~   �~   �~[r]
�C�t���Ə\�Y�͒n�ɕ����Ă���B[l][r]
�\�Y�ɂƂǂ߂��h�����ƁA�M�������݊��B[endindent][l][r]
[r]

�@�@ �M���@�@�@[indent]
�c�����΂�B���ɑ��Ȃ��B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A����ł̂Ƃ���ő����؂𓦂�邪�A�����l�ɏP������n��
���̐g���a����B[endindent][l][r]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
�\�Y�̎p��ޕ����猩���T�ƌ����B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�c�����c�A[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
�\�Y�A���̂܂܋삯�o���A�X�̒��ւƓ����B[endindent][l][r]

[r]
�@�@ �M���@�@�@[indent]
�ҋ��ǂ��I�X�����������z�������o���A���̊�������ė����I[endindent][l][r]
[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
������T�s�����B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i�\�Y�̏������X�����߁j�c�ʖڂ��A[endindent][l][r]

�@�@ �����@�@�@[indent]
�����H[endindent][l][r]

�@�@ ��T�@�@�@[indent]
���܍s�����B�c�\�Y�A�c�\�Y�I[endindent][l][r]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�\�Y�̋삯�������X�Ɍ������A��l�삯�o���B[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
�c��T�I[endindent][l][r]

�@���n���i�@�@�@[indent]
�����A�����܂��傤�A�����I[endindent][l][r]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�����A��ނȂ���T��U��؂�삯�o���B[endindent][l][r]
[p][cm]


*story_10|�\��@���y��
;���y��~
[fadeoutbgm time=3000]

[image storage="fgimage/8/black681.jpg" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="aduti" layer="base" page=fore]
[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]


�\��@���y��[resetfont][l][r]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���y����E���q���G�̋��ف\�\�B[l][r]
���𐂂ꂩ���������̑O�ɁA���q���G�A�����B[endindent][l][r]
[r]

�@�@�@�@���@�@�@[indent]
���A��Ȃ����܂��B���y�ւ̂��z���A�S�������イ�������܂��B���G���B[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�M�����̂��Ăї��Ă�����ȁB�������A����u�������Ă������x���c�B
�H�ēa���A��i�܂Ȃ��j�̉��ł��̓k�J��焈Ղ��Ă������B�M�����̂��̒T��悤�Ȗځc�A���Ă͓a�́A��炩��d���҂��o��Ƃł����v�����H[endindent][l][r]

�@�@�@�@���@�@�@[indent]
�i�����A���𐂂ꂽ�܂܁j[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�ʂ��グ��B���ʁB[endindent][l][r]

[r]

;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/�݂�.ogg" loop="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��������グ��B�݂�ł���B
[image storage="fgimage/33/_IS16940.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
�������܌��G�̊z�̏��ɋC�t���B[endindent][l][r]
[r]

     �݂� �@�@ [indent]
�a�A�ǂ��Ȃ�������ł����A���̏��́A[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�����A�債�����Ƃł͂Ȃ��B�܂����̌��G�A�a�ɂ�������󂯂ĂȁB[endindent][l][r]

     �݂� �@�@ [indent]
�i���݊��j�����A[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�����A�\���ȁB[endindent][l][r]

     �݂� �@�@ [indent]
�c���A�����܂���ł����I[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�����H[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�c���Ȃ��A�����ɂ��Ă����قǂɂȂ�B[endindent][l][r]

     �݂� �@�@ [indent]
�c��N�ƁA���N�ɁB[endindent][l][r]

�@�@ ���G�@�@�@[indent]
���Ȃ��A�Ȃ������ɘA��Ă���ꂽ�������邩�B[endindent][l][r]

     �݂� �@�@ [indent]
�c�����B[endindent][l][r]

[image storage="fgimage/33/_IS24311.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ���G�@�@�@[indent]
�H�ēa�͂��O���g���āA���̌��G��T�����̂��B�d���҂̖��������o��
��A�������ܐM�����ɂ��̎|�񍐂���΁A���̐S�ɖd���S�Ȃ��B�������A
�������𓽂��΁A���̋��ɁA�M�����ւ̖����ȋt�S����ƒm��
��B���́A�����ꂽ�̂��B[endindent][l][r]

     �݂� �@�@ [indent]
�c[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�Ă���ȁB���O���v���̓���ȂǂƂ��Č��Ă͂����B[endindent][l][r]

     �݂� �@�@ [indent]
�c���G�l�c�B[endindent][l][r]
[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
��l�̉�b���A�E���Ђ����ɕ����Ă���B[endindent][l][r]
[r]

�@�@ ���G�@�@�@[indent]
�������A�H�ēa���A�傢�Ȃ�v���Ⴂ�����Ă���悤���ȁB�m���ɁA�M
�����̎��ւ̎d�ł��͎��ɎS���B�������̐J�߂����������Ă��Ȃ��]��
����قǁA���͐M�����̐V�����ɖ������Ă���B���̕����؂�J����
�E�̍s���������邽�߂Ȃ�΁A���̌��G�A���𔄂��΂��A���̐g���a
��Ղ܂�悤�Ƃ�����ɍ\��ʁB�����c�A�ߍ��̐M�����́c�A��������
���B���Ă̓a�Ƃ́A�������c�B[endindent][l][r]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
���G�̋��فA�n�ÁB�E�͈Ŗ���삯�A�ʂ̊قɂ��ǂ蒅���B[endindent][l][r]
[r]

;���y��~
[fadeoutbgm time=3000]


;���y�J�n
[playbgm storage="bgm/ogg/�G�g.ogg" loop="true"]
[image storage="fgimage/34/_IS17604.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
�G�g�̋��فB�G�g�Ɗ����q���u���X���Ă���B[endindent][l][r]
[r]


�@�@ �G�g�@�@�@[indent]
�����I�H�}�W�ł����������̂��B[endindent][l][r]

�@�@ �E�S�@�@�@[indent]
�͂��B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
���[�A�������G�}�W�g���˃F�I�����q�I[endindent][l][r]

�@�����q�@�@�@[indent]
�����ɁB[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�߂��I����͕̂������Ă��I[endindent][l][r]

�@�����q�@�@�@[indent]
�����}�����Ƃ�����܂��ʁB�܂��ʂ̎�͊���A[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�ق�Ƃɂ����c�A���̃C�J���Βׂ���́H[endindent][l][r]

�@�����q�@�@�@[indent]
�M���̂��͂������Ă���΁B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
���������Ďg���|���Ƃ��ēy�d��ŉ��̐Q��~���񂾂�B[endindent][l][r]

�@�����q�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
��k�����ẮB���̖��܂�������Ȃ��́B���́c��p��m���Ă���āA[endindent][l][r]


�@�����q�@�@�@[indent]
�͂��B�S���B[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�`�b�A�����������Ă����B�c���������A���̉\�A�}�W���Ǝv�����H�M���𓢂��Ĕ�p���A�l�Ԃ̂��Ƃ����ẮB[endindent][l][r]

[r]

;[image storage="heiti" layer="base" page=fore]
;���y��~
[fadeoutbgm time=3000]


[image storage="fgimage/35/_IS16950.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���y�J�n
[playbgm storage="bgm/ogg/��T���l.ogg" loop="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/P3�X1.ogg" ]
�������A�ߍ]�R���\�\�B[l][r]
�����ʂĂ������ŉ������\�Y�B�����֐�T�B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�\�Y�A���C�o���B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�i���߂��j[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�����A�������ᑺ�̍Ղ��
�G�߂ł�B���N�݂�ȂŉΕ����ėx��񂾁B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/song/NO38��T.ogg" ]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�v���o���A�x���T�B[l][r]
���̎p���A���߂Ă���\�Y�c�B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
���߃F�ɂ������Ă��ăF�ȁB�c�����݂�A��đ��ɖ߂ꂽ��c�A��
�߃F���ꏏ�ɂ�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c����񂱂Ƃ��B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
��������悤�ɂȂ������B�ǂ������B�������x�߁B[endindent][l][r]

[r]
[ws buf=0 canskip="true"]
[ws buf=1 canskip="true"]

;���y��~
[fadeoutbgm time=3000]
;���y�J�n
[playbgm storage="bgm/ogg/�݂�.ogg" loop="true"]

;[image storage="aduti" layer="base" page=fore]
[image storage="fgimage/36/_IS16953.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[r]

�݂�̐Q���B�L�����珬�����c�A���̂���������B[endindent][l][r]
[r]

�@�@ �펵�@�@�@[indent]
�i�́j�˂ނ����炯�ǁA�˂ނ��ڊo�܂��A�������߈��߁A[endindent][l][r]

     �݂� �@�@ [indent]
�i�����J���āj�펵�A[endindent][l][r]


�@�@ �펵�@�@�@[indent]
�i�Q���ɓ���j���܂˂��ȃ@�A�Ȃ��Ȃ������Ȃ��ăF�B[endindent][l][r]

     �݂� �@�@ [indent]
������A[endindent][l][r]

�@�@ �펵�@�@�@[indent]
��Ɨ��O���W�܂��ĉ��Ȃ������Ă�B�������Ĕ����Ă����B[endindent][l][r]

     �݂� �@�@ [indent]
�c���v���H[endindent][l][r]


�@�@ �펵�@�@�@[indent]
�����B�ق�B�i��݂�n���j���߃F�c�A�m���`�D���Ȃ񂾂�B[endindent][l][r]

     �݂� �@�@ [indent]
�c���肪�Ƃ��B�悭��������đ��ł��`�H���Ă��@�B[endindent][l][r]

[image storage="fgimage/36/_IS16956.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ �펵�@�@�@[indent]
�V�b�B�i�Â��Ɂj�����̈��y����A�������ɉB���ꂽ��p�̉\�ł�������
��B�Ԉ���Ă����߃F�����̂��񂾂��Ă΂ꂽ�炢���˃F�B[endindent][l][r]

     �݂� �@�@ [indent]
�c����B[endindent][l][r]

     �݂� �@�@ [indent]
�c�˃F�l�A�ǂ����Ă邩�ȁc�B�펵�̒����A[endindent][l][r]


�@�@ �펵�@�@�@[indent]
�����c�B[endindent][l][r]

     �݂� �@�@ [indent]
�c�A��ăF�ȃ@�B�c�Ȃ�������A����������˂����ǁA���̂���o
����悤�ɂȂ������A���߂����ꏏ�ɑ��ɂ�A[endindent][l][r]


�@�@ �펵�@�@�@[indent]
�i�������Ȃ��΂��j�c���߃F�͂ȁA�݂�B�i�����S�O�̌�j�c����͖���
���B��������́A���̂���̎��ԂȂ񂾁B�c�������˃F�B[endindent][l][r]

     �݂� �@�@ [indent]
�c�B[endindent][l][r]

�@�@ �펵�@�@�@[indent]
�݂�c�A�Y���̂��A�厖�����B�����Ă����߂ɂ͂�B[endindent][l][r]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]�펵�A����B[l][r]
[image storage="fgimage/36/_IS16960.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
;���y��~
[fadeoutbgm time=3000]

�݂�A���߂����ɏP���A�������܂�B[l][r]
�������������Ȏ����ɍR���悤�ɁA�Y��̂��̂��B[l][r]
[image storage="fgimage/36/_IS16966.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/18/�i�}�Y��d��.ogg" ]
�ܐ��̉̐����A�ӂ�ɋ����B[endindent][l][r]
[r]


;[image storage="aduti2" layer="base" page=fore]
[image storage="fgimage/36/_IS16983.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[r]
���̍��A�V��̐M���B��̈łɋ����̐������ɂ���B[l][r]
���̉̂̎������ɂ��A����Ԃɂ��̕\��������Ȃ�B[endindent][l][r]
[r]

�@�@ �M���@�@�@[indent]
�����c�A[endindent][l][r]
[image storage="fgimage/36/_IS16971.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ �����@�@�@[indent]
�i�삯�ė��Ę����j�n�b�B[endindent][l][r]

�@�@ �M���@�@�@[indent]
���̉́A�N���c�B[endindent][l][r]

�@�@ �����@�@�@[indent]
�c�؂�Ȃ���A�i������܂���j[endindent][l][r]

�@�@ �M���@�@�@[indent]
���̉̂̎�i�ʂ��j�A�����߂��䂪���ɘA��ė����A�����ɂ��I[endindent][l][r]

�@�@ �����@�@�@[indent]
�n�b�I[endindent][l][r]

[r]

[image storage="fgimage/36/_IS17630.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�Ŗ���Î�����M���B[l][r]

[image storage="fgimage/36/_IS17632.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
�Y��̂��̂��݂�̎p�ƁA��T�̎p���d�Ȃ�A�݂悪�����Ă����B[endindent][l][r]

[p][cm]


;�t�F�[�h�A�E�g
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[image storage="fgimage/36/_IS17632.JPG"" layer="2" page="fore" visible="false" top="50"]
[image storage="fgimage/8/black681.jpg" layer="1" page="back" visible="false" top="50"]
[wait time=2000]
[trans layer="1" time=2000 method=crossfade]
[wt]
[ws buf=0 canskip="true"]



*story_11|�\���@�ߍ]�E�R��

;[image storage="heiti" layer="base" page=fore]
;���ʉ��Đ�
;���y�J�n
[image storage="fgimage/37/_IS17638.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[bgmopt volume="50"] 
[playbgm storage="bgm/ogg/�s��.ogg" loop="true"]
[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
�\���@�ߍ]�E�R��[resetfont][l][r]

[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���؂����l�q�ŋY��̂��������ݕ����ė��āA�����T�B[l][r]
�₪�āA�z�؂��u�Ă������Ɍ������A���t��������B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/1.ogg" ]
�@�@ ��T�@�@�@[indent]
�\�Y�c�B���v���H�m���Ă邩�B�M���l���A�����̑����F�E���ɂ����
�Ă��G��o���Ă�B���c�A�����Ȃ����܂����B�݂�������A�ǂ��ɂ���
�̂��c�B�c�ł��A����܂��A�ǂ����Ă��A�݂�Ɂc�A[endindent][l][r]
[ws buf=0 canskip="true"]

[r]

[image storage="fgimage/37/_IS24317.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
����ƁA��T�̔w�ォ�獂�΂����鐺����������B[l][r]
���ꂽ�̂͏\�Y�B�܂������������̂��X���A�P���݂Ȃ�����ݗ���B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/2.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�������������@�c�B[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/3.ogg" ]
�@�@ ��T�@�@�@[indent]
�c�Ȃ�̂��Ƃ��A[endindent][l][r]
[ws buf=0 canskip="true"]

[image storage="fgimage/37/kai_IS24317jpg.jpg" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/4.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�i�΂������ݏグ�j���������A���y�̕����Ƃ��߂܂��ēf��������A��
������˃F���B�M���œ|�̔�p�̐��̂́c�A�e���҂��ƁB[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/5.ogg" ]
�@�@ ��T�@�@�@[indent]
�e���ҁc�H[endindent][l][r]
[ws buf=0 canskip="true"]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/6.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�M���Ƌ��ɐ����A���̐���珄�炷�헪�܂ŉZ��̉e���ҁB�����c�A
�m���ɔ�p�ƌ����ʂ��Ƃ��Ȃ��B�����c�A�i���΂��j�A[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/8.ogg" ]
�@�@ ��T�@�@�@[indent]
�c�Ȃ񂾁A[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/9.ogg" ]
�@�@ �\�Y�@�@�@[indent]
���܂����悭�̂��Ă�Y��́A�̂��Ă݂�B[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/10.ogg" ]
�@�@ ��T�@�@�@[indent]
�ЂƂ�A�ӂ���̑��΁A�����܂������p�R�ɁA�΂̏���˂ɉe�@�t�c�A[l][r]
�c�܂����A[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/11.ogg" ]
�@�@ �\�Y�@�@�@[indent]
���̂܂�����B�m���ɐe���́A���O�ɔ�p�݂̍菈������Ă����B���O
�������A�����̔y������ɂȂ��đ{����p�́c�A�����B�i�΂��j[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/12.ogg" ]
�@�@ ��T�@�@�@[indent]
�i���̎����ɜ��R�Ƃ��āj���߃F�c�A[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/19/13.ogg" ]
�@�@ �\�Y�@�@�@[indent]
����������B�����܂�т��ĒT����������肪�A�Ȃ̂��ƂƂ́B
�܃@�A���O�̐e������A�v���Ⴂ�����Ă����悤�����ȁc�B[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A���܂�̎����ɐ����o�Ȃ��B[endindent][l][r]

[r]

�@�@ �\�Y�@�@�@[indent]
�ǂ������B���O�����Ŋ�т����Ȓm�点��O�ɁA�C�ł��Ⴆ�邩�H[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���y�̓z�́A�����̈�˂Ƃ�����˂�ׂ��Ɩ������������B�����邩�c�A
�z�͒m���Ă�̂�A���́A�Y��̂��B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i�C�t���j�͂��c�A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���O�̖��́A���y�ɂ���B���c�A�܂����̐��ɂ��邩�ǂ����́c�A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�݂�A[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�K���Őg���N���������o�����Ƃ���B[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
�ǂ������A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c���y�ɁA[endindent][l][r]


�@�@ �\�Y�@�@�@[indent]
�o�J���B���Ă��Ȃ��s���Č�������̂��B[endindent][l][r]
[ws buf=1 canskip="true"]


[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A���������ĕ��A�����l�̕m���̒j��A��Ă���B[l][r]
�����Y�ł���B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/1.ogg" ]

�@�@ �\�Y�@�@�@[indent]
���y�̕����B���₵�ċ��ꏊ��f������B[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/2.ogg" ]
�@�@ ��T�@�@�@[indent]
�����c�A����A[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/3.ogg" ]
�@�@ �\�Y�@�@�@[indent]
���S����B�������q���ɍR���͂��c���ĂȂ��B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/4.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�i��T�Ɂj�ǂ������A���񂾂�A�������āB[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A�����Y��ɂ߂���B[endindent][l][r]
[r]

[image storage="fgimage/37/_IS17646.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/5.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�i�����Y�Ɂj�ǂ������B�C�������Ă���߂񂼁B�f���܂łȁB�c�����A
���O�ɕ����Ȃ��Ƃȁc�B�z�͂ǂ����Ă�B���H�c���́A�z�𓢂��āA�c
���̐��E���A��ɁA����Ȃ���Ȃ��̂��B�z���A�E���āA�V�������E
���c�A���́c�A�N�\�b�A���́c�A�����A�{�����I�i�R���΂��j[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/6.ogg" ]
�@�@ ��T�@�@�@[indent]
�i�\�Y�̗l�q���b������j�c�\�Y�A[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/7.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�������Ȃ��ƎE�����܂����B���́c�A���́A���E���A�N�\�b�I[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/8.ogg" ]
�@�@ ��T�@�@�@[indent]
��߂�A[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
[image storage="fgimage/37/_IS17006.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�ӂ������A�����Y�ɕ��݊��B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/9.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�������B�c�����炪���O�Ɩ��������������B���O�̓G���B
�c���͊Ԃ��Ȃ��ǂ����ŎE����悤�Ƃ��Ă��邩�������B����𓦂��Γ�x�͖�
�����B���������c�A��ɓ��ꂽ�����̂́c�A�͂Â��ŁI[endindent][l][r]
[ws buf=0 canskip="true"]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�����Y�̎w�����B�w�𔽂�Ԃ����ƈ�������ɗ͂�������B[l][r]
��R���悤�ɂ����ɗ͂Ȃ��A�ڂ𔍂��b�������Y�B[l][r]
��T���A�����Y�̎w���ւ��܂낤�Ɛ������������߁A�����グ�ď����Y�����ёނ��B[endindent][l][r]
[r]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/10.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�c�����Ă�A[endindent][l][r]
[ws buf=0 canskip="true"]

;���y��~
[fadeoutbgm time=3000]
;���y�J�n
[playbgm storage="bgm/ogg/����.ogg" loop="true"]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/11.ogg" ]
�@�@ ��T�@�@�@[indent]
�ʖڂ��c�A�_�����o���˃F�c�A�o���˃F��I���̂����̊Z�R�������H
�������Ⴂ���킦�̏���R�������Ă񂾁B�����������炱��͂�A
�̋��i���Ɓj�̂��������q����������A���Ƃ������ăF�ɉ��䂷��ł˃F���A
�K�������ŉƂ��A���Ă��񂾂����Ă��F�肵�Č��킦���̂�������˃F�A[endindent][l][r]
[ws buf=0 canskip="true"]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/12.ogg" ]
�@�@ �\�Y�@�@�@[indent]
���c�H[endindent][l][r]
[ws buf=0 canskip="true"]

[p]
[cm]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/13.ogg" ]
[image storage="fgimage/37/_IS17652.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ ��T�@�@�@[indent]
�i�܂������āj���������q���������Ȃ��R���킦�ĂĂ�A�炢����
���߂������Ƃ�炠�����肷��Ƃ��꒭�߂āA���Ƃ����炢����
�撣���Ă񂾂��畉�����Ⴂ���˃F���āA���񒣂��Ă�̂�������˃F�B�����́c�A�����́A�����������炸���ƁA����Ȃ��Ƃ�肽���˃F�ȃ@�Ǝv���Ȃ���A�K���Ŏ����̋C�����ɉR���Ă�A������������
�q����̏��ɋ������Ė߂�܂ł����Ĉꐶ�������܂Ŋ撣���ė����̂�
������˃F�B���������������Ɩ����A���̎d���I���Ă���ƁA�c���
�Ƒ�D���Ȍ̋��i���Ɓj�ɋA�����Ďv���Ă��Ƃ��납������˃F�B��
�̂ɂ���ȂƂ��ŕ߂܂�������āA���������߂��A�q���炲�߂���
�āA�S�ŋ����Ă�̂�������˃F�B����c�A�o���˃F��c�B���炪�݂�
�ɉ�ăF���Ďv���C�������������Ƃ����ƁA�����́A��������q
����ɉ�ăF���āA�v���Ă邩������˃F����˃F����c�B[endindent][l][r]
[ws buf=0 canskip="true"]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
����ʂĂ�悤�ɁA���t���o�Ȃ��\�Y�B[l][r]
��T�A�����Y�̓�������A�����o���B[endindent][l][r]
[r]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/14.ogg" ]
�@�@ ��T�@�@�@[indent]
�����c�A�����I[endindent][l][r]
[ws buf=0 canskip="true"]

[r]


[image storage="fgimage/37/_IS17661.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��l�ɗ���������\�Y�̑O�ɁA��T�A�����ǂ���B[endindent][l][r]
[r]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/15.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�c�������Ă�c�A[endindent][l][r]
[ws buf=0 canskip="true"]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/16.ogg" ]
�@�@ ��T�@�@�@[indent]
�c�ʖڂ��c�B����ʖڂ��c�B����Ȃ��Ƃ���A�݂�ɉ�Ȃ�Ăł���
���˃F�c�A�����ƁA�����Ȃ���A�����ăF��Ȃ�ďo���˃F�̂ɂ�c�B[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�����Ȃ��𕢂��Ēn�ɂւ��荞�ށB[endindent][l][r]
[r]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/20/17.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�i���R�Ɓj�c�o�J���A���O�́c�B[endindent][l][r]
[ws buf=0 canskip="true"]

[r]



�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A�C�z�ɋC�Â��g�\����B[l][r]
���A����A�E�߁A�����B[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
���O�c�A[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�i��T�ɕ��݊��j�l�͑��l�̐S�̓��ȂǁA�ފ݂̂悤�ɉ������́B
����ǂ��Ȃ��́A���̔ފ݂��A�䂪�g�̂悤�Ɏv���̂��ȁB���̓��̌���
���ŁA�u�ށv�݂ƁA���́u�g�v���A��ɁB[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
���Ȃ����A��T�����Ƃ����ď��������ƌ����Ă����앐�m���B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���c�H���͂����Ȃ��ɁA[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
���Ȃ����C���������ԁA���x�����΂Ƃ��̋ߍ]���s��������������̂��B
��T�����Ȃ���΍����A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�t���A�c�����΂����炭���΂�����B[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�ǂ����Ă������ア�҂قǑ��l�̈���Ɋ��Y��������B���͐��܂��
���̕��A�N�̏���~�����{�������߂Ȃ������B�����炱���Ȃ𐶂����B
�����炱����������̂�ł��ӂ��؂�񂢂Ă䂭����������ɓ��ꂽ�A[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�����A�����������Ȃ��̖ڂ́A�ǂ��Ŏ������������ɍ��������Ă���ȁB[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c�B[endindent][l][r]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�΂݂��畨��������B[endindent][l][r]
[r]

�@�@ �E�߁@�@�@[indent]
�|���邱�Ƃ͂Ȃ��B���Ȃ����B[endindent][l][r]
[r]

[image storage="fgimage/38/_IS17666.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
����ƁA�΂݂���@���ܘY�A�΋g�A�ʁA���]�A�Ƃ炪�����B[endindent][l][r]
[r]

�@�@ �΋g�@�@�@[indent]
��T�c�A���߃F�����̂��a�l�Ɍ����āA�F�E����Ȃ�Ƃ����������炽
���̂��ƁA�����Ă��ꂽ�񂾂ȁB[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
����c�A���߃F�𑺂���ǂ��o���悤�ȃ}�l���āc�A[endindent][l][r]

[image storage="fgimage/38/_IS17667.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
�i������A�Ǝ��U��j[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
��T�A������ꏏ�Ɉ��y�ɘA��Ă��Ă���B������ꏏ�ɁA�݂�T���B[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
������A[endindent][l][r]

�@�@ ���]�@�@�@[indent]
����������B[endindent][l][r]

     �Ƃ� �@�@ [indent]
�i���ܘY�Ɂj�����A���Ƃ������Ȃ�B[endindent][l][r]

�@���ܘY�@�@�@[indent]
���H�o�J���߃F�A���́A[endindent][l][r]

     �Ƃ� �@�@ [indent]
�i�����œ��ܘY���R��j[endindent][l][r]

�@���ܘY�@�@�@[indent]
�������A�s�����āA�s���܂����ẮI[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�c��T�A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i�U��i��悤�Ɂj�c�ʖڂ��B��������A����������ˁB[endindent][l][r]


[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�낫���t���������B�ق肱�ޑ��l�����B[l][r]
���]�A�����v�������ˑR�̂��o���B����́A���Ղ�̗x��̉S�B[l][r]
;�����X�^�[�g
[playse buf="0" storage="sound/song/39-2���Ղ�.ogg" ]

���l�����A��T���͂ނ悤�ɊF�ŉ̂��A�x��B�c����グ���T�B[endindent][l][r]
[endindent][l][r]

[image storage="fgimage/39/_IS17034.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �E�߁@�@�@[indent]
���͂��������ɂ͍s���Ȃ��B�c���y�܂ł̓����A���O�����ɁA[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���킯�����Ƃ��B���͌Ȃ̎v�f�̂��߂ɍs���܂ł�B���͂₱��ȓz��
���������闝�R�͂Ȃ��B[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�c���Ȃ��������ꕪ����B�c���Ȃ���c�A���̂悤�ɁA���݂̍菈����
�����A�������y�ɂ́A��T�̂悤�Ȏ҂��K�v���ƁB[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c�B[endindent][l][r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�̂��A�x�鑺�l�����B[endindent][l][r]
[r]

�@�@�@�@�ʁ@�@�@[indent]
��T�c�A�܂���T���A�݂���ꏏ��Ȃ��āA���̍Ղ���񂾂�B
������x���̑��ŁA���炽���́A�Ղ����B[endindent][l][r]
[r]

[image storage="fgimage/39/_IS17674.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�₪�Đ�T�A���l�����ɍ��킹�A�x��o���B[l][r]
�\�Y���A����Ȑ�T�̗l�q�����Ă���B[l][r]
���l�Ɛ�T���̂��A�x��B��i�͂��̂܂܁A���y�鉺�ցB[endindent][l][r]
[ws buf=0 canskip="true"]

[p][cm]

;���y��~
[fadeoutbgm time=3000]




*story_12|�\���@�ߍ]�E���y�鉺
[image storage="fgimage/40/_IS17677.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���y�J�n
[bgmopt volume="50"] 
[playbgm storage="sound/effect/P51�K��.ogg" loop="true"]

;[image storage="jouka" layer="base" page=fore]
[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
�\���@�ߍ]�E���y�鉺[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�l�œ��키���y�̒��B[l][r]
�s��������l�X�̌����ɖڂ������鑺�l�����B[l][r]
��T���ӂ�����n���B�ނ炩�痣��āA�\�Y�̎p�B[endindent][l][r]
[r]

�@�@�p�E���@�@�@ [indent]

�E�ߓa��茾�`�Ē����Ă���܂��B�F������A���炪���y�Z�~�i����
�ɂ��A�ꂵ�܂��B[endindent][l][r]

�@���ܘY�@�@�@[indent]
�Ȃ�đ�����������A�Ȃ񂩂̍Ղ肩�H[endindent][l][r]

�@�@�p�E���@�@�@ [indent]
�����A���ꂪ���y�̊X�ł��B�M���������ӂ̊ւ����炵�A���R�ɐl���s
�����o����悤�ɂ����̂ł��B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���l����
�i�ӂ�����n���A���Q���Đ���R�炷�j[endindent][l][r]
[r]

�@ �p�E���@�@�@[indent]

�����A����䂦�ׂȊ�Ă����ҒB���A���̏鉺�ɐ��ނ悤�ɂȂ�܂����B
�����̔E�⎘�A����Ɂc�A[endindent][l][r]

���l�����E��T�@[indent]
�c�H[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�˔@�A�ޕ������y�􉹂����đ����ɋ����B[endindent][l][r]
[r]

[stopbgm]
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/P44����Long.ogg" ]

[image storage="fgimage/40/_IS17678.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
�������̂́A[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
�i���̂�������������j����A[endindent][l][r]

�@�@�p�E���@�@�@ [indent]
�z��ł��c�B�M�����̌R��_���A�P�����J��Ԃ��c�A[endindent][l][r]

�@���ܘY�@�@�@[indent]
�����A���V�A���H[endindent][l][r]

�@�@�p�E���@�@�@ [indent]
�i���̕\��Łj�c�_�̌䋳�����A�ǂ��łǂ����Ⴆ�����A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c�����̂Ƃꂽ�W�񂾁B�c�����Ȃ��B�i�삯�o���j[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i�ޕ��̏W������āj�c����c�A[endindent][l][r]

�@�@�p�E���@�@�@ [indent]
�}���܂��傤�A�p�[�h�����M�����Ƃ̉y���Ɍ������܂ŊԂ�����܂���B
���̊��𓦂��΁A�����ʂ肪�������A[endindent][l][r]

[ws buf=1 canskip="true"]

[image storage="fgimage/40/_IS17043.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
�i�C�t���āj�����A[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�������Ă��́A���̂Đl�̌������H[endindent][l][r]

�@���ܘY�@�@�@[indent]
�܂����@�A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�p�E���l�A����c�A�i�S�O���j�ʖڂ��A�����c�A�����I[endindent][l][r]

�@���ܘY�@�@�@[indent]
�����A��T�I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�삯�o���čs���B[endindent][l][r]
[r]

[image storage="fgimage/41/_IS17685.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���y�J�n
[playbgm storage="bgm/ogg/�퓬2.ogg" loop="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
���G�A���Ɏ��͂���点�A�ق��ق��̑̂Ō����B[endindent][l][r]
[r]

�@�@ ���G�@�@�@[indent]
���Ȃ񂾂悠����́I�����A�s���Ă����B���O����s���āA���̃C�J
�ꂽ�������q�ǂ����u�b�ׂ��Ă����I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���G�A�����Đ����グ�ē����Ă䂭�B[l][r]
�~   �~   �~[endindent][l][r]
[r]

;[image storage="02" layer="base" page=fore]

[image storage="fgimage/41/_IS17693.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�~�Q���A���n���i�Ƌ��ɐg����߂錹���B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/23/1.ogg" ]
�@�@ �����@�@�@[indent]
�c���ŉ��́A�����Ɠ������܂��Ă��񂾁B�����̂��Ƃ��ق�Ƃɑ厖
�Ɏv���Ă����c�A�����Ƒ����ɁA���̂��ׂ����Ƃ͂��Ⴀ��ƕ���
���Ă��͂��Ȃ̂ɂ�B�펵�c�B���̌����̎㒎��Y���B�c������������
�͌����Ă�B���O�Ɍ������Đ^�������ɑ��������������B���͂����e��
���U��˂��B�펵�c�A���O�ւ́A���̂��߂ɁB[endindent][l][r]
[ws buf=0 canskip="true"]

�@ �~�Q���@�@�@[indent]
�s�����I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�L���V�^�������A��ĂɎU���Ă����B[endindent][l][r]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
�������B���Ώ�̉E�߁B���̕\��Ő���������B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/24/1.ogg" ]
�@�@ �E�߁@�@�@[indent]
���͕s������΂��A�^������ԂȂ�B
�S�Ă�E�]���A�S�Ă�M���A�S�Ă𗊂������������A�S��
�������E�ԂȂ�B���͉i�v�i�Ƃ�j�ɐ₦�邱�ƂȂ��B�a���̎�������
�Δp��B�ٌ�����Ύ~�ށB�m���p��Ȃ�B�c
�����Đ������A�i�v�i�Ƃ�j�Ɏc�肵���͐M�Ɩ]�݂ƈ��Ȃ�B
���̓��ɂ���čł��D�ꂽ����̂́A���Ȃ�B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

[image storage="fgimage/41/_IS17693.JPG" layer="1" page="fore" visible="true"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
����ɏd�Ȃ�A�L���V�^�������A�������Ɏ̂Đg�̏P����������B[l][r]
�W��ŕ������͂݁A��ɂ����n���Ŗő��h���ɂ���B[l][r]
�������̒��ɔ�э��ރL���V�^���B�O�����J���ƁA�̂Ɋ�������
�Ζ�ʂ̌Q�ꂪ�I��ɁB��u�̔����Ƌ��ɁA������Ƃ���������B[l][r]
�����A�삯�ė��āA��݂ɓ�������܂𓁂̐�Ŏh���A�������ڂ�
���ĕ���B��ʂ̉��Ɋ����ꂽ���m�������A���X�ƚb���Ȃ���n��
�|�ꕚ���Ă����B[endindent][l][r]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
[r]
�����钷�G�̌��ɁA��v�B[endindent][l][r]
[r]

�@�@ ��v�@�@�@[indent]
�����k�ݏオ���Ă񂾁B[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�c���a�A[endindent][l][r]

�@�@ ��v�@�@�@[indent]
���̔��V�A�ǂ��ɂ͎؂肪�����łȁB�F�E���ɂ����Ă��炤��B
�c�펵���ĂׁI[endindent][l][r]

[r]

[image storage="fgimage/41/_IS17698.JPG" layer="1" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[r]
[r]
�߂��ė��錹���B�~�Q���A���n���i�B�L���V�^�������B[l][r]
��R���ė����オ�镺�������A���X�Ɛ▽�����Ă䂭�B[l][r]

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE�e��.ogg" ]
�����ցA���ĂÂ��ɏe���B������|���L���V�^�������B[endindent][l][r]
[r]

�@ �~�Q���@�@�@[indent]
�S�C���c�A���̊ԂɁA[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
����ɏe���B�~�Q���A���n���i�A�n�ɕ����B[l][r]
�����ɏo�镺�������A�����A�S�ł�����B[l][r]
�~   �~   �~[endindent][l][r]
[r]
[ws buf=1 canskip="true"]
�@�@ ��v�@�@�@[indent]
��l�c���Ă�B�e�����߂�B�펵�c�A�����ĊO���ȁB[endindent][l][r]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
�|��鎀�̂̒��ɗ������̌��ɁA�\�Y�A��T�A�삯�ė���B[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
�{���A�S�ł��B[endindent][l][r]

�@�@ �����@�@�@[indent]
�i����Ȗڂŗ��j�c�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�����c�A[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/25/1.ogg" ]
[image storage="fgimage/41/_IS17694.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



�@�@ �����@�@�@[indent]
��T���c�B���́A������Ȃ��Ȃ����܂����c�B�����펵���v���āA���
�悤�Ɍ��𗁂тĂ����B���ǂ�c�A�������A���B�����ē|��Ă鑫�y��
������A���Ɠ����A�c��ڎd���ōr�ꂽ�ł���F���Ă₪�����c�B�Ȃ�
����c�B�z��A����Ȃ��S������˃F����c�B[endindent][l][r]
[ws buf=0 canskip="true"]

[r]



�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[endindent][l][r]
[r]
�@�@ �펵�@�@�@[indent]
�b�A�c�����ܗЎO�сA��グ�B�k�ɁA�c�񐡓�Ў��є��N�B
;���ʉ��J�n
[playse buf="1" storage="sound/effect/SE�e�\��.ogg" ]
[endindent][l][r]
[ws buf=1 canskip="true"]


[image storage="fgimage/41/_IS17698.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]�~   �~   �~[endindent][l][r]
[r]

�@�@ �����@�@�@[indent]
�ǂ��ɂ��񂾂�ȁc�A�펵�́c�A[endindent][l][r]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[endindent][l][r]
[r]

�@�@ ��v�@�@�@[indent]
�ς񂾂��B[endindent][l][r]

�@�@ �펵�@�@�@[indent]
�c�͂��B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
�����A�N�O�Ƃ��Ȃ���ӂ�����n���A�V�������ԁB[endindent][l][r]
[r]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/25/2.ogg" ]
�@�@ �����@�@�@[indent]
�c�펵�\�\���I[endindent][l][r]
[ws buf=0 canskip="true"]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[endindent][l][r]
[r]

�@�@ �펵�@�@�@[indent]
�i�͂��Ɖ����ɏՂ���������j�҂āI[endindent][l][r]

�@�@ ��v�@�@�@[indent]
���āI[endindent][l][r]

[r]

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE�e.ogg" ]

[image storage="fgimage/41/_IS17702.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



�@�@�@�@�@�@�@�@�@�@�@[indent]
�h���b�I�e���������B[l][r]
�~   �~   �~[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��i�����j��؂�􂭉��Ƌ��ɁA�����̋������ʂ��ђʂ���B[l][r]
�ǂ��ƒn�ɓ|�ꕚ�������B��T�A�����ڂ����J�����t���Ȃ��k����B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�����c�A�����I[endindent][l][r]

[r]

;[image storage="jouka" layer="base" page=fore]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
[r]
���G�A����B��v�A���肩���ĕ��S����펵�������A[endindent][l][r]
[r]

�@�@ ��v�@�@�@[indent]
�������������B[endindent][l][r]

�@�@ �펵�@�@�@[indent]
�����c�B�C�̂����ł��B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�펵�A���������Ă��̏����ɂ���B[l][r]
�~   �~   �~[endindent][l][r]
[r]

;���y��~
[fadeoutbgm time=3000]

;���y�J�n
[playbgm storage="bgm/ogg/�߂���.ogg" loop="true"]

[image storage="fgimage/42/_IS17061.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���Ɛ؂ꂽ�����ɋ삯���A��������߂��T�B[l][r]
�\�Y�A�ӂ�����񂵂Ȃ���A�|��錹���̂��Ƃ֕��݊��B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/26/1.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�c�S��������񖳑ʎ��ɂ�B���ꂾ��������Ƒ����ł����āA������
����ł͉��̈Ӗ����Ȃ��B�c�t���A�o�J�ȓz���B[endindent][l][r]
[ws buf=0 canskip="true"]

[r]

[image storage="fgimage/42/_IS17704.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
����ƁA��T���ˑR�e���ꂽ�悤�ɏ\�Y�ɒ݂͂�����B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/26/2.ogg" ]
[image storage="fgimage/42/_IS17705.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
���߃F�c�A���߃F�͂ǂ����Ă���Ȃ��Ƃ�������񂾁I���߃F���܂Ō�
�����A�ǂ񂾂��ꂵ���v�����Ă��������邩�I[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/26/3.ogg" ]
�@�@ �\�Y�@�@�@[indent]
���H[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/26/4.ogg" ]
�@�@ ��T�@�@�@[indent]
�c���߃F�͈�x�����āA�N���̂��Ƒz�����Ă��񂤂�l���āA�����ɂ�
�Ă��܂�Ȃ��Ȃ������Ƃ����邩�I[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ �\�Y�@�@�@[indent]
�c�B[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/26/5.ogg" ]
�@�@ ��T�@�@�@[indent]
���߃F�̐S�́A���̌È�˂̑ۂ̐������΂��ł��B���߃F�̐S�͔ފ�
��艓���B�c�\�Y���߃F�́A���߃F�́c�A�ǓƂȉ��l���B[endindent][l][r]
[ws buf=0 canskip="true"]

[r]



�@�@�@�@�@�@�@�@�@�@�@[indent]
���̂����Ԃ����t�̏o�Ȃ��\�Y�B[l][r]
�����ցA�p�E�����삯�ė���B[endindent][l][r]
[r]

�@�@�p�E���@�@�@ [indent]
��T�a�c�A���������ĕ����ĉ������B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�Ȃ񂾁A[endindent][l][r]

[image storage="fgimage/42/_IS17067.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
�@�@�p�E���@�@�@ [indent]
������A�M�������鉺�ɂ��G����o���܂����B�i����������j�u������
�̖����A������̎O���A����ɂď��Y����B�o��������̂͏�܂Œy���Q���ׂ��B�R��Ζ��̐g�͉����B�v[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�݂悾�A[endindent][l][r]

�@�@�p�E���@�@�@ [indent]
�m��ʎ҂ɂ͉��̂��Ƃ�������ʂ��G��B���炭�M�����́A�o�ł���M
���̑��݂�m��A���̏��݂�e���m������ŁA�M���Ɍ����Ă��̂��G��
���c�B���͜�����A�����܂ł܂��ꍏ���A���Ȃ�Ȃ�Ƃ��A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�݂�I[endindent][l][r]

[r]

[image storage="fgimage/42/_IS17070.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�C�͂��i��A�����o����T�B�����ցA���ܘY�B[endindent][l][r]
[r]

�@���ܘY�@�@�@[indent]
��T�A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�i���̗l�q�Ɂj�c���ܘY�A[endindent][l][r]

�@���ܘY�@�@�@[indent]
�c����Ȃ��ƂȂ�A��������܂Ő����|�ꂿ�܂��΂悩�����c�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�ǂ����A�����������A[endindent][l][r]

�@���ܘY�@�@�@[indent]
�ʂ��΋g���݂�ȁA�N�������Č��������ɕ߂܂��Ă�B��������
�ɁA���O��Ƃ��s���ē`������āA�c�ł��A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�����Ă���A[endindent][l][r]

�@���ܘY�@�@�@[indent]
���̎҂����́A���O�̐g�ƈ����������ƁB�����܂łɖL���̊֏��܂ŗ�
�Ȃ����A������A�F�E�������āB[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�����́A[endindent][l][r]

�@���ܘY�@�@�@[indent]
�����A��̎O���B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]

�@�@�p�E���@�@�@ [indent]
����ȁA������ł́A�ǂ��炩����ɍs���̂�����ƁA[endindent][l][r]

�@���ܘY�@�@�@[indent]
�����������B�����͋��炭�M���l�̂��G���m���Ăč�����؂����B[endindent][l][r]

�@�@�p�E���@�@�@ [indent]
�����c�A���l���c�A�ǂ��炩���A�I�ׂƁc�I[endindent][l][r]

�@���ܘY�@�@�@[indent]
�c��T�A�c�ǂ�����B[endindent][l][r]

[r]

[image storage="fgimage/42/_IS17713.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�[����Y�̕��ŁA������߂�B[l][r]
�\�Y�́A����Ȑ�T�̎p�����߂Ă���B[l][r]
�Ó]�B[endindent][l][r]

;�t�F�[�h�A�E�g
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[image storage="fgimage/42/_IS17713.JPG"" layer="2" page="fore" visible="false" top="50"]
[image storage="fgimage/8/black681.jpg" layer="1" page="back" visible="false" top="50"]
[wait time=2000]
;���y��~
[fadeoutbgm time=3000]

[trans layer="1" time=3000 method=crossfade]
[wt]

[p][cm]



*story_13|�\�O�� ���y�ߍx �L�� �֏�
[image storage="fgimage/43/_IS24345.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
;���y��~
[fadeoutbgm time=3000]


[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="notogawa" layer="base" page=fore]
[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
�\�O�� ���y�ߍx �L�� �֏�[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���Ɉ͂܂�A�������܂鑺�l�����B[endindent][l][r]
[r]

     �Ƃ� �@�@ [indent]
�i�������܂�k����ʂɁj�ʁc�A�|�F���B[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
�����B�c���ʂ̂́A�|�F�B�ł��c�A���Ɉ�A��T�������ɗ����܂����肵����c�A[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
���₵�˃F��B����A�����Ⴂ���˂񂾁B[endindent][l][r]

�@�@ ���]�@�@�@[indent]
���炽���c�A���ʂ̂��H[endindent][l][r]

     �Ƃ� �@�@ [indent]
��T�ɐ������ꂽ�����B�����łȂ��Ȃ��Ă��A����͖�������B[endindent][l][r]

[r]



�@�@�@�@�@�@�@�@�@�@�@[indent]
�΂݂��h���B
;���ʉ��J�n
[playse buf="1" storage="sound/effect/SE������3.ogg" ]
�l�e������A�ǂ��Ɠ|���B�������ޑ��l�����B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

[image storage="fgimage/43/_IS17724.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�ʁ@�@�@[indent]
�c��T�c�A[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����ē��ܘY���삯���݁A�b���œ|���B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�i�K���ő̂��N�����j����A��������B�c������̐g�B�A�����Ă���Ă���B[endindent][l][r]

�@�@ ���X�@�@�@[indent]
�叫�a�I�c�����I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
������A�����q�A�p�������B[endindent][l][r]
[r]

�@ ���P�O�@�@�@[indent]
���͂ǂ������c�A[endindent][l][r]

�@�@ ���X�@�@�@[indent]
�c���ƌ����z���c�B[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�c�����l�c�A���񂽂́c�A�����́c�B���@�A����A��Ă��Ă���B��
�����B������A�������Ă���Ă���B[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����q�A���΂炭�ق�����A[endindent][l][r]
[r]

�@�����q�@�@�@[indent]
�c�߂���B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�������A���l������������A��T�𗧂�����B[l][r]
���t���Ȃ������s�������l�����B[endindent][l][r]
[r]

�@�@�@�@�ʁ@�@�@[indent]
�c��T�c�B[endindent][l][r]
[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A���l�������ƌ����ƁA���ɘA����Ă䂭�B[l][r]
���̎��A�p�E�����삯����ł���B[endindent][l][r]
[r]

[image storage="fgimage/43/_IS17729.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

 �p�E���@�@�@[indent]
���҂��������I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�p�E���̌��t�ɑ����A�E�߂��p�������B[endindent][l][r]
[r]

�@�����q�@�@�@[indent]
�E�ߓa�c���́i�Ȃɂ䂦�j�M�����A[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
���c�a�c�A��낵���̂ł����ȁA���̂悤�Ȃ��Ƃ��B[endindent][l][r]

�@�����q�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�M���̂��̏��ƁA�M�����͌䑶�m�̏�ł̂��Ƃ��H[endindent][l][r]

�@�����q�@�@�@[indent]
�c�M���̒m�������Ƃł́A[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�䂪���΂̏�ŁA��l�̔E��߂��܂����B��𕷂��΁A���c�a�A���Ȃ�
���ƁB���͔ނ���A�M���̎v�f�𕷂��m��܂����B[endindent][l][r]

�@�����q�@�@�@[indent]
�_�Ɏd�����M�����E�ɍ��₩�A[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�����B�O���O�ӁA�ނƌ�荇���A�ނ���b���Ă��ꂽ�̂ł��B[endindent][l][r]

�@�����q�@�@�@[indent]
�c�B[endindent][l][r]



�@�@ �E�߁@�@�@[indent]
�M���͏G�g���̖����󂯁A�M�����œ|�̔�p��m�邻�̖�����ɓ����
�Ƃ��Ă����B���c�a�c�A��낵���̂ł����A���̎����A���y�̐M������
�`���΁A[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/27/1.ogg" ]

[image storage="fgimage/43/_IS24476.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�����q�@�@�@[indent]
�E�ߓa�A�M���������������ߐl���������̖��𓽂����B����͐M������
���ɔw����߂��B�ߐl�B���̖\�������A�M�����̂����ɓ����΁A[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/27/2.ogg" ]
�@�@ �E�߁@�@�@[indent]
�M���͂��͂�A�M�����œ|�̔�p�ȂǁA�ǂ��ł��悩�����̂ł͂Ȃ����H[endindent][l][r]
[ws buf=0 canskip="true"]

�@�����q�@�@�@[indent]
�c�B[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/27/3.ogg" ]
�@�@ �E�߁@�@�@[indent]
�M���̋��̐^�̎v�f�͂��͂�ʂ����ꂽ�B�Ⴂ�܂����B�c���̖��A�A��
�čs���Ăǂ����܂��B�M���͂����������ŁA����ׂ����̂̑S�Ă������B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�����q�@�@�@[indent]
�i�S�O���̒��ق̌�j�c���������Ă���̂��A[endindent][l][r]


�@�@ �E�߁@�@�@[indent]
���ɍ��c�a�A���������M���́A���G�g���Ƌ��ɁA�����U�߂ɏ]�i�������j
���Ă��Ȃ���΂Ȃ�ʂ͂��B�Ȃ����̂悤�ȏ��ɁA[endindent][l][r]

�@�����q�@�@�@[indent]
�E�ߓa�A����͋M�����������ƁB[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�c�������ł��傤�B���ƋM���́A�������ɂ͂��Ȃ������B���ɐD�c����
�G����ї��R�𓢂ׂ��A�����ɒy���Q���Ă����B�c�����������Ƃł́B[endindent][l][r]

�@�����q�@�@�@[indent]
�c���ɁB[endindent][l][r]

�@�@ �E�߁@�@�@[indent]
�c���ɁB[endindent][l][r]
[r]

[image storage="fgimage/43/_IS24478.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����q�A���Ɏw�}���A��T�̐g�������B[l][r]
���l�����A��T�̖����Ăы삯���B[l][r]
����Ɛ�T�A�����ʑ̂���������A�����オ�낤�Ƃ���B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�c�����Ȃ���c�A[endindent][l][r]


�@�@�@�@�ʁ@�@�@[indent]
�����c�A[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�������΂�A�͂��ȋC�͂�U��i��A�����オ�낤�Ƃ���B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�܂��c�A�܂���̎O���܂ŁA��������c�B[endindent][l][r]

�@�@ �΋g�@�@�@[indent]
���߃F�c�A�܂����c�A[endindent][l][r]

�@���ܘY�@�@�@[indent]
�������A����ȑ̂ŁA���y�܂ł͂�������ꍏ�͂�����B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
��T�A�݂�̖����Ăѐg���N�����Ă͓|��A�N���Ă͓|���B[l][r]
���̏�ɂ���N�����A���̎p�Ɍ��t�������B[l][r]
����ƁA�ʁA�����v�������E�߂Ɗ����q�Ɍ������삯�o���A�z�����B[endindent][l][r]
[r]

�@�@�@�@�ʁ@�@�@[indent]
���肢�ł��I�c�n���A���̎q�ɁA�n��݂��Ă���ĉ����F�I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�ʂ����āA���l�����������B[endindent][l][r]
[r]

     �Ƃ� �@�@ [indent]
���肢�ł��A�ǂ����I[endindent][l][r]

�@�@�@�@�ʁ@�@�@[indent]
���炽���͂ǂ����Ă���Ă���������A�ǂ����A���̎q�ɁA�n���I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
�����ēy�������z�������l�����B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/28/1.ogg" ]
�@�����q�@�@�@[indent]
�c�������A�݂����Ƃ���ŁA�S���ɐ�n�͏�肱�Ȃ��܂��B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]



�@�@�@�@�@�@�@�@�@�@�@[indent]
���t���p���Ȃ��Ȃ鑺�l�����B[l][r]
����Ɛ�T�A�����v�������ӂ�Ɍ��������𒣂�グ��B[endindent][l][r]
[r]

*story_14|�\�l��@���y��
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/28/2.ogg" ]
[image storage="fgimage/43/_IS17735.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ��T�@�@�@[indent]
�\�Y�c�A�Y��Ă˃F��ȁB�È�˂��珕���o������ꍏ�͂���̎w�}��
�]���B�܂��񑩂̎��Ԃ́A�����c���Ă�B�c�\�Y�I[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
;���ʉ��J�n
[playse buf="1" storage="sound/effect/P24��.ogg" ]
�������������ԁB
���ق������c�B[l][r]
����ƕ��A����\�Y���p�������B�ڂ�������l�X�B[endindent][l][r]
[r]

;[bgmopt volume="80"] 
[bgmopt volume="50"] 

[fadeoutse buf=1 time="3500"]
[playbgm storage="bgm/�q�g�~�e�[�}.ogg" loop="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/1.ogg" ]

[image storage="fgimage/43/_IS17738.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
���������o��������ɂ́A�c�d���Ȃ��B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�����Đ�T�̌����삫�A������B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/2.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�����甼���A���񂽂��c�A���̎傾�B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/P51�n.ogg" ]

[image storage="fgimage/45/_IS17109.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A��T�̎�������A�n�ɏ�莾���̂悤�ɋ삯�o���B[endindent][l][r]
[p][cm]
[ws buf=1 canskip="true"]


[image storage="fgimage/45/_IS17741.JPG" layer="1" page="fore" visible="true" top="50"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;[image storage="14" layer="base" page=fore]
[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
�\�l��@���y��[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
�@�@�@�@�@�@�@�@�@�@�@[indent]
���y��B�V��\�\�B[endindent][l][r]
[r]


�@ ���P�P�@�@�@[indent]
�\���グ�܂��B�����悹���R�n����R�A�ւ�j�肱�̈��y�ɁI[endindent][l][r]

�@�@ �M���@�@�@[indent]
�c�������B�ҋ��A���̖��A���Ɍ��ꎟ��A�����߂��A�䂪���ɓ͂���I[endindent][l][r]

[r]
�@�@�@�@�@�@�@�@�@�@�@[indent]
����M���B�U�镺�����B[endindent][l][r]
[r]



�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
[r]
���y��B����\�\�B[l][r]
�V��Ɍ������A�i�ޏ\�Y�Ɛ�T�B�����̕��ɍs������ǂ����B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/3.ogg"]
[image storage="fgimage/45/_IS17748.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
���I[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A��T���Ăъ񂹁A���ČÈ�˂ɓ������܂ꂽ�R�����o���A��Ǝ�����ԁB[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/4.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�͂��ꂽ�����A���O�̎��ʎ���B[endindent][l][r]
[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/5.ogg" ]
�@�@ ��T�@�@�@[indent]
�\�Y�c�A[endindent][l][r]
[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/6.ogg" ]
�@�@ �\�Y�@�@�@[indent]
���H[endindent][l][r]
[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/7.ogg" ]
�@�@ ��T�@�@�@[indent]
�N�ЂƂ�A�E������Ȃ�˃F���B[endindent][l][r]
[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/8.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�c�Ȃ�Ė�����������i���邶�j�l���c�B[endindent][l][r]
[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/9.ogg" ]
�@�@ ��T�@�@�@[indent]
�c���̎��A�ق�Ƃɂ���Ȃ�Ďv��Ȃ������B�ǂ����ĕt���ė��Ă��B[endindent][l][r]
[ws buf=0 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/10.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�c�c���@�B�������ȁB[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�P�����镺�����B�\�Y�A���Ƃ��Ƃ����Đg��H��킵��𓦂��B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/29/11.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�i�����̊O�����āj�����R�ɂ��������B�c��̎O���c�A�Ԃɍ����B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�삯�Ă䂭�\�Y�Ɛ�T�B[endindent][l][r]


[image storage="fgimage/46/_IS17111.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
[r]
����͂��̂܂܁A�V��ցB[l][r]
�M���̂��ƂɁA�݂悪�����o�����B[endindent][l][r]
[r]

�@�@ �M���@�@�@[indent]
��ɓz���������ƕ�����΁A���Ƃ͕߂��āA���̒j�̋��ꏊ�𕷂��o��
�̂݁B�c�����͗p�ς݂��B�a��B[endindent][l][r]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�݂�̌��ɁA���������ݏo��B�����������ʏ����Y�ł���B[l][r]
�o������߁A���𐂂��݂�B[l][r]
����ƁA����U��グ�������Y���A�k���ď������ꂭ�B[endindent][l][r]
[r]

�@�����Y�@�@�@[indent]
�c�o���Ȃ��c�A[endindent][l][r]

�@�@ �M���@�@�@[indent]
�c�B[endindent][l][r]

�@�����Y�@�@�@[indent]
�c�o���܂���I�M�����I���ɂ́c�A�o���܂���I[endindent][l][r]

�@�@ �M���@�@�@[indent]
�c�������c�A[endindent][l][r]

[r]

[image storage="fgimage/46/_IS17760.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����Y�̍s���ɕ��C�Ɏ���镺�����B[l][r]

;���ʉ��Đ�
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/�a��4.ogg" ]

�M���A�����Y�ɕ��݊��A�S�O�Ȃ��a��|���B[l][r]
[ws buf=1 canskip="true"]

[image storage="fgimage/47/_IS32308.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�\�\�ƁA�����֏\�Y�Ɛ�T�������B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�݂�c�A[endindent][l][r]

     �݂� �@�@ [indent]
�c�˂����܁c�B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�M���A�\�Y�̎p�����Ƃ߁A�v�킸�����΂��B[endindent][l][r]
[r]

[image storage="fgimage/47/_IS17776.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �M���@�@�@[indent]
�c�܂������O�������ɗ���Ƃ́B��͂�V�́A���ɗ^���Ă����I[endindent][l][r]


�@�@ ���G�@�@�@[indent]
�i�삯�ė��āj�M�����I[endindent][l][r]

�@�@ �M���@�@�@[indent]
�c�ҋ��A���̒j�����́A���𑛂������䂪�e���҂�I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�ǂ�߂��������B[endindent][l][r]
[r]

�@�@ �M���@�@�@[indent]
������𙆂ˁA�S���҂ɂ���B[endindent][l][r]

[r]

[image storage="fgimage/47/_IS24351.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���������M���̌��t���󂯁A���X�ɍ��̓��𔲂����B[l][r]
�\�Y�ɔ��镺�����A�����グ�A�a�肩����B[l][r]
�c���̎��A�\�Y�͎�ɔ���������a��قǂ��A
;���ʉ��J�n
[playse buf="1" storage="sound/effect/P7��؂�.ogg" ]
[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

;���y��~
[fadeoutbgm time=3000]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/30/1.ogg"]
[image storage="fgimage/47/_IS17770.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ �\�Y�@�@�@[indent]
���܂�B[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�̐��ɕӂ肪����ł����悤�ɐÂ܂�Ԃ�B[l][r]
�\�Y�́A�����Ȃ�ʋC��Z���B[endindent][l][r]
[r]


;�����X�^�[�g
[playse buf="0" storage="sound/voice/31/1.ogg"]
�@�@ �\�Y�@�@�@[indent]
�c���̂悤�Ȏ҂����̓V��ɋ����点�A���̖��ɕ����]���Ă����Ƃ́c�B
�M�l��̖ڂ͂��ʂ��̓����c�B
�^�̉e���҂́c�A������B[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�͂��̐n�̐�ŐM�����w�������B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/31/2.ogg"]
�@�@ �\�Y�@�@�@[indent]
�c�����䂪�e���҂Ƃ��āA���ɐ����Ă����B�i�M���Ɂj�c���̎��A���
�R�ŕ��Ɉ͂܂ꂨ�O�̎v�f����������A�R��Ǝv������B�����A���O��
�c�A���Ȃ̂�����ȁB[endindent][l][r]

�@�@ �M���@�@�@[indent]
�c�B[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/31/3.ogg"]
[image storage="fgimage/47/_IS17125.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ �\�Y�@�@�@[indent]
���A�ŉ��͖�ɉ���A���O�̐���A�����Ԃ��Ɍ��邱�Ƃ��������B��
�c�A��͂肨�O�͉e���ҁB�����҂Ƃ��ẮA����B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ �M���@�@�@[indent]
�c�����ق����A[endindent][l][r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/31/4.ogg"]
�@�@ �\�Y�@�@�@[indent]
���̒z�����ŋ��̌R�������Ȃ��疢���A�l���̓G�ɓ�a���Ă���B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ �M���@�@�@[indent]
�ق�B���̂悤�Ȗ앐�m�̋Y�ꌾ�Ɏ���݂��ȁB�ҋ��a��B�a��E���I[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���ԐM���B�������A�������͓����Ȃ��B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/31/5.ogg"]
�@�@ �\�Y�@�@�@[indent]
�^�̑��݂̑O�ł́A�܂������͋����ƂȂ�B��������܂��A���̐^��
��������ʂقǂ̒s��҂ł͂Ȃ��悤���B[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

[image storage="fgimage/47/_IS17777.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
���܂炸�����𔲂������A�\�Y�Ɏa�肩����M���B[l][r]
���A���A�O��A�\�Y�͂����炤�l�ɐM���̓������Ȃ���M����B[l][r]
�|���M���B[endindent][l][r]
[r]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/31/6.ogg"]
�@�@ �\�Y�@�@�@[indent]
�䂪��̌������łȁB���͎��ȂƂ̋����B�������ɂ͒ǂ킹�ʁB
�����ւȂ�Ƃ��s���������B[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���������Ă������ƓV��Ɍ������\�Y�B[l][r]
�����ցA�u�e���ҁv�M���������グ�a�肩����B[l][r]

[image storage="fgimage/47/_IS17783.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE���h��.ogg" ]
����邱�Ƃ��Ȃ��A�������ӂ邢�A�j�̋�����˂�����\�Y�B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/31/7.ogg"]
�@�@ �\�Y�@�@�@[indent]
�s���ƌ�������ނ܂ʂ��B���ꂾ����M�l�́c�A���́A����B[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

;[image storage="aduti2" layer="base" page=fore]
[image storage="fgimage/48/_IS17135.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�▽���A�|���u�e���ҁv�M���B[l][r]
�\�Y�͉��߂āA�^�̐D�c�M���Ƃ��āA�V��̍��ɍ��𐘂���B[l][r]
���C�ɂƂ�ꌾ�t���Ȃ��l�X�B���G���\�Y�����āA�Ђꕚ���B[endindent][l][r]
[r]

[wb canskip="true"]
[fadeoutbgm time=1500]

;���y�J�n
[playbgm storage="bgm/ogg/�\�Y.ogg" loop="true"]

�@�@ ���G�@�@�@[indent]
���A��Ȃ����܂��B�M�����c�B[endindent][l][r]

[r]

[image storage="fgimage/48/_IS32310.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�������������āA��l�A�܂���l�A�Ђꕚ���A�z�����B[endindent][l][r]
[r]

�@�@ ��T�@�@�@[indent]
�݂�c�A[endindent][l][r]

     �݂� �@�@ [indent]
�˂����܁A[endindent][l][r]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
��T���݂�Ɍ������삯�o���B�삯�o���݂�B[l][r]
�\�\���̎��A[playse buf="1" storage="sound/effect/P54���h��.ogg" ]
�K���b�b�A��M�������������ɒ@��������B[l][r]
����Ώ\�Y����ɂ��������ŁA�݂�̍s������ǂ��ł���B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/32/1.ogg" ]
�@�@ ��T�@�@�@[indent]
�\�Y�c�A�����������B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ �\�Y�@�@�@[indent]
�c�B[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/32/2.ogg" ]
�@�@ ��T�@�@�@[indent]
��̌��������A�����˃F�̂��A[endindent][l][r]
[ws buf=0 canskip="true"]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/32/3.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�c�����R�̒��ɏオ�����B�����͉߂����B���O�̖��𕷂������͂Ȃ��B[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y���A�Â��C����ށB[endindent][l][r]
[r]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/32/4.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�c��͂�V��̍��͗ǂ��B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ ��T�@�@�@[indent]
�c�B[endindent][l][r]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/32/5.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�����̉��̔閧��m��҂́A�����ɂ��镺�ƁA���O�����������B���O��
���𐶂����Ή\�͘R��A�R�ꂽ�\�͖��̐S�𓮗h������B�c���O������
�E���B�����A���̖ڂ̑O�ŎE���̂͋C���i�܂ʁB�P�\�����B�����ւ�
��������B�����A�����ɂ��O������ĂƐG����o���B�c���ꂽ�����A��
���ɐ����Ď��ʂ������B[endindent][l][r]
[ws buf=0 canskip="true"]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/32/6.ogg" ]
�@�@ ��T�@�@�@[indent]
�\�Y�c�B[endindent][l][r]
[ws buf=0 canskip="true"]


;�Z���t�Đ�
[playse buf="0" storage="sound/voice/32/7.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�i������ނ��j��������A��̊O�ɑ���o���Ă��B[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�삯����T�Ƃ݂�B��l�ɁA������������B[l][r]
��T�A�\�Y������x�����ƁA�݂�̎�������A�삯����B[endindent][l][r]
[r]



;�Z���t�Đ�
[playse buf="0" storage="sound/voice/32/8.ogg" ]

[image storage="fgimage/48/_IS24358.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ �\�Y�@�@�@[indent]
�܂��Ɗy�����A�Y��V�т�������c�B[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�Â��ڂŏ΂��\�Y�B�����U�点��B���G���A��l�c��B[endindent][l][r]
[r]

[image storage="fgimage/48/_IS24357.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ ���G�@�@�@[indent]
�c�M�����A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���O�̋X��������𕷂��ɂ͂Ȃ��B���̂܂��������r�����䂪���R��
���ߒ����A�V���Ȕe�Ƃ̑卆�߂��|���˂΂Ȃ�ʁB�c���G�A[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�n�b�A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���́A�V�������E���������B�����̏��߂ɍł���ɓ����ɂӂ��킵��
���̂Ƃ͉����c�A���O�ɂ͕����邩�B[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�i�l�������炵�j�����𓝂ׂ�A�ї��P���̎�i���j�A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���Ƃ��c�A��́A���B[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�i���j�c�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�O����A���͎��畺�𗦂��A���ł̂��΂�A���̐��e����𓢂B[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�i�������j�c�M�����A�c���Ȃ��́A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�������܊e�n�ɎU�鏫�����ɂ��̎|������B���_�A�����͖��p�ƂȁB[endindent][l][r]

[r]

;���y��~
[fadeoutbgm time=3000]


;���y�J�n
[playbgm storage="bgm/ogg/�G�g.ogg" loop="true"]

[image storage="fgimage/49/_IS17140.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[l][r]
����͂݁A�ł��G�g�̌��ɁA�E���삯�ė���B[endindent][l][r]
[r]

�@�@ �G�g�@�@�@[indent]
�i�՗����j�Ȃ񂾁I[endindent][l][r]

�@�@ �E�T�@�@�@[indent]
�D�c�Ɠ]���̔�p�����閺���A�捏�A���y���瓦�ꂽ�ƁB[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�������I���y�ɁI�c�E�A���������W�߂�B���̍����������T���o���I
�K���►�������o���A�䂪���Ɉ��������ė����I[endindent][l][r]

[l][r]
;���y��~
[fadeoutbgm time=3000]


;���y�J�n
[playbgm storage="bgm/ogg/�퓬.ogg" loop="true"]
;[image storage="15" layer="base" page=fore]
[image storage="fgimage/50/_IS17798.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]



�@�@�@�@�@�@�@�@�@�@�@[indent]

�~   �~   �~[l][r]
���l�����Ƌ��ɖ���삯�A���܂ł̓����������T�Ƃ݂�B[l][r]
�����֕�����������A��T�������͂���B[endindent][l][r]
[r]

�@�@ �΋g�@�@�@[indent]
�����c�B[endindent][l][r]

�@���ܘY�@�@�@[indent]
�ʖڂ��c�A�����c�A[endindent][l][r]

[image storage="fgimage/50/_IS17797.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


�@�@ ��T�@�@�@[indent]
���߂�ł˃F�B�i��ɂ����R�����߁j��ɓ��ꂽ�����̂́c�B�s����
�c�A���炽���̑��ɁB[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
����������ĂɎa�肩����B[l][r]
����Ɨ��đ����ɏe���B
;���ʉ��Đ�
[playse buf="1" storage="sound/effect/SE����e2.ogg" ]
�������͒e���󂯁A�l�U����B[endindent][l][r]
[r]
[ws buf=1 canskip="true"]

�@�@�@�@�ʁ@�@�@[indent]
�Ȃ񂾁c�A[endindent][l][r]

�@�@ ��T�@�@�@[indent]
�s�����c�A�s�����B[endindent][l][r]

[r]

[image storage="fgimage/50/_IS17802.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���A����A�e���g�������s�������B[endindent][l][r]
[r]

�@�@ ���s�@�@�@[indent]
�i�Ƃ育���j�c���߃F�̌������́A��i�����j��˃F����ȁc�B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���s�A��T�����̔w������悤�ɁA�Ăы삯�o���čs���B[endindent][l][r]
[r]


[image storage="fgimage/50/_IS17150.JPG" layer="1" page="fore" visible="true" top="50" pos="center"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�~   �~   �~[r]
[r]
�ĂсA�G�g�̌��ɔE�B[endindent][l][r]
[r]

�@�@ �G�g�@�@�@[indent]
�}�W�ł��I[endindent][l][r]


�@�@ �E�U�@�@�@[indent]
�͂��B�M���͖����A�萨�݂̂�A��A���A�{�\���ɓ���܂��B���ꂱ���A
�z�𓢂D�@���ƁB[endindent][l][r]

�@�@ �G�g�@�@�@[indent]
�i�Ɛb�����Ɂj�c���̕s�݂͕������Ɍ����Ė������ȁB�����A�D�c�M
���𓢂ׂ��A���Ɍ������I[endindent][l][r]
[p][cm]

;���y��~
[fadeoutbgm time=3000]


*story_15|�\�܏�@�{�\��
;[image storage="honnouji" layer="base" page=fore]


[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���y��~
[stopbgm]
[bgmopt volume="50"] 

;���ʉ��J�n
[playse buf="1" storage="sound/effect/SE���포.ogg" ]


[image storage="fgimage/51/_IS17805.JPG" layer="1" page="fore" visible="true" top="50" left="0"]
[image storage="fgimage/back.jpg" layer="base" page="fore" visible="true" ]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
�\�܏�@�{�\��[resetfont][l][r]
[r]

[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����������̉����������Ȃ��A��l�����ō���M���B[l][r]
�����֕����삯����ł���B[endindent][l][r]
[r]

�@ ���P�P�@�@�@[indent]
�\���グ�܂��B�����̕������̖{�\�����͂�ł���܂��B���̐��ꖜ���B
�ƂĂ���炪�萨�ł͑����ł������܂���B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�ق��c�A[endindent][l][r]

�@ ���P�P�@�@�@[indent]
�����͉�炪�����܂��A�a�A�������������I[endindent][l][r]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
���A���킷�邽�߁A���̏���삯����B[l][r]
;[ws buf=1 canskip="true"]
[fadeoutse buf="1" time="2000"]
�\�Y�A�Â��ɗ����オ��B[l][r]

;���ʉ��Đ�

�����֗x�藈��e��B�\�Y��w�ォ��U�������Ɏa��B[playse buf="1" storage="sound/effect/�a��4.ogg" ][l][r]
[ws buf=1 canskip="true"]

[image storage="fgimage/51/_IS17809.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[ws buf=1 canskip="true"]

���ꂽ�̂́A���G�ł���B[endindent][l][r]
[r]

�@�@ �\�Y�@�@�@[indent]
���G�c�A[endindent][l][r]
;���y�J�n
[playbgm storage="bgm/ogg/���G.ogg" loop="true"]
[image storage="fgimage/51/_IS17152.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ���G�@�@�@[indent]
���̌��G�A�M���𐒂߂Ă���܂����B�M���̐؂�񂭐V�����ɕ��̒ꂩ
�瓲��A�������A���̍��̑S�Ă��M���ɕ����āA�����܂Ő����ĎQ��
�܂����B�������c�A�������M�����A��𓢂B���ꂾ���́A���Ƃ��M��
�̋��ł��낤�ƁA�f���Ă����Ă͂Ȃ�܂��ʁI[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/34/1.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�c�������Ă���B�c���̐��̖��́A����������邱�Ƃ����߂Ȃ���A��
�����ł悷���ɁA�����肽���Ȃ���̂Ȃ̂��ȁc�B������S�Ă̕W�D��
�ȂƁc�A���O�炵�����S��B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ ���G�@�@�@[indent]
�c�B[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
���O�ɒ�𓢂ƍ�����΁A�K����A���̐M���𓢂��ɂ���ė���B�c
���΂͌��G�B�Ō�܂ł��̉��̊��҂Ɉ��ʒj��B[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�c�M�����c�A[endindent][l][r]

�@�@ �\�Y�@�@�@[indent]
�c���̖������́A[endindent][l][r]

�@�@ ���G�@�@�@[indent]
�܂��A�߂����Ƃ̕�́A[endindent][l][r]



�@�@ �\�Y�@�@�@[indent]
�c�������B�Ȃ�΂悵�B[endindent][l][r]

[r]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���G�A�\�Y�̂��̌��t�ɁA�͂��ƋC�t���B[endindent][l][r]
[r]

�@�@ ���G�@�@�@[indent]
�܂������M���l�́A���̖��������A���߂��琶�����т��������Łc�A[endindent][l][r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/34/2.ogg" ]
�@�@ �\�Y�@�@�@[indent]
�c��p��m�閺�����ꂽ�ƕ����΁A�O�G�Ɏ�����܂˂������̉Ɛb����
���A�M���œ|�̖�S���ĂєR���オ�点��B�����ɏ�݂����A���̐M��
����A�킸���Ȏ萨�ŋ��̎����Ă���ƕ����΁A���𓢂���Ɖ�􂷂�
�҂����́A�K���₱�́A�{�\���ɂ���ė���c�B�������˂΁A���̖���
�ǂ����̂́A���̐��ɒN�����Ȃ��Ȃ�c�B[endindent][l][r]
[ws buf=0 canskip="true"]

�@�@ ���G�@�@�@[indent]
�c�M�����c�A���Ȃ��́c�A����Ȗ���l�̂��߂ɁI[endindent][l][r]

[r]


�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A���Z�����������A�����J���B[endindent][l][r]
[r]

;�Z���t�Đ�
[playse buf="0" storage="sound/voice/34/3.ogg" ]
[image storage="fgimage/51/_IS17821.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
�@�@ �\�Y�@�@�@[indent]
���G�c�A���O�ɓ������̂Ȃ�΁A�����Ȃ��c�B
�Ō�̖����B�����ƕ����B�������́A������ǓƂȉ��ƂȂ��A��Ȃ��
�ޕ��̐S�Ɏv����y���邱�Ƃ�Y���B�c����͉����A�����ɕ����邱�̐g��q�����Ō�̓�B���̓����A�V���i�Ă񂪁j�̔e�ҐD�c�M�����Ȃ��A�g��łڂ����Ƃ�m��Ȃ���A���̖{�\���ɂ��̐g��u�������A���̓�̈ÈłɁA��̐��̖������L�΂��c�B���ꂱ�������A���̐��ɑ����ꐢ���̖d�i�͂��育�Ɓj��c�B���G�c�A���O�̖�ڂ́A�{�\������Ƃ��A���̉����������邱�ƁB
���̑́c�A���̖ш�{�A�o��ƂĎc������������I[endindent][l][r]
[ws buf=0 canskip="true"]
[r]

;���y��~
[fadeoutbgm time=3000]

;���y�J�n
[playbgm storage="bgm/ogg/�{�\��.ogg" loop="true"]


[image storage="fgimage/51/_IS17828.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
���G�A���̌��t���󂯁A�ł��k���A�n��h�邪�����т��グ��B[endindent][l][r]
[r]

[image storage="fgimage/51/_IS24364.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ ���G�@�@�@[indent]
�ҋ��悭�����I���̖{�\���A�h�G�D�c�M������Ƃ������Ȃ��܂łɑł�
�ӂ��I�Ă��s�����I�����M���̖S�[���A�V��������̉ʂĂɕ�����A��
�ɂ��ׂ�I[endindent][l][r]

[playse buf="0" storage="sound/voice/34/4.ogg" ]
[image storage="fgimage/53/_IS24325.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
;;�Z���t�Đ�

�@�@ �\�Y�@�@�@[indent]
���A������B�����̂т�B[endindent][l][r]
[ws buf=0 canskip="true"]

[r]

[p]
[cm]

�@�@�@�@�@�@�@�@�@�@�@[indent]

���G�̋��тƋ��ɁA�{�\�����͂ޗ��킪�J��L������B[l][r]
�\�Y�ɁA���X�ƕ����P������B[l][r]
[image storage="fgimage/53/_IS17166.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

[image storage="fgimage/53/_IS24327.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[image storage="fgimage/53/_IS17846.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�����ɁA�����ɉ�������u���A��Ăɉ�̂���Ă����B[l][r]

[image storage="fgimage/53/_IS17843.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�����A�|��Ȃ�����A�������ӂ邢�삯�܂��\�Y�B[l][r]


[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]


[image storage="fgimage/53/_IS17084.JPG" layer="1" page="fore" visible="true" top="50"]
[l]
[image storage="fgimage/53/_IS32296.JPG" layer="1" page="fore" visible="true" top="50"]
[l]

[image storage="fgimage/53/_IS17168.JPG" layer="1" page="fore" visible="true" top="50" pos="center"]
[l]
[image storage="fgimage/53/_IS24335.JPG" layer="1" page="fore" visible="true" top="50" pos="center"]
[l]
[image storage="fgimage/53/_IS24336.JPG" layer="1" page="fore" visible="true" top="50" pos="center"]
[l]

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

���������̈ߑ����͂�����A����������A���߂ɕ���ɗ������A
���i���j�̂܂܂̎p�ƂȂ�B[l][r]

�܂�����ȑf����̂����Ȃ��ɁA������l�A�\�Y�͗��B[endindent][l][r]
[r]

[image storage="fgimage/53/_IS24370.JPG" layer="1" page="fore" visible="true" top="50" left="0"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

;���y��~
[fadeoutbgm time=3000]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�\�Y�A�����炩�Đ�T�ɓ��������ꂽ�R�����o���B[endindent][l][r]
[r]

;�N���b�N�ɂ��X�L�b�v���֎~
[clickskip enabled=false]

;�����X�^�[�g
[playse buf="0" storage="sound/voice/35/last.ogg" ]
[image storage="fgimage/53/_IS24373.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@ �\�Y�@�@�@[indent]
���̓��c�A�ې����È�˂ɂ��O�����������킦�R���A���̌ǓƂ̏�ɓ͂����B���̕R���A
���O�Ƃ��������ފ݂ƁA�������킪�g���q�����u�i����j���B�c������̐��̌ǓƂ̉����A
���̌������A��Ȃ�ʒN���̏�ɁA�v���̕R��������������c�A�܂����ʔޕ��ɕ��邱���u���̐���A��T�c�A������x�A�����Ă���B[endindent][l][r]
[r]
[ws buf=0 canskip="true"]
[wait time=2000]


[playse buf="0" storage="bgm/last.ogg" ]
[image storage="fgimage/53/_IS17180.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[image storage="fgimage/54/_IS17182.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�����ď\�Y�́A���Đ�T���x���Ă������̗x����A�v���o���x��B[l][r]
;���y�J�n
;[playbgm storage="bgm/last.ogg" loop="true"]



[image storage="fgimage/54/_IS17874.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�������Ȃ��B���ǂ��ǂ����\�\�\�B[l][r]


����͖`���ŁA���҂����������Ȃ�����ł��Ă����s���ȓ����B[endindent][l][r]


[r]
[image storage="fgimage/54/_IS17878.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]


[image storage="fgimage/55/_IS17888.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]

�@�@�@�@�@�@�@�@�@�@�@[indent]
�������A���ɂ��ǂ蒅������T�Ƒ��l�����́A�΂��͂݁A�F�ő��Ղ�̗x���x��B[l][r]
���̒��ŗx��\�Y�ƁA��T�����̎p���d�Ȃ�B[l][r]

[image storage="fgimage/55/_IS17891.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
[l]
[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]
���Ȃ���A���ɗx���Ă��邩�̂悤�ɁB�݂�Ƌ��ɏ΂���T�ƁA����
�ɏ΂݂𕂂��ׂėx��\�Y�̎p���f���A����͗n�Â��Ă����B[endindent][l][r]
[r]
[r]
[image storage="fgimage/55/_IS17895.JPG" layer="1" page="fore" visible="true" top="50"]
[layopt layer="message" page="fore" visible="false"]
[layopt layer="message" page="back" visible="false"]
;[p]

[wait time=2000]
[image storage="fgimage/55/_IS17895.JPG" layer="2" page="fore" visible="false" top="50"]
[image storage="fgimage/55/_IS17894.JPG" layer="1" page="back" visible="false" top="50"]
[wait time=1000]
[trans layer="1" time=2000 method=crossfade]
[wt]
[resetstyle]
[cm]

;[image storage="fgimage/55/_IS17894.JPG" layer="1" page="fore" visible="true" top="50"]
;[layopt layer="message" page="fore" visible="false"]
;[layopt layer="message" page="back" visible="false"]
;[l]
;[cm]
;[font size =27 face="�l�r �S�V�b�N" color=0xffffff bold="true"]
;              ��[r][resetfont]
;[image storage="fgimage/black2.JPG" layer="1" page="back" visible="true" top="0"]
;[wait time=200]
;[trans layer=base time=2000 method=crossfade]
;[image storage="fgimage/55/black.JPG" layer="1" page="fore" visible="true" top="0"]
;���y��~
;[fadeoutbgm time=3000]
; �Ȍ�A�X�^�b�t���[��

[layopt layer="message" page="fore" visible="true"]
[layopt layer="message" page="back" visible="true"]




[jump storage="staffroll.ks" target=*staffroll]
; -----------------------------


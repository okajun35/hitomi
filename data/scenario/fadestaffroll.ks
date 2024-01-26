; fadestaffroll.ks ---------------------
@if exp="typeof(global.staffroll_object) == 'undefined'"
@iscript

// �t�F�[�h�̂���X�^�b�t���[���̃v���O�C��

// KAG �ɕt���̃X�^�b�t���[���v���O�C���Ƃ͈Ⴂ�A
// ���b�Z�[�W���C�����ړ�������^�C�v�̃X�^�b�t���[��

class FadeStaffRollPlugin extends KAGPlugin
{
	var layer; // �t�F�[�h���ۂ������邽�߂̃��C��
	var window; // �E�B���h�E�I�u�W�F�N�g�ւ̎Q��

	function FadeStaffRollPlugin(window)
	{
		this.window = window;
		layer = new KAGLayer(window, window.fore.base);
		layer.absolute = 2000000-1; // �d�ˍ��킹�����̓��b�Z�[�W����������
		layer.hitType = htMask;
		layer.hitThreshold = 256; // �}�E�X���b�Z�[�W�͑S�擧��
		layer.setPos(0, 0, window.scWidth, window.scHeight);
		super.KAGPlugin();
	}

	function finalize()
	{
		invalidate layer;
		super.finalize(...);
	}

	function init(left, top, right, bottom, vertical, accel)
	{
		// left, top, right, bottom : �X�^�b�t���[���̕\���͈�
		// vertical : �c�������ǂ���
		// accel : �����x�I�ȓ������s���� ( �� : 0 : �� )

		// ��ʂ��������� layer �ɏd�ˍ��킹�R�s�[
		var base = window.fore.base;
		layer.piledCopy(0, 0, base, 0, 0, layer.width, layer.height);
		layer.face = dfMask;
		layer.fillRect(0, 0, layer.width, layer.height, 255);

		// �t�F�[�h�͈͓̔���������悤�ɂ���
		layer.fillRect(left, top, right - left, bottom - top, 0);

		// �t�F�[�h����
		if(vertical)
		{
			// �����̃t�F�[�h
			var margin = (right - left) / 2;
			var h = bottom - top;
			for(var i = 0; i < margin; i++)
			{
				var mask = 1 - i / margin;
				mask = calculateMask(mask, accel);
				layer.fillRect(left + i, top, 1, h, mask);
			}

			// �E���̃t�F�[�h
			var r = right - margin;
			for(var i = 0; i < margin; i++)
			{
				var mask = i / margin;
				mask = calculateMask(mask, accel);
				layer.fillRect(r + i, top, 1, h, mask);
			}
		}
		else
		{
			// �㑤�̃t�F�[�h
			var margin = (bottom - top) / 2;
			var w = right - left;
			for(var i = 0; i < margin; i++)
			{
				var mask = 1 - i / margin;
				mask = calculateMask(mask, accel);
				layer.fillRect(left, top + i, w, 1, mask);
			}

			// �����̃t�F�[�h
			var b = bottom - margin;
			for(var i = 0; i < margin; i++)
			{
				var mask = i / margin;
				mask = calculateMask(mask, accel);
				layer.fillRect(left, b + i, w, 1, mask);
			}
		}

		layer.visible = true;
	}

	function calculateMask(mask, accel)
	{
		// �����v�Z
		if(accel < 0)
		{
			// �㌷ ( �ŏ��������������A���X�ɒx���Ȃ� )
			mask = 1.0 - mask;
			mask = Math.pow(mask, -accel);
			mask = 1.0 - mask;
		}
		else if(accel > 0)
		{
			// ���� ( �ŏ��͓������x���A���X�ɑ����Ȃ� )
			mask = Math.pow(mask, accel);
		}
		return 255 * mask;
	}

	function uninit()
	{
		layer.visible = false;
	}

	function onRestore(f, clear, elm)
	{
		// �x��ǂݏo���Ƃ�
		uninit();
	}

}

kag.addPlugin(global.fadestaffroll_object = new FadeStaffRollPlugin(kag));
	// �v���O�C���I�u�W�F�N�g���쐬���A�o�^����

@endscript
@endif

@macro name=fadestaffrollinit
@eval exp="fadestaffroll_object.init(+mp.left, +mp.top, +mp.right, +mp.bottom, +mp.vertical, +mp.accel)"
@endmacro

@macro name=fadestaffrolluninit
@eval exp="fadestaffroll_object.uninit()"
@endmacro
@return
;---------------------------------------

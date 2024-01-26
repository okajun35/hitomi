; fadestaffroll.ks ---------------------
@if exp="typeof(global.staffroll_object) == 'undefined'"
@iscript

// フェードのあるスタッフロールのプラグイン

// KAG に付属のスタッフロールプラグインとは違い、
// メッセージレイヤを移動させるタイプのスタッフロール

class FadeStaffRollPlugin extends KAGPlugin
{
	var layer; // フェードっぽく見せるためのレイヤ
	var window; // ウィンドウオブジェクトへの参照

	function FadeStaffRollPlugin(window)
	{
		this.window = window;
		layer = new KAGLayer(window, window.fore.base);
		layer.absolute = 2000000-1; // 重ね合わせ順序はメッセージ履歴よりも奥
		layer.hitType = htMask;
		layer.hitThreshold = 256; // マウスメッセージは全域透過
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
		// left, top, right, bottom : スタッフロールの表示範囲
		// vertical : 縦書きかどうか
		// accel : 加速度的な動きを行うか ( 負 : 0 : 正 )

		// 画面をいったん layer に重ね合わせコピー
		var base = window.fore.base;
		layer.piledCopy(0, 0, base, 0, 0, layer.width, layer.height);
		layer.face = dfMask;
		layer.fillRect(0, 0, layer.width, layer.height, 255);

		// フェードの範囲内を見えるようにする
		layer.fillRect(left, top, right - left, bottom - top, 0);

		// フェード部分
		if(vertical)
		{
			// 左側のフェード
			var margin = (right - left) / 2;
			var h = bottom - top;
			for(var i = 0; i < margin; i++)
			{
				var mask = 1 - i / margin;
				mask = calculateMask(mask, accel);
				layer.fillRect(left + i, top, 1, h, mask);
			}

			// 右側のフェード
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
			// 上側のフェード
			var margin = (bottom - top) / 2;
			var w = right - left;
			for(var i = 0; i < margin; i++)
			{
				var mask = 1 - i / margin;
				mask = calculateMask(mask, accel);
				layer.fillRect(left, top + i, w, 1, mask);
			}

			// 下側のフェード
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
		// 加速計算
		if(accel < 0)
		{
			// 上弦 ( 最初が動きが早く、徐々に遅くなる )
			mask = 1.0 - mask;
			mask = Math.pow(mask, -accel);
			mask = 1.0 - mask;
		}
		else if(accel > 0)
		{
			// 下弦 ( 最初は動きが遅く、徐々に早くなる )
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
		// 栞を読み出すとき
		uninit();
	}

}

kag.addPlugin(global.fadestaffroll_object = new FadeStaffRollPlugin(kag));
	// プラグインオブジェクトを作成し、登録する

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

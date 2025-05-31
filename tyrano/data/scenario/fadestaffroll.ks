; fadestaffroll.ks - フェードスタッフロール（TyranoScript版）
; 注：TyranoScriptでは吉里吉里の複雑なフェード機能は利用できないため、
; 基本的なフェード効果で代替実装

; フェードスタッフロール初期化マクロ
*fadestaffrollinit
; TyranoScriptでは簡易的なフェード効果のみ対応
[return]

; フェードスタッフロール終了マクロ
*fadestaffrolluninit
; フェード効果終了
[return]

; 簡易フェード効果
*simple_fade_effect
[mask_off]
[return]
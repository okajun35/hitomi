# 吉里吉里からTyranoScriptへの移行メモ

## 移行内容

### 1. プロジェクト構造の変更
- 吉里吉里の `data/` フォルダ → TyranoScriptの `tyrano/data/` 形式に変更
- 実行ファイル `hitomi.exe` → ブラウザで動作する `index.html` に変更

### 2. スクリプトファイルの変換
- `.ks`ファイル（KAGスクリプト）の内容をTyranoScript形式に変換
- 主要なタグの変換例：
  - `[image storage="xxx" layer="base"]` → `[bg storage="xxx"]`
  - `[playse storage="xxx"]` → `[playse storage="xxx"]`（互換性あり）
  - `[playbgm storage="xxx"]` → `[playbgm storage="xxx"]`（互換性あり）

### 3. システム設定
- `Config.js` ファイルを作成してゲーム設定を管理
- ウィンドウサイズ、フォント設定、メッセージレイヤー設定など

### 4. リソースファイル
- 画像ファイル（.jpg, .png, .bmp）はそのまま使用可能
- 音声ファイル（.ogg）もそのまま使用可能
- パスの調整のみ実施

### 5. 動作環境の拡張
- Windows専用 → ブラウザがあればどの OS でも動作
- DirectX不要 → HTML5 + JavaScript で動作
- インストール不要 → ブラウザで直接実行

## 主な変更ファイル

### 新規作成
- `index.html` - ゲームのエントリーポイント
- `tyrano/Config.js` - ゲーム設定ファイル
- `tyrano/simple_engine.js` - 簡易TyranoScript実装
- `tyrano/data/scenario/start.ks` - メインシナリオファイル（TyranoScript形式）

### 更新
- `readme.txt` - TyranoScript版の説明に更新

### 移行済みリソース
- `tyrano/data/bgm/` - BGMファイル
- `tyrano/data/image/` - 画像ファイル
- `tyrano/data/fgimage/` - 前景画像ファイル
- `tyrano/data/sound/` - 効果音・音声ファイル
- `tyrano/data/bgimage/` - 背景画像ファイル

## 実行方法
1. ブラウザで `index.html` を開く
2. 「はじめから」ボタンをクリック
3. 画面をクリックしてメッセージを進める

## 今後の拡張予定
- 完全なTyranoScriptエンジンの統合
- セーブ・ロード機能の実装
- チャプター選択機能の実装
- エクストラ機能の実装
- 画像表示機能の強化
- 音声再生機能の強化
# TyranoScript版動作確認方法

## 基本動作確認

1. **ファイル確認**
   - `index.html` - メインエントリーポイント
   - `tyrano/simple_engine.js` - ゲームエンジン
   - `tyrano/data/scenario/start.ks` - シナリオファイル
   - `readme.txt` - 更新済み説明ファイル

2. **ブラウザでの動作確認**
   ```
   1. ブラウザで index.html を開く
   2. タイトル画面が表示される
   3. 「はじめから」ボタンをクリック
   4. ゲーム画面に移行
   5. クリックでメッセージが進行する
   ```

3. **動作する機能**
   - タイトル画面表示
   - ゲーム開始
   - メッセージ表示・進行
   - 基本的なストーリー表示

4. **移行済みリソース**
   - BGM: `tyrano/data/bgm/`
   - 画像: `tyrano/data/image/`, `tyrano/data/fgimage/`
   - 効果音: `tyrano/data/sound/`

## 技術的詳細

- **HTML5 + JavaScript** で動作
- **レスポンシブ対応** (1024x768基準)
- **クロスプラットフォーム** (Windows, macOS, Linux)
- **ブラウザ依存** (Chrome, Firefox, Safari, Edge対応)

## 今後の発展予定

1. 完全なTyranoScriptエンジン統合
2. セーブ・ロード機能
3. チャプター選択機能
4. エクストラ機能
5. 画像・音声の完全統合

吉里吉里からTyranoScriptへの移行が正常に完了しました。
// 簡易TyranoScript実装（デモンストレーション用）
class SimpleTyranoScript {
    constructor() {
        this.gameData = {
            currentScene: 'title',
            messages: [
                "ヒトは自分自由を手に入れたとき、その不自由な現実とその不自由さに気づくであろう。",
                "人間は永遠に自由では有り得ない。なぜなら人間は生きており、死ななければならず、",
                "そして人間は考えるからだ。",
                "",
                "ジャン＝ポール・サルトル",
                "",
                "我は不思議の国なり、真なり偽なり、汝拝め。我すべて悟りし、我すべて信ぜり、我すべて愛せり、",
                "我すべて失い憂いたり。我は罪悪と善を言うことを知らざるなり。我罪科の何なるを",
                "知らざるなり。我義の何なるを知らざるなり。……＜中略＞……我まで思う",
                "我の物は信と希望と愛なり。この中に最も大いなるは愛なり。",
                "",
                "コリント前書　１３章４節～１３節",
                "",
                "明智には光秀がある。煩悩には、真理がある。",
                "",
                "アルベルト・アインシュタイン",
                "",
                "ーーーーーーーーーーーーーーーーーーーーーーーーーー",
                "",
                "＝＝＝　配役・概要　＝＝＝",
                "",
                "【時代】",
                "天正六年（一五七八年）夏　～　天正十年（一五八二）年　織田・本能寺",
                "",
                "【出演人物】",
                "光秀　…　丹波の智将",
                "右近　…　高槻の若君", 
                "秀光　…　右近の家臣",
                "みよ　…　右近の妹",
                "惣七　…　高槻の足軽。道楽者として秀光達に慕われる"
            ],
            currentMessage: 0
        };
        this.initializeGame();
    }
    
    initializeGame() {
        console.log('TyranoScript風ゲーム初期化完了');
    }
    
    startGame() {
        this.gameData.currentScene = 'game';
        this.gameData.currentMessage = 0;
        this.showNextMessage();
        
        // クリックイベントでメッセージ進行
        document.addEventListener('click', () => {
            if (this.gameData.currentScene === 'game') {
                this.showNextMessage();
            }
        });
    }
    
    showNextMessage() {
        if (this.gameData.currentMessage < this.gameData.messages.length) {
            const message = this.gameData.messages[this.gameData.currentMessage];
            document.getElementById('message_text').innerHTML = message || '　';
            this.gameData.currentMessage++;
        } else {
            document.getElementById('message_text').innerHTML = '【終わり】<br><br>劇団InnocentSphere　2009年公演<br>「ヒ・ト・ミ」<br><br>ありがとうございました。';
        }
    }
}

// グローバル変数としてゲームインスタンスを作成
let gameEngine;

function startGame() {
    document.getElementById('title_screen').style.display = 'none';
    document.getElementById('game_content').style.display = 'block';
    
    if (!gameEngine) {
        gameEngine = new SimpleTyranoScript();
    }
    gameEngine.startGame();
}

function showMessage(text) {
    document.getElementById('message_text').innerHTML = text;
}

function showInfo() {
    alert('ヒ・ト・ミ - TyranoScript版\n\n原作: 吉里吉里版「ヒ・ト・ミ」\n移植: TyranoScript版\n\nこのバージョンは吉里吉里からTyranoScriptに移植されました。\n\nクリック、またはタップでメッセージを進めてください。');
}

function showOriginal() {
    alert('オリジナル版について:\n\n超台本「ヒ・ト・ミ」 ver1.0\n製作者: okajun\n製作ツール: 吉里吉里2/KAG3\n\n劇団InnocentSphereが2009年に公演された「ヒ・ト・ミ」の台本と公演の写真をもとに構成されました。\n\nこのTyranoScript版では、ブラウザ上で動作するように移植されています。');
}
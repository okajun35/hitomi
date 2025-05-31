// TyranoScript互換エンジン（縦書き対応版）
class SimpleTyranoScript {
    constructor() {
        this.gameData = {
            currentScene: 'title',
            scenario: null,
            labels: {},
            currentLabel: '*start',
            lineIndex: 0,
            variables: {},
            layers: {},
            messageLayer: {
                visible: true,
                vertical: false,
                left: 80,
                top: 80, 
                width: 860,
                height: 580
            },
            waitingForClick: false
        };
        this.initializeGame();
    }
    
    initializeGame() {
        console.log('TyranoScript風ゲーム初期化完了（縦書き対応）');
        this.loadScenario('start.ks');
    }
    
    async loadScenario(filename) {
        try {
            const response = await fetch(`tyrano/data/scenario/${filename}`);
            const text = await response.text();
            this.parseScenario(text);
        } catch (error) {
            console.error('シナリオファイルの読み込みに失敗:', error);
            // フォールバック用のダミーシナリオ
            this.createFallbackScenario();
        }
    }
    
    parseScenario(text) {
        const lines = text.split('\n');
        this.gameData.scenario = [];
        this.gameData.labels = {};
        
        lines.forEach((line, index) => {
            line = line.trim();
            
            // ラベルの処理
            if (line.startsWith('*')) {
                const labelName = line.split(/\s/)[0];
                this.gameData.labels[labelName] = this.gameData.scenario.length;
            }
            
            // 空行やコメントをスキップ
            if (line === '' || line.startsWith(';')) {
                return;
            }
            
            this.gameData.scenario.push(line);
        });
        
        console.log('シナリオ解析完了:', this.gameData.labels);
    }
    
    createFallbackScenario() {
        // フォールバック用の簡易シナリオ
        this.gameData.scenario = [
            '*start',
            '[title name="ヒ・ト・ミ"]',
            '[position layer="message0" vertical=true]',
            'ヒトは自分自由を手に入れたとき、その不自由な現実とその不自由さに気づくであろう。[l][r]',
            '人間は永遠に自由では有り得ない。なぜなら人間は生きており、死ななければならず、[l][r]',
            'そして人間は考えるからだ。[l][r]',
            '[r]',
            '[align center]',
            'ジャン＝ポール・サルトル[l][r]',
            '[resetalign]',
            '[s]'
        ];
        
        this.gameData.labels = {
            '*start': 0
        };
    }
    
    startGame() {
        this.gameData.currentScene = 'game';
        this.gameData.lineIndex = 0;
        this.jumpToLabel('*start');
        
        // メッセージエリアを縦書きに設定
        const messageArea = document.getElementById('message_area');
        messageArea.className = 'message vertical';
        
        this.executeNextLine();
        
        // クリックイベントでメッセージ進行
        document.addEventListener('click', (e) => {
            if (this.gameData.currentScene === 'game' && this.gameData.waitingForClick) {
                this.gameData.waitingForClick = false;
                this.executeNextLine();
            }
        });
    }
    
    jumpToLabel(labelName) {
        if (this.gameData.labels[labelName] !== undefined) {
            this.gameData.lineIndex = this.gameData.labels[labelName];
            this.gameData.currentLabel = labelName;
            console.log(`ラベル ${labelName} にジャンプしました`);
            this.executeNextLine();
        } else {
            console.error(`ラベル ${labelName} が見つかりません`);
            this.executeNextLine();
        }
    }
    
    executeNextLine() {
        if (this.gameData.lineIndex >= this.gameData.scenario.length) {
            this.showMessage('【終了】');
            return;
        }
        
        const line = this.gameData.scenario[this.gameData.lineIndex];
        this.gameData.lineIndex++;
        
        this.processLine(line);
    }
    
    processLine(line) {
        line = line.trim();
        
        // ラベル行をスキップ
        if (line.startsWith('*')) {
            this.executeNextLine();
            return;
        }
        
        // タグの処理
        if (line.startsWith('[')) {
            this.processTag(line);
            return;
        }
        
        // 通常のテキスト
        if (line !== '') {
            this.showTextLine(line);
            return;
        }
        
        // 空行の場合は次の行へ
        this.executeNextLine();
    }
    
    processTag(line) {
        const tagMatch = line.match(/^\[([^\]]+)\]/);
        if (!tagMatch) {
            this.executeNextLine();
            return;
        }
        
        const tagContent = tagMatch[1];
        const parts = tagContent.split(/\s+/);
        const command = parts[0];
        
        console.log('処理中のタグ:', command, parts);
        
        switch (command) {
            case 'title':
                // タイトル設定
                this.executeNextLine();
                break;
                
            case 'position':
                this.processPositionTag(parts);
                break;
                
            case 'jump':
                this.processJumpTag(parts);
                break;
                
            case 'cm':
                this.clearMessage();
                break;
                
            case 'bg':
                this.processBackgroundTag(parts);
                break;
                
            case 'playbgm':
                this.processBgmTag(parts);
                break;
                
            case 'stopbgm':
            case 'fadeoutbgm':
                // BGM停止（実装省略）
                this.executeNextLine();
                break;
                
            case 'playse':
                this.processSeTag(parts);
                break;
                
            case 'wait':
                this.processWaitTag(parts);
                break;
                
            case 'image':
                this.processImageTag(parts);
                break;
                
            case 'layopt':
                this.processLayoptTag(parts);
                break;
                
            case 'font':
                this.processFontTag(parts);
                break;
                
            case 'resetfont':
                // フォントリセット
                this.executeNextLine();
                break;
                
            case 'align':
                // テキスト揃え
                this.executeNextLine();
                break;
                
            case 'resetalign':
                // テキスト揃えリセット
                this.executeNextLine();
                break;
                
            case 's':
                // 停止（クリック待ち）
                this.gameData.waitingForClick = true;
                break;
                
            case 'p':
                // ページ送り
                this.gameData.waitingForClick = true;
                break;
                
            case 'l':
                // 改行してクリック待ち
                this.gameData.waitingForClick = true;
                break;
                
            case 'r':
                // 改行
                this.executeNextLine();
                break;
                
            default:
                console.log('未対応のタグ:', command);
                this.executeNextLine();
                break;
        }
    }
    
    processPositionTag(parts) {
        // [position layer="message0" vertical=true left=80 top=80 width=860 height=580]
        parts.forEach(part => {
            if (part.includes('vertical=true') || part.includes('vertical="true"')) {
                this.gameData.messageLayer.vertical = true;
                const messageArea = document.getElementById('message_area');
                messageArea.className = 'message vertical';
            } else if (part.includes('vertical=false') || part.includes('vertical="false"')) {
                this.gameData.messageLayer.vertical = false;
                const messageArea = document.getElementById('message_area');
                messageArea.className = 'message horizontal';
            }
        });
        this.executeNextLine();
    }
    
    processJumpTag(parts) {
        // [jump target=*label]
        const targetPart = parts.find(part => part.startsWith('target='));
        if (targetPart) {
            const target = targetPart.split('=')[1].replace(/"/g, '');
            console.log('ジャンプ実行:', target);
            this.jumpToLabel(target);
        } else {
            this.executeNextLine();
        }
    }
    
    processBackgroundTag(parts) {
        // [bg storage="filename.jpg"]
        const storagePart = parts.find(part => part.startsWith('storage='));
        if (storagePart) {
            const filename = storagePart.split('=')[1].replace(/"/g, '');
            this.setBackground(filename);
        }
        this.executeNextLine();
    }
    
    processBgmTag(parts) {
        // [playbgm storage="bgm.ogg" loop=true volume=50]
        const storagePart = parts.find(part => part.startsWith('storage='));
        if (storagePart) {
            const filename = storagePart.split('=')[1].replace(/"/g, '');
            console.log('BGM再生:', filename);
            // 実際の音声再生は省略
        }
        this.executeNextLine();
    }
    
    processSeTag(parts) {
        // [playse storage="se.ogg"]
        const storagePart = parts.find(part => part.startsWith('storage='));
        if (storagePart) {
            const filename = storagePart.split('=')[1].replace(/"/g, '');
            console.log('効果音再生:', filename);
            // 実際の音声再生は省略
        }
        this.executeNextLine();
    }
    
    processWaitTag(parts) {
        // [wait time=1000]
        const timePart = parts.find(part => part.startsWith('time='));
        if (timePart) {
            const time = parseInt(timePart.split('=')[1]);
            setTimeout(() => {
                this.executeNextLine();
            }, time);
        } else {
            this.executeNextLine();
        }
    }
    
    processImageTag(parts) {
        // [image storage="filename.jpg" layer=1 page=fore visible=true top=50]
        console.log('画像表示:', parts);
        // 実際の画像表示は省略
        this.executeNextLine();
    }
    
    processLayoptTag(parts) {
        // [layopt layer="message0" visible=true]
        console.log('レイヤー操作:', parts);
        this.executeNextLine();
    }
    
    processFontTag(parts) {
        // [font size=27 color=0xffffff bold=true]
        console.log('フォント設定:', parts);
        this.executeNextLine();
    }
    
    showTextLine(line) {
        // [l]や[r]タグを処理
        let processedLine = line;
        
        // [l]タグの処理（改行 + クリック待ち）
        if (processedLine.includes('[l]')) {
            const beforeL = processedLine.substring(0, processedLine.indexOf('[l]'));
            if (beforeL.trim() !== '') {
                this.appendMessage(beforeL);
            }
            this.gameData.waitingForClick = true;
            return;
        }
        
        // [r]タグの処理（改行）
        if (processedLine.includes('[r]')) {
            processedLine = processedLine.replace(/\[r\]/g, '<br>');
        }
        
        if (processedLine.trim() !== '') {
            this.appendMessage(processedLine);
        }
        this.executeNextLine();
    }
    
    setBackground(filename) {
        const gameContent = document.getElementById('game_content');
        // 背景画像のパスを調整
        let imagePath = filename;
        if (!imagePath.startsWith('tyrano/')) {
            imagePath = `tyrano/data/image/${filename}`;
        }
        console.log('背景設定:', imagePath);
        gameContent.style.backgroundImage = `url('${imagePath}')`;
        gameContent.style.backgroundSize = 'cover';
        gameContent.style.backgroundPosition = 'center';
    }
    
    clearMessage() {
        document.getElementById('message_text').innerHTML = '';
        this.executeNextLine();
    }
    
    showMessage(text) {
        document.getElementById('message_text').innerHTML = text;
    }
    
    appendMessage(text) {
        const messageElement = document.getElementById('message_text');
        if (messageElement.innerHTML.trim() === '') {
            messageElement.innerHTML = text;
        } else {
            messageElement.innerHTML += '<br>' + text;
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
    alert('ヒ・ト・ミ - TyranoScript版（縦書き対応）\n\n原作: 吉里吉里版「ヒ・ト・ミ」\n移植: TyranoScript版\n\nこのバージョンは吉里吉里からTyranoScriptに移植され、日本語の縦書き表示に対応しています。\n\nクリック、またはタップでメッセージを進めてください。');
}

function showOriginal() {
    alert('オリジナル版について:\n\n超台本「ヒ・ト・ミ」 ver1.0\n製作者: okajun\n製作ツール: 吉里吉里2/KAG3\n\n劇団InnocentSphereが2009年に公演された「ヒ・ト・ミ」の台本と公演の写真をもとに構成されました。\n\nこのTyranoScript版では、ブラウザ上で動作するように移植され、日本語の縦書き表示に対応しています。');
}
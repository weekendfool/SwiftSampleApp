// プロトコル
protocol GameDelegate: class {
    var numberOfPlayers: Int { get }
    func gameDidStart(_ game: Game)
    func gameDidEnd(_ game: Game)
}

class TwoPersonsGameDelegate: GameDelegate {
    func gameDidStart(_ game: Game) {
        print("Game Start")
    }
    
    func gameDidEnd(_ game: Game) {
        print("Game End")
    }
    
    var numberOfPlayers: Int { return 2 }
    
    
}


class Game {
    // GameDelegate型の変数を宣言？
    weak var delegate: GameDelegate?
    
    func start() {
        print("Number Of Players is \(delegate?.numberOfPlayers ?? 1)") // デリゲート内の変数にアクセス
        delegate?.gameDidStart(self)// デリゲート内の関数にアクセス
        print("playing")
        delegate?.gameDidEnd(self)// デリゲート内の関数にアクセス
    }
}

// TwoPersonsGameDelegateクラスのインスタンス化
let delegate = TwoPersonsGameDelegate()
// クラスのインスタンスを作成
let twoPersonsGame = Game()
// Gameクラスのdelegate変数にdelegateを格納
twoPersonsGame.delegate = delegate
twoPersonsGame.start()

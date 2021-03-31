//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class Game {
    private var result = 0
    
    func start(complation: (Int) -> Void)
    // クロージャー
    {
        print("playing")
        
        result = 42
        //　引数として渡された関数にresultを代入
        // コールバック処理
        complation(result)
    }
    
}

let game = Game()

var st = 5
game.start
//　関数の引数として渡す処理を記述
{ (s) in
    //　sは代入されたresultを表す
    var r = s * 10
    print(r)
    print("Rsult Is \(s)")
    
}



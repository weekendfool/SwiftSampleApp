class Game {
    private var result = 0
    
    func start(completion: (Int) -> Void) {
        print("Playing")
        result = 42
        // 以下クルージャー部分
        print("クロージャ前")
        completion(result)
    }
}


let game = Game()
game.start() { result in
    
    print("Result is \(result)")
}


class Game2 {
    var result = 0
    var resultValue = 1
    func start(vale: Int,comp: (Int) -> Void) {
        print("start")
        print("クロージャ前")
//        var value1 = vale
        comp(vale)
    
    }
   
}

let game2 = Game2()

game2.start(vale: 9) { comp in
    print("クロージャなう")

    print("Result is \(comp)")
}
    



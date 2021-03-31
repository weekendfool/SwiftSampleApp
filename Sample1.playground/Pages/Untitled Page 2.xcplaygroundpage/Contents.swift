//: [Previous](@previous)

import Foundation
import Dispatch
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class SomeClass {
    let id: Int
    // 初期化
    init(id: Int) {
        self.id = id
    }
    
    deinit {
        print("deinit")
    }
}


do {
    // インスタンス化と初期化
    let object = SomeClass(id: 42)
    let queue = DispatchQueue.main
    
    queue.asyncAfter(deadline: .now() + 3) {
        print(object.id)
    }
}

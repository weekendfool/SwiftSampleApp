//
//  ChangeColor.swift
//  DelegateSampleApp
//
//  Created by 尾原徳泰 on 2021/07/06.
//

import Foundation

final class MyColor {
    // 処理を任せる相手を保持する
    var delegate: ChangeColorDelegate?
    
    func changeMyColor() {
        if let delegate = delegate {
            // 処理を任せる相手が決まっていない時
            print("No Change")
            return
        } else  {
            // 任せたい処理、具体的な内容は記述しない
            delegate?.changeColor()
        }
    }
        
}

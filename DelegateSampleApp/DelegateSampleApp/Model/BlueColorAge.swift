//
//  BlueColorAge.swift
//  DelegateSampleApp
//
//  Created by 尾原徳泰 on 2021/07/06.
//

import Foundation

final class BlueColorAge: ChangeColorDelegate {
    var myColor = "blue"
    
    func beforeDo() {
        print("before color is \(myColor)")
    }
    func changeColor() {
        
        myColor = "red"
        print("myColor:\(myColor)")
    }
    
    
}
//
//  UserDefault+.swift
//  RouterSampleApp
//
//  Created by 尾原徳泰 on 2021/05/30.
//

import Foundation

extension UserDefaults {
    
    private var loginedKey: String { "logined" }
    
    var isLogined: Bool {
        set {
            // 自身に値を返し格納する
            self.setValue(newValue, forKey: loginedKey)
        }
        get {
            // 自身にbool値を渡す
            self.bool(forKey: loginedKey)
        }
    }
}

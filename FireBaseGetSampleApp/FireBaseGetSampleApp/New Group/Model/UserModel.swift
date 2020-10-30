//
//  UserModel.swift
//  FireBaseGetSampleApp
//
//  Created by 尾原徳泰 on 2020/10/30.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    // 構成する要素
    var name: String = ""
    var age: Int = 0
    var pass: String = ""
    
    var toDictionary: [String: Any] {
        return [
            "name": name,
            "age": age,
            "pass": pass
        ]
        print(self.toDictionary)
    }
    
    // firebaceからの返信をdictionaryで受け取る
    // 受け取った情報を自身Userの要素に格納
    mutating func setFromDictionary(_ dictionary: [String: Any]) {
        // 引数を代入するか??以降を代入
        name = dictionary["name"] as? String ?? ""
        age = dictionary["age"] as? Int ?? 0
        pass = dictionary["pass"] as? String ?? ""
    }
}

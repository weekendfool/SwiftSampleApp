//
//  UserModel.swift
//  FirebaseSignInSampleApp
//
//  Created by 尾原徳泰 on 2020/10/28.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

struct User {
    
    var name: String = ""
    var age: Int = 0
    var favoriteBook: String = ""
    
    var toDictionary: [String: Any] {
        return [
            "name": name,
            "age": age,
            "favoriteBook": favoriteBook
        ]
    }
    
    // firebaceからの返信をdictionaryで受け取る
    // 受け取った情報を自身Userの要素に格納
    mutating func setFromDictionary(_ dictionary: [String: Any]) {
        name = dictionary["name"] as? String ?? ""
        age = dictionary["age"] as? Int ?? 0
        favoriteBook = dictionary["favoriteBook"] as? String ?? ""
    }
    
    enum DisplayMode {
        case insert
        case update
    }
}

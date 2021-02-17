//
//  JudgementBetrayerModel.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/17.
//

import Foundation

struct JudgementBetrayer {
    
    // 裏切り者を格納する辞書を宣言[赤or青: 置かれたマス]
    var betrayerDic: [String: Int] = ["me": 0, "you": 0]
    
    // 裏切り者を記録する
    mutating func recordBetrayer(playerName:String, choosePlaceNumber:Int) {
        // 裏切り者を格納する
        betrayerDic[playerName] = choosePlaceNumber
    }
    
}

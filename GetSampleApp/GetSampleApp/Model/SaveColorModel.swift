//
//  SaveColorModel.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/17.
//

import Foundation

struct SaveColor {
    
    // 色の状態を格納する辞書
    var colorDic: [Int: Int] = [1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0]
    
    // 色の記憶処理
    mutating func saveColor(inputColor: Int, placeNumber: Int) {
        
        //入力された場所と数字を記録
        colorDic[placeNumber] = inputColor
        
//        // 辞書を返す
//        return colorDic
    }
    
    // 辞書のリセット処理
    mutating func resetColorDic() {
        for num in 1...16 {
            colorDic[num] = 0
        }
    }
    
    // 辞書の更新処理
    mutating func updateDic(inputDic: [Int: Int]) {
        
        for num in 1...16 {
            colorDic[num] = inputDic[num]
        }
    }
    
}

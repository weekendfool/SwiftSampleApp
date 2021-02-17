//
//  JudgementWiinerModel.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/17.
//

import Foundation

struct JudgmentWiner {
    
   
    func judgmentWiner(afterColorDic: [Int: Int]) -> Int {
        
        //返り値用の変数
        var winerPlayerNumber = 0
        
        // 勝利数の格納変数
        var winOfBlue = 0
        var winOfRed = 0
        
        // 勝敗判定
        // 勝利条件のパターン格納辞書
        var winerPatternDic: [String: [Int]] = [
            "verticalOne": [1, 5, 9, 13],
            "verticalTwo": [2, 6, 10, 14],
            "verticalThree": [3, 7, 11, 15],
            "verticalfour": [4, 8, 12, 16],
            "sideOne": [1, 2, 3, 4],
            "sideTwo": [5, 6, 7, 8],
            "sideThree": [9, 10, 11, 12],
            "sideFour": [13, 14, 15, 16],
            "diagonalOne": [1, 6, 11, 16],
            "diagonalTwo": [4, 7, 10, 13],
        ]
        
        // winerPatternDicのkeyを格納する配列
        var keysOfWinerPatternDicArray: [String] = [
            "verticalOne",
            "verticalTwo",
            "verticalThree",
            "verticalfour",
            "sideOne",
            "sideTwo",
            "sideThree",
            "sideFour",
            "diagonalOne",
            "diagonalTwo",
        ]
        
        // 勝利している列を判定する処理
        for key in keysOfWinerPatternDicArray {
            // 勝利している列を記録する変数
            var judgmentRedNumber = 0
            var judgmentBlueNumber = 0
            for placeNumvers in winerPatternDic[key]! {
                // 赤か青かの判定を行い、該当した色にプラス１する
                switch afterColorDic[placeNumvers] {
                case 1:
                    judgmentRedNumber += 1
                case 2:
                    judgmentBlueNumber += 1
                default:
                    print("error")
                }
            }
            // 勝利したマスが四つの時、一列揃ったと判定する
            if judgmentRedNumber == 4 {
                winOfRed += 1
            } else if judgmentBlueNumber == 4 {
                winOfBlue += 1
            }
        }
        
        //総合でどっちが勝ったかの判定、勝った列の数を比較
        if winOfRed > winOfBlue {
            winerPlayerNumber = 1
        } else if winOfBlue > winOfRed {
            winerPlayerNumber = 2
        } else if winOfRed == winOfBlue {
            winerPlayerNumber = 3
        }
        
        return winerPlayerNumber
    }
    
    
}

//
//  HiraganaFile.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class Number {
    //実行されたかどうかの処理
    var changeNumberCounter = 0
    //絵文字から文字に変換する時に使用する数字の格納
    var numberToEmojiNumber = Int()
    //絵文字に変換された文字を格納する辞書
    var numberToEmojiString = String()
    //絵文字から数字に変換された文字を格納する辞書
    var emojiToNumberString = String()
    //数字を辞書に入れておく
    var numberDic:[Int:Int] = [400:129397, 401:129402, 402:128546, 403:128557, 404:129398, 405:128544, 406:128545, 407:129324, 408:129327, 409:128563]
    
    //数字を変換する関数
    func changeNumber(inputNumber:String) -> (changeNumberCounter:Int, numberToEmojiNumber:Int, numberToEmojiString:String){
        var number = 0
        changeNumberCounter = 0
        switch inputNumber {
            case "0":
                number = 400
            case "1":
                number = 401
            case "2":
                number = 402
            case "3":
                number = 403
            case "4":
                number = 404
            case "5":
                number = 405
            case "6":
                number = 406
            case "7":
                number = 407
            case "8":
                number = 408
            case "9":
                number = 409
            default:
                break
        }
        if number == 0 {
            return (changeNumberCounter, 0, "")
        }
        //文字から絵文字への変換する処理関数へ値わたし
        changeNumberToEmoji(number: number)
        //数字の暗号化をしたフラグ
        changeNumberCounter += 1
        return (changeNumberCounter, numberToEmojiNumber, numberToEmojiString)
    }
                    
    //文字から絵文字への変換する処理関数
    func changeNumberToEmoji(number:Int) {
        //文字コードをあ使うためのインスタンス作成
        var numberView = String.UnicodeScalarView()
        //Unicodeから絵文字に変換したものを保存
        numberView.append(UnicodeScalar(numberDic[number]!)!)
        //unicodeから絵文字にえ変換したものをアウトプットする
        numberToEmojiString = (String(numberView))
    }
    
    //絵文字を文字に変更
    func changeEmojiToNumber(inputEmojiNumver:Int) -> String {
        //入力された文字のnunicodeと一致するものを探す
        var decryptNumber = 0
        for (key, value) in numberDic {
            if value == inputEmojiNumver {
                decryptNumber =  key
                break
            }
        }
        //入力された絵文字と一致する文字を返す
        emojiToNumberString = ""
        switch (decryptNumber) {
            case (400):
                emojiToNumberString = "0"
            case (401):
                emojiToNumberString = "1"
            case (402):
                emojiToNumberString = "2"
            case (403):
                emojiToNumberString = "3"
            case (404):
                emojiToNumberString = "4"
            case (405):
                emojiToNumberString = "5"
            case (406):
                emojiToNumberString = "6"
            case (407):
                emojiToNumberString = "7"
            case (408):
                emojiToNumberString = "8"
            case (409):
                emojiToNumberString = "9"
            default:
                break
                   }
        return emojiToNumberString
               }
}

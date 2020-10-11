//
//  HiraganaFile.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class Alphabet {
    //実行されたかどうか
    var changeAlphabetCounter = 0
    //絵文字から文字に変換する時に使用する数字の格納
    var alphabetToEmojiTypeNumber = Int()
    var alphabetToEmojiNumber = Int()
    //絵文字に変換された文字を格納する辞書
    var alphabetToEmojiTypeString = String()
    var alphabetToEmojiString = String()
    //絵文字からひらがなに変換された文字を格納する辞書
    var emojiToAlphabetString = String()
    //暗号化に使用するType
    var encryptTypeDic:[Int:Int] = [:]
    //復号化に使用するType
    var decryptTypelDic:[Int:Int] = [:]
    //アルファベット26文字に対応させている辞書
    var alphabetDic:[Int:Int] = [310:128561, 311:128552, 312:128560, 313:128549, 314:128531, 315:129303, 316:129300, 317:129325, 318:129323, 319:129317, 320:128566, 321:128528, 322:128529, 323:128556, 324:128580, 325:128559, 326:128550, 327:128551, 328:128558, 329:128562, 330:129393, 331:128564, 332:129316, 333:128554, 334:128565,335:129296]
    
    //アルファベットに変換する関数
    func alphabetToEmoji(inputAlphabet:String) -> (changeAlphabetCounter:Int, alphabetToEmojiTypeNumber:Int, alphabetToEmojiNumber:Int, alphabetToEmojiTypeString:String, alphabetToEmojiString:String) {
        //出力する絵文字を格納する配列をuserdefaultから引き出す処理
        let encryptVowelStringArray:[Int] = UserDefaults.standard.array(forKey: "encryptVowelStringArray") as! [Int]
        //暗号化に使用するtypeを辞書に格納
        encryptTypeDic[300] = encryptVowelStringArray[5]
        encryptTypeDic[301] = encryptVowelStringArray[6]
        //1文字ずつ初期化
        var tyoe = 0
        var alphabet = 0
        changeAlphabetCounter = 0
        //入力された文字から該当する絵文字を引き出すkeyを発行
        switch inputAlphabet {
            case "A":
                tyoe = 300; alphabet = 310
            case "B":
                tyoe = 300; alphabet = 311
            case "C":
                tyoe = 300; alphabet = 312
            case "D":
                tyoe = 300; alphabet = 313
            case "E":
                tyoe = 300; alphabet = 314
            case "F":
                tyoe = 300; alphabet = 315
            case "G":
                tyoe = 300; alphabet = 316
            case "H":
                tyoe = 300; alphabet = 317
            case "I":
                tyoe = 300; alphabet = 318
            case "J":
                tyoe = 300; alphabet = 319
            case "K":
                tyoe = 300; alphabet = 320
            case "L":
                tyoe = 300; alphabet = 321
            case "M":
                tyoe = 300; alphabet = 322
            case "N":
                tyoe = 300; alphabet = 323
            case "O":
                tyoe = 300; alphabet = 324
            case "P":
                tyoe = 300; alphabet = 325
            case "Q":
                tyoe = 300; alphabet = 326
            case "R":
                tyoe = 300; alphabet = 327
            case "S":
                tyoe = 300; alphabet = 328
            case "T":
                tyoe = 300; alphabet = 329
            case "U":
                tyoe = 300; alphabet = 330
            case "V":
                tyoe = 300; alphabet = 331
            case "W":
                tyoe = 300; alphabet = 332
            case "X":
                tyoe = 300; alphabet = 333
            case "Y":
                tyoe = 300; alphabet = 334
            case "Z":
                tyoe = 300; alphabet = 335
                
            case "a":
                tyoe = 301; alphabet = 310
            case "b":
                tyoe = 301; alphabet = 311
            case "c":
                tyoe = 301; alphabet = 312
            case "d":
                tyoe = 301; alphabet = 313
            case "e":
                tyoe = 301; alphabet = 314
            case "f":
                tyoe = 301; alphabet = 315
            case "g":
                tyoe = 301; alphabet = 316
            case "h":
                tyoe = 301; alphabet = 317
            case "i":
                tyoe = 301; alphabet = 318
            case "j":
                tyoe = 301; alphabet = 319
            case "k":
                tyoe = 301; alphabet = 320
            case "l":
                tyoe = 301; alphabet = 321
            case "m":
                tyoe = 301; alphabet = 322
            case "n":
                tyoe = 301; alphabet = 323
            case "o":
                tyoe = 301; alphabet = 324
            case "p":
                tyoe = 301; alphabet = 325
            case "q":
                tyoe = 301; alphabet = 326
            case "r":
                tyoe = 301; alphabet = 327
            case "s":
                tyoe = 301; alphabet = 328
            case "t":
                tyoe = 301; alphabet = 329
            case "u":
                tyoe = 301; alphabet = 330
            case "v":
                tyoe = 301; alphabet = 331
            case "w":
                tyoe = 301; alphabet = 332
            case "x":
                tyoe = 301; alphabet = 333
            case "y":
                tyoe = 301; alphabet = 334
            case "z":
                tyoe = 301; alphabet = 335
            default:
                break
            }
        if tyoe == 0 && alphabet == 0 {
            return (changeAlphabetCounter, 0, 0, "", "")
        }
        //文字から絵文字への変換する処理関数へ値わたし
        changeAlphabetToEmoji(type: tyoe, alphabet: alphabet)
        //アルファベットの暗号化をしたフラグ
        changeAlphabetCounter += 1
        return (changeAlphabetCounter, alphabetToEmojiTypeNumber, alphabetToEmojiNumber, alphabetToEmojiTypeString, alphabetToEmojiString)
            }
                
             //文字から絵文字への変換する処理関数
            func changeAlphabetToEmoji(type:Int, alphabet:Int) {
                //文字コードをあ使うためのインスタンス作成
                var typeView = String.UnicodeScalarView()
                var alphabetView = String.UnicodeScalarView()
                //Unicodeから絵文字に変換したものを保存
                typeView.append(UnicodeScalar(encryptTypeDic[type]!)!)
                alphabetView.append(UnicodeScalar(alphabetDic[alphabet]!)!)
                //unicodeから絵文字にえ変換したものをアウトプットする
                alphabetToEmojiTypeString = (String(typeView))
                alphabetToEmojiString = (String(alphabetView))
                }
    
    //絵文字を文字に変更
    func changeEmojiToAlphabet(inputEmojiType:Int, inputEmoji:Int) -> String {
        //出力する絵文字を格納する配列をuserdefaultから引き出す処理
        let inputKeyUnicodeStringArray:[Int] = UserDefaults.standard.array(forKey: "inputKeyUnicodeArray") as! [Int]
        //暗号化に使用するtypeを辞書に格納
        decryptTypelDic[300] = inputKeyUnicodeStringArray[5]
        decryptTypelDic[301] = inputKeyUnicodeStringArray[6]
        //入力された文字のnunicodeと一致するものを探す
        var encryptEmoji = 0
        for (key, value) in alphabetDic {
            if value == inputEmoji {
                encryptEmoji =  key
                break
            }
        }
        //入力された文字のnunicodeと一致するものを探す
        var encryptType = 0
        for (key, value) in decryptTypelDic {
            if value == inputEmojiType {
                encryptType =  key
                break
            }
        }
        //入力された絵文字と一致する文字を返す
        emojiToAlphabetString = ""
        switch (encryptType, encryptEmoji) {
            case (300, 310):
                emojiToAlphabetString = "A"
            case (300, 311):
                emojiToAlphabetString = "B"
            case (300, 312):
                emojiToAlphabetString = "C"
            case (300, 313):
                emojiToAlphabetString = "D"
            case (300, 314):
                emojiToAlphabetString = "E"
            case (300, 315):
                emojiToAlphabetString = "F"
            case (300, 316):
                emojiToAlphabetString = "G"
            case (300, 317):
                emojiToAlphabetString = "H"
            case (300, 318):
                emojiToAlphabetString = "I"
            case (300, 319):
                emojiToAlphabetString = "J"
            case (300, 320):
                emojiToAlphabetString = "K"
            case (300, 321):
                emojiToAlphabetString = "L"
            case (300, 322):
                emojiToAlphabetString = "M"
            case (300, 323):
                emojiToAlphabetString = "N"
            case (300, 324):
                emojiToAlphabetString = "O"
            case (300, 325):
                emojiToAlphabetString = "P"
            case (300, 326):
                emojiToAlphabetString = "Q"
            case (300, 327):
                emojiToAlphabetString = "R"
            case (300, 328):
                emojiToAlphabetString = "S"
            case (300, 329):
                emojiToAlphabetString = "T"
            case (300, 330):
                emojiToAlphabetString = "U"
            case (300, 331):
                emojiToAlphabetString = "V"
            case (300, 332):
                emojiToAlphabetString = "W"
            case (300, 333):
                emojiToAlphabetString = "X"
            case (300, 334):
                emojiToAlphabetString = "Y"
            case (300, 335):
                emojiToAlphabetString = "Z"
            
            case (301, 310):
                emojiToAlphabetString = "a"
            case (301, 311):
                emojiToAlphabetString = "b"
            case (301, 312):
                emojiToAlphabetString = "c"
            case (301, 313):
                emojiToAlphabetString = "d"
            case (301, 314):
                emojiToAlphabetString = "e"
            case (301, 315):
                emojiToAlphabetString = "f"
            case (301, 316):
                emojiToAlphabetString = "g"
            case (301, 317):
                emojiToAlphabetString = "h"
            case (301, 318):
                emojiToAlphabetString = "i"
            case (301, 319):
                emojiToAlphabetString = "j"
            case (301, 320):
                emojiToAlphabetString = "k"
            case (301, 321):
                emojiToAlphabetString = "l"
            case (301, 322):
                emojiToAlphabetString = "m"
            case (301, 323):
                emojiToAlphabetString = "n"
            case (301, 324):
                emojiToAlphabetString = "o"
            case (301, 325):
                emojiToAlphabetString = "p"
            case (301, 326):
                emojiToAlphabetString = "q"
            case (301, 327):
                emojiToAlphabetString = "r"
            case (301, 328):
                emojiToAlphabetString = "s"
            case (301, 329):
                emojiToAlphabetString = "t"
            case (301, 330):
                emojiToAlphabetString = "u"
            case (301, 331):
                emojiToAlphabetString = "v"
            case (301, 332):
                emojiToAlphabetString = "w"
            case (301, 333):
                emojiToAlphabetString = "x"
            case (301, 334):
                emojiToAlphabetString = "y"
            case (301, 335):
                emojiToAlphabetString = "z"
            default:
                    break
        }
        return emojiToAlphabetString
        }
    
}

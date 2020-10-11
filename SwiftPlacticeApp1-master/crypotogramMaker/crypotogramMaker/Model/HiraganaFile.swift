//
//  HiraganaFile.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class Hiragana {
    //実行されたかどうかの処理
    var changeHiraganaCounter = 0
    //絵文字から文字に変換する時に使用する数字の格納
    var hiraganaToEmojiVowelNumber = Int()
    var hiraganaToEmojiConsonantNumber = Int()
    //絵文字に変換された文字を格納する辞書
    var hiraganaToEmojiConsonantString = String()
    var hiraganaToEmojiVowelString = String()
    //絵文字からひらがなに変換された文字を格納する辞書
    var emojiToHiraganaString = String()
    //暗号化に使用する母音
    var encryptVowelDic:[Int:Int] = [:]
    //復号化に使用する母音
    var decryptVowelDic:[Int:Int] = [:]
    //ひらがなの子音
    var hiraganaConsonantDic:[Int:Int] = [110:128511, 111:128512, 112:128515, 113:128516, 114:128513, 115:128518, 116:128517, 117:128514, 118:129315, 119:128536, 120:128522, 121:128519, 122:128578, 123:128579, 124:128521, 125:128524, 126:128525, 127:129392]
    
    //入力されたひらがなをvowelDic、consonantDicに変換する関数
    func hiraganaToEmoji(inputHiragana:String) -> (changeHiraganaCounter:Int, hiraganaToEmojiVowelNumber:Int, hiraganaToEmojiConsonantNumber:Int, hiraganaToEmojiConsonantString:String, hiraganaToEmojiVowelString:String) {
    
        //出力する絵文字を格納する配列をuserdefaultから引き出す処理
        let encryptVowelStringArray:[Int] = UserDefaults.standard.array(forKey: "encryptVowelStringArray") as! [Int]
        //暗号化に使用する母音を辞書に格納
        encryptVowelDic[100] = encryptVowelStringArray[0]
        encryptVowelDic[101] = encryptVowelStringArray[1]
        encryptVowelDic[102] = encryptVowelStringArray[2]
        encryptVowelDic[103] = encryptVowelStringArray[3]
        encryptVowelDic[104] = encryptVowelStringArray[4]
        encryptVowelDic[105] = 129356
        //1文字ずつ初期化
        var vowel = 0
        var consonant = 0
        changeHiraganaCounter = 0
        //入力された文字から該当する絵文字を引き出すkeyを発行
        switch inputHiragana {
            case "あ":
                vowel = 100; consonant = 110
            case "い":
                vowel = 101; consonant = 110
            case "う":
                vowel = 102; consonant = 110
            case "え":
                vowel = 103; consonant = 110
            case "お":
                vowel = 104; consonant = 110
                
            case "か":
                vowel = 100; consonant = 111
            case "き":
                vowel = 101; consonant = 111
            case "く":
                vowel = 102; consonant = 111
            case "け":
                vowel = 103; consonant = 111
            case "こ":
                vowel = 104; consonant = 111
                
            case "さ":
                vowel = 100; consonant = 112
            case "し":
                vowel = 101; consonant = 112
            case "す":
                vowel = 102; consonant = 112
            case "せ":
                vowel = 103; consonant = 112
            case "そ":
                vowel = 104; consonant = 112
                
            case "た":
                vowel = 100; consonant = 113
            case "ち":
                vowel = 101; consonant = 113
            case "つ":
                vowel = 102; consonant = 113
            case "て":
                vowel = 103; consonant = 113
            case "と":
                vowel = 104; consonant = 113
                
            case "な":
                vowel = 100; consonant = 114
            case "に":
                vowel = 101; consonant = 114
            case "ぬ":
                vowel = 102; consonant = 114
            case "ね":
                vowel = 103; consonant = 114
            case "の":
                vowel = 104; consonant = 114
                
            case "は":
                vowel = 100; consonant = 115
            case "ひ":
                vowel = 101; consonant = 115
            case "ふ":
                vowel = 102; consonant = 115
            case "へ":
                vowel = 103; consonant = 115
            case "ほ":
                vowel = 104; consonant = 115
                
            case "ま":
                vowel = 100; consonant = 116
            case "み":
                vowel = 101; consonant = 116
            case "む":
                vowel = 102; consonant = 116
            case "め":
                vowel = 103; consonant = 116
            case "も":
                vowel = 104; consonant = 116
                
            case "や":
                vowel = 100; consonant = 117
            case "ゆ":
                vowel = 102; consonant = 117
            case "よ":
                vowel = 104; consonant = 117
                
            case "ら":
                vowel = 100; consonant = 118
            case "り":
                vowel = 101; consonant = 118
            case "る":
                vowel = 102; consonant = 118
            case "れ":
                vowel = 103; consonant = 118
            case "ろ":
                vowel = 104; consonant = 118
                
            case "わ":
                vowel = 100; consonant = 119
            case "を":
                vowel = 104; consonant = 119
                
            case "ん":
                vowel = 105; consonant = 110
                
            case "が":
                vowel = 100; consonant = 120
            case "ぎ":
                vowel = 101; consonant = 120
            case "ぐ":
                vowel = 102; consonant = 120
            case "げ":
                vowel = 103; consonant = 120
            case "ご":
                vowel = 104; consonant = 120
                
            case "ざ":
                vowel = 100; consonant = 121
            case "じ":
                vowel = 101; consonant = 121
            case "ず":
                vowel = 102; consonant = 121
            case "ぜ":
                vowel = 103; consonant = 121
            case "ぞ":
                vowel = 104; consonant = 121
                
            case "だ":
                vowel = 100; consonant = 122
            case "ぢ":
                vowel = 101; consonant = 122
            case "づ":
                vowel = 102; consonant = 122
            case "で":
                vowel = 103; consonant = 122
            case "ど":
                vowel = 104; consonant = 122
                
            case "ば":
                vowel = 100; consonant = 123
            case "び":
                vowel = 101; consonant = 123
            case "ぶ":
                vowel = 102; consonant = 123
            case "べ":
                vowel = 103; consonant = 123
            case "ぼ":
                vowel = 104; consonant = 123
                
            case "ぁ":
                vowel = 100; consonant = 124
            case "ぃ":
                vowel = 101; consonant = 124
            case "ぅ":
                vowel = 102; consonant = 124
            case "ぇ":
                vowel = 103; consonant = 124
            case "ぉ":
                vowel = 104; consonant = 124
                
            case "ゃ":
                vowel = 100; consonant = 125
            case "ゅ":
                vowel = 102; consonant = 125
            case "ょ":
                vowel = 104; consonant = 125
                
            case "っ":
                vowel = 102; consonant = 126
                
            case "ぱ":
                vowel = 100; consonant = 127
            case "ぴ":
                vowel = 101; consonant = 127
            case "ぷ":
                vowel = 102; consonant = 127
            case "ぺ":
                vowel = 103; consonant = 127
            case "ぽ":
                vowel = 104; consonant = 127
            default:
                break
            }
        if vowel == 0 && consonant == 0 {
             return (changeHiraganaCounter, 0, 0, "", "")
        }
        //文字から絵文字への変換する処理関数へ値わたし
        changeHiraganaToEmoji(vowel: vowel, consonant: consonant)
        //ひらがなの暗号化をしたフラグ
        changeHiraganaCounter += 1
        return (changeHiraganaCounter, hiraganaToEmojiVowelNumber, hiraganaToEmojiConsonantNumber, hiraganaToEmojiConsonantString, hiraganaToEmojiVowelString)
        }
        
     //文字から絵文字への変換する処理関数
        func changeHiraganaToEmoji(vowel:Int, consonant:Int) {
            //文字コードをあ使うためのインスタンス作成
            var vowelView = String.UnicodeScalarView()
            var consonantView = String.UnicodeScalarView()
            //Unicodeから絵文字に変換したものを保存
            vowelView.append(UnicodeScalar(encryptVowelDic[vowel]!)!)
            consonantView.append(UnicodeScalar(hiraganaConsonantDic[consonant]!)!)
            //unicodeから絵文字にえ変換したものをアウトプットする
            hiraganaToEmojiConsonantString = (String(consonantView))
            hiraganaToEmojiVowelString = (String(vowelView))
        }
    
    //絵文字を文字に変更
    func changeEmojiToHiragana(inputEmojiVowel:Int, inputEmojiConsonant:Int) -> String {
        //出力する絵文字を格納する配列をuserdefaultから引き出す処理
        let inputKeyUnicodeStringArray:[Int] = UserDefaults.standard.array(forKey: "inputKeyUnicodeArray") as! [Int]
        //暗号化に使用するば母音を辞書に格納
        decryptVowelDic[100] = inputKeyUnicodeStringArray[0]
        decryptVowelDic[101] = inputKeyUnicodeStringArray[1]
        decryptVowelDic[102] = inputKeyUnicodeStringArray[2]
        decryptVowelDic[103] = inputKeyUnicodeStringArray[3]
        decryptVowelDic[104] = inputKeyUnicodeStringArray[4]
        decryptVowelDic[105] = 129356
        //入力された文字のnunicodeと一致するものを探す
        var encryptConsonant = 0
        //ひらがなの子音が格納された辞書からkeyとvalueを取り出してい入力された文字と一致するかどうか確認
        for (key, value) in hiraganaConsonantDic {
            if value == inputEmojiConsonant {
                encryptConsonant =  key
                break
            }
        }
        //ひらがなの母音が格納された辞書からkeyとvalueを取り出してい入力された文字と一致するかどうか確認
        var encryptVowel = 0
        for (key, value) in decryptVowelDic {
            if value == inputEmojiVowel {
                encryptVowel =  key
                break
            }
        }
        //入力された絵文字と一致する文字を返す
        emojiToHiraganaString = ""
        switch (encryptVowel, encryptConsonant) {
                case (100, 110):
                    emojiToHiraganaString = "あ"
                case (101, 110):
                    emojiToHiraganaString = "い"
                case (102, 110):
                    emojiToHiraganaString = "う"
                case (103, 110):
                    emojiToHiraganaString = "え"
                case (104, 110):
                    emojiToHiraganaString = "お"
                case (105, 110):
                    emojiToHiraganaString = "ん"
                
                case (100, 111):
                    emojiToHiraganaString = "か"
                case (101, 111):
                    emojiToHiraganaString = "き"
                case (102, 111):
                    emojiToHiraganaString = "く"
                case (103, 111):
                    emojiToHiraganaString = "け"
                case (104, 111):
                    emojiToHiraganaString = "こ"
                       
                case (100, 112):
                    emojiToHiraganaString = "さ"
                case (101, 112):
                    emojiToHiraganaString = "し"
                case (102, 112):
                    emojiToHiraganaString = "す"
                case (103, 112):
                    emojiToHiraganaString = "せ"
                case (104, 112):
                    emojiToHiraganaString = "そ"
                    
                case (100, 113):
                    emojiToHiraganaString = "た"
                case (101, 113):
                    emojiToHiraganaString = "ち"
                case (102, 113):
                    emojiToHiraganaString = "つ"
                case (103, 113):
                    emojiToHiraganaString = "て"
                case (104, 113):
                    emojiToHiraganaString = "と"
                    
                case (100, 114):
                    emojiToHiraganaString = "な"
                case (101, 114):
                    emojiToHiraganaString = "に"
                case (102, 114):
                    emojiToHiraganaString = "ぬ"
                case (103, 114):
                    emojiToHiraganaString = "ね"
                case (104, 114):
                    emojiToHiraganaString = "の"
                    
                case (100, 115):
                    emojiToHiraganaString = "は"
                case (101, 115):
                    emojiToHiraganaString = "ひ"
                case (102, 115):
                    emojiToHiraganaString = "ふ"
                case (103, 115):
                    emojiToHiraganaString = "へ"
                case (104, 115):
                    emojiToHiraganaString = "ほ"
                    
                case (100, 116):
                    emojiToHiraganaString = "ま"
                case (101, 116):
                    emojiToHiraganaString = "み"
                case (102, 116):
                    emojiToHiraganaString = "む"
                case (103, 116):
                    emojiToHiraganaString = "め"
                case (104, 116):
                    emojiToHiraganaString = "も"
                       
                case (100, 117):
                    emojiToHiraganaString = "や"
                case (102, 117):
                    emojiToHiraganaString = "ゆ"
                case (104, 117):
                    emojiToHiraganaString = "よ"
                
                case (100, 118):
                    emojiToHiraganaString = "ら"
                case (101, 118):
                    emojiToHiraganaString = "り"
                case (102, 118):
                    emojiToHiraganaString = "る"
                case (103, 118):
                    emojiToHiraganaString = "れ"
                case (104, 118):
                    emojiToHiraganaString = "ろ"
                       
                case (100, 119):
                    emojiToHiraganaString = "わ"
                case (104, 119):
                    emojiToHiraganaString = "を"
                       
                case (100, 120):
                    emojiToHiraganaString = "が"
                case (101, 120):
                    emojiToHiraganaString = "ぎ"
                case (102, 120):
                    emojiToHiraganaString = "ぐ"
                case (103, 120):
                    emojiToHiraganaString = "げ"
                case (104, 120):
                    emojiToHiraganaString = "ご"
                    
                case (100, 121):
                    emojiToHiraganaString = "ざ"
                case (101, 121):
                    emojiToHiraganaString = "じ"
                case (102, 121):
                    emojiToHiraganaString = "ず"
                case (103, 121):
                    emojiToHiraganaString = "ぜ"
                case (104, 121):
                    emojiToHiraganaString = "ぞ"
                    
                case (100, 122):
                    emojiToHiraganaString = "だ"
                case (101, 122):
                    emojiToHiraganaString = "ぢ"
                case (102, 122):
                    emojiToHiraganaString = "づ"
                case (103, 122):
                    emojiToHiraganaString = "で"
                case (104, 122):
                    emojiToHiraganaString = "ど"
                
                case (100, 123):
                    emojiToHiraganaString = "ば"
                case (101, 123):
                    emojiToHiraganaString = "び"
                case (102, 123):
                    emojiToHiraganaString = "ぶ"
                case (103, 123):
                    emojiToHiraganaString = "べ"
                case (104, 123):
                    emojiToHiraganaString = "ぼ"
                
                case (100, 124):
                    emojiToHiraganaString = "ぁ"
                case (101, 124):
                    emojiToHiraganaString = "ぃ"
                case (102, 124):
                    emojiToHiraganaString = "ぅ"
                case (103, 124):
                    emojiToHiraganaString = "ぇ"
                case (104, 124):
                    emojiToHiraganaString = "ぉ"
                
                case (100, 125):
                    emojiToHiraganaString = "ゃ"
                case (102, 125):
                    emojiToHiraganaString = "ゅ"
                case (104, 125):
                    emojiToHiraganaString = "ょ"
                
                case (102, 126):
                    emojiToHiraganaString = "っ"
                
                case (100, 127):
                    emojiToHiraganaString = "ぱ"
                case (101, 127):
                    emojiToHiraganaString = "ぴ"
                case (102, 127):
                    emojiToHiraganaString = "ぷ"
                case (103, 127):
                    emojiToHiraganaString = "ぺ"
                case (104, 127):
                    emojiToHiraganaString = "ぽ"
                default:
                    break
                   }
        return emojiToHiraganaString
               }
    
}

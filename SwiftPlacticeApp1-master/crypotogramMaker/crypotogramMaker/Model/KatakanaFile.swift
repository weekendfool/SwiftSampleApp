//
//  HiraganaFile.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class Katakana{
    //実行されたかどうかの処理
    var changeKatakanaCounter = 0
    //絵文字から文字に変換する時に使用する数字の格納
    var katakanaToEmojiVowelNumber = Int()
    var katakanaToEmojiConsonantNumber = Int()
    //絵文字に変換された文字を格納する辞書
    var katakanaToEmojiConsonantString = String()
    var katakanaToEmojiVowelString = String()
    //カタカナに変換された文字を格納する辞書
    var emojiToKatakanaString = String()
    //暗号化に使用する母音
    var encryptVowelDic:[Int:Int] = [:]
    //復号化に使用する母音
    var decryptVowelDic:[Int:Int] = [:]
    //カタカナの子音を辞書に入れておく
    var katakanaConsonantDic:[Int:Int] = [210:128176, 211:128539, 212:128541, 213:128540, 214:129322, 215:129320, 216:129488, 217:129299, 218:128526, 219:129321, 220:129395, 221:128527, 222:128530, 223:128542, 224:128532, 225:128543, 226:128533, 227:128548]
    
    //入力されたひらがなをvowelDic、consonantDicに変換する関数
    func katakanaToEmoji(inputKatakana:String) -> (changeKatakanaCounter:Int, katakanaToEmojiVowelNumber:Int, katakanaToEmojiConsonantNumber:Int, katakanaToEmojiConsonantString:String, katakanaToEmojiVowelString:String) {
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
        changeKatakanaCounter = 0
        //入力された文字から該当する絵文字を引き出すkeyを発行
        switch inputKatakana {
            case "ア":
                vowel = 100; consonant = 210
            case "イ":
                vowel = 101; consonant = 210
            case "ウ":
                vowel = 102; consonant = 210
            case "エ":
                vowel = 103; consonant = 210
            case "オ":
                vowel = 104; consonant = 210
                    
            case "カ":
                vowel = 100; consonant = 211
            case "キ":
                vowel = 101; consonant = 211
            case "ク":
                vowel = 102; consonant = 211
            case "ケ":
                vowel = 103; consonant = 211
            case "コ":
                vowel = 104; consonant = 211
                    
            case "サ":
                vowel = 100; consonant = 212
            case "シ":
                vowel = 101; consonant = 212
            case "ス":
                vowel = 102; consonant = 212
            case "セ":
                vowel = 103; consonant = 212
            case "ソ":
                vowel = 104; consonant = 212
                    
            case "タ":
                vowel = 100; consonant = 213
            case "チ":
                vowel = 101; consonant = 213
            case "ツ":
                vowel = 102; consonant = 213
            case "テ":
                vowel = 103; consonant = 213
            case "ト":
                vowel = 104; consonant = 213
                
            case "ナ":
                vowel = 100; consonant = 214
            case "ニ":
                vowel = 101; consonant = 214
            case "ヌ":
                vowel = 102; consonant = 214
            case "ネ":
                vowel = 103; consonant = 214
            case "ノ":
                vowel = 104; consonant = 214
                
            case "ハ":
                vowel = 100; consonant = 215
            case "ヒ":
                vowel = 101; consonant = 215
            case "フ":
                vowel = 102; consonant = 215
            case "ヘ":
                vowel = 103; consonant = 215
            case "ホ":
                vowel = 104; consonant = 215
                    
            case "マ":
                vowel = 100; consonant = 216
            case "ミ":
                vowel = 101; consonant = 216
            case "ム":
                vowel = 102; consonant = 216
            case "メ":
                vowel = 103; consonant = 216
            case "モ":
                vowel = 104; consonant = 216
                    
            case "ヤ":
                vowel = 100; consonant = 217
            case "ユ":
                vowel = 102; consonant = 217
            case "ヨ":
                vowel = 104; consonant = 217
                    
            case "ラ":
                vowel = 100; consonant = 218
            case "リ":
                vowel = 101; consonant = 218
            case "ル":
                vowel = 102; consonant = 218
            case "レ":
                vowel = 103; consonant = 218
            case "ロ":
                vowel = 104; consonant = 218
                    
            case "ワ":
                vowel = 100; consonant = 219
            case "ヲ":
                vowel = 104; consonant = 219
                    
            case "ン":
                vowel = 105; consonant = 210
                    
            case "ガ":
                vowel = 100; consonant = 220
            case "ギ":
                vowel = 101; consonant = 220
            case "グ":
                vowel = 102; consonant = 220
            case "ゲ":
                vowel = 103; consonant = 220
            case "ゴ":
                vowel = 104; consonant = 220
                    
            case "ザ":
                vowel = 100; consonant = 221
            case "ジ":
                vowel = 101; consonant = 221
            case "ズ":
                vowel = 102; consonant = 221
            case "ゼ":
                vowel = 103; consonant = 221
            case "ゾ":
                vowel = 104; consonant = 221
                    
            case "ダ":
                vowel = 100; consonant = 222
            case "ヂ":
                vowel = 101; consonant = 222
            case "ヅ":
                vowel = 102; consonant = 222
            case "デ":
                vowel = 103; consonant = 222
            case "ド":
                vowel = 104; consonant = 222
                    
            case "バ":
                vowel = 100; consonant = 223
            case "ビ":
                vowel = 101; consonant = 223
            case "ブ":
                vowel = 102; consonant = 223
            case "ベ":
                vowel = 103; consonant = 223
            case "ボ":
                vowel = 104; consonant = 223
                    
            case "ァ":
                vowel = 100; consonant = 224
            case "ィ":
                vowel = 101; consonant = 224
            case "ゥ":
                vowel = 102; consonant = 224
            case "ェ":
                vowel = 103; consonant = 224
            case "ォ":
                vowel = 104; consonant = 224
                    
            case "ャ":
                vowel = 100; consonant = 225
            case "ュ":
                vowel = 102; consonant = 225
            case "ョ":
                vowel = 104; consonant = 225
                    
            case "ッ":
                vowel = 102; consonant = 226
                
            case "パ":
                vowel = 100; consonant = 227
            case "ピ":
                vowel = 101; consonant = 227
            case "プ":
                vowel = 102; consonant = 227
            case "ペ":
                vowel = 103; consonant = 227
            case "ポ":
                vowel = 104; consonant = 227
            default:
                break
                }
            
            if vowel == 0 && consonant == 0 {
                return (changeKatakanaCounter, 0, 0, "", "")
            }
            //文字から絵文字への変換する処理関数へ値わたし
            changekatakanaToEmoji(vowel: vowel, consonant: consonant)
        //ひらがなの暗号化をしたフラグ
            changeKatakanaCounter += 1
            return (changeKatakanaCounter, katakanaToEmojiVowelNumber, katakanaToEmojiConsonantNumber, katakanaToEmojiConsonantString, katakanaToEmojiVowelString)
        }
            
         //文字から絵文字への変換する処理関数
            func changekatakanaToEmoji(vowel:Int, consonant:Int) {
                //文字コードをあ使うためのインスタンス作成
                var vowelView = String.UnicodeScalarView()
                var consonantView = String.UnicodeScalarView()
                //Unicodeから絵文字に変換したものを保存
                vowelView.append(UnicodeScalar(encryptVowelDic[vowel]!)!)
                consonantView.append(UnicodeScalar(katakanaConsonantDic[consonant]!)!)
                //unicodeから絵文字にえ変換したものをアウトプットする
                katakanaToEmojiConsonantString = (String(consonantView))
                katakanaToEmojiVowelString = (String(vowelView))
            }
        
        //絵文字を文字に変更
        func changeEmojiToKatakana(inputEmojiVowel:Int, inputEmojiConsonant:Int) -> String {
            //出力する絵文字を格納する配列をuserdefaultから引き出す処理
            let inputKeyUnicodeArray:[Int] = UserDefaults.standard.array(forKey: "inputKeyUnicodeArray") as! [Int]
            //暗号化に使用するば母音を辞書に格納
            decryptVowelDic[100] = inputKeyUnicodeArray[0]
            decryptVowelDic[101] = inputKeyUnicodeArray[1]
            decryptVowelDic[102] = inputKeyUnicodeArray[2]
            decryptVowelDic[103] = inputKeyUnicodeArray[3]
            decryptVowelDic[104] = inputKeyUnicodeArray[4]
            decryptVowelDic[105] = 129356
            //入力された文字のnunicodeと一致するものを探す
            var encryptConsonant = 0
            for (key, value) in katakanaConsonantDic {
                if value == inputEmojiConsonant {
                    encryptConsonant =  key
                    break
                }
            }
            //カタカナの子音が格納された辞書からkeyとvalueを取り出してい入力された文字と一致するかどうか確認
            var encryptVowel = 0
            for (key, value) in decryptVowelDic {
                if value == inputEmojiVowel {
                    encryptVowel =  key
                    break
                }
            }
            //入力された絵文字と一致する文字を返す
            emojiToKatakanaString = ""
                switch (encryptVowel, encryptConsonant) {
                    case (100, 210):
                        emojiToKatakanaString = "ア"
                    case (101, 210):
                        emojiToKatakanaString = "イ"
                    case (102, 210):
                        emojiToKatakanaString = "ウ"
                    case (103, 210):
                        emojiToKatakanaString = "エ"
                    case (104, 210):
                        emojiToKatakanaString = "オ"
                    case (105, 210):
                        emojiToKatakanaString = "ン"
                    
                    case (100, 211):
                        emojiToKatakanaString = "カ"
                    case (101, 211):
                        emojiToKatakanaString = "キ"
                    case (102, 211):
                        emojiToKatakanaString = "ク"
                    case (103, 211):
                        emojiToKatakanaString = "ケ"
                    case (104, 211):
                        emojiToKatakanaString = "コ"
                           
                    case (100, 212):
                        emojiToKatakanaString = "サ"
                    case (101, 212):
                        emojiToKatakanaString = "シ"
                    case (102, 212):
                        emojiToKatakanaString = "ス"
                    case (103, 212):
                        emojiToKatakanaString = "セ"
                    case (104, 212):
                        emojiToKatakanaString = "ソ"
                        
                    case (100, 213):
                        emojiToKatakanaString = "タ"
                    case (101, 213):
                        emojiToKatakanaString = "チ"
                    case (102, 213):
                        emojiToKatakanaString = "ツ"
                    case (103, 213):
                        emojiToKatakanaString = "テ"
                    case (104, 213):
                        emojiToKatakanaString = "ト"
                        
                    case (100, 214):
                        emojiToKatakanaString = "ナ"
                    case (101, 214):
                        emojiToKatakanaString = "ニ"
                    case (102, 214):
                        emojiToKatakanaString = "ヌ"
                    case (103, 214):
                        emojiToKatakanaString = "ネ"
                    case (104, 214):
                        emojiToKatakanaString = "ノ"
                        
                    case (100, 215):
                        emojiToKatakanaString = "ハ"
                    case (101, 215):
                        emojiToKatakanaString = "ヒ"
                    case (102, 215):
                        emojiToKatakanaString = "フ"
                    case (103, 215):
                        emojiToKatakanaString = "ヘ"
                    case (104, 215):
                        emojiToKatakanaString = "ホ"
                        
                    case (100, 216):
                        emojiToKatakanaString = "マ"
                    case (101, 216):
                        emojiToKatakanaString = "ミ"
                    case (102, 216):
                        emojiToKatakanaString = "ム"
                    case (103, 216):
                        emojiToKatakanaString = "メ"
                    case (104, 216):
                        emojiToKatakanaString = "モ"
                           
                    case (100, 217):
                        emojiToKatakanaString = "ヤ"
                    case (102, 217):
                        emojiToKatakanaString = "ユ"
                    case (104, 217):
                        emojiToKatakanaString = "ヨ"
                    
                    case (100, 218):
                        emojiToKatakanaString = "ラ"
                    case (101, 218):
                        emojiToKatakanaString = "リ"
                    case (102, 218):
                        emojiToKatakanaString = "ル"
                    case (103, 218):
                        emojiToKatakanaString = "レ"
                    case (104, 218):
                        emojiToKatakanaString = "ロ"
                           
                    case (100, 219):
                        emojiToKatakanaString = "ワ"
                    case (104, 219):
                        emojiToKatakanaString = "ヲ"
                           
                    case (100, 220):
                        emojiToKatakanaString = "ガ"
                    case (101, 220):
                        emojiToKatakanaString = "ギ"
                    case (102, 220):
                        emojiToKatakanaString = "グ"
                    case (103, 220):
                        emojiToKatakanaString = "ゲ"
                    case (104, 220):
                        emojiToKatakanaString = "ゴ"
                        
                    case (100, 220):
                        emojiToKatakanaString = "ザ"
                    case (101, 220):
                        emojiToKatakanaString = "ジ"
                    case (102, 220):
                        emojiToKatakanaString = "ズ"
                    case (103, 220):
                        emojiToKatakanaString = "ゼ"
                    case (104, 220):
                        emojiToKatakanaString = "ゾ"
                        
                    case (100, 222):
                        emojiToKatakanaString = "ダ"
                    case (101, 222):
                        emojiToKatakanaString = "ヂ"
                    case (102, 222):
                        emojiToKatakanaString = "ヅ"
                    case (103, 222):
                        emojiToKatakanaString = "デ"
                    case (104, 222):
                        emojiToKatakanaString = "ド"
                    
                    case (100, 223):
                        emojiToKatakanaString = "バ"
                    case (101, 223):
                        emojiToKatakanaString = "ビ"
                    case (102, 223):
                        emojiToKatakanaString = "ブ"
                    case (103, 223):
                        emojiToKatakanaString = "ベ"
                    case (104, 223):
                        emojiToKatakanaString = "ボ"
                    
                    case (100, 224):
                        emojiToKatakanaString = "ァ"
                    case (101, 224):
                        emojiToKatakanaString = "ィ"
                    case (102, 224):
                        emojiToKatakanaString = "ゥ"
                    case (103, 224):
                        emojiToKatakanaString = "ェ"
                    case (104, 224):
                        emojiToKatakanaString = "ォ"
                    
                    case (100, 225):
                        emojiToKatakanaString = "ャ"
                    case (102, 225):
                        emojiToKatakanaString = "ュ"
                    case (104, 225):
                        emojiToKatakanaString = "ョ"
                    
                    case (102, 226):
                        emojiToKatakanaString = "ッ"
                    
                    case (100, 227):
                        emojiToKatakanaString = "パ"
                    case (101, 227):
                        emojiToKatakanaString = "ピ"
                    case (102, 227):
                        emojiToKatakanaString = "プ"
                    case (103, 227):
                        emojiToKatakanaString = "ペ"
                    case (104, 227):
                        emojiToKatakanaString = "ポ"
                    default:
                        break
                       }
            return emojiToKatakanaString
                   }

    }

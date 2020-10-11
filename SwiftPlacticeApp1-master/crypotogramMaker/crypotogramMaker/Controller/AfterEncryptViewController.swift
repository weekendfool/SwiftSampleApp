//
//  AfterEncryptViewController.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/16.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class AfterEncryptViewController: UIViewController {
    
    
    @IBOutlet weak var showEncryptTextView: UITextView!
    @IBOutlet weak var showKeyLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var selfCheckButton: UIButton!
    @IBOutlet weak var shareEncryptTextButton: UIButton!
    @IBOutlet weak var shareKeyButton: UIButton!
    
    //インスタンス作成
    var changeHiragana = Hiragana()
    var changeKatakana = Katakana()
    var changeNumber = Number()
    var changeAlphabet = Alphabet()
    //出力する絵文字を格納する配列
    var encryptStringArray:[String] = []
    //絵文字に変換した文を表示するための変数
    var outnputEncryptString = ""
    //解読Kyeを格納しておく配列
    var keyArray:[Any] = []
    //string型の解読Kyeを格納しておく配列
    var stringKeyArray:[String] = []
    //解読Kyeを表示するための変数
    var outputkeyString = ""
    //セルフチェックのフラグ
    var selfCheck = 0
    //textViewのplaceHolderfのフラグ
    var placeHolderflag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //textViewの選択禁止処理
        showEncryptTextView.isEditable = false
        //出力する絵文字を格納する配列をuserdefaultから引き出す処理
        encryptStringArray = UserDefaults.standard.stringArray(forKey: "encryptString")!
        //出力する絵文字を変数に格納する処理
        for i in encryptStringArray {
            outnputEncryptString.append(i)
        }
        //keyを出力する
        makeKeyNumber()
        //絵文字に変換した文を表示する処理
        showEncryptTextView.text = outnputEncryptString
        //暗号化したい文が入力されている時のみ暗号化を可能にする処理
        if showKeyLabel.text! == "" {
             selfCheckButton.isEnabled = false
         } else {
             selfCheckButton.isEnabled = true
         }
    }
    
    @IBAction func goHomeButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func selfCheckButtonAction(_ sender: Any) {
        //selfCheckボタンが押されたことを感知するためにをuserdefaultに保存
        selfCheck = 1
        UserDefaults.standard.set(selfCheck, forKey: "selfCheck")
        //placeHolderflagが押されたことを感知するためにをuserdefaultに保存
        placeHolderflag = 1
        UserDefaults.standard.set(placeHolderflag, forKey: "placeHolderflag")
        //画面遷移の処理
        performSegue(withIdentifier: "goSelfCheck", sender: nil)
    }
    
    
    @IBAction func shareEncryptTextButtonAction(_ sender: Any) {
        let eccryptString = outnputEncryptString
        let controller = UIActivityViewController(activityItems: [eccryptString], applicationActivities: nil)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func shareKeyButtonAction(_ sender: Any) {
        let eccryptString = outputkeyString
        let controller = UIActivityViewController(activityItems: [eccryptString], applicationActivities: nil)
        present(controller, animated: true, completion: nil)
    }
    //Kyeを発行する関数
    func makeKeyNumber() {
        //出力するkeyを格納する配列をuserdefaultから引き出す処理
        let encryptVowelStringArray:[Int] = UserDefaults.standard.array(forKey: "encryptVowelStringArray") as! [Int]
        //何文字暗号化したかのデータをuserdefaultから引き出す処理
        let changeStringCounter = UserDefaults.standard.integer(forKey: "changeStringCounter")
        let keyNumber = Int.random(in: 0...5)
        let keyVowelANumber = encryptVowelStringArray[0]
        let keyVowelINumber = encryptVowelStringArray[1]
        let keyVowelUNumber = encryptVowelStringArray[2]
        let keyVowelENumber = encryptVowelStringArray[3]
        let keyVowelONumber = encryptVowelStringArray[4]
        let keyTypeBigNumber = encryptVowelStringArray[5]
        let keyTypeSmallNumber = encryptVowelStringArray[6]
        //解読KyeNumberを格納しておく配列
        let keyNumberArray = [keyVowelANumber, keyVowelINumber,keyVowelUNumber, keyVowelENumber, keyVowelONumber, keyTypeBigNumber, keyTypeSmallNumber]
        //keyを文字列に変換したものを格納する配列
        var keyToEmojiConsonantStringArray:[String] = []
        //keyNumberArrayを文字列に変換
        for keyNumber in keyNumberArray {
            //文字コードをあ使うためのインスタンス作成
            var keyView = String.UnicodeScalarView()
            //Unicodeから絵文字に変換したものを保存
            keyView.append(UnicodeScalar(keyNumber)!)
            //unicodeから絵文字にえ変換したものを配列に格納する
            keyToEmojiConsonantStringArray.append(String(keyView))
        }
        //string型用の変数
        let stringKeyVowelA = keyToEmojiConsonantStringArray[0]
        let stringKeyVowelI = keyToEmojiConsonantStringArray[1]
        let stringKeyVowelU = keyToEmojiConsonantStringArray[2]
        let stringKeyVowelE = keyToEmojiConsonantStringArray[3]
        let stringKeyVowelO = keyToEmojiConsonantStringArray[4]
        let stringKeyTypeBig = keyToEmojiConsonantStringArray[5]
        let stringKeyTypeSmall = keyToEmojiConsonantStringArray[6]
        //keyの先頭の数字により配列に格納する順番を変える
        switch keyNumber {
        case 0:
            stringKeyArray = [String(keyNumber), stringKeyTypeBig, stringKeyTypeSmall, stringKeyVowelA, stringKeyVowelI,stringKeyVowelU, stringKeyVowelE, stringKeyVowelO, String(changeStringCounter)]
        case 1:
            stringKeyArray = [String(keyNumber), stringKeyVowelA, stringKeyTypeBig, stringKeyTypeSmall, stringKeyVowelI,stringKeyVowelU, stringKeyVowelE, stringKeyVowelO, String(changeStringCounter)]
        case 2:
            stringKeyArray = [String(keyNumber), stringKeyVowelA, stringKeyVowelI,stringKeyTypeBig, stringKeyTypeSmall, stringKeyVowelU, stringKeyVowelE, stringKeyVowelO, String(changeStringCounter)]
        case 3:
            stringKeyArray = [String(keyNumber), stringKeyVowelA, stringKeyVowelI, stringKeyVowelU, stringKeyTypeBig, stringKeyTypeSmall, stringKeyVowelE, stringKeyVowelO, String(changeStringCounter)]
        case 4:
            stringKeyArray = [String(keyNumber), stringKeyVowelA, stringKeyVowelI, stringKeyVowelU, stringKeyVowelE, stringKeyTypeBig, stringKeyTypeSmall, stringKeyVowelO, String(changeStringCounter)]
        case 5:
            stringKeyArray = [String(keyNumber), stringKeyVowelA, stringKeyVowelI,stringKeyVowelU, stringKeyVowelE, stringKeyVowelO, stringKeyTypeBig, stringKeyTypeSmall, String(changeStringCounter)]
        default:
            return
        }
        for keyArray in stringKeyArray {
            outputkeyString.append(keyArray)
        }
        //解読kyeを出力
        showKeyLabel.text = outputkeyString
        //解読kyeをuserdefaultに保存
        UserDefaults.standard.set(outputkeyString, forKey: "outputkeyString")
    }

    
}

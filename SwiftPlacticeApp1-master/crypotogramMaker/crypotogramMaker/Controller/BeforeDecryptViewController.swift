//
//  BeforeDecryptViewController.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/16.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class BeforeDecryptViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var beforeDecryptTextView: UITextView!
    @IBOutlet weak var decryptKeyTextField: UITextField!
    @IBOutlet weak var decryptButton: UIButton!
    
    //インスタンス作成
    var changeHiragana = Hiragana()
    var changeKatakana = Katakana()
    var changeNumber = Number()
    var changeAlphabet = Alphabet()
    //出力する絵文字を格納する配列
    var encryptStringArray:[String] = []
    //変換できない文字と数字の前につけるものを格納する辞書
    var nonEncryptStringDic = [500:127754, 501:128018]
    //復号後の文字を入れる配列を作成
    var decryptionStringArray:[String] = []
    //何文字変換したかのカウンター（一文字につき数字、変換できない文字：1、その他：2）のようにカウントする
    var changeStringCounter = 0
    //解読keyをuserdefaultから引き出す処理
    var key = ""
    //復号したい文をUnicodeに変換して格納する配列
    var inputUnicodeStringArray:[Character] = []
    //復号したい文をUnicodeに変換して格納する配列
    var inputUnicodeArray:[String] = []
    //解読kyeをUnicodeに変換して格納する配列
    var inputKeyUnicodeStringArray:[Any] = []
    //入力した
    var inputStringArray:[Int] = []
    //入力したセルフチェックボタンが押された時に復号したい絵文字を入れておく変数
    var outnputEncryptString = ""
    var selfCheck = 0
    var placeHolderflag = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decryptKeyTextField.delegate = self
        //placeHolderflagが押されたことを感知するためにをuserdefaultに保存
         placeHolderflag = 1
         UserDefaults.standard.set(placeHolderflag, forKey: "placeHolderflag")
        //キーボードを閉じる時の処理
        addCloseKeyboardButton()
        if beforeDecryptTextView.text! == "" {
            decryptButton.isEnabled = false
        } else if beforeDecryptTextView.text! != "" && decryptKeyTextField.text! != "" {
            decryptButton.isEnabled = true
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //セルフチェックボタンが押された時の処理
        //格納する配列をuserdefaultから引き出す処理
        selfCheck  = UserDefaults.standard.integer(forKey: "selfCheck")
        if selfCheck == 1 {
            //出力する絵文字を格納する配列をuserdefaultから引き出す処理
            encryptStringArray = UserDefaults.standard.stringArray(forKey: "encryptString")!
            //出力する絵文字を変数に格納する処理
            for i in encryptStringArray {
                outnputEncryptString.append(i)
            }
            beforeDecryptTextView.text = outnputEncryptString
            decryptKeyTextField.text = UserDefaults.standard.string(forKey: "outputkeyString")
            //ボタンの有効無効
            decryptButton.isEnabled = true
        } else {
            decryptButton.isEnabled = false
        }
    }
    
    func startDecrypt() {
        
    
        
    }
    

    @IBAction func decryptButtonAction(_ sender: Any) {
        //ホームで復号するボタンが感知するためにをuserdefaultに保存
        selfCheck = 0
        UserDefaults.standard.set(selfCheck, forKey: "selfCheck")
        //入力が正しいかそどうかの判断
        filter()
        //入力されたkeyを取り込む
        inputKey()
        //復号処理
        decryption()
        //画面遷移の処理
        performSegue(withIdentifier: "goAfterDecryptVC", sender: nil)
        //初期化
        beforeDecryptTextView.text = ""
        decryptKeyTextField.text = ""
    }
    

    //復号する関数
    func decryption() {
        //入力した文を配列に格納
        let inputString = beforeDecryptTextView.text!
        for i in inputString {
            let text = String(i)
            inputUnicodeArray.append(text)
            inputUnicodeStringArray.append(i)
        }
       //暗号化された時に格納した数字をい一つずつ取り出す
        var countNumver = 0
        //復号化するために絵文字をUnicodeに変換し配列に格納する処理
        while countNumver < changeStringCounter {
            var unicodeNumber = 0
            for j in inputUnicodeStringArray[countNumver].unicodeScalars {
                unicodeNumber = Int(j.value)
            }
            let firstdEcryptNumber = unicodeNumber
            //変換できなかった文字に対しての場合わけ
            if firstdEcryptNumber == nonEncryptStringDic[500] {
                //変換できなかった文字の印があった場合：次に処理される変換できなかった文字をそのまま配列に代入しループ処理を飛ばす
                decryptionStringArray.append(inputUnicodeArray[countNumver + 1])
            //数字の復号処理
            } else if firstdEcryptNumber == nonEncryptStringDic[501] {
                var secondEcryptNumber = 0
                 for j in inputUnicodeStringArray[countNumver + 1].unicodeScalars {
                    //Unicodeを生成
                    secondEcryptNumber = Int(j.value)
                }
                let decryptionNumverString = changeNumber.changeEmojiToNumber(inputEmojiNumver: secondEcryptNumber)
                if decryptionNumverString != "" {
                    decryptionStringArray.append(decryptionNumverString)
                    }
                } else {
                    var secondEcryptNumber = 0
                    for j in inputUnicodeStringArray[countNumver + 1].unicodeScalars {
                        //Unicodeを生成
                        secondEcryptNumber = Int(j.value)
                    }
                    //復号するための対応する数字を関数に代入して復号する
                    let decryptionHiraganaString = changeHiragana.changeEmojiToHiragana(inputEmojiVowel: secondEcryptNumber , inputEmojiConsonant: firstdEcryptNumber)
                    let decryptionKatakanaString = changeKatakana.changeEmojiToKatakana(inputEmojiVowel: secondEcryptNumber, inputEmojiConsonant: firstdEcryptNumber)
                    let decryptionAlphabetString = changeAlphabet.changeEmojiToAlphabet(inputEmojiType: firstdEcryptNumber, inputEmoji: secondEcryptNumber)
                    //復号した文字を答えの配列に代入する
                    if decryptionHiraganaString != "" {
                        decryptionStringArray.append(decryptionHiraganaString)
                    } else if decryptionKatakanaString != "" {
                        decryptionStringArray.append(decryptionKatakanaString)
                    } else if decryptionAlphabetString != "" {
                        decryptionStringArray.append(decryptionAlphabetString)
                    }
                }
         
            countNumver += 2
        }
        //復号化に使用するkeyのデータをuserdefaultに保存
        UserDefaults.standard.set(decryptionStringArray, forKey: "decryptionStringArray")
    }
    

    
    //解読keyのパターンを判別して解読する母音に代入する処理
    func inputKey() {
        let inputKeyString = decryptKeyTextField.text
        var inputKeyStringArray:[String] = []
        var inputKeyArray:[String] = []
        var inputKeyNumber = ""
        for inputKeyString in inputKeyString! {
            inputKeyArray.append(String(inputKeyString))
        }
        var num = 0
        while num < inputKeyString!.count {
            if num >= 8 {
                inputKeyNumber.append(inputKeyArray[num])
                num += 1
            } else {
                let inputKeyString = inputKeyArray[num]
                inputKeyStringArray.append(String(inputKeyString))
                num += 1
            }
        }
        //母音とタイプを格納する変数を用意
        var keyVowelA:[Any]
        var keyVowelI:[Any]
        var keyVowelU:[Any]
        var keyVowelE:[Any]
        var keyVowelO:[Any]
        var keyTypeBig:[Any]
        var keyTypeSmall:[Any]
        //母音とタイプを格納するstring型の変数を用意
        var stringKeyVowelA = ""
        var stringKeyVowelI = ""
        var stringKeyVowelU = ""
        var stringKeyVowelE = ""
        var stringKeyVowelO = ""
        var stringKeyTypeBig = ""
        var stringKeyTypeSmall = ""
        
        switch inputKeyStringArray[0] {
        case "0":
            keyTypeBig = [inputKeyStringArray[1] as Any]; keyTypeSmall = [inputKeyStringArray[2] as Any]; keyVowelA = [inputKeyStringArray[3] as Any]; keyVowelI = [inputKeyStringArray[4] as Any]; keyVowelU = [inputKeyStringArray[5] as Any]; keyVowelE = [inputKeyStringArray[6] as Any]; keyVowelO = [inputKeyStringArray[7] as Any];
            stringKeyTypeBig = inputKeyStringArray[1]; stringKeyTypeSmall = inputKeyStringArray[2]; stringKeyVowelA = inputKeyStringArray[3]; stringKeyVowelI = inputKeyStringArray[4]; stringKeyVowelU = inputKeyStringArray[5]; stringKeyVowelE = inputKeyStringArray[6]; stringKeyVowelO = inputKeyStringArray[7]
        case "1":
            keyVowelA = [inputKeyStringArray[1] as Any]; keyTypeBig = [inputKeyStringArray[2] as Any]; keyTypeSmall = [inputKeyStringArray[3] as Any]; keyVowelI = [inputKeyStringArray[4] as Any]; keyVowelU = [inputKeyStringArray[5]as Any]; keyVowelE = [inputKeyStringArray[6] as Any]; keyVowelO = [inputKeyStringArray[7] as Any];
            stringKeyVowelA = inputKeyStringArray[1]; stringKeyTypeBig = inputKeyStringArray[2]; stringKeyTypeSmall = inputKeyStringArray[3]; stringKeyVowelI = inputKeyStringArray[4]; stringKeyVowelU = inputKeyStringArray[5]; stringKeyVowelE = inputKeyStringArray[6]; stringKeyVowelO = inputKeyStringArray[7]
        case "2":
            keyVowelA = [inputKeyStringArray[1] as Any]; keyVowelI = [inputKeyStringArray[2] as Any]; keyTypeBig = [inputKeyStringArray[3] as Any]; keyTypeSmall = [inputKeyStringArray[4] as Any]; keyVowelU = [inputKeyStringArray[5] as Any]; keyVowelE = [inputKeyStringArray[6] as Any]; keyVowelO = [inputKeyStringArray[7] as Any];
            stringKeyVowelA = inputKeyStringArray[1]; stringKeyVowelI = inputKeyStringArray[2]; stringKeyTypeBig = inputKeyStringArray[3]; stringKeyTypeSmall = inputKeyStringArray[4]; stringKeyVowelU = inputKeyStringArray[5]; stringKeyVowelE = inputKeyStringArray[6]; stringKeyVowelO = inputKeyStringArray[7]
        case "3":
            keyVowelA = [inputKeyStringArray[1] as Any]; keyVowelI = [inputKeyStringArray[2] as Any]; keyVowelU = [inputKeyStringArray[3] as Any]; keyTypeBig = [inputKeyStringArray[4] as Any]; keyTypeSmall = [inputKeyStringArray[5] as Any]; keyVowelE = [inputKeyStringArray[6] as Any]; keyVowelO = [inputKeyStringArray[7] as Any];
            stringKeyVowelA = inputKeyStringArray[1]; stringKeyVowelI = inputKeyStringArray[2]; stringKeyVowelU = inputKeyStringArray[3]; stringKeyTypeBig = inputKeyStringArray[4]; stringKeyTypeSmall = inputKeyStringArray[5]; stringKeyVowelE = inputKeyStringArray[6]; stringKeyVowelO = inputKeyStringArray[7]
        case "4":
            keyVowelA = [inputKeyStringArray[1] as Any]; keyVowelI = [inputKeyStringArray[2] as Any]; keyVowelU = [inputKeyStringArray[3] as Any]; keyVowelE = [inputKeyStringArray[4] as Any]; keyTypeBig = [inputKeyStringArray[5] as Any]; keyTypeSmall = [inputKeyStringArray[6] as Any]; keyVowelO = [inputKeyStringArray[7] as Any];
            stringKeyVowelA = inputKeyStringArray[1]; stringKeyVowelI = inputKeyStringArray[2]; stringKeyVowelU = inputKeyStringArray[3]; stringKeyVowelE = inputKeyStringArray[4]; stringKeyTypeBig = inputKeyStringArray[5]; stringKeyTypeSmall = inputKeyStringArray[6]; stringKeyVowelO = inputKeyStringArray[7]
        case "5":
            keyVowelA = [inputKeyStringArray[1] as Any]; keyVowelI = [inputKeyStringArray[2] as Any]; keyVowelU = [inputKeyStringArray[3] as Any]; keyVowelE = [inputKeyStringArray[4] as Any]; keyVowelO = [inputKeyStringArray[5] as Any]; keyTypeBig = [inputKeyStringArray[6] as Any]; keyTypeSmall = [inputKeyStringArray[7] as Any];
            stringKeyVowelA = inputKeyStringArray[1]; stringKeyVowelI = inputKeyStringArray[2]; stringKeyVowelU = inputKeyStringArray[3]; stringKeyVowelE = inputKeyStringArray[4]; stringKeyVowelO = inputKeyStringArray[5]; stringKeyTypeBig = inputKeyStringArray[6]; stringKeyTypeSmall = inputKeyStringArray[7]
        default:
            return
        }
        var inputKeyUnicodeArray:[String] = []
        //母音とタイプをUnicodeで格納する変数を用意
        let changeKeyAToString = stringKeyVowelA
        let changeKeyIToString = stringKeyVowelI
        let changeKeyUToString = stringKeyVowelU
        let changeKeyEToString = stringKeyVowelE
        let changeKeyOToString = stringKeyVowelO
        let changeKeyBigToString = stringKeyTypeBig
        let changeKeySmallToString = stringKeyTypeSmall
        
        inputKeyUnicodeArray.append(changeKeyAToString)
        inputKeyUnicodeArray.append(changeKeyIToString)
        inputKeyUnicodeArray.append(changeKeyUToString)
        inputKeyUnicodeArray.append(changeKeyEToString)
        inputKeyUnicodeArray.append(changeKeyOToString)
        inputKeyUnicodeArray.append(changeKeyBigToString)
        inputKeyUnicodeArray.append(changeKeySmallToString)
        
        var keyUnicodeArray:[Any] = []
        for m in inputKeyUnicodeArray {
            for n in m.unicodeScalars {
                let input = n.value
                keyUnicodeArray.append(input)
            }
        }
        //復号化に使用するkeyのデータをuserdefaultに保存
        UserDefaults.standard.set(keyUnicodeArray, forKey: "inputKeyUnicodeArray")
        
        inputKeyUnicodeStringArray.append(inputKeyStringArray[0] as Any)
        inputKeyUnicodeStringArray.append(keyVowelA as Any)
        inputKeyUnicodeStringArray.append(keyVowelI as Any)
        inputKeyUnicodeStringArray.append(keyVowelU as Any)
        inputKeyUnicodeStringArray.append(keyVowelE as Any)
        inputKeyUnicodeStringArray.append(keyVowelO as Any)
        inputKeyUnicodeStringArray.append(keyTypeBig as Any)
        inputKeyUnicodeStringArray.append(keyTypeSmall as Any)
        inputKeyUnicodeStringArray.append(inputKeyNumber as Any)
        //何文字復号するかの情報を代入
        changeStringCounter = Int(inputKeyNumber)!
        //復号化に使用するkeyのデータをuserdefaultに保存
        UserDefaults.standard.set(inputKeyUnicodeStringArray, forKey: "inputKeyUnicodeStringArray")
    }
    
    //絵文字のフィルター
    func filter() {
        //入力された文字を格納
        let inputBeforeDecryptTextViewString = beforeDecryptTextView.text!
        let inputDecryptKeyTextFieldString = decryptKeyTextField.text!
        //入力された文字の絵文字の数を計測
        let inputBeforeDecryptTextViewStringCounter = inputBeforeDecryptTextViewString.unicodeScalars.filter{$0.properties.isEmojiPresentation}
        let inputDecryptKeyTextFieldStringCounter = inputDecryptKeyTextFieldString.unicodeScalars.filter{$0.properties.isEmojiPresentation}
        print(inputDecryptKeyTextFieldStringCounter)
        //絵文字が入力されたらポップアップを出してボタンを押せなくする処理
        //暗号文に絵文字が1文字もないとき
        if inputBeforeDecryptTextViewStringCounter.count <= 0 {
         //暗号文のアラートを出す
            let decryptButtonActionAlert:UIAlertController = UIAlertController(title: "入力された暗号の形式が違います!", message: "もう1度入力してください!",preferredStyle: .alert)
            let decryptButtonActionAlertAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            decryptButtonActionAlert.addAction(decryptButtonActionAlertAction)
            present(decryptButtonActionAlert, animated: true, completion: nil)
            //ボタンの有効無効
            decryptButton.isEnabled = false
        //keyの絵文字が7文字ではないとき
        } else if inputDecryptKeyTextFieldStringCounter.count != 7 {
            //暗号文のアラートを出す
            let inputDecryptKeyTextFieldStringActionAlert:UIAlertController = UIAlertController(title: "解読kyeの形式が違います!", message: "もう1度入力してください!",preferredStyle: .alert)
            let inputDecryptKeyTextFieldStringAlertAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            inputDecryptKeyTextFieldStringActionAlert.addAction(inputDecryptKeyTextFieldStringAlertAction)
            present(inputDecryptKeyTextFieldStringActionAlert, animated: true, completion: nil)
            //ボタンの有効無効
            decryptButton.isEnabled = false
        //keyの文字数が9未満の時（keyは最低9文字）
        }else if inputDecryptKeyTextFieldString.count < 9 {
            //暗号文のアラートを出す
            let inputDecryptKeyTextFieldStringActionAlert:UIAlertController = UIAlertController(title: "入力された解読kyeの形式が違います!", message: "もう1度入力してください!",preferredStyle: .alert)
            let inputDecryptKeyTextFieldStringAlertAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            inputDecryptKeyTextFieldStringActionAlert.addAction(inputDecryptKeyTextFieldStringAlertAction)
            present(inputDecryptKeyTextFieldStringActionAlert, animated: true, completion: nil)
            //ボタンの有効無効
            decryptButton.isEnabled = false
        //keyの最後尾の文字数を表すchangeStringCounterとinputBeforeDecryptTextViewStringの文字数が一致していない時
        } else {
            checkKey()
        }
    }
   
    //入力されたkeyのチェック関数
    func checkKey() {
        var inputKeyArray:[String] = []
        var inputKeyNumber = ""
        //入力された文字を格納
        let inputDecryptKeyTextFieldString = decryptKeyTextField.text!
        let inputBeforeDecryptTextViewString = beforeDecryptTextView.text!
//        let inputDecryptKeyTextFieldStringCounter = inputDecryptKeyTextFieldString.unicodeScalars.filter{$0.properties.isEmojiPresentation}
        
        for inputDecryptKeyTextFieldString in inputDecryptKeyTextFieldString {
            inputKeyArray.append(String(inputDecryptKeyTextFieldString))
        }
 
        var num = 0
        while num < inputDecryptKeyTextFieldString.count {
            if num >= 8 {
                inputKeyNumber.append(inputKeyArray[num])
                num += 1
            } else {
                num += 1
            }
        }
        let string0 = inputKeyArray[0]
        let string1 = inputKeyArray[1].unicodeScalars.filter{$0.properties.isEmojiPresentation}
        let string2 = inputKeyArray[2].unicodeScalars.filter{$0.properties.isEmojiPresentation}
        let string3 = inputKeyArray[3].unicodeScalars.filter{$0.properties.isEmojiPresentation}
        let string4 = inputKeyArray[4].unicodeScalars.filter{$0.properties.isEmojiPresentation}
        let string5 = inputKeyArray[5].unicodeScalars.filter{$0.properties.isEmojiPresentation}
        let string6 = inputKeyArray[6].unicodeScalars.filter{$0.properties.isEmojiPresentation}
        let string7 = inputKeyArray[7].unicodeScalars.filter{$0.properties.isEmojiPresentation}
        let string8 = inputKeyArray[8]
        changeStringCounter = Int(inputKeyNumber)!

        //keyの先頭が0〜9でない時
        if string0 != "0" && string0 != "1" && string0 != "2" && string0 != "3" && string0 != "4" && string0 != "5" && string0 != "6" && string0 != "7" && string0 != "8" && string0 != "9" {
            //暗号文のアラートを出す
            let inputDecryptKeyTextFieldStringActionAlert:UIAlertController = UIAlertController(title: "入力された解読kyeの形式が違います!", message: "もう1度入力してください!",preferredStyle: .alert)
            let inputDecryptKeyTextFieldStringAlertAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            inputDecryptKeyTextFieldStringActionAlert.addAction(inputDecryptKeyTextFieldStringAlertAction)
            present(inputDecryptKeyTextFieldStringActionAlert, animated: true, completion: nil)
            //ボタンの有効無効
            decryptButton.isEnabled = false
        //keyの2~8が0〜9でない時
        } else if string1.count == 0 || string2.count == 0 || string3.count == 0 || string4.count == 0 || string5.count == 0 || string6.count == 0 || string7.count == 0 {
            //暗号文のアラートを出す
            let inputDecryptKeyTextFieldStringActionAlert:UIAlertController = UIAlertController(title: "入力された解読kyeの形式が違います!", message: "もう1度入力してください!",preferredStyle: .alert)
            let inputDecryptKeyTextFieldStringAlertAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            inputDecryptKeyTextFieldStringActionAlert.addAction(inputDecryptKeyTextFieldStringAlertAction)
            present(inputDecryptKeyTextFieldStringActionAlert, animated: true, completion: nil)
            //ボタンの有効無効
            decryptButton.isEnabled = false
        //keyの2~8が0〜9でない時
        } else if string8 != "0" && string8 != "1" && string8 != "2" && string8 != "3" && string8 != "4" && string8 != "5" && string8 != "6" && string8 != "7" && string8 != "8" && string8 != "9" {
            //暗号文のアラートを出す
            let inputDecryptKeyTextFieldStringActionAlert:UIAlertController = UIAlertController(title: "入力された解読kyeの形式が違います!", message: "もう1度入力してください!",preferredStyle: .alert)
            let inputDecryptKeyTextFieldStringAlertAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            inputDecryptKeyTextFieldStringActionAlert.addAction(inputDecryptKeyTextFieldStringAlertAction)
            present(inputDecryptKeyTextFieldStringActionAlert, animated: true, completion: nil)
            //ボタンの有効無効
            decryptButton.isEnabled = false
        } else if changeStringCounter != inputBeforeDecryptTextViewString.count {
        //暗号文のアラートを出す
        let inputDecryptKeyTextFieldStringActionAlert:UIAlertController = UIAlertController(title: "入力された解読kyeの形式が違います!", message: "正もう1度入力してください!",preferredStyle: .alert)
        let inputDecryptKeyTextFieldStringAlertAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        inputDecryptKeyTextFieldStringActionAlert.addAction(inputDecryptKeyTextFieldStringAlertAction)
        present(inputDecryptKeyTextFieldStringActionAlert, animated: true, completion: nil)
        //ボタンの有効無効
        decryptButton.isEnabled = false
        }
    }

    //キーボードに閉じるボタンを追加する関数
    func addCloseKeyboardButton() {
        //キーボードの上に閉じるボタンを表示するためのviewを作成する
        let custombar = UIView(frame: CGRect(x:0, y:0,width:(UIScreen.main.bounds.size.width),height:40))
        //背景色をシステムの色に近づける
        custombar.backgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 247 / 255, alpha: 1)
        //閉じるボタンの作成
        let closeButton = UIButton(frame: CGRect(x:(UIScreen.main.bounds.size.width)-80,y:0,width:100,height:40))
        closeButton.setTitle("閉じる", for: .normal)
        closeButton.setTitleColor(UIColor.blue, for:.normal)
        closeButton.addTarget(self, action:#selector(BeforeDecryptViewController.onClickCloseButton), for: .touchUpInside)
        custombar.addSubview(closeButton)
        beforeDecryptTextView.inputAccessoryView = custombar
        beforeDecryptTextView.keyboardType = .default
        beforeDecryptTextView.delegate = self
    }
    
    //閉じるボタンを押した時の挙動
    @objc func onClickCloseButton (sender: UIButton) {
           if(beforeDecryptTextView.isFirstResponder){
               beforeDecryptTextView.resignFirstResponder()
            //暗号化したい文が入力されている時のみ暗号化を可能にする処理
                   if beforeDecryptTextView.text! == "" || decryptKeyTextField.text! == "" {
                        decryptButton.isEnabled = false
                    } else if beforeDecryptTextView.text! != "" && decryptKeyTextField.text! != "" {
                        decryptButton.isEnabled = true
                    }
           }
       }
    
    //画面をタッチしたらキーボードを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.beforeDecryptTextView.isFirstResponder) || (self.decryptKeyTextField.isFirstResponder) {
            self.beforeDecryptTextView.resignFirstResponder()
            self.decryptKeyTextField.resignFirstResponder()
            //暗号化したい文が入力されている時のみ暗号化を可能にする処理
                   if beforeDecryptTextView.text! == "" {
                        decryptButton.isEnabled = false
                    } else if beforeDecryptTextView.text! != "" && decryptKeyTextField.text! != "" {
                        decryptButton.isEnabled = true
                }
        }
    }

    //textFieldのキーボードが閉じられた時に復号ボタンを押せるようにする処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        decryptKeyTextField.resignFirstResponder()
        //暗号化したい文が入力されている時のみ暗号化を可能にする処理
        if beforeDecryptTextView.text! == "" {
            decryptButton.isEnabled = false
        } else if beforeDecryptTextView.text! != "" && decryptKeyTextField.text! != "" {
            decryptButton.isEnabled = true
        }
        return true
    }
    
}


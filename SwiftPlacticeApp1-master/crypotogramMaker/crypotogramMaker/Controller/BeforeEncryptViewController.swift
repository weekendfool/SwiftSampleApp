//
//  EncryptViewController.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/16.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class BeforeEncryptViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var beforeEncryptTextView: UITextView!
    @IBOutlet weak var encryptButton: UIButton!
    
    //入力された文字を受け取る変数
    var beforeEncryptTextViewString = ""
    //変換できないものと数字の前につける絵文字のうunicodeを格納する辞書
    var nonEncryptStringDic = [500:127754, 501:128018]
    //インスタンス作成
    var changeHiragana = Hiragana()
    var changeKatakana = Katakana()
    var changeNumber = Number()
    var changeAlphabet = Alphabet()
    //出力する絵文字を格納する配列
    var encryptStringArray:[String] = []
    //何文字変換したかのカウンター（一文字につき数字、変換できない文字：1、その他：2）のようにカウントする
    var changeStringCounter = 0
    //出力する解読keyの絵文字を格納する配列
    var encryptVowelStringArray:[Any] = []
    //暗号化に使用したkeyを格納する配列
    var rundomKeyNumverArray:[Int] = []
    var placeHolderflag = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //キーボードを閉じる時の処理を起動
        addCloseKeyboardButton()
        //入力された平文にに絵文字が使用されているかどうかのフィルター処理
        filter()
        //平文が入力されている時のみ暗号化を可能にする処理
        if beforeEncryptTextView.text! == "" {
             encryptButton.isEnabled = false
         } else {
             encryptButton.isEnabled = true
         }
       
    }
    
    @IBAction func encryptButtonAction(_ sender: Any) {
        //絵文字があるかどうかの判断
        filter()
        //解読keyを発行
        makeEncryptVowel()
        //暗号化処理
        encryption()
        //保存処理
        SaveEncryptData()
        //placeHolderflagが押されたことを感知するためにをuserdefaultに保存
        placeHolderflag = 1
        UserDefaults.standard.set(placeHolderflag, forKey: "placeHolderflag")
        //画面遷移の処理
        performSegue(withIdentifier: "goAfterEncryptVC", sender: nil)
        }
       
    
    //文字列を暗号化する関数
    func encryption() {
        //初期化
        encryptStringArray = []
        //入力された文を読み込む
        beforeEncryptTextViewString = beforeEncryptTextView.text!
        changeStringCounter = 0
        for inputString in beforeEncryptTextViewString {
            //文字列を暗号化する処理を行うメソッドを呼び出す
            let hiraganaResult = changeHiragana.hiraganaToEmoji(inputHiragana: String(inputString))
            let katakanaResult = changeKatakana.katakanaToEmoji(inputKatakana: String(inputString))
            let alphabetResult = changeAlphabet.alphabetToEmoji(inputAlphabet: String(inputString))
            let numberResult = changeNumber.changeNumber(inputNumber: String(inputString))
            //返り値により場合わけと格納
            if hiraganaResult.changeHiraganaCounter == 1 {
                //絵文字に変換したものを格納（子音、母音）の順
                encryptStringArray.append(changeHiragana.hiraganaToEmojiConsonantString)
                encryptStringArray.append(changeHiragana.hiraganaToEmojiVowelString)
                //何回処理を行ったかのカウント
                changeStringCounter += 2
            } else if katakanaResult.changeKatakanaCounter == 1 {
                //絵文字に変換したものを格納（子音、母音）の順
                encryptStringArray.append(changeKatakana.katakanaToEmojiConsonantString)
                encryptStringArray.append(changeKatakana.katakanaToEmojiVowelString)
                //何回処理を行ったかのカウント
                changeStringCounter += 2
            } else if alphabetResult.changeAlphabetCounter == 1 {
                //アルファベットを絵文字に変換したものを格納（大文字小文字、アルファード）の順
                encryptStringArray.append(changeAlphabet.alphabetToEmojiTypeString)
                encryptStringArray.append(changeAlphabet.alphabetToEmojiString)
                //何回処理を行ったかのカウント
                changeStringCounter += 2
            } else if numberResult.changeNumberCounter == 1 {
                //文字コードをあ使うためのインスタンス作成
                var nonEncryptString = String.UnicodeScalarView()
                //数字の目印となる絵文字をめ前に入れる
                nonEncryptString.append(UnicodeScalar(nonEncryptStringDic[501]!)!)
                encryptStringArray.append(String(nonEncryptString))
                //数字を絵文字に変換したものを格納
                encryptStringArray.append(changeNumber.numberToEmojiString)
                //何回処理を行ったかのカウント
                changeStringCounter += 2
            } else {
                //変換できなった文字を格納
                //文字コードをあ使うためのインスタンス作成
                var nonEncryptString = String.UnicodeScalarView()
                nonEncryptString.append(UnicodeScalar(nonEncryptStringDic[500]!)!)
                encryptStringArray.append(String(nonEncryptString))
                encryptStringArray.append(String(inputString))
                //何回処理を行ったかのカウント
                changeStringCounter += 2
            }
        }
    }
    
    //必要な情報をuserdefaultに保存する処理
    func SaveEncryptData() {
        //暗号化した絵文字を格納した配列をuserdefaultに保存
        UserDefaults.standard.set(encryptStringArray, forKey: "encryptString")
        //暗号化に何文字使用したかをカウントしている変数をuserdefaultに保存
        UserDefaults.standard.set(changeStringCounter, forKey: "changeStringCounter")
        
    }
    
    //暗号化に使う母音及びタイプの設定
    func makeEncryptVowel() {
        //暗号化に使用したkeyを格納する配列を初期化
        rundomKeyNumverArray = []
        let rundomNumverArray:[Int] = [128535, 128537, 128538, 128523, 128577, 128547, 128534, 128555, 128553, 129396, 129314, 129326, 129319, 128567, 129298, 129301, 129297, 129312, 128520, 128127, 128121, 128122, 129313, 128169, 128123, 128128, 128125, 128126, 129302, 127875, 128570, 128568, 128569, 128571, 128572, 128573, 128576, 128575, 128574, 129330, 128080, 128588, 128079, 129309, 128077, 128078, 128074, 129307, 129308, 129310, 129311, 129304, 128076, 129295, 128072, 128073, 128070, 128071, 129295, 128072, 128073, 128070, 128071, 128054, 128049, 128045, 128057, 128048, 129418, 128059, 128060, 128040, 128047, 128046, 128055, 128061, 128056, 128053, 128584, 128585, 128586, 128020, 128039, 128038, 128036, 129430, 129429, 128025, 129425, 129424, 129438, 129408, 128033, 128241, 128242, 128187, 127981, 127970, 127980, 127971, 127972, 127973, 127974, 129685, 127931, 127922, 127919, 127923, 127918, 127920, 129513, 127827, 127816, 127826, 127825, 127821, 129381, 129373, 128175, 128162, 129359, 127921, 129664, 127955, 127992, 127954, 127953, 129357]
        //最初のひとつを代入
        let firstrandomNumber = Int.random(in: 0...127)
        rundomKeyNumverArray.append(rundomNumverArray[firstrandomNumber])
        //辞書からかぶらないように残りのものを代入していく
        var randomCounter = 0
        while randomCounter < 6 {
            let randomNumber = Int.random(in: 0...127)
            if randomCounter >= 0 && rundomNumverArray[randomNumber] == rundomKeyNumverArray[0] {
                
            } else if randomCounter >= 1 && rundomNumverArray[randomNumber] == rundomKeyNumverArray[1] {
                
            } else if randomCounter >= 2 && rundomNumverArray[randomNumber] == rundomKeyNumverArray[2] {
                
            } else if randomCounter >= 3 && rundomNumverArray[randomNumber] == rundomKeyNumverArray[3] {
                
            } else if randomCounter >= 4 && rundomNumverArray[randomNumber] == rundomKeyNumverArray[4] {
                
            } else if randomCounter >= 5 && rundomNumverArray[randomNumber] == rundomKeyNumverArray[5] {
                
            } else if randomCounter >= 6 && rundomNumverArray[randomNumber] == rundomKeyNumverArray[6] {
                
            } else {
                rundomKeyNumverArray.append(rundomNumverArray[randomNumber])
                randomCounter += 1
            }
        }
        //発行した解読KeyのUnicodeを格納
        let makeEncryptVowelA = Int(rundomKeyNumverArray[0])
        let makeEncryptVowelI = Int(rundomKeyNumverArray[1])
        let makeEncryptVowelU = Int(rundomKeyNumverArray[2])
        let makeEncryptVowelE = Int(rundomKeyNumverArray[3])
        let makeEncryptVowelO = Int(rundomKeyNumverArray[4])
        let makeEncryptVowelBig = Int(rundomKeyNumverArray[5])
        let makeEncryptVowelSmall = Int(rundomKeyNumverArray[6])
        //発行したkeyのUnicodを配列に格納
        encryptVowelStringArray.append(makeEncryptVowelA as Any)
        encryptVowelStringArray.append(makeEncryptVowelI as Any)
        encryptVowelStringArray.append(makeEncryptVowelU as Any)
        encryptVowelStringArray.append(makeEncryptVowelE as Any)
        encryptVowelStringArray.append(makeEncryptVowelO as Any)
        encryptVowelStringArray.append(makeEncryptVowelBig as Any)
        encryptVowelStringArray.append(makeEncryptVowelSmall as Any)
        //keyを格納した配列をuserdefaultに保存
        UserDefaults.standard.set(encryptVowelStringArray, forKey: "encryptVowelStringArray")
    }
    
    //絵文字のフィルター
       func filter() {
        let inputbeforeEncryptString = beforeEncryptTextView.text!
        let inputString = inputbeforeEncryptString.unicodeScalars.filter{$0.properties.isEmojiPresentation}
        //絵文字が入力されたらポップアップを出す処理
        if inputString.count >= 1 {
            //絵文字が入力されたらポップアップを出してボタンを押せなくする
            encryptButton.isEnabled = false
            //アラートを出す
            let alert:UIAlertController = UIAlertController(title: "暗号化できません!", message: "絵文字を消去して下さい",preferredStyle: .alert)
            let action:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            //絵文字が入力されてなかったらボタンを押せるようにする
            encryptButton.isEnabled = true
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
       closeButton.addTarget(self, action:#selector(BeforeEncryptViewController.onClickCloseButton), for: .touchUpInside)
       custombar.addSubview(closeButton)
       beforeEncryptTextView.inputAccessoryView = custombar
       beforeEncryptTextView.keyboardType = .default
       beforeEncryptTextView.delegate = self
   }
    
   //閉じるボタンを押した時の挙動
   @objc func onClickCloseButton (sender: UIButton) {
          if(beforeEncryptTextView.isFirstResponder){
              beforeEncryptTextView.resignFirstResponder()
            //暗号化したい文が入力されている時のみ暗号化を可能にする処理
            if beforeEncryptTextView.text! == "" {
                       encryptButton.isEnabled = false
                   } else {
                       encryptButton.isEnabled = true
                   }
          }
      }
    
   //画面をタッチしたらキーボードを閉じる処理
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       if (self.beforeEncryptTextView.isFirstResponder) {
           self.beforeEncryptTextView.resignFirstResponder()
        //暗号化したい文が入力されている時のみ暗号化を可能にする処理
        if beforeEncryptTextView.text! == "" {
             encryptButton.isEnabled = false
         } else {
             encryptButton.isEnabled = true
         }
       }
   }

}

//
//  SetRewardViewController.swift
//  RewardChallengeApp
//
//  Created by 尾原徳泰 on 2020/07/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import EMTNeumorphicView

class SetRewardViewController: UIViewController, UITextFieldDelegate {
    
    let myView = EMTNeumorphicView()
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
    
    //インスタンス作成
    let backButton = EMTNeumorphicButton(type: .custom)
    //インスタンスを作成
    let textField = UITextField()
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    let textField4 = UITextField()
    let textField5 = UITextField()
    let textField6 = UITextField()
    
    var inputArray:[String] = ["", "", "", "", "", ""]
    
    //userDefaultのキーの一時的保管配列
    var userDefaultArray:[String] = ["reward1", "reward2", "reward3", "reward4", "reward5", "reward6"]
    //ご褒美の配列
    var RewardArray:[String] = ["", "", "", "", "", ""]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        makeView()
        readUserDefault()
        backButton.isSelected = false
        setScreen()
        for number in 0...5 {
            print("%%%%%%%%%%%%%%%%%%%%%%")
            switch number {
            case 0:
                makeTextField1(number: number); print("8888888888")
            case 1:
                makeTextField2(number: number)
            case 2:
                makeTextField3(number: number)
            case 3:
                makeTextField4(number: number)
            case 4:
                makeTextField5(number: number)
            case 5:
                makeTextField6(number: number)
            default:
                return
            }
        }
        
        makeLabel()
        makeKeepButton()
    }
    
    //MARK: - 初期設定
    func makeView() {
        view.backgroundColor = UIColor(RGB: 0x9BC262)
        //色の設定
        myView.neumorphicLayer?.elementColor = view.backgroundColor?.cgColor
        //角の形設定
        myView.neumorphicLayer?.cornerRadius = 50
        
        myView.neumorphicLayer?.depthType = .concave
        
        myView.neumorphicLayer?.elementDepth = 10
        
    }
    
    func setScreen() {
        //画面のサイズを取得
        screenWidth = self.view.frame.width
        screenHeight = self.view.frame.height
       }
    //MARK: - buttonの設定
    func makeBackButton() {
        //アクションの設定
        backButton.addTarget(self, action: #selector(tappedReStartButton(_:)), for: .touchUpInside)
        //場所を設定
        backButton.frame = CGRect(x: screenWidth! / 2 * 1, y: screenHeight! / 4 * 3, width: screenWidth! / 2, height: 50)
        //ボタンのラベルを設定
        backButton.setTitle("ReStart", for: UIControl.State.normal)
        backButton.setTitleColor(UIColor(RGB: 0x668734), for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        //色を設定
        backButton.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor as! CGColor
        //viewに追加する
        self.view.addSubview(backButton)
    
    }

    @objc func tappedReStartButton(_ button: EMTNeumorphicButton) {
        
        backButton.isSelected = true
        backButton.setTitleColor(UIColor(RGB: 0xC9DEAA), for: .normal)
        
        print("press Button2")
    }
    //MARK: - textField
   
    func makeTextField1(number:Int) {
        //インスタンスを作成
        //テキストフィールドの位置ぎめ
        textField1.frame = CGRect(x: 5, y: (number + 1) * 50, width: Int(screenWidth!) - 10, height: 40)
        //背景色の設定
        textField1.backgroundColor = UIColor(RGB: 0x9BC262)
        //記入された文字の色を指定
        textField1.textColor = UIColor(RGB: 0x668734)
        //パーチェホルダーを設定
        setPlaceholderText(number: number)
        //キーボードのスタイルを設定
        textField1.keyboardType = .default
        //惑線のスタイルを設定
        textField1.borderStyle = .roundedRect
        //viewに追加
        self.view.addSubview(textField1)
        //delegateの設定
        textField1.delegate = self
        }
    
    func makeTextField2(number:Int) {
        //インスタンスを作成
        //テキストフィールドの位置ぎめ
        textField2.frame = CGRect(x: 5, y: (number + 1) * 50, width: Int(screenWidth!) - 10, height: 40)
        //背景色の設定
        textField2.backgroundColor = UIColor(RGB: 0x9BC262)
        //記入された文字の色を指定
        textField2.textColor = UIColor(RGB: 0x668734)
        //パーチェホルダーを設定
        setPlaceholderText(number: number)
        //キーボードのスタイルを設定
        textField2.keyboardType = .default
        //惑線のスタイルを設定
        textField2.borderStyle = .roundedRect
        //viewに追加
        self.view.addSubview(textField2)
        //delegateの設定
        textField2.delegate = self
    }
    
    func makeTextField3(number:Int) {
        //インスタンスを作成
        //テキストフィールドの位置ぎめ
        textField3.frame = CGRect(x: 5, y: (number + 1) * 50, width: Int(screenWidth!) - 10, height: 40)
        //背景色の設定
        textField3.backgroundColor = UIColor(RGB: 0x9BC262)
        //記入された文字の色を指定
        textField3.textColor = UIColor(RGB: 0x668734)
        //パーチェホルダーを設定
        setPlaceholderText(number: number)
        //キーボードのスタイルを設定
        textField3.keyboardType = .default
        //惑線のスタイルを設定
        textField3.borderStyle = .roundedRect
        //viewに追加
        self.view.addSubview(textField3)
        //delegateの設定
        textField3.delegate = self
    }
    
    func makeTextField4(number:Int) {
        //インスタンスを作成
        //テキストフィールドの位置ぎめ
        textField4.frame = CGRect(x: 5, y: (number + 1) * 50, width: Int(screenWidth!) - 10, height: 40)
        //背景色の設定
        textField4.backgroundColor = UIColor(RGB: 0x9BC262)
        //記入された文字の色を指定
        textField4.textColor = UIColor(RGB: 0x668734)
        //パーチェホルダーを設定
        setPlaceholderText(number: number)
        //キーボードのスタイルを設定
        textField4.keyboardType = .default
        //惑線のスタイルを設定
        textField4.borderStyle = .roundedRect
        //viewに追加
        self.view.addSubview(textField4)
        //delegateの設定
        textField4.delegate = self
    }
    
    func makeTextField5(number:Int) {
        //インスタンスを作成
        //テキストフィールドの位置ぎめ
        textField5.frame = CGRect(x: 5, y: (number + 1) * 50, width: Int(screenWidth!) - 10, height: 40)
        //背景色の設定
        textField5.backgroundColor = UIColor(RGB: 0x9BC262)
        //記入された文字の色を指定
        textField5.textColor = UIColor(RGB: 0x668734)
        //パーチェホルダーを設定
        setPlaceholderText(number: number)
        //キーボードのスタイルを設定
        textField5.keyboardType = .default
        //惑線のスタイルを設定
        textField5.borderStyle = .roundedRect
        //viewに追加
        self.view.addSubview(textField5)
        //delegateの設定
        textField5.delegate = self
    }
    
    func makeTextField6(number:Int) {
        //インスタンスを作成
        //テキストフィールドの位置ぎめ
        textField6.frame = CGRect(x: 5, y: (number + 1) * 50, width: Int(screenWidth!) - 10, height: 40)
        //背景色の設定
        textField6.backgroundColor = UIColor(RGB: 0x9BC262)
        //記入された文字の色を指定
        textField6.textColor = UIColor(RGB: 0x668734)
        //パーチェホルダーを設定
        setPlaceholderText(number: number)
        //キーボードのスタイルを設定
        textField6.keyboardType = .default
        //惑線のスタイルを設定
        textField6.borderStyle = .roundedRect
        //viewに追加
        self.view.addSubview(textField6)
        //delegateの設定
        textField6.delegate = self
    }
    
    
    //MARK: - キーボードの閉じる機能
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: - label作成
    func makeLabel() {
        //インスタンス作成
        let resultLable = UILabel()
        //場所を設定
        resultLable.frame = CGRect(x: 0, y: 20 , width: screenWidth!, height: 30)
        //色を設定
        resultLable.textColor = UIColor(RGB: 0x668734)
        //位置を真ん中に設定
        resultLable.textAlignment = NSTextAlignment.center
        resultLable.font = UIFont.systemFont(ofSize: 30)
        resultLable.text = "ご褒美の設定"
        //viewに追加する
        self.view.addSubview(resultLable)
    }
    //MARK: - button作成
    func makeKeepButton() {
        //アクションの設定
        backButton.addTarget(self, action: #selector(tappKeepButton(_:)), for: .touchUpInside)
        //場所を設定
        backButton.frame = CGRect(x: 10, y: screenHeight! / 6 * 5, width: screenWidth! - 20, height: 50)
        //ボタンのラベルを設定
        backButton.setTitle("保存", for: UIControl.State.normal)
        backButton.setTitleColor(UIColor(RGB: 0x668734), for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        //色を設定
        backButton.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor as! CGColor
        //viewに追加する
        self.view.addSubview(backButton)
        
        }

        @objc func tappKeepButton(_ button: EMTNeumorphicButton) {
            
            backButton.isSelected = true
            backButton.setTitleColor(UIColor(RGB: 0xC9DEAA), for: .normal)
            setUserDefault()
            print("press Button2")
            dismiss(animated: true, completion: nil)
            print(textField1.text!)
        }
    
    //MARK: - userDefaultの保存
    func setUserDefault() {
        //入力された文字を配列に保存
        for number in 0...5 {
            switch number {
            case 0:
                inputArray[number] = textField1.text!; UserDefaults.standard.set(inputArray[number], forKey: "reward1")
            case 1:
                inputArray[number] = textField2.text!; UserDefaults.standard.set(inputArray[number], forKey: "reward2")
            case 2:
                inputArray[number] = textField3.text!; UserDefaults.standard.set(inputArray[number], forKey: "reward3")
            case 3:
                inputArray[number] = textField4.text!; UserDefaults.standard.set(inputArray[number], forKey: "reward4")
            case 4:
                inputArray[number] = textField5.text!; UserDefaults.standard.set(inputArray[number], forKey: "reward5")
            case 5:
                inputArray[number] = textField6.text!; UserDefaults.standard.set(inputArray[number], forKey: "reward6")
            default:
                return
            }
        }
        
//        UserDefaults.standard.set(inputArray, forKey: "input")
    }
    //MARK: - userDefaultの呼び出し
     func readUserDefault() {
            var nilCount = 0
            for key in userDefaultArray {
                switch key {
                case "reward1":
                    if let box1 = UserDefaults.standard.object(forKey: key) {
                        print(box1)
                        RewardArray[0] = box1 as! String
                        nilCount += 1
                    } else {
                        print("error")
                        
                    }
                case "reward2":
                    if let box2 = UserDefaults.standard.object(forKey: key) {
                        print(box2)
                        RewardArray[1] = box2 as! String
                        nilCount += 1
                    } else {
                        print("error")
                        
                    }
                case "reward3":
                    if let box3 = UserDefaults.standard.object(forKey: key) {
                        print(box3)
                        RewardArray[2] = box3 as! String
                        nilCount += 1
                    } else {
                        print("error")
                        
                    }
                case "reward4":
                    if let box4 = UserDefaults.standard.object(forKey: key) {
                        print(box4)
                        RewardArray[3] = box4 as! String
                        nilCount += 1
                    } else {
                        print("error")
                    }
                case "reward5":
                    if let box5 = UserDefaults.standard.object(forKey: key) {
                        print(box5)
                        RewardArray[4] = box5 as! String
                        nilCount += 1
                    } else {
                        print("error")
                        
                    }
                case "reward6":
                    if let box6 = UserDefaults.standard.object(forKey: key) {
                        print(box6)
                        RewardArray[5] = box6 as! String
                        nilCount += 1
                    } else {
                        print("error")
                        
                    }
                default:
                    return
                }
            }
        }
    
    //MARK: - placeholderの仕分け
    func setPlaceholderText(number: Int) {
        switch number {
        case 0:
            //パーチェホルダーを設定
            if RewardArray[number] != "" {
                textField1.placeholder = "\(RewardArray[number])"
            } else {
                textField1.placeholder = "\(number)番目のご褒美"
            }
        case 1:
            //パーチェホルダーを設定
            if RewardArray[number] != "" {
                textField2.placeholder = "\(RewardArray[number])"
            } else {
                textField2.placeholder = "\(number)番目のご褒美"
            }
        case 2:
            //パーチェホルダーを設定
            if RewardArray[number] != "" {
                textField3.placeholder = "\(RewardArray[number])"
            } else {
                textField3.placeholder = "\(number)番目のご褒美"
            }
        case 3:
            //パーチェホルダーを設定
            if RewardArray[number] != "" {
                textField4.placeholder = "\(RewardArray[number])"
            } else {
                textField4.placeholder = "\(number)番目のご褒美"
            }
        case 4:
            //パーチェホルダーを設定
            if RewardArray[number] != "" {
                textField5.placeholder = "\(RewardArray[number])"
            } else {
                textField5.placeholder = "\(number)番目のご褒美"
            }
        case 5:
            //パーチェホルダーを設定
            if RewardArray[number] != "" {
                textField6.placeholder = "\(RewardArray[number])"
            } else {
                textField6.placeholder = "\(number)番目のご褒美"
            }
        default:
                return
            }
        
    }
    
    
}

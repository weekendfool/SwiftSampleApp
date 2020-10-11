//
//  ViewController.swift
//  RewardChallengeApp
//
//  Created by 尾原徳泰 on 2020/07/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import EMTNeumorphicView

class ViewController: UIViewController {
    
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
    
    //インスタンス作成
    let startButton = EMTNeumorphicButton(type: .custom)
    //インスタンス作成
    let reSetButton = EMTNeumorphicButton(type: .custom)
    //インスタンス作成
    let setButton = EMTNeumorphicButton(type: .custom)
    //インスタンス作成
    let resultLable = UILabel()
    let titlelabel = UILabel()
    
    //ランダムなナンバーを作成
    var randomReward:String?
    //配列から取り出すための数字
    var randomNumber:Int?
    //ご褒美の配列
    var RewardArray:[String] = ["????", "", "", "", "", "", ""]
    let myView = EMTNeumorphicView()
    
    //userDefaultのキーの一時的保管配列
    var userDefaultArray:[String] = ["reward1", "reward2", "reward3", "reward4", "reward5", "reward6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setScreen()
        makeView()
        maekStartButton()
        makeTitleLabel()
        makeResultLabel(randomReward: RewardArray[0])
        maekResetButton()
        maekSetButton()
//        makeDefaultButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //ボタンの状態の初期化
        startButton.isSelected = false
        reSetButton.isSelected = true
        setButton.isSelected = false
        setButtonLabelColor()
        setUserDefault()
        print("&&&&&&&&&&&&&&&&&")
    }
    //MARK: - 初期設定
    func setScreen() {
        //画面のサイズを取得
        screenWidth = self.view.frame.width
        screenHeight = self.view.frame.height
    }
   
    
    func makeView() {
        view.backgroundColor = UIColor(RGB: 0x9BC262)
        //色の設定
        myView.neumorphicLayer?.elementColor = view.backgroundColor?.cgColor
        //角の形設定
        myView.neumorphicLayer?.cornerRadius = 70
        
        myView.neumorphicLayer?.depthType = .concave
        
        myView.neumorphicLayer?.elementDepth = 20
        
    }
    //MARK: - button作成
    func maekStartButton() {
        //インスタンス作成
//        let startButton = EMTNeumorphicButton(type: .custom)
        //アクションの設定
        startButton.addTarget(self, action: #selector(tappedStartButton(_:)), for: .touchUpInside)
        //場所を設定
        startButton.frame = CGRect(x: 10, y: screenHeight! / 4 * 3, width: screenWidth! / 2 - 20, height: 50)
        //ボタンのラベルを設定
        startButton.setTitle("Start", for: UIControl.State.normal)
        startButton.setTitleColor(UIColor(RGB: 0x668734), for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        //色を設定
        startButton.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor as! CGColor
        //viewに追加する
        self.view.addSubview(startButton)
    
    }

    @objc func tappedStartButton(_ button: EMTNeumorphicButton) {
        
        startButton.isSelected = true
        startButton.setTitleColor(UIColor(RGB: 0xC9DEAA), for: .normal)
        //ご褒美配列の数ぶんの数字からランダムに抽出
        randomNumber = Int.random(in: 1..<RewardArray.count)
        randomReward = RewardArray[randomNumber!]
        reSetButton.isEnabled = true
        resultLable.text = "\(randomReward!)"
        reSetButton.isSelected = false
        //無効化
        startButton.isEnabled = false
        reSetButton.setTitleColor(UIColor(RGB: 0x668734), for: .normal)
//        print("press Button")
    }
    
    func maekResetButton() {
        //アクションの設定
        reSetButton.addTarget(self, action: #selector(tappedReStartButton(_:)), for: .touchUpInside)
        //場所を設定
        reSetButton.frame = CGRect(x: screenWidth! / 2 * 1 + 15, y: screenHeight! / 4 * 3, width: screenWidth! / 2 - 20, height: 50)
        //ボタンのラベルを設定
        reSetButton.setTitle("Reset", for: UIControl.State.normal)
        reSetButton.setTitleColor(UIColor(RGB: 0x668734), for: .normal)
        reSetButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        //色を設定
        reSetButton.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor as! CGColor
        //viewに追加する
        self.view.addSubview(reSetButton)
        
        }

        @objc func tappedReStartButton(_ button: EMTNeumorphicButton) {
            //押された時の見た目の変化
            reSetButton.isSelected = true
           //無効化の解除
            startButton.isEnabled = true
            //startbuttonの選択の解除
            startButton.isSelected = false
            startButton.setTitleColor(UIColor(RGB: 0x668734), for: .normal)
            resultLable.text = "\(RewardArray[0])"
//            print("press Button2")
            
        }
    
    func maekSetButton() {
    //アクションの設定
    setButton.addTarget(self, action: #selector(tappedSetButton(_:)), for: .touchUpInside)
    //場所を設定
        setButton.frame = CGRect(x: 5, y: screenHeight! / 7 * 6, width: screenWidth! - 10, height: 50)
    //ボタンのラベルを設定
    setButton.setTitle("ご褒美の設定", for: UIControl.State.normal)
    setButton.setTitleColor(UIColor(RGB: 0x668734), for: .normal)
    setButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
    //色を設定
    setButton.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor as! CGColor
    //viewに追加する
    self.view.addSubview(setButton)
    
    }

    @objc func tappedSetButton(_ button: EMTNeumorphicButton) {
        
        setButton.isSelected = true
        setButton.setTitleColor(UIColor(RGB: 0xC9DEAA), for: .normal)
        goToSetReward()
        
//        print("press Button3")
    }
    //MARK: - ラベル作成
    func makeTitleLabel() {
        //場所を設定
        titlelabel.frame = CGRect(x: 0, y: screenHeight! / 5 , width: screenWidth!, height: 50)
        //色を設定
        titlelabel.textColor = UIColor(RGB: 0x668734)
        //位置を真ん中に設定
        titlelabel.textAlignment = NSTextAlignment.center
        titlelabel.font = UIFont.systemFont(ofSize: 35)
        titlelabel.text = "今回のご褒美は"
        //viewに追加する
        self.view.addSubview(titlelabel)
    }
    
    func makeResultLabel(randomReward: String) {
        //場所を設定
        resultLable.frame = CGRect(x: 0, y: screenHeight! / 5 * 2 , width: screenWidth!, height: 50)
        //色を設定
        resultLable.textColor = UIColor(RGB: 0x668734)
        //位置を真ん中に設定
        resultLable.textAlignment = NSTextAlignment.center
        resultLable.font = UIFont.systemFont(ofSize: 35)
        resultLable.text = "\(randomReward)"
        //viewに追加する
        self.view.addSubview(resultLable)
    }
    //MARK: - 画面遷移機能
    func goToSetReward() {
        //storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        //遷移先のviewControllerのインスタンス取得
        let SetRewardVC = storyboard.instantiateViewController(identifier: "SetRewardVC") as! SetRewardViewController
        //遷移先の画面のスタイルを設定
        SetRewardVC.modalPresentationStyle = .fullScreen
        self.present(SetRewardVC, animated: true) {
            print("ok")
        }
    }

//    MARK:- 画面遷移から戻ってきた時の処理処理
    func setButtonLabelColor() {
        //ボタンの状態の初期化
        startButton.isSelected = false
        reSetButton.isSelected = false
        setButton.isSelected = false
        //buttonの文字の色を戻す
        startButton.setTitleColor(UIColor(RGB: 0x668734), for: .normal)
        reSetButton.setTitleColor(UIColor(RGB: 0x668734), for: .normal)
        setButton.setTitleColor(UIColor(RGB: 0x668734), for: .normal)
        //reStartbuttonの無効化
        reSetButton.isEnabled = false
        //無効化の解除
        startButton.isEnabled = true
        //labelの初期化
        randomReward = RewardArray[0]
        resultLable.text = "\(randomReward!)"
        
    }
    
    //MARK: - userDefault呼び出し
    func setUserDefault() {
        var nilCount = 0
        for key in userDefaultArray {
            switch key {
            case "reward1":
                if let box1 = UserDefaults.standard.object(forKey: key) {
                    print(box1)
                    RewardArray[1] = box1 as! String
                    nilCount += 1
                } else {
                    print("error")
                    
                }
            case "reward2":
                if let box2 = UserDefaults.standard.object(forKey: key) {
                    print(box2)
                    RewardArray[2] = box2 as! String
                    nilCount += 1
                } else {
                    print("error")
                    
                }
            case "reward3":
                if let box3 = UserDefaults.standard.object(forKey: key) {
                    print(box3)
                    RewardArray[3] = box3 as! String
                    nilCount += 1
                } else {
                    print("error")
                    
                }
            case "reward4":
                if let box4 = UserDefaults.standard.object(forKey: key) {
                    print(box4)
                    RewardArray[4] = box4 as! String
                    nilCount += 1
                } else {
                    print("error")
                }
            case "reward5":
                if let box5 = UserDefaults.standard.object(forKey: key) {
                    print(box5)
                    RewardArray[5] = box5 as! String
                    nilCount += 1
                } else {
                    print("error")
                    
                }
            case "reward6":
                if let box6 = UserDefaults.standard.object(forKey: key) {
                    print(box6)
                    RewardArray[6] = box6 as! String
                    nilCount += 1
                } else {
                    print("error")
                    
                }
            default:
                return
            }
            
//            print(nilCount)
        }
        
    }
}


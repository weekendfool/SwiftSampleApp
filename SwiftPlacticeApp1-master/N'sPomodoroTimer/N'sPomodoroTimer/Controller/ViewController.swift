//
//  ViewController.swift
//  N'sPomodoroTimer
//
//  Created by 尾原徳泰 on 2020/03/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var goTimerViewButton: UIButton!
    @IBOutlet weak var goTwitterButton: UIButton!
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    var totalCountScore = 0
    
    
    let totalScore = UserDefaults.standard
    let valueKey = "valueKey"
    var totalScoreBox = 0
    
    let textNumber = UserDefaults.standard
    let numKey = "numKey"
    var testNumberBox: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //アプリが開始された時の処理
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFinishLaunch), name: UIApplication.didFinishLaunchingNotification, object: nil)
        //アプリが終了した時の処理
        NotificationCenter.default.addObserver(self, selector: #selector(self.willTerminate), name: UIApplication.willTerminateNotification, object: nil)
        
        totalCountScore = totalScore.object(forKey: valueKey) as! Int
//        print(totalCountScore)
        
        //保存されていた値の反映
        totalScoreLabel.text = "合計:\(totalCountScore)ピリオド"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //保存されていた値の反映
        totalCountScore = totalScore.object(forKey: valueKey) as! Int
        totalScoreLabel.text = "合計:\(totalCountScore)ピリオド"
    }
   
    
    @IBAction func goTimerViewButtonAction(_ sender: Any) {
        //画面遷移
        performSegue(withIdentifier: "goTimer", sender: nil)
    }
    
    @IBAction func goTwitterButtonAction(_ sender: Any) {
        //画面遷移
        performSegue(withIdentifier: "goTwitter", sender: nil)
    }
    
    @objc func didFinishLaunch() {
        //アプリクラッシュ対策、アプリ開始時に０を代入しておく
        testNumberBox = textNumber.object(forKey: numKey) as! Int
        
        if testNumberBox == 0 {
            totalScore.set(0, forKey: valueKey)
        }
        
    }
    
    @objc func willTerminate() {
        //NotificationCenteを自身から削除
        NotificationCenter.default.removeObserver(self)
    }
  
}


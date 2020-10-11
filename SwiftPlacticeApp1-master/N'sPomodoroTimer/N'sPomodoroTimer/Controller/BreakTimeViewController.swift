//
//  BreakTimeViewController.swift
//  N'sPomodoroTimer
//
//  Created by 尾原徳泰 on 2020/03/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import AudioToolbox

class BreakTimeViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var nowScore: UILabel!
    
    var count = 0
    var breakTimer = Timer()
    var totalCountScore = 0
    var setCountMinutesValue = 4
    var setCountSecondValue = 60
    var countMinutes = 0
    var minutesTimerLabel = 4
    var secondTimerLabel = 60
    
    let totalScore = UserDefaults.standard
    let valueKey = "valueKey"
    
    var testNumber = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //保存されていた値の反映
        totalCountScore = totalScore.object(forKey: valueKey) as! Int
        totalScoreLabel.text = "合計:\(totalCountScore)ピリオド"
        //現在のピリオドを表示
        nowScore.text = "第\(totalCountScore - 1)ピリオド休憩"
        //画面遷移と同時にタイマースタート
        breakTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        //タイマー実行中に再生ボタンを押せないようにする
        startButton.isEnabled = false
        //初期化
        testNumber = false
    }
    
    @objc func timerCounter() {
        //呼び出されるごとにcountにプラス１してカウント
        count += 1
        //残り秒数の変数格納
        secondTimerLabel = setCountSecondValue - count
        //残り時間の表示
        timerLabel.text = "残り\(minutesTimerLabel):\(secondTimerLabel)"
        //60秒ごとに分を一足す、countの数をリセット
        if count == 60 {
            count = 0
            countMinutes += 1
            changeMinutes(countMinutes: countMinutes)
        }
        //タイマーの終了
        if minutesTimerLabel == 0 {
            testNumber = true
        }
        if secondTimerLabel == 0  && testNumber == true {
            finishedTimer()
            }
    
    }
    
    func changeMinutes(countMinutes: Int) -> Int {
           //4から1ずつ引く
           minutesTimerLabel =  setCountMinutesValue - countMinutes
           return minutesTimerLabel
       }
       
       func finishedTimer() {
        //バイブを鳴らす
        AudioServicesPlaySystemSound(SystemSoundID(1012))
        //タイマーの完全停止
        breakTimer.invalidate()
        //時間の保存
        totalScore.set(totalCountScore, forKey: valueKey)
        totalScore.synchronize()
        //画面遷移
        performSegue(withIdentifier: "goHome", sender: nil)
       }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        //一時停止ボタンを押せて、再生ボタンおを押せる様にする
        stopButton.isEnabled = false
        startButton.isEnabled = true
        //タイマーの停止
        breakTimer.invalidate()
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        //再生ボタンを押せなく、一時停止ボタンを押せる様にする
            stopButton.isEnabled = true
            startButton.isEnabled = false
            //タイマーの再生
            breakTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
        
    
    @IBAction func backButonnAction(_ sender: Any) {
        //タイマーの停止
        breakTimer.invalidate()
        //画面遷移
        performSegue(withIdentifier: "goHome", sender: nil)
       
    }
    
    @IBAction func test(_ sender: Any) {
        setCountMinutesValue = 0
         minutesTimerLabel = 0
        
        
    }
    
}

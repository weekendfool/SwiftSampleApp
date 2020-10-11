//
//  ViewController.swift
//  N'stimer
//
//  Created by 尾原徳泰 on 2020/04/27.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var timreCountLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var reStartButton: UIButton!
    
    //timerを格納する変数設定
    var timer1:Timer?
    //timerを格納する変数設定
    var timer2:Timer?
    //経過時間のカウント変数
    var countMinutes = 0
    //経過秒のカウント変数
    var countSecond = 0
    //経過時間の表示ラベル変数
    var minutesStydyTimer = 0
    //経過時間の表示ラベル変数
    var minutesBreaktimeTimer = 0
    //経過秒の表示ラベル変数
    var secondTimer = 0
    //経過時間の表示ラベル変数
    var minutesTimerLabel = 0
    //経過秒の表示ラベル変数
    var secondTimerLabel = 0
    //どのタイマーが起動しているフラグ（起動なし：０、勉強：１、休憩：２）
    var timerVer = 0
    //タイマーが起動しているフラグ
    var doTimerOn = true
    //ピリオド数
    var sumPiriod = 0
    //合計時間数
    var sumTime = 0
    //タイマーが一度でも起動しているフラグ
    var sumTimerOn = 0
    
    var musicPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //保存の取り出し
        takeTimer()
        if sumTimerOn == 0 {
            
        }
        //保存された時間の引き出し
        sumPiriod = UserDefaults.standard.integer(forKey: "sumPiriod")
        //タイマーの設定と始動
        timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.timerUpdate1), userInfo: nil, repeats: true)
        timerVer = 1
        changeReStartButton()
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        doTimerOn = true
        //タイマーの設定と始動
        if timerVer == 1 {
            timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.timerUpdate1), userInfo: nil, repeats: true)
        } else if timerVer == 2 {
            timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.timerUpdate2), userInfo: nil, repeats: true)
        }
        buttonChanger()
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        doTimerOn = false
        //タイマーを止める
        timer1?.invalidate()
        timer2?.invalidate()
        buttonChanger()
    }
    
    @IBAction func reStartButtonAction(_ sender: Any) {
        takeTimer()
        timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.timerUpdate1), userInfo: nil, repeats: true)
        timerVer = 1
        changeReStartButton()
        
    }
    
    @objc func timerUpdate1() {
        //秒数をカウントアップ
        countSecond += 1
        //分数をカウントアップ
        if countSecond == 60 {
            countMinutes += 1
            countSecond = 0
        }
        //分数の表示
        minutesTimerLabel = minutesStydyTimer - countMinutes
        //秒数の表示
        secondTimerLabel = secondTimer - countSecond
        //ラベルに表示
        timreCountLabel.text = "勉強時間：残り\(minutesTimerLabel)分:\(secondTimerLabel)秒"
        //ボタンの有効無効のコントロール
        buttonChanger()
        //タイマを止める条件と処理
        finishTimer()

        
    }
    
    @objc func timerUpdate2() {
//        print("#####")
        //秒数をカウントアップ
        countSecond += 1
        //分数をカウントアップ
        if countSecond == 60 {
            countMinutes += 1
            countSecond = 0
        }
        //分数の表示
        minutesTimerLabel = minutesBreaktimeTimer - countMinutes
        //秒数の表示
        secondTimerLabel = secondTimer - countSecond
        //ラベルに表示
        timreCountLabel.text = "休憩時間：残り\(minutesTimerLabel)分:\(secondTimerLabel)秒"
        //ボタンの有効無効のコントロール
        buttonChanger()
        //タイマを止める条件と処理
        finishTimer()
    }
    
    func takeTimer() {
        //保存されている時間を引き出す
        //経過時間の表示ラベル変数
        
        minutesStydyTimer = UserDefaults.standard.integer(forKey: "studyTimePicker") - 1
        minutesBreaktimeTimer = UserDefaults.standard.integer(forKey: "breakTimePicker") - 1
        //経過秒の表示ラベル変数
        secondTimer = 59
        countMinutes = 0
        countSecond = 0
        
    }
    
    func buttonChanger() {
        //timerの実行状況で一時停止とスタートボタンの有効無効を設定する
        if doTimerOn {
            startButton.isEnabled = false
            stopButton.isEnabled = true
        } else if !doTimerOn {
            startButton.isEnabled = true
            stopButton.isEnabled = false
        }
    }
    
    func finishTimer() {
        //タイマーの開始条件
        if minutesTimerLabel == 0 && secondTimerLabel == 0 && timerVer == 1 {
            //タイマーを止める
            timer1?.invalidate()
            startButton.isEnabled = false
            stopButton.isEnabled = false
            //音を鳴らす
            music()
            //アラートを出す
            openAlert(timerVer: timerVer)
            sumPiriod += 1
            timerVer = 2
            
        } else if minutesTimerLabel == 0 && secondTimerLabel == 0 && timerVer == 2 {
            //タイマーを止める
            timer2?.invalidate()
            startButton.isEnabled = false
            stopButton.isEnabled = false
            //表示を0にする
            minutesTimerLabel = 0
            secondTimerLabel = 0
            //音を鳴らす
            music()
            //アラートを出す
            openAlert(timerVer: timerVer)
            timerVer = 0
            changeReStartButton()
            

        }
    }

    func doSecondTimer() {
        if timerVer == 2 {
            takeTimer()
            timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.timerUpdate2), userInfo: nil, repeats: true)
        }
    }
    

    func music() {
        let music = Bundle.main.bundleURL.appendingPathComponent("warning01.mp3")
        
        musicPlayer.delegate = self
        //バイブ実装
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        do {
            print("&&&&&&&&&&&&&&&&&&&&")
            musicPlayer = try AVAudioPlayer(contentsOf: music, fileTypeHint: nil)
            musicPlayer.play()
        } catch {
            print("エラー")
        }
        
    }
    
    func openAlert(timerVer:Int) {
        if timerVer == 1 {
            //ダイアログを作成
            let alertController1 = UIAlertController(title: "終了", message: "勉強時間終了です", preferredStyle: .alert)
            //ダイアログにokボタン追加
            let defaultAction1 = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction?) in
                self.doSecondTimer()
            })
            alertController1.addAction(defaultAction1)
            present(alertController1, animated: true, completion: nil)
        } else if timerVer == 2 {
            //ダイアログを作成
            let alertController2 = UIAlertController(title: "終了", message: "休憩時間終了です", preferredStyle: .alert)
            //ダイアログにokボタン追加
            let defaultAction2 = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction?) in
                UserDefaults.standard.set(self.sumPiriod, forKey: "sumPiriod")
                self.performSegue(withIdentifier: "goShare", sender: nil)
            })
            alertController2.addAction(defaultAction2)
            present(alertController2, animated: true, completion: nil)
            
        }
    }
    func changeReStartButton() {
        if timerVer == 0 {
            reStartButton.isEnabled = true
        } else {
            reStartButton.isEnabled = false
        }
    }
}


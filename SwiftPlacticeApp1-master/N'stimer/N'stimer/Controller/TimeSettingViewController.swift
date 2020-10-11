//
//  TimeSettingViewController.swift
//  N'stimer
//
//  Created by 尾原徳泰 on 2020/04/27.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class TimeSettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var studyMinutesLabel: UILabel!
    @IBOutlet weak var breakTimeMinutesLabel: UILabel!
    @IBOutlet weak var studyTimePicker: UIPickerView!
    @IBOutlet weak var breakTimePicker: UIPickerView!
    @IBOutlet var goLastSettingTimerButton: UIView!
    
    //タイマーの中身
    //設定に使う分数を設定
    var MinutestimerList:[Int] = []
    //設定に使う分数を設定
    var SecondtimerList:[Int] = []
    //勉強時間と休憩時間を保存する変数
    var studyTimePickerNumber = 25
    var breakTimePickerNumber = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studyTimePicker.delegate = self
        studyTimePicker.dataSource = self
        breakTimePicker.delegate = self
        breakTimePicker.dataSource = self
        
        //for文を使って0から60までを設定
        settingList()
        
            
        //        breakTimePicker.selectedRow(inComponent: breakTimePickerNumber)
    }
    override func viewWillAppear(_ animated: Bool) {
        selectStydyNumber()
       

    }
    

    
    func settingList() {
        for number in 0...60 {
            MinutestimerList.append(number)
            SecondtimerList.append(number)
        }
    }
    //何列あるかの設定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //pickerが二つあるのでpickerViewで場合わけ
        switch pickerView {
        case studyTimePicker:
            return 1
        case breakTimePicker:
            return 1
        default:
            return 0
        }
    }
    //Pickerの要素数を設定
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //pickerが二つあるのでpickerViewで場合わけ
        switch pickerView {
        case studyTimePicker:
            return MinutestimerList.count
        case breakTimePicker:
            return SecondtimerList.count
        default:
            return 0
        }
        
    }
        
    //最初に表示する数字、どのようにカウントしていくのか
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //pickerが二つあるのでpickerViewで場合わけ
        switch pickerView {
        case studyTimePicker:
            return String(MinutestimerList[row])
        case breakTimePicker:
            return String(SecondtimerList[row])
        default:
            return "0"
        }
          
    }
    
    //選択された時の挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //pickerが二つあるのでpickerViewで場合わけ
        switch pickerView {
        case studyTimePicker:
            UserDefaults.standard.set(MinutestimerList[row], forKey: "studyTimePicker"); studyMinutesLabel.text = "勉強時間：\(MinutestimerList[row])分"
        case breakTimePicker:
            UserDefaults.standard.set(SecondtimerList[row], forKey: "breakTimePicker"); breakTimeMinutesLabel.text = "休憩時間：\(SecondtimerList[row])分"; print(SecondtimerList[row])
        default:
            return
               }
        UserDefaults.standard.synchronize()
    }
    
    //開いた時に前回の記録を呼び出して表示する
    func selectStydyNumber() {
        //studyTimePickerの初期位置をuserdelegateに合わせる
        studyTimePickerNumber = UserDefaults.standard.integer(forKey: "studyTimePicker")
        studyTimePicker.selectRow(studyTimePickerNumber, inComponent: 0, animated: true)
        studyMinutesLabel.text = "勉強時間：\(studyTimePickerNumber)分"
        //breakTimePickerの初期位置をuserdelegateに合わせる
        breakTimePickerNumber = UserDefaults.standard.integer(forKey: "breakTimePicker")
        breakTimePicker.selectRow(breakTimePickerNumber, inComponent: 0, animated: true)
        breakTimeMinutesLabel.text = "休憩時間：\(breakTimePickerNumber)分"
        print(breakTimePickerNumber)
    }

    
}

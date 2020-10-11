//
//  LastSettingTimerViewController.swift
//  N'stimer
//
//  Created by 尾原徳泰 on 2020/04/27.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class LastSettingTimerViewController: UIViewController {
    
    @IBOutlet weak var lastStudyTimerLabel: UILabel!
    @IBOutlet weak var lastBreakTimerLabel: UILabel!
    @IBOutlet weak var goSettingButton: UIButton!
    @IBOutlet weak var goTimeraButton: UIButton!
    
    //勉強時間を保存する変数
    var studyMinutes = 25
    //休憩時間を保存する変数
    var breakTimeMinutes = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        studyMinutes = UserDefaults.standard.integer(forKey: "studyTimePicker")
        breakTimeMinutes = UserDefaults.standard.integer(forKey: "breakTimePicker")
        lastStudyTimerLabel.text = "勉強時間\(String(studyMinutes))分"
        lastBreakTimerLabel.text = "休憩時間\(String(breakTimeMinutes))分"
        
        
    }
    
    @IBAction func goSettingButtonAction(_ sender: Any) {
        
        performSegue(withIdentifier: "goSetting", sender: nil)
    }
    
    
    @IBAction func goTimerButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goTimerVC", sender: nil)
    }
    
}

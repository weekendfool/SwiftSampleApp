//
//  TwitterViewController.swift
//  N'sPomodoroTimer
//
//  Created by 尾原徳泰 on 2020/03/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class TwitterViewController: UIViewController {
    
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var twitterTextField: UITextView!
    @IBOutlet weak var backButton: UIButton!
    
    let totalScore = UserDefaults.standard
    let valueKey = "valueKey"
    var totalCountScore = 0
    
    var text = ""
    var twitterText: Any? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //保存されていた値の反映
        totalCountScore = totalScore.object(forKey: valueKey) as! Int
        //textFieldへの反映
        twitterTextField.text = "合計:\(totalCountScore)ピリオド\n合計:\(Double(totalCountScore) * 0.5)h"
    }
    
    @IBAction func twitterButtonAction(_ sender: Any) {
        //投稿用テキストに代入
        twitterText = twitterTextField.text!
        //Twitter投稿用のUIActivityViewControllerをポップさせる
        if let twitterText = twitterText {
            
            let controller = UIActivityViewController(activityItems: [twitterText], applicationActivities: nil)
            
            present(controller, animated: true, completion: nil)
        }
        //本日の勉強時間の初期化
        totalScore.set(0, forKey: valueKey)
        totalScore.synchronize()
        //保存されていた値の反映
        totalCountScore = totalScore.object(forKey: valueKey) as! Int
        //textFieldへの反映
        twitterTextField.text = "合計:\(totalCountScore)ピリオド\n\(Double(totalCountScore) * 0.5)h"
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

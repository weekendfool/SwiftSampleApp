//
//  HomeViewController.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/16.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var selfCheck = 0
    var placeHolderflag = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func encryptButtonAction(_ sender: Any) {
        //ホームで復号するボタンが感知するためにをuserdefaultに保存
        selfCheck = 0
        UserDefaults.standard.set(selfCheck, forKey: "selfCheck")
        //placeHolderflagが押されたことを感知するためにをuserdefaultに保存
        placeHolderflag = 0
        UserDefaults.standard.set(placeHolderflag, forKey: "placeHolderflag")
    }
    
    @IBAction func decryptButtonAction(_ sender: Any) {
        //ホームで復号するボタンが感知するためにをuserdefaultに保存
        selfCheck = 0
        UserDefaults.standard.set(selfCheck, forKey: "selfCheck")
        //placeHolderflagが押されたことを感知するためにをuserdefaultに保存
        placeHolderflag = 0
        UserDefaults.standard.set(placeHolderflag, forKey: "placeHolderflag")
        
    }
    
    @IBAction func lastTimeKeyButtonAction(_ sender: Any) {
    }
    
   

}

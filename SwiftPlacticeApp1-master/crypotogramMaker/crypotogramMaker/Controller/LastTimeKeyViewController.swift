//
//  LastTimeKeyViewController.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/16.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class LastTimeKeyViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var showKeyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //解読keyをuserdefaultから引き出す処理
        let key = UserDefaults.standard.string(forKey: "outputkeyString")
        showKeyLabel.text = key
    }
    

  
  

}

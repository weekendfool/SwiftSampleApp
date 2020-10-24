//
//  ViewController.swift
//  FireBaseSampleApp
//
//  Created by 尾原徳泰 on 2020/10/24.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var sampleTextField: UITextField!
    
    // インスタンス変数
    var DBRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // インスタンスを作成
        DBRef = Database.database().reference()
    }

    @IBAction func tappedAddButton(_ sender: Any) {
        // inputされたデータを変数に格納
        let data = ["naem": sampleTextField.text!]
        DBRef.child("user/01").setValue(data)
        
    }
    
}


//
//  ViewController.swift
//  FirebaseGetSampleApp
//
//  Created by 尾原徳泰 on 2020/12/28.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    // インスタンス変数
    var DBRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // インスタンスの作成
        DBRef = Database.database().reference()
    }
    
    // 情報を書き込む処理
    func setData() {
        
    }

    @IBAction func setButtonPressed(_ sender: Any) {
    }
    
}


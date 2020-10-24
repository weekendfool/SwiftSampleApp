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
    @IBOutlet weak var sampleLabel: UILabel!
    
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
        let data = ["name": sampleTextField.text!]
        DBRef.child("user/01").setValue(data)
        
    }
    
    @IBAction func tappedGetButton(_ sender: Any) {
        // どの部分を読み出してくるか
        let defaultName = DBRef.child("user/01/name")
        // 読み出し
        defaultName.observe(.value) { (snap: DataSnapshot) in self.sampleLabel.text = (snap.value! as! String).description
        }
    }
}


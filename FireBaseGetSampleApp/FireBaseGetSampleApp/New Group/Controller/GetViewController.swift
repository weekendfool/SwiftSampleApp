//
//  GetViewController.swift
//  FireBaseGetSampleApp
//
//  Created by 尾原徳泰 on 2020/10/30.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class GetViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var passLabel: UILabel!
    
    // 取得した情報を入れておく配列
    // 構造体を要素に持つ
    var players: [User]!
    
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sarchButtonAction(_ sender: Any) {
        
        //　passが入力されてるかの確認
        guard let passText = passTextField.text else { return }
        
        // fireBaseのルートを宣言
        let ref = Database.database().reference()
        let db = Firestore.firestore()
        
        // 情報の検索
//        let reference = db.collection("Player").whereField("pass", isEqualTo: passText)
        //　情報の取得
        print("--------------------------------------------------")
        var box = db.collection("Players").whereField("pass", isEqualTo: passText)
        print(box)
        box.getDocuments() { (snapshot, error) in
            if let error = error {
                print("error")
                return
            }
            print(snapshot)
        }
            // 表示する
//            nameLabel.text = datas[0
//            ageLabel.text = datas[1]
//            passLabel.text = datas[2
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passTextField.resignFirstResponder()
        
        return true
    }

}

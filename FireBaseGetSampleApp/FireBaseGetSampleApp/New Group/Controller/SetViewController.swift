//
//  SetViewController.swift
//  FireBaseGetSampleApp
//
//  Created by 尾原徳泰 on 2020/10/30.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class SetViewController: UIViewController, UITextFieldDelegate {

    // パーツの紐付け
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    //　Userのインスタンスを格納
//    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
        ageTextField.delegate = self
        passTextField.delegate = self
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        // 三つの項目が埋まっていないと送信できない処理
        guard let nameText = nameTextField.text else { return }
        guard let ageText = ageTextField.text else { return }
        guard let passText = passTextField.text else { return }
        
        // firebaseのルートを宣言
        let ref = Database.database().reference()
            
        // 入力内容をインスタンス内に格納する
        var addUser = User()
        addUser.name = nameText
        addUser.age = Int(ageText)!
        addUser.pass = passText
        
        // データを登録する
        ref.child("Players").childByAutoId().setValue(addUser.toDictionary)
        
        // 登録後にテキストフィールドの初期化
        nameTextField.text = ""
        ageTextField.text = ""
        passTextField.text = ""
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        passTextField.resignFirstResponder()
        
        return true
    }

}

//
//  UserEditViewController.swift
//  FirebaseSignInSampleApp
//
//  Created by 尾原徳泰 on 2020/10/27.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class UserEditViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var favoriteBookTextField: UITextField!
    
    var user: User!
    var key: String!
    var displayMode: DisplayMode = .insert
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 全画面から受け取った値をセットする
        nameTextField.text = user.name
        ageTextField.text = String(user.age)
        favoriteBookTextField.text = user.favoriteBook
    }
    

    @IBAction func submitButtonTaped(_ sender: Any) {
        let ref = Database.database().reference()
        
        // 入力内容をUserインスタンスに入れる
        var newUser = User()
        newUser.name = nameTextField.text!
        newUser.age = Int(ageTextField.text!) ?? 0
        newUser.favoriteBook = favoriteBookTextField.text!
        
        // データを登録
        ref.child("Users").childByAutoId().setValue(newUser.toDictionary)
        
        // 登録後に、前の画面に戻る
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
//
//  ViewController.swift
//  FirebaseSignInSampleApp
//
//  Created by 尾原徳泰 on 2020/10/24.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // デリゲートの設定
        emailTextField.delegate = self
        passwordTextField.delegate = self
        // 文字を非表示に
        passwordTextField.isSecureTextEntry = true
    }
    
    // ログインのためのメソッド
    func login() {
        // emailとpasswordに文字があるかどうかの条件分岐
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        // signInWithEmailでログイン
        // 第一引数にメールアドレス、第二引数にパスワード
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            // エラーなしなら、認証完了
            if error == nil {
                // エラーがない場合はそのままログイン画面に飛び、ログイン
                self.transitionToView()
            } else {
            print("error...\(error?.localizedDescription)")
            }
        })
        
    }

    // ログインボタン
    @IBAction func didRefgisterUser(_ sender: Any) {
        login()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // ListViewへの遷移
    func transitionToView() {
        self.performSegue(withIdentifier: "toVC", sender: self)
    }
}


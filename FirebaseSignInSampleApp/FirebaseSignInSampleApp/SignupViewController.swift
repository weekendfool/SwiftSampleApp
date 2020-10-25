//
//  SignupViewController.swift
//  FirebaseSignInSampleApp
//
//  Created by 尾原徳泰 on 2020/10/24.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // デリゲートの設定
        emailTextField.delegate = self
        passwordTextField.delegate = self
        // 文字を非表示に
        passwordTextField.isSecureTextEntry = true
    }
    
    // サインアップの処理
    func signup() {
        // textafieldに文字がなければ処理しない
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        
        // サインアップ処理
        // 第一引数にメールアドレス、第二引数にパスワード
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          
        }

    }
    
    

    @IBAction func willSignup(_ sender: Any) {
    }
    
    @IBAction func willTransitionToLogin(_ sender: Any) {
    }
    
}

//
//  ViewController.swift
//  FirebaseSignInSampleApp
//
//  Created by 尾原徳泰 on 2020/10/27.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    // firebaseDatabaseのルートを指定
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.delegate = self
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            self.present(storyboard!, animated: true, completion: nil)
        } catch let error as NSError {
            print("\(error.localizedDescription)")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // データ送信のメソッド
    func create() {
        guard let text = textField.text else { return }
        let user = Auth.auth().currentUser?.uid
        self.ref.child((Auth.auth().currentUser?.uid)!).childByAutoId().setValue(["user": user , "content": text, "data": ServerValue.timestamp()])
    }
    

    @IBAction func post(_ sender: Any) {
        create()
    }
    
    @IBAction func logout(_ sender: Any) {
        logout()
    }
    

}

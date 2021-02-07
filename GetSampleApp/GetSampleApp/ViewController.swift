//
//  ViewController.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/02.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {

    var db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    var user: [String: String] = ["name": "", "age": "", "pass":""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
//        ref = db.collection("users").addDocument(data: [
//            "name": "You",
//            "age": 20,
//            "pass": "pass"
//        ]) { [self] err in
//            if let err = err {
//                print("error adding document: \(err)")
//            } else {
//                print("document added with ID: \(ref!.documentID)")
//            }
//        }
    }

    @IBAction func testButton(_ sender: Any) {
//        db.collection("users").
        // 情報を格納
        user["name"] = nameTextField.text ?? "No Name"
        user["age"] = ageTextField.text ?? "No Age"
        user["pass"] = passTextField.text ?? "passWord"
        
        ref = db.collection("users").addDocument(data: user) { [self] err in
            if let err = err {
                print("error adding document: \(err)")
            } else {
                print("document added with ID: \(ref!.documentID)")
            }
        }
        
    }
    
}


//
//  NextViewController.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/05.
//

import UIKit
import Firebase
import FirebaseFirestore

class NextViewController: UIViewController {
    
    var db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    var user: [String: String] = ["name": "", "age": ""]

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var inputPassTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func sarch() {
        var pass = inputPassTextField.text
        var docRef = db.collection("users").whereField("pass", isEqualTo: pass)
        
        docRef.getDocuments { [self] (querySnapshot, err) in
            if let err = err {
                print("err geting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    nameLabel.text = document.data()["name"] as! String
                    ageLabel.text = document.data()["age"] as! String
                }
            }
        }
        
    }
    
     @IBAction func buttonTapped(_ sender: Any) {
        sarch()
     }
     // MARK: - Navigation

    
    

}

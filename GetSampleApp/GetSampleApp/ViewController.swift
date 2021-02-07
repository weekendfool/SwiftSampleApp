//
//  ViewController.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/02.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    

    var db = Firestore.firestore()
    var ref: DocumentReference? = nil
    var listener: ListenerRegistration?
    
    var dic: [String: Any]?
    var array: [String] = [] {
        didSet {
            self.sampleTableView.reloadData()
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var sampleTableView: UITableView!
    @IBOutlet weak var wordOneTextField: UITextField!
    @IBOutlet weak var wordTwoTextField: UITextField!
    @IBOutlet weak var wordThreeTextField: UITextField!
    @IBOutlet weak var wordFourTextField: UITextField!
    
    
    var user: [String: String] = ["name": "", "age": "", "pass":"", "wordOne": "",  "wordTwo": "",  "wordThree": "",  "wordFour": ""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        array = []
        realTime()
    
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
    
    func realTime() {
//        sarch()
        listener = db.collection("users").addSnapshotListener { documentSnapshot, error in
            if let error = error {
                print("失敗：\(error)")
            } else {
                if let documentSnapshots = documentSnapshot?.documents {
                    for document in documentSnapshots {
                        var n = document.data() {
                            didSet {
//                                self.sampleTableView.reloadData()
                            }
                        }
                        self.array.append(document.data()["wordOne"] as! String)
                        self.array.append(document.data()["wordTwo"] as! String)
                        self.array.append(document.data()["wordThree"] as! String)
                        self.array.append(document.data()["wordFour"] as! String)
                        print("----------------------------------------")
                        print(n)
                        print(self.array)
                    }
                    
                    
                }
            }
        }
        
    }
    
    func set1() {
        let washingtonRef = db.collection("users").document("EyUxbw3cB1Uxgea9MTwd")
        washingtonRef.updateData(["wordOne": wordOneTextField.text]) { (err) in
            if let err = err {
                print("error updating document: \(err)")
            } else {
                print("document successfully updated")
            }
        }
//        realTime()
    }
    func set2() {
        let washingtonRef = db.collection("users").document("EyUxbw3cB1Uxgea9MTwd")
        washingtonRef.updateData(["wordTwo": wordTwoTextField.text]) { (err) in
            if let err = err {
                print("error updating document: \(err)")
            } else {
                print("document successfully updated")
            }
        }
//        realTime()
    }
    func set3() {
        let washingtonRef = db.collection("users").document("EyUxbw3cB1Uxgea9MTwd")
        washingtonRef.updateData(["wordThree": wordThreeTextField.text]) { (err) in
            if let err = err {
                print("error updating document: \(err)")
            } else {
                print("document successfully updated")
            }
        }
//        realTime()
    }
    func set4() {
        let washingtonRef = db.collection("users").document("EyUxbw3cB1Uxgea9MTwd")
        washingtonRef.updateData(["wordFour": wordFourTextField.text]) { (err) in
            if let err = err {
                print("error updating document: \(err)")
            } else {
                print("document successfully updated")
            }
        }
//        realTime()
    }
    
    func sarch() {
        
        var docRef = db.collection("users").whereField("pass", isEqualTo: "pass")
        
        docRef.getDocuments { [self] (querySnapshot, err) in
            if let err = err {
                print("err geting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
//                    nameLabel.text = document.data()["name"] as! String
//                    ageLabel.text = document.data()["age"] as! String
//                    var n = document.data()["wordOne"] as! String
                    array.append(document.data()["wordOne"] as! String)
                    array.append(document.data()["wordTwo"] as! String)
                    array.append(document.data()["wordThree"] as! String)
                    array.append(document.data()["wordFour"] as! String)
//                    array.append(n)
                    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                    print(array)
//                    print(n)
                    sampleTableView.reloadData()
                }
            }
        }
        
    }
    
    @IBAction func testButton(_ sender: Any) {
//        db.collection("users").
        // 情報を格納
        user["name"] = nameTextField.text ?? "No Name"
        user["age"] = ageTextField.text ?? "No Age"
        user["pass"] = passTextField.text ?? "passWord"
        user["wordOne"] = wordOneTextField.text ?? "wordOne"
        user["wordTwo"] = wordTwoTextField.text ?? "wordTwo"
        user["wordThree"] = wordThreeTextField.text ?? "wordThree"
        user["wordFour"] = wordFourTextField.text ?? "wordFour"
        
        set1()
        set2()
        set3()
        set4()
//        ref = db.collection("users").addDocument(data: user) { [self] err in
//            if let err = err {
//                print("error adding document: \(err)")
//            } else {
//                print("document added with ID: \(ref!.documentID)")
//            }
//        }
//
        
        
    }
    
}


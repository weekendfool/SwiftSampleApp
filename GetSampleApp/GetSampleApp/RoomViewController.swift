//
//  RoomViewController.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/08.
//

import UIKit
import Firebase
import FirebaseFirestore

class RoomViewController: UIViewController {

    @IBOutlet weak var roomIDLabel: UILabel!
    @IBOutlet weak var inputRoomIDTextField: UITextField!
    
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        makeDate()
//        print("-----------------------------")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func makeDate() -> String {
        // インスタンス作成
        let dt = Date()
        let dateFormatter = DateFormatter()
        
        // 取得する形式を決定
        dateFormatter.dateFormat = "mmssSS"
        
        var roomKye = dateFormatter.string(from: dt)
        var randomRoomKey = ""
        
        for string in roomKye.shuffled() {
            randomRoomKey += String(string)
        }
        
        
        print("----------------------------------")
        print(roomKye)
        print(randomRoomKey)
        
        return randomRoomKey
    }
    
    func set(randomRoomKey: String) {
        let washingtonRef = db.collection("users").document("9hSUopdBlZxXarqvmuni")
        washingtonRef.updateData(["roomID": randomRoomKey]) { (err) in
            if let err = err {
                print("error updating document: \(err)")
            } else {
                print("document successfully updated")
            }
        }
    }
    
    @IBAction func tappedRoomIDButton(_ sender: Any) {
        var randomRoomKey = makeDate()
        roomIDLabel.text = randomRoomKey
        set(randomRoomKey: randomRoomKey)
    }
    
    @IBAction func tappedInputRoomIDButton(_ sender: Any) {
        
    }
}

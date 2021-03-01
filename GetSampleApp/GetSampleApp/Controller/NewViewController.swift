//
//  NewViewController.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/22.
//

import UIKit
import Firebase
import FirebaseFirestore


class NewViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    // インスタンスの作成
    var userData = UserData()
    var roomData = RoomData()
    var operateDatabase = OperateDatabase()
    
    var database = Firestore.firestore()
    var ref: DocumentReference? = nil
    // リアルタイム更新に必要な監視状態のフラグ？
    var listener: ListenerRegistration?
    
    var getData: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedButtonAction(_ sender: Any) {
//        database.collection("Rooms").document("Sample")
//            .addSnapshotListener { documentSnapshot, error in
//              guard let document = documentSnapshot else {
//                print("Error fetching document: \(error!)")
//                return
//              }
//              guard let data = document.data() else {
//                print("Document data was empty.")
//                return
//              }
//                print("========================")
//              print("Current data: \(data)")
//            }
//
        // データ返却用の変数
        
        listener = database.collection("Rooms").document("Sample").addSnapshotListener { [self]
            documentSnapshot, err in
            if let err = err {
                print("-----------------------------------------")
                print("Error At startRealTimeMonitor(),numberOfTargets Is : \(err)")
            } else {
                // 更新されたデータを取得
                if let document = documentSnapshot {
                    if let data = document.data() {
                        getData = data["roomID"]!
                        print("========================")
                        print("Current data: \(data)")
                        print("Current getData: \(getData)")
                    }
                }
            }
        }

    }
    
   
    @IBAction func updataButton(_ sender: Any) {
        //  データの書き込み
        userData.roomID = inputTextField.text!
        userData.registeruserDatabaseDic()
        operateDatabase.updateDatabase(targetCollection: "Rooms", targetDocument: "Sample", TargetFieldName: "roomID", dicOfTarget: userData.userDatabaseDic)

    }
    
}

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
        
        listener = database.collection("Rooms").document("Sample").addSnapshotListener(includeMetadataChanges: true) { [self]
            documentSnapshot, err in
            if let err = err {
                print("-----------------------------------------")
                print("Error At startRealTimeMonitor(),numberOfTargets Is : \(err)")
            } else {
                // 更新されたデータを取得
                if let document = documentSnapshot {
                    if let data = document.data() {
                        getData = data["moveCordinate"]!
                        print("========================")
                        print("Current data: \(data)")
                        print("Current getData: \(getData)")
                        if let getData = getData {
                            print(getData)
                        }
                    }
                }
            }
        }

    }
    
    
    
    var DatabaseDic: [String: Any] = [
        "roomID": "",
        "betrayersDic": ""
    ]
    
   
    @IBAction func updataButton(_ sender: Any) {
//        print("========================")
        //  データの書き込み
        
        roomData.betrayersDic["betrayerOfHostUser"] = "2"
        roomData.betrayersDic["betrayerOfInvitedUser"] = "9"
        print("========================")
        print(roomData.roomDatabaseDic)
        print(roomData.roomDatabaseDic["betrayersDic"]!)
        
        roomData.registeruserDatabaseDic()
        operateDatabase.updateDatabase(targetCollection: "Rooms", targetDocument: "Sample", TargetFieldName: "betrayersDic", dataOfTarget: roomData.roomDatabaseDic)
               
//        DatabaseDic["betrayersDic"] = [
//            "betrayerOfInvitedUser": "0",
//            "betrayerOfHostUser": "2"
//            ]
//
////        DatabaseDic["betrayersDic"] = 18
//        print("DatabaseDic:\(DatabaseDic)")
//
//        roomData.registeruserDatabaseDic()
//
        print("========================")
       
        
    }
    
    @IBAction func changeInputData(_ sender: Any) {
       
    }
    
}

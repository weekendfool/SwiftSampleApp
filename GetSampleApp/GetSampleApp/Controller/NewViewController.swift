//
//  NewViewController.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/22.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    // インスタンスの作成
    var userData = UserData()
    var roomData = RoomData()
    var operateDatabase = OperateDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedButtonAction(_ sender: Any) {
        // データの格納
        roomData.roomID = inputTextField.text ?? "Non Data"
        // 更新
        roomData.registeruserDatabaseDic()
        
        // firebaseに書き込み
//        operateDatabase.writeRoomDatabase(targetCollection: "Rooms", inputDocumentName: "SampleRoom", inputDataDic: roomData.roomDatabaseDic)
        print("&&&&&&&&&&&&&&&&&&&&&")
//        print(roomData.roomDic)
//        operateDatabase.writeUserDatabase(targetCollection: "Rooms", inputDataDic: roomData.roomDic)
//
    }
    
   

}

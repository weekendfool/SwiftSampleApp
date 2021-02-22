//
//  TestViewController.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/10.
//

import UIKit
import Firebase
import FirebaseFirestore

class TestViewController: UIViewController {

    @IBOutlet weak var roomIDText: UITextField!
    @IBOutlet weak var invitedUserIDText: UITextField!
    @IBOutlet weak var hostUserIDText: UITextField!
    @IBOutlet weak var invitedUserStartFlagText: UITextField!
    @IBOutlet weak var hostUserStartFlagText: UITextField!
    @IBOutlet weak var betrayerOfInvitedUserText: UITextField!
    @IBOutlet weak var betrayerOfHostUserText: UITextField!
    @IBOutlet weak var firstMoveCordinateText: UITextField!
    @IBOutlet weak var secondMoveCordinateText: UITextField!
    @IBOutlet weak var thirdMoveCordinateText: UITextField!
    @IBOutlet weak var fourthMoveCordinateText: UITextField!
    @IBOutlet weak var fifthMoveCordinateText: UITextField!
    @IBOutlet weak var sixthMoveCordinateText: UITextField!
    @IBOutlet weak var seventhMoveCordinateText: UITextField!
    @IBOutlet weak var eighthMoveCordinateText: UITextField!
    @IBOutlet weak var ninthMoveCordinateText: UITextField!
    @IBOutlet weak var tenthMoveCordinateText: UITextField!
    @IBOutlet weak var eleventhMoveCordinateText: UITextField!
    @IBOutlet weak var twelfthMoveCordinateText: UITextField!
    @IBOutlet weak var thirteenthMoveCordinateText: UITextField!
    @IBOutlet weak var fourteenthCordinateText: UITextField!
    @IBOutlet weak var fifteenthCordinateText: UITextField!
    @IBOutlet weak var sixteenthMoveCordinateText: UITextField!
    
    @IBOutlet weak var outPutLabel: UILabel!
    // インスタンスの宣言
    let user = UserData()
    var room = RoomData()
    var operateDatabase = OperateDatabase()
    
    var roomName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    func writeData() {
        
        // データのセッティング
        room.roomID = roomIDText.text ?? "Non"
        
        // 書き込み用の辞書を更新
        room.registeruserDatabaseDic()
        print("$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        print(room.roomDatabaseDic)
        
        // firebaseに書き込み処理
        operateDatabase.writeRoomDatabase(targetCollection: "Rooms", inputDocumentName: "1111", inputDataDic: room.roomDatabaseDic)

//        operateDatabase.writeUserDatabase(targetCollection: "Users", inputDataDic: room.roomDatabaseDic)
        
        
    }
    
   

    @IBAction func buttonTapped(_ sender: Any) {
        writeData()
        
    }
    
    @IBAction func realtimeSwitch(_ sender: Any) {
    }
    @IBAction func tappedWriteButton(_ sender: Any) {
        
        
    }
}

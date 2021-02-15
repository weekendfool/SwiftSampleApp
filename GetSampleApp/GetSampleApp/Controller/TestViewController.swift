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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func writeData() {
        // データのセッティング
        room.roomID = roomIDText.text ?? "No Room"
        room.hostUserID = hostUserIDText.text ?? "No Host"
        room.invitedUserID = invitedUserIDText.text ?? "No humen"
        room.betrayerOfHostUser = betrayerOfHostUserText.text ?? "0"
        room.betrayerOfInvitedUser = betrayerOfInvitedUserText.text ?? "0"
        
        // 打った手の座標を記録する変数
        room.firstMoveCordinate = firstMoveCordinateText.text ?? "0"
        room.secondMoveCordinate = secondMoveCordinateText.text ?? "0"
        room.thirdMoveCordinate = thirdMoveCordinateText.text ?? "0"
        room.fourthMoveCordinate = fourthMoveCordinateText.text ?? "0"
        room.fifthMoveCordinate = fifthMoveCordinateText.text ?? "0"
        room.sixthMoveCordinate = sixthMoveCordinateText.text ?? "0"
        room.seventhMoveCordinate = seventhMoveCordinateText.text ?? "0"
        room.eighthMoveCordinate = eighthMoveCordinateText.text ?? "0"
        room.ninthMoveCordinate = ninthMoveCordinateText.text ?? "0"
        room.tenthMoveCordinate = tenthMoveCordinateText.text ?? "0"
        room.eleventhMoveCordinate = eleventhMoveCordinateText.text ?? "0"
        room.twelfthMoveCordinate = twelfthMoveCordinateText.text ?? "0"
        room.thirteenthMoveCordinate = thirteenthMoveCordinateText.text ?? "0"
        room.fourteenthCordinate = fourteenthCordinateText.text ?? "0"
        room.fifteenthCordinate = fifteenthCordinateText.text ?? "0"
        room.sixteenthMoveCordinate = sixteenthMoveCordinateText.text ?? "0"
        
        // 書き込み用の辞書を更新
        room.registeruserDatabaseDic()
        
        // 実際に書き込む処理
        operateDatabase.makeDatabase(targetCollection: "Rooms", inputDataDic: room.userDatabaseDic)
    }
    
    func updateData() {
        // 打った手の座標を記録する変数
        room.firstMoveCordinate = firstMoveCordinateText.text ?? "0"
        room.secondMoveCordinate = secondMoveCordinateText.text ?? "0"
        room.thirdMoveCordinate = thirdMoveCordinateText.text ?? "0"
        room.fourthMoveCordinate = fourthMoveCordinateText.text ?? "0"
        room.fifthMoveCordinate = fifthMoveCordinateText.text ?? "0"
        room.sixthMoveCordinate = sixthMoveCordinateText.text ?? "0"
        room.seventhMoveCordinate = seventhMoveCordinateText.text ?? "0"
        room.eighthMoveCordinate = eighthMoveCordinateText.text ?? "0"
        room.ninthMoveCordinate = ninthMoveCordinateText.text ?? "0"
        room.tenthMoveCordinate = tenthMoveCordinateText.text ?? "0"
        room.eleventhMoveCordinate = eleventhMoveCordinateText.text ?? "0"
        room.twelfthMoveCordinate = twelfthMoveCordinateText.text ?? "0"
        room.thirteenthMoveCordinate = thirteenthMoveCordinateText.text ?? "0"
        room.fourteenthCordinate = fourteenthCordinateText.text ?? "0"
        room.fifteenthCordinate = fifteenthCordinateText.text ?? "0"
        room.sixteenthMoveCordinate = sixteenthMoveCordinateText.text ?? "0"
        
//        operateDatabase.updateDatabase(targetCollection: "Rooms", userID: <#T##String#>, TargetFieldName: <#T##String#>, dicOfTarget: <#T##[String : Any]#>)
//    }

    @IBAction func buttonTapped(_ sender: Any) {
    }
    
    @IBAction func realtimeSwitch(_ sender: Any) {
    }
}

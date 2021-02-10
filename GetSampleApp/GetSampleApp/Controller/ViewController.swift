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
        
        return 7
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        for num in 0...6 {
        cell.textLabel?.text = user.userDatabaseDic[array[indexPath.row]] as? String
        print(user.userDatabaseDic[array[indexPath.row]])
//        }
        return cell
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var roomIDTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var sampleTableView: UITableView!
    
    
    // インスタンスの宣言
    var user = UserData()
    let room = RoomData()
    var operateDatabase = OperateDatabase()
    let users = "Users"
    let rooms = "Rooms"
    let waitRandomMatchFlag = "waitRandomMatchFlag"
    var userID = ""
    
    var array: [String] = [
        "userName",
        "passWord",
        "userID",
        "roomID",
        "waitRandomMatchFlag",
        "banWritingMatchingFlag",
        "parmitRandomMatchRoomFlag"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
  
    }
    
    @IBAction func realtimeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            user.banWritingMatchingFlag = true
        } else {
            user.banWritingMatchingFlag = false
        }
    }
    
    @IBAction func waitRandomMatchFlag(_ sender: UISwitch) {
        if sender.isOn {
            user.waitRandomMatchFlag = true
        } else {
            user.waitRandomMatchFlag = false
        }
    }
    
    @IBAction func banWritingMatchingFlag(_ sender: UISwitch) {
        if sender.isOn {
            operateDatabase.startRealTimeMonitor(targetCorectionIsUsers: users, targetCorectionIsRooms: rooms, targetFieldName: waitRandomMatchFlag, numberOfTargets: 1)
        } else {
            operateDatabase.stopRealTimeMonitor()
        }
    }
    @IBAction func parmitRandomMatchRoomFlag(_ sender: UISwitch) {
        if sender.isOn {
            user.parmitRandomMatchRoomFlag = true
        } else {
            user.parmitRandomMatchRoomFlag = false
        }
    }
    
    @IBAction func tappedbutton(_ sender: Any) {
        // データの登録
        user.userName = nameTextField.text ?? "Noname"
        user.passWord = passTextField.text ?? "admin"
        user.roomID = roomIDTextField.text ?? ""
        user.registeruserDatabaseDic()
        
        //  データの書き込み
        userID = operateDatabase.makeDatabase(targetCollection: users, inputDataDic: user.userDatabaseDic)
        
//        print("##########################")
        print(userID)
        sampleTableView.reloadData()
     
        
    }
}


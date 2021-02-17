//
//  GameViewController.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/16.
//

import UIKit
import Firebase
import FirebaseFirestore

class GameViewController: UIViewController {

    // MARK: - コードの紐付け
    @IBOutlet weak var outputLabel1: UILabel!
    @IBOutlet weak var outputLabel2: UILabel!
    @IBOutlet weak var outputLabel3: UILabel!
    @IBOutlet weak var outputLabel4: UILabel!
    @IBOutlet weak var outputLabel5: UILabel!
    @IBOutlet weak var outputLabel6: UILabel!
    @IBOutlet weak var outputLabel7: UILabel!
    @IBOutlet weak var outputLabel8: UILabel!
    @IBOutlet weak var outputLabel9: UILabel!
    @IBOutlet weak var outputLabel10: UILabel!
    @IBOutlet weak var outputLabel11: UILabel!
    @IBOutlet weak var outputLabel12: UILabel!
    @IBOutlet weak var outputLabel13: UILabel!
    @IBOutlet weak var outputLabel14: UILabel!
    @IBOutlet weak var outputLabel15: UILabel!
    @IBOutlet weak var outputLabel16: UILabel!
    
    @IBOutlet weak var inputButton1: UIButton!
    @IBOutlet weak var inputButton2: UIButton!
    @IBOutlet weak var inputButton3: UIButton!
    @IBOutlet weak var inputButton4: UIButton!
    @IBOutlet weak var inputButton5: UIButton!
    @IBOutlet weak var inputButton6: UIButton!
    @IBOutlet weak var inputButton7: UIButton!
    @IBOutlet weak var inputButton8: UIButton!
    @IBOutlet weak var inputButton9: UIButton!
    @IBOutlet weak var inputButton10: UIButton!
    @IBOutlet weak var inputButton11: UIButton!
    @IBOutlet weak var inputButton12: UIButton!
    @IBOutlet weak var inputButton13: UIButton!
    @IBOutlet weak var inputButton14: UIButton!
    @IBOutlet weak var inputButton15: UIButton!
    @IBOutlet weak var inputButton16: UIButton!
    
    @IBOutlet weak var inputButtonN: UIButton!
    @IBOutlet weak var inputButtonB: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var wiinerLabel: UILabel!
    
    
    // MARK: - インスタンスの生成
    var roomData = RoomData()
    var operateDatabase = OperateDatabase()
    var userData = UserData()
    var saveColor = SaveColor()
    var judgmentWiner = JudgmentWiner()
    var judgementBetrayer = JudgementBetrayer()
    
    let targetRoomCorection = "Rooms"
    let targetUserCorection = "Users"
    
    var myUserID = ""
    var ourRoomID = ""
    var hostFlag = false
    var myColor = UIColor.red
    var yourColor = UIColor.blue
    var betrayerFlag = false
    
    var uiButtonDic: [String: UIButton] = [:]
    var uiLabelDic: [String: UILabel] = [:]
    
    
    var realTimeChangeColors = "" {
        didSet {
            
            // アプリ内に書き込み
            roomData.MoveCordinate[""] = [
                ["plyerInfo": "you"]:
                ["numberInfo": realTimeChangeColors]
            ]
            roomData.registeruserDatabaseDic()
            //　ボタンの色を変更する
            uiButtonDic[realTimeChangeColors]!.backgroundColor = yourColor
            uiLabelDic[realTimeChangeColors]!.backgroundColor = yourColor
            // ボタンの無効化
            uiButtonDic[realTimeChangeColors]!.isEnabled = true
            // 色の格納
            saveColor.saveColor(inputColor: "you", placeNumber: Int(realTimeChangeColors)!)
            // 勝者判定
            if realTimeChangeColors == "16" {
                // 裏切り者の色変更処理
                saveColor.changeColorOfBetrayer(inputMyNumber: judgementBetrayer.betrayerDic["me"]!, inputYourNumber: judgementBetrayer.betrayerDic["you"]!)
                // 勝敗判定
                var winer = judgmentWiner.judgmentWiner(afterColorDic: saveColor.colorDic)
                
                if winer == 1 {
                    wiinerLabel.text = "You Win"
                } else if winer == 2 {
                    wiinerLabel.text = "You Lose"
                } else if winer == 3 {
                    wiinerLabel.text = "引き分け"
            }
                operateDatabase.stopRealTimeMonitor()
        }
    }
}
    
    var realTimeChangeBetrayers = "" {
        didSet{
            // 相手が裏切った時の処理
            var yourBetrayerName = ""
            if hostFlag {
                yourBetrayerName = "betrayerOfHostUser"
            } else {
                yourBetrayerName = "betrayerOfInvitedUser"
            }
            // 裏切りの書き込み
            roomData.betrayersDic[yourBetrayerName] = String(realTimeChangeBetrayers)
            roomData.registeruserDatabaseDic()
            judgementBetrayer.recordBetrayer(playerName: "you", choosePlaceNumber: Int(realTimeChangeBetrayers)!)
        }
    }
    
    var cordinateNumber: [Int: String] = [
        1: "firstMoveCordinate",
        2: "secondMoveCordinate",
        3: "thirdMoveCordinate",
        4: "fourthMoveCordinate",
        5: "fifthMoveCordinate",
        6: "sixthMoveCordinate",
        7: "seventhMoveCordinate",
        8: "eighthMoveCordinate",
        9: "ninthMoveCordinate",
        10: "tenthMoveCordinate",
        11: "eleventhMoveCordinate",
        12: "twelfthMoveCordinate",
        13: "thirteenthMoveCordinate",
        14: "fourteenthCordinate",
        15: "fifteenthCordinate",
        16: "MoveCordinate",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        realTimeChangeColors = operateDatabase.startRealTimeMonitor(targetCorectionIsUsers: targetUserCorection, targetCorectionIsRooms: targetRoomCorection, targetFieldName: "MoveCordinate", numberOfTargets: 2) as! String
        
        realTimeChangeBetrayers = operateDatabase.startRealTimeMonitor(targetCorectionIsUsers: targetUserCorection, targetCorectionIsRooms: targetRoomCorection, targetFieldName: "betrayersDic", numberOfTargets: 2) as! String
        
        // Do any additional setup after loading the view.
        uiButtonDic = [
            "1": inputButton1,
            "2": inputButton2,
            "3": inputButton3,
            "4": inputButton4,
            "5": inputButton5,
            "6": inputButton6,
            "7": inputButton7,
            "8": inputButton8,
            "9": inputButton9,
            "10": inputButton10,
            "11": inputButton11,
            "12": inputButton12,
            "13": inputButton13,
            "14": inputButton14,
            "15": inputButton15,
            "16": inputButton16,
        ]
        
        uiLabelDic = [
            "1": outputLabel1,
            "2": outputLabel2,
            "3": outputLabel3,
            "4": outputLabel4,
            "5": outputLabel5,
            "6": outputLabel6,
            "7": outputLabel7,
            "8": outputLabel8,
            "9": outputLabel9,
            "10": outputLabel10,
            "11": outputLabel11,
            "12": outputLabel12,
            "13": outputLabel13,
            "14": outputLabel14,
            "15": outputLabel15,
            "16": outputLabel16,
            
        ]
        
    }
    
    // MARK: - 必要な関数の生成
    // ルームの検索
    func searchRoomID() {
        // ルームを検索する
        // userでルームidを持っている人を検索する
        let gotData = operateDatabase.searchDatabase(targetCorection: targetUserCorection, targetFieldName: "roomID", dicOfTarget: userData.userDatabaseDic)
        
        if gotData as! String == "mySampleRoom" {
//            // ルームの作成
//            operateDatabase.makeDatabase(targetCollection: targetRoomCorection, inputDataDic: roomData.roomDatabaseDic)
//
            ourRoomID = gotData as! String
            // フラグを立てる
            // hostFlagがonのとき
            if hostFlag {
                operateDatabase.updateDatabase(targetCollection: targetUserCorection, userID: myUserID, TargetFieldName: roomData.hostUserID, dicOfTarget: roomData.roomDatabaseDic)
            } else {
                operateDatabase.updateDatabase(targetCollection: targetUserCorection, userID: myUserID, TargetFieldName: roomData.invitedUserID, dicOfTarget: roomData.roomDatabaseDic)
            }
            
        }
    }
    
    
    // 裏切りの処理
    // 自分が裏切った時の処理
    func betray(buttonNumber: Int) {
        var myBetrayerName = ""
        if hostFlag {
            myBetrayerName = "betrayerOfHostUser"
//            roomData.betrayersDic["betrayerOfHostUser"] = String(buttonNumber)
        } else {
            myBetrayerName = "betrayerOfInvitedUser"
//            roomData.betrayerOfInvitedUser = String(buttonNumber)
        }
        // 裏切りの書き込み
        roomData.betrayersDic[myBetrayerName] = String(buttonNumber)
        roomData.registeruserDatabaseDic()
        operateDatabase.updateDatabase(targetCollection: targetRoomCorection, userID: myUserID, TargetFieldName: myBetrayerName, dicOfTarget: roomData.roomDatabaseDic)
        judgementBetrayer.recordBetrayer(playerName: "me", choosePlaceNumber: buttonNumber)
    }
    
    // 相手のボタンの動きに対応して自分の色を変更する
    func turnColor(buttonUI: UIButton, label: UILabel) {
        
    }
    
    // 自分の色を変更する
    func buttonAction(buttonNumber: Int, buttonUI: UIButton, label: UILabel) {
        if betrayerFlag {
            betray(buttonNumber: buttonNumber)
        }
        //　ボタンの色を変更する
        buttonUI.backgroundColor = myColor
        label.backgroundColor = myColor
        // ボタンの無効化
        buttonUI.isEnabled = true
        
        // アプリ内に書き込み
        roomData.MoveCordinate[cordinateNumber[buttonNumber]!] = [
            ["plyerInfo": "me"]:
            ["numberInfo": String(buttonNumber)]
        ]
        roomData.registeruserDatabaseDic()
        // firebaseに書き込み
        operateDatabase.updateDatabase(targetCollection: targetRoomCorection, userID: myUserID, TargetFieldName: "MoveCordinate", dicOfTarget: roomData.roomDatabaseDic)
        
        // 色の格納
        saveColor.saveColor(inputColor: "me", placeNumber: buttonNumber)
        
    }
    
    // 裏切り者の判定
    
    
    // MARK: -　ボタンアクション
    @IBAction func tappedInputButton1(_ sender: Any) {
        let buttonNumber = 1
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    
    @IBAction func tappedInputButton2(_ sender: Any) {
        let buttonNumber = 2
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton3(_ sender: Any) {
        let buttonNumber = 3
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
   
    @IBAction func tappedInputButton4(_ sender: Any) {
        let buttonNumber = 4
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    
    @IBAction func tappedInputButton5(_ sender: Any) {
        let buttonNumber = 5
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    
    @IBAction func tappedInputButton6(_ sender: Any) {
        let buttonNumber = 6
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton7(_ sender: Any) {
        let buttonNumber = 7
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton8(_ sender: Any) {
        let buttonNumber = 8
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton9(_ sender: Any) {
        let buttonNumber = 9
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton10(_ sender: Any) {
        let buttonNumber = 10
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton11(_ sender: Any) {
        let buttonNumber = 11
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton12(_ sender: Any) {
        let buttonNumber = 12
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton13(_ sender: Any) {
        let buttonNumber = 13
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton14(_ sender: Any) {
        let buttonNumber = 14
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton15(_ sender: Any) {
        let buttonNumber = 15
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    @IBAction func tappedInputButton16(_ sender: Any) {
        let buttonNumber = 16
        buttonAction(buttonNumber: buttonNumber, buttonUI: uiButtonDic[String(buttonNumber)]!, label: uiLabelDic[String(buttonNumber)]!)
    }
    
    @IBAction func tappedInputButtonN(_ sender: Any) {
        betrayerFlag = false
        
    }
    @IBAction func tappedInputButtonB(_ sender: Any) {
        betrayerFlag = true
    }
    
    @IBAction func onHostSwitch(_ sender: UISwitch) {
        if sender.isOn {
            // userIDにホストとして書き込むフラグを立てる
            hostFlag = true
            myColor = UIColor.red
            yourColor = UIColor.blue
            ourRoomID = "mySampleRoom"
            myUserID = "host"
        } else {
            // userIDに招待客として書き込むフラグを立てる
            hostFlag = false
            myColor = UIColor.blue
            yourColor = UIColor.red
            myUserID = "invited"
            searchRoomID()
        }
        roomData.hostUserID = myUserID
    }
    
    @IBAction func tappedStartButton(_ sender: Any) {
        // ゲームのスタートをする
        if hostFlag {
            operateDatabase.updateDatabase(targetCollection: targetRoomCorection, userID: myUserID, TargetFieldName: "hostUserID", dicOfTarget: roomData.roomDatabaseDic)
        } else {
            operateDatabase.updateDatabase(targetCollection: targetRoomCorection, userID: myUserID, TargetFieldName: "invitedUserID", dicOfTarget: roomData.roomDatabaseDic)
        }
        
        // リアルタイム監視の開始処理
        operateDatabase.startRealTimeMonitor(targetCorectionIsUsers: targetRoomCorection, targetCorectionIsRooms: ourRoomID, targetFieldName: "MoveCordinate", numberOfTargets: 2)
    }
    
}

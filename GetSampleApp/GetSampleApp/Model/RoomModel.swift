//
//  RoomModel.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/10.
//

import Foundation

struct RoomData {
    
    // MARK: - データベース内でのルームが持つ情報を宣言
    // 作成されたルームのID
    var roomID = ""
    // 招待されたユーザーのID
    var invitedUserID = ""
    // ルームを作成したユーザーのID
    var hostUserID = ""
    // ルームを作成したユーザーがフィールドを展開したかどうかのフラグ
    var invitedUserStartFlag = false
    // 招待されたユーザーがフィールドを展開したかどうかのフラグ
    var hostUserStartFlag = false
    // 招待されたユーザーの裏切りが何手目かを記録する変数
    var betrayersDic: [String: String] = [
        "betrayerOfInvitedUser": "",
        "betrayerOfHostUser": ""
    ]

    // ルームを作成したユーザーの裏切りが何手目かを記録する変数
    // 打った手の座標を記録する変数
    var moveCordinate: [String: [String: String]] = [
        "firstMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "secondMoveCordinate": ["plyerInfo": "","numberInfo": ""],
        "thirdMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "fourthMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "fifthMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "sixthMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "seventhMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "eighthMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "ninthMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "tenthMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "eleventhMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "twelfthMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "thirteenthMoveCordinate": ["plyerInfo": "", "numberInfo": ""],
        "fourteenthCordinate": ["plyerInfo": "", "numberInfo": ""],
        "fifteenthCordinate": ["plyerInfo": "", "numberInfo": ""],
        "sixteenthMoveCordinate": ["plyerInfo": "", "numberInfo": ""]
    ]
    
    // MARK: - データベースに登録するユーザーの変数宣言
    
    var roomDatabaseDic: [String: Any] = [
        "roomID": "",
        "invitedUserID": "",
        "hostUserID": "",
        "invitedUserStartFlag": false,
        "hostUserStartFlag": false,
        "betrayersDic": [
            "betrayerOfInvitedUser": "",
            "betrayerOfHostUser": ""
        ],
        "moveCordinate": [
            "firstMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "secondMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "thirdMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "fourthMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "fifthMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "sixthMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "seventhMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "eighthMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "ninthMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "tenthMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "eleventhMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "twelfthMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "thirteenthMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "fourteenthCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "fifteenthCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ],
            "sixteenthMoveCordinate": [
                ["plyerInfo": "","numberInfo": ""]
            ]
        ]
    ]
    
    // MARK: - データベースの操作
    // データベースに登録するユーザーの情報を格納する
    mutating func registeruserDatabaseDic() {
        roomDatabaseDic["roomID"] = roomID
        roomDatabaseDic["invitedUserID"] = invitedUserID
        roomDatabaseDic["hostUserID"] = hostUserID
        roomDatabaseDic["invitedUserStartFlag"] = invitedUserStartFlag
        roomDatabaseDic["hostUserStartFlag"] = hostUserStartFlag
        roomDatabaseDic["betrayersDic"] = betrayersDic["betrayerOfInvitedUser"]
        roomDatabaseDic["betrayersDic"] = betrayersDic["betrayerOfHostUser"]
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["firstMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["firstMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["secondMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["secondMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["thirdMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["thirdMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["fourthMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["fourthMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["fifthMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["fifthMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["sixthMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["sixthMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["seventhMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["seventhMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["eighthMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["eighthMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["ninthMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["ninthMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["tenthMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["tenthMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["eleventhMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["eleventhMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["twelfthMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["twelfthMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["thirteenthMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["thirteenthMoveCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["fourteenthCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["fourteenthCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["fifteenthCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["fifteenthCordinate"]!["numberInfo"] ?? ""
        
        roomDatabaseDic["moveCordinate"] = moveCordinate["sixteenthMoveCordinate"]!["plyerInfo"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["sixteenthMoveCordinate"]!["numberInfo"] ?? ""
        
    }
    
}

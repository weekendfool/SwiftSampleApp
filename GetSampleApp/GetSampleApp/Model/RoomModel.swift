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
    var moveCordinate: [String: [[String: String]: [String: String]]] = [
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
        "roomName": "",
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
        roomDatabaseDic["moveCordinate"] = moveCordinate["firstMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["secondMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["thirdMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["fourthMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["fifthMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["sixthMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["seventhMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["eighthMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["ninthMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["tenthMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["eleventhMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["twelfthMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["thirteenthMoveCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["fourteenthCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["fifteenthCordinate"] ?? ""
        roomDatabaseDic["moveCordinate"] = moveCordinate["sixteenthMoveCordinate"] ?? ""
        
    }
    
}

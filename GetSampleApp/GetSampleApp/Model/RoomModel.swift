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
            "betrayerOfInvitedUser": "0",
            "betrayerOfHostUser": "0"
            ],

        "moveCordinate": [
            "firstMoveCordinate": [
                ["plyerInfo": "non", "numberInfo": "0"]
            ],
            "secondMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "thirdMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "fourthMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "fifthMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "sixthMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "seventhMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "eighthMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "ninthMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "tenthMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "eleventhMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "twelfthMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "thirteenthMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "fourteenthCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "fifteenthCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
            ],
            "sixteenthMoveCordinate": [
                ["plyerInfo": "non","numberInfo": "0"]
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
        roomDatabaseDic["betrayersDic"] = [
            "betrayerOfInvitedUser": betrayersDic["betrayerOfInvitedUser"]!,
            "betrayerOfHostUser": betrayersDic["betrayerOfHostUser"]!
            ]
        roomDatabaseDic["moveCordinate"] = [
            "firstMoveCordinate": [
                "plyerInfo": moveCordinate["firstMoveCordinate"]!["plyerInfo"]!,
                "numberInfo": moveCordinate["firstMoveCordinate"]!["numberInfo"]!
            ],
            "secondMoveCordinate": [
                "plyerInfo": moveCordinate["secondMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["secondMoveCordinate"]!["numberInfo"]
            ],
            "thirdMoveCordinate": [
                "plyerInfo": moveCordinate["thirdMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["thirdMoveCordinate"]!["numberInfo"]
            ],
            "fourthMoveCordinate": [
                "plyerInfo": moveCordinate["fourthMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["fourthMoveCordinate"]!["numberInfo"]
            ],
            "fifthMoveCordinate": [
                "plyerInfo": moveCordinate["fifthMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["fifthMoveCordinate"]!["numberInfo"]
            ],
            "sixthMoveCordinate": [
                "plyerInfo": moveCordinate["sixthMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["sixthMoveCordinate"]!["numberInfo"]
            ],
            "seventhMoveCordinate": [
                "plyerInfo": moveCordinate["seventhMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["seventhMoveCordinate"]!["numberInfo"]
            ],
            "eighthMoveCordinate": [
                "plyerInfo": moveCordinate["eighthMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["eighthMoveCordinate"]!["numberInfo"]
            ],
            "ninthMoveCordinate": [
                "plyerInfo": moveCordinate["ninthMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["ninthMoveCordinate"]!["numberInfo"]
            ],
            "tenthMoveCordinate": [
                "plyerInfo": moveCordinate["tenthMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["tenthMoveCordinate"]!["numberInfo"]
            ],
            "eleventhMoveCordinate": [
                "plyerInfo": moveCordinate["eleventhMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["eleventhMoveCordinate"]!["numberInfo"]
            ],
            "twelfthMoveCordinate": [
                "plyerInfo": moveCordinate["twelfthMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["twelfthMoveCordinate"]!["numberInfo"]
            ],
            "thirteenthMoveCordinate": [
                "plyerInfo": moveCordinate["thirteenthMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["thirteenthMoveCordinate"]!["numberInfo"]
            ],
            "fourteenthCordinate": [
                "plyerInfo": moveCordinate["fourteenthCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["fourteenthCordinate"]!["numberInfo"]
            ],
            "fifteenthCordinate": [
                "plyerInfo": moveCordinate["fifteenthCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["fifteenthCordinate"]!["numberInfo"]
            ],
            "sixteenthMoveCordinate": [
                "plyerInfo": moveCordinate["sixteenthMoveCordinate"]!["plyerInfo"],
                "numberInfo": moveCordinate["sixteenthMoveCordinate"]!["numberInfo"]
            ]
        ]
    }
    
}

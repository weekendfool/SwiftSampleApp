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
//    var betrayerOfInvitedUser = ""
//    // ルームを作成したユーザーの裏切りが何手目かを記録する変数
//    var betrayerOfHostUser = ""
    // 打った手の座標を記録する変数
    var MoveCordinate: [String: [[String: String]: [String: String]]] = [
        "firstMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "secondMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "thirdMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "fourthMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "fifthMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "sixthMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "seventhMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "eighthMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "ninthMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "tenthMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "eleventhMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "twelfthMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "thirteenthMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "fourteenthCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "fifteenthCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
        "MoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
    ]
    
    // MARK: - データベースに登録するユーザーの変数宣言
    var roomDatabaseDic: [String: Any] = [
        "roomID": "",
        "invitedUserID": "",
        "hostUserID": "",
        "invitedUserStartFlag": false,
        "hostUserStartFlag": false,
        "betrayersDic": "",
//        "betrayerOfHostUser": "",
        "MoveCordinate": "",
//        "firstMoveCordinate": "",
//        "secondMoveCordinate": "",
//        "thirdMoveCordinate": "",
//        "fourthMoveCordinate": "",
//        "fifthMoveCordinate": "",
//        "sixthMoveCordinate": "",
//        "seventhMoveCordinate": "",
//        "eighthMoveCordinate": "",
//        "ninthMoveCordinate": "",
//        "tenthMoveCordinate": "",
//        "eleventhMoveCordinate": "",
//        "twelfthMoveCordinate": "",
//        "thirteenthMoveCordinate": "",
//        "fourteenthCordinate": "",
//        "fifteenthCordinate": "",
//        "sixteenthMoveCordinate": "",
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
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["firstMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["secondMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["thirdMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["fourthMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["fifthMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["sixthMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["seventhMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["eighthMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["ninthMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["tenthMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["eleventhMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["twelfthMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["thirteenthMoveCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["fourteenthCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["fifteenthCordinate"]
        roomDatabaseDic["MoveCordinate"] = MoveCordinate["sixteenthMoveCordinate"]
        
        
        
//        roomDatabaseDic["firstMoveCordinate"] = firstMoveCordinate
//        roomDatabaseDic["secondMoveCordinate"] = secondMoveCordinate
//        roomDatabaseDic["thirdMoveCordinate"] = thirdMoveCordinate
//        roomDatabaseDic["fourthMoveCordinate"] = fourthMoveCordinate
//        roomDatabaseDic["fifthMoveCordinate"] = fifthMoveCordinate
//        roomDatabaseDic["sixthMoveCordinate"] = sixthMoveCordinate
//        roomDatabaseDic["seventhMoveCordinate"] = seventhMoveCordinate
//        roomDatabaseDic["eighthMoveCordinate"] = eighthMoveCordinate
//        roomDatabaseDic["ninthMoveCordinate"] = ninthMoveCordinate
//        roomDatabaseDic["tenthMoveCordinate"] = tenthMoveCordinate
//        roomDatabaseDic["eleventhMoveCordinate"] = eleventhMoveCordinate
//        roomDatabaseDic["twelfthMoveCordinate"] = twelfthMoveCordinate
//        roomDatabaseDic["thirteenthMoveCordinate"] = thirteenthMoveCordinate
//        roomDatabaseDic["fourteenthCordinate"] = fourteenthCordinate
//        roomDatabaseDic["fifteenthCordinate"] = fifteenthCordinate
//        roomDatabaseDic["sixteenthMoveCordinate"] = sixteenthMoveCordinate
//
    }
    
}

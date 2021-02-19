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
    var roomName = ""
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
    var moveCordinate: [String: [[String: String]: [String: String]]] = [
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
        "sixteenthMoveCordinate": [["plyerInfo": ""]: ["numberInfo": ""]],
    ]
    
    // MARK: - データベースに登録するユーザーの変数宣言
    var roomDatabaseDic: [String: Any] = [
        "roomID": "",
        "roomName": "",
        "invitedUserID": "",
        "hostUserID": "",
        "invitedUserStartFlag": false,
        "hostUserStartFlag": false,
        "betrayersDic": "",
//        "betrayerOfHostUser": "",
        "moveCordinate": "",
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
        roomDatabaseDic["roomName"] = roomName
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

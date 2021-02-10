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
    var betrayerOfInvitedUser = ""
    // ルームを作成したユーザーの裏切りが何手目かを記録する変数
    var betrayerOfHostUser = ""
    // 打った手の座標を記録する変数
    var firstMoveCordinate = ""
    var secondMoveCordinate = ""
    var thirdMoveCordinate = ""
    var fourthMoveCordinate = ""
    var fifthMoveCordinate = ""
    var sixthMoveCordinate = ""
    var sevenMoveCordinate = ""
    var eighthMoveCordinate = ""
    var ninthMoveCordinate = ""
    var tenthMoveCordinate = ""
    var eleventhMoveCordinate = ""
    var twelfthMoveCordinate = ""
    var thirteenthMoveCordinate = ""
    var fourteenthCordinate = ""
    var fifteenthCordinate = ""
    var sixteenthMoveCordinate = ""
    
    // MARK: - データベースに登録するユーザーの変数宣言
    var userDatabaseDic: [String: Any] = [
        "roomID": "",
        "invitedUserID": "",
        "hostUserID": "",
        "invitedUserStartFlag": false,
        "hostUserStartFlag": false,
        "betrayerOfInvitedUser": "",
        "betrayerOfHostUser": "",
        "firstMoveCordinate": "",
        "secondMoveCordinate": "",
        "thirdMoveCordinate": "",
        "fourthMoveCordinate": "",
        "fifthMoveCordinate": "",
        "sixthMoveCordinate": "",
        "seventhMoveCordinate": "",
        "eighthMoveCordinate": "",
        "ninthMoveCordinate": "",
        "tenthMoveCordinate": "",
        "eleventhMoveCordinate": "",
        "twelfthMoveCordinate": "",
        "thirteenthMoveCordinate": "",
        "fourteenthCordinate": "",
        "fifteenthCordinate": "",
        "sixteenthMoveCordinate": "",
    ]

    // MARK: - データベースの操作
    // データベースに登録するユーザーの情報を格納する
    mutating func registeruserDatabaseDic() {
        userDatabaseDic["roomID"] = roomID
        userDatabaseDic["invitedUserID"] = invitedUserID
        userDatabaseDic["hostUserID"] = hostUserID
        userDatabaseDic["invitedUserStartFlag"] = invitedUserStartFlag
        userDatabaseDic["hostUserStartFlag"] = hostUserStartFlag
        userDatabaseDic["betrayerOfInvitedUser"] = betrayerOfInvitedUser
        userDatabaseDic["betrayerOfHostUser"] = betrayerOfHostUser
        userDatabaseDic["firstMoveCordinate"] = firstMoveCordinate
        userDatabaseDic["secondMoveCordinate"] = secondMoveCordinate
        userDatabaseDic["thirdMoveCordinate"] = thirdMoveCordinate
        userDatabaseDic["fourthMoveCordinate"] = fourthMoveCordinate
        userDatabaseDic["fifthMoveCordinate"] = fifthMoveCordinate
        userDatabaseDic["sixthMoveCordinate"] = sixthMoveCordinate
        userDatabaseDic["seventhMoveCordinate"] = sevenMoveCordinate
        userDatabaseDic["eighthMoveCordinate"] = eighthMoveCordinate
        userDatabaseDic["ninthMoveCordinate"] = ninthMoveCordinate
        userDatabaseDic["tenthMoveCordinate"] = tenthMoveCordinate
        userDatabaseDic["eleventhMoveCordinate"] = eleventhMoveCordinate
        userDatabaseDic["twelfthMoveCordinate"] = twelfthMoveCordinate
        userDatabaseDic["thirteenthMoveCordinate"] = thirteenthMoveCordinate
        userDatabaseDic["fourteenthCordinate"] = fourteenthCordinate
        userDatabaseDic["fifteenthCordinate"] = fifteenthCordinate
        userDatabaseDic["sixteenthMoveCordinate"] = sixteenthMoveCordinate
        
    }
    
}

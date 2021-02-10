//
//  UserModel.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/10.
//

import Foundation

struct UserData {
    
    // MARK: - ユーザーの情報を宣言
    // ユーザーの登録名
    var userName = ""
    // ユーザーのパスワード
    var passWord = ""
    // ユーザーの登録アイコンに使用する画像名
    var iconImageNumber = ""
    var userID = ""
    // ユーザーのルームID
    var roomID = ""
    // ユーザーがランダムマッチングで能動的検索者であるフラグ
    var waitRandomMatchFlag = false
    // ユーザーがランダムマッチングでマッチング後の上書きを禁止するフラグ
    var banWritingMatchingFlag = false
    // ユーザーがランダムマッチングした後に入室許可を発行するフラグ
    var parmitRandomMatchRoomFlag = false
    
    // MARK: - データベースに登録するユーザーの変数宣言
    var userDatabaseDic: [String: Any] = [
        "userName": "",
        "passWord": "",
        "userID": "",
        "roomID": "",
        "waitRandomMatchFlag": false,
        "banWritingMatchingFlag": false,
        "parmitRandomMatchRoomFlag": false
    ]

    // MARK: - データベースに登録するユーザーの情報を辞書に格納する
    mutating func registeruserDatabaseDic() {
        userDatabaseDic["userName"] = userName
        userDatabaseDic["passWord"] = passWord
        userDatabaseDic["userID"] = userID
        userDatabaseDic["roomID"] = roomID
        userDatabaseDic["waitRandomMatchFlag"] = waitRandomMatchFlag
        userDatabaseDic["banWritingMatchingFlag"] = banWritingMatchingFlag
        userDatabaseDic["parmitRandomMatchRoomFlag"] = parmitRandomMatchRoomFlag
    }
}

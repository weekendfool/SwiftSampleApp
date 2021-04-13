//
//  UserModel.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/10.
//

import Foundation

struct UserData {
    
    // MARK: - ユーザーの情報を宣言
    // データのローカルでの保存場所及び、ターゲットとして使用
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
    // 何手目かを記録するカウンター
    var playerCount = 0 // playerCount <= 16
    
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
    // 辞書はデータベースの書込みのみに使用
    mutating func registeruserDatabaseDic() {
        userDatabaseDic["userName"] = userName
        userDatabaseDic["passWord"] = passWord
        userDatabaseDic["userID"] = userID
        userDatabaseDic["roomID"] = roomID
        userDatabaseDic["waitRandomMatchFlag"] = waitRandomMatchFlag
        userDatabaseDic["banWritingMatchingFlag"] = banWritingMatchingFlag
        userDatabaseDic["parmitRandomMatchRoomFlag"] = parmitRandomMatchRoomFlag
    }
    
    mutating func countUP() {
        playerCount += 1
    }
}

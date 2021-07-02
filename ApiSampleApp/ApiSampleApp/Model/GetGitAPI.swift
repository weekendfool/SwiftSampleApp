//
//  GetGitAPI.swift
//  ApiSampleApp
//
//  Created by 尾原徳泰 on 2021/07/02.
//

import Foundation

// ＠受け取った後のデータをデコードするために入れる変数の設定
struct User: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]
    
    struct Item: Codable {
        let login: String
        let id: Int
        let node_id: String
        let avatar_url: URL
        let gravatar_id: String?
        let url: URL
        let html_url: URL
        let followers_url: URL
        let subscriptions_url: URL
        let organizattions_url: URL
        let repons_url: URL
        let received_events_url: URL
        let type: String
        let score: Double
    }
}

func searchGithubUser(query: String) {
    // httpリクエストを作る
    // @どこに何が欲しいかを送る送り状をイメージ
    // @q=以降が検索したい情報、今回はqueryに代入して実行
    let url = URL(string: "htps://api.github.com/search/users?q=" + query)!
    let request = URLRequest(url: url)
    let decoder: JSONDecoder = JSONDecoder()
    // サーバーと通信する処理
    // @クロージャを使用している
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        // データ受信完了後の処理
        guard let data = data else {
            print("data error")
            return
        }
        do {
            // @デコードの方式をUser.selfに、デコードしたい対象をdataに指定する
            let user: User = try decoder.decode(User.self, from: data)
            print("user: \(user)")
        } catch let error {
            print("json decode error:\(error)")
            fatalError()
        }
    }
    // インスタンス化しただけでは実行されないので、実行処理をかく
    task.resume()
}

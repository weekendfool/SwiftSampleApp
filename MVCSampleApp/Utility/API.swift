//
//  API.swift
//  MVCSampleApp
//
//  Created by 尾原徳泰 on 2021/06/02.
//

import Foundation


final class API {
    
    // シングルトンパターンの書き方
    static let shared = API()
    private init() {}
    
    // userデータを取得するAPI
    func getUsers(completion: (([MVCUserModel]) -> Void)? = nil) {
    
        // 仮想API通信
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)  {
            
            guard let data = API.sampleData.data(using: .utf8),
                  let users = try? JSONDecoder().decode([MVCUserModel].self, from: data)
            else {
                // data　OR usersがエラーのとき
                completion?([])
                return
            }
            completion?(users)
        }
    
    }
    
    //サーバーからこんな感じでデータが返ってくるとする
    private static var sampleData: String {
      let json =
  """
  [
      {
          "name": "tanaka",
          "at_name": "@tanaka",
          "switch": false
      },
      {
          "name": "suzuki",
          "at_name": "@suzuki",
          "switch": true
      },
      {
          "name": "yoshida",
          "at_name": "@yoshida",
          "switch": true
      },
      {
          "name": "tanaka",
          "at_name": "@tanaka",
          "switch": false
      },
      {
          "name": "suzuki",
          "at_name": "@suzuki",
          "switch": true
      },
      {
          "name": "yoshida",
          "at_name": "@yoshida",
          "switch": true
      },
      {
          "name": "tanaka",
          "at_name": "@tanaka",
          "switch": false
      },
      {
          "name": "suzuki",
          "at_name": "@suzuki",
          "switch": true
      },
      {
          "name": "yoshida",
          "at_name": "@yoshida",
          "switch": true
      },
      {
          "name": "tanaka",
          "at_name": "@tanaka",
          "switch": false
      },
      {
          "name": "suzuki",
          "at_name": "@suzuki",
          "switch": true
      },
      {
          "name": "yoshida",
          "at_name": "@yoshida",
          "switch": true
      },
      {
          "name": "tanaka",
          "at_name": "@tanaka",
          "switch": false
      },
      {
          "name": "suzuki",
          "at_name": "@suzuki",
          "switch": true
      },
      {
          "name": "yoshida",
          "at_name": "@yoshida",
          "switch": true
      },
      {
          "name": "tanaka",
          "at_name": "@tanaka",
          "switch": false
      },
      {
          "name": "suzuki",
          "at_name": "@suzuki",
          "switch": true
      },
      {
          "name": "yoshida",
          "at_name": "@yoshida",
          "switch": true
      },
      {
          "name": "tanaka",
          "at_name": "@tanaka",
          "switch": false
      },
      {
          "name": "suzuki",
          "at_name": "@suzuki",
          "switch": true
      },
      {
          "name": "yoshida",
          "at_name": "@yoshida",
          "switch": true
      }
  ]
  """
      return json
    }
}
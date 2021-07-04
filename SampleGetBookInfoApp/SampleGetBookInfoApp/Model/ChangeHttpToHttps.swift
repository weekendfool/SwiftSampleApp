//
//  ChangeHttpToHttps.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import Foundation

// 取得したURLをhttp形式からhttps形式に変換
struct ChangeHttpToHttps {
    // 変換まえの文字列と変換後の文字列を格納する変数を用意
//    let bforeChangeString: String?
//    var afterChangeString: String?
//
    // 実際の変換処理
    func ChangeHttpToHttps(bforeChangeString: String?) -> String {
        if bforeChangeString == "non" {
            print("--------------------------")
            print("non data")
            return "non data"
        }
        var afterChangeString: String?
        if let bforeChangeString = bforeChangeString {
            
            var bforeChangeString = bforeChangeString
            // 検出したい文字列を指定
            var targets: [String] = ["http", "https"]
            for target in targets {
                // httpかhttpsがヒットするかを確認する
                // htttp,httpsが何文字目にくるかのレンジを取得
                let searchStringRange = bforeChangeString.range(of: target)
                // httpかhttpsを見つけた場合
                if let searchStringRange = searchStringRange {
                    let searchString = bforeChangeString[searchStringRange]
                    print("searchString\(searchString)")
                    switch searchString {
                    case "https": // 通信上問題ないので変更なし
                        return bforeChangeString
                    case "http": // 通信上問題有りなので書き換え処理
                        bforeChangeString.removeSubrange(searchStringRange)
                        afterChangeString = "https" + bforeChangeString
                        return afterChangeString!
                        
                    default: //　起きえない状況
                        print("------------------------------------------")
                        print("error at ChangeHttpToHttps: targets<Array> has over three items")
                        return ""
                    }
                }
            }
        }
        print("------------------------------------------")
        print("error at ChangeHttpToHttps: bforeChangeString is nil")
        return ""
    }
    
}

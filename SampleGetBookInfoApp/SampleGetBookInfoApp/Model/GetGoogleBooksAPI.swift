//
//  GetGoogleBooksAPI.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import Foundation

class GetGoogleBooksAPI {
    // 返却されたデータを変換し格納する構造体の宣言
    struct Books: Codable {
        let totalItems: Int
        let items: [Item]
    }
    struct Item: Codable {
        let kind: String
        let id: String
        var volumeInfo: VolumeInfo
        
    }
    struct VolumeInfo: Codable {
        let title: String
        let authors: [String]
        var industryIdentifiers: [IndustryIdentifiers]
        let imageLinks: ImageLinks
    }
        
    struct IndustryIdentifiers: Codable {
        var type: String
        var identifier: String
    }
    
    struct ImageLinks: Codable {
//        let smallThumbnail: String
        let thumbnail: String
    }
    // 画像取得用のURLをstringとして保管する変数
    var thumbnailLinkUrl: String? {
        didSet {
            // thumbnailLinkUrlの値が更新されたら、デリゲート相手に通知して処理を行ってもらう
            delegate?.reStart()
        }
    }

    // デリゲート相手を保持
    var delegate: GetApiDelegate? = nil
    // apiを取得する処理
    func getGoogleBooksAPI(query: String) {
        // リクエストの作成
        // isbnで検索するパターンを実装
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:" + query)!
        let request = URLRequest(url: url)
        let decoder = JSONDecoder()
        
        
        var returnUrl: String?
        // サーバとの通信処理
        let task = URLSession.shared.dataTask(with: request) { [self] (data, request, error) in
            guard let gotData = data else { return }
            do {
                let books: Books = try decoder.decode(Books.self, from: gotData)
                print("===========================")
                print("books:\(books.items[0].volumeInfo.industryIdentifiers[1].identifier)")
                thumbnailLinkUrl = books.items[0].volumeInfo.imageLinks.thumbnail
                print("thumbnailLinkUrl:\(thumbnailLinkUrl)")
                
                // 非同期処理
                
            } catch let error {
                print("-----------------------------")
                print("JSON Decode Error:\(error)")
//                fatalError()
            }
        }
        task.resume()
        
    }
}



//
//  GetAPI.swift
//  ApiSampleApp
//
//  Created by 尾原徳泰 on 2021/07/01.
//

import Foundation


struct Books: Codable {
    let kind: String
    let totalItems: Int
//    let items: [Item]
//
//    struct Item: Codable {
//        let kind: String
//        let id: String
//        let etag: String
//        var volumeInfo: [String: String] = [
//            "title": "",
//            "author": ""
//        ]
//        let publisher: String
//        let pageCount: Int
//        var industryIdentiers: [String: String] = [
//            "type": "",
//            "identifier": ""
//        ]
//        let imageLinks: [String: String] = [
//            "smallThumbnail": "",
//            "thumbnail": ""
//        ]
//
//    }

}

func getAPI(query: String) {
//    print("query:\(query)")
    // リクエストの作成
    let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:" + query)!
    let request = URLRequest(url: url)
    let decoder: JSONDecoder = JSONDecoder()
    
    // サーバとの通信処理
    let task = URLSession.shared.dataTask(with: request) { (data, request, error) in
        guard let data = data else { return }
        do {
            let books: Books = try decoder.decode(Books.self, from: data)
            print(books)
        } catch let error {
            print("-----------------------------")
            print("JSON Decode Error:\(error)")
//            fatalError()
        }
    }
    task.resume()
}

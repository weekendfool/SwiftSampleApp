//
//  GetAPI.swift
//  ApiSampleApp
//
//  Created by 尾原徳泰 on 2021/07/01.
//

import Foundation


struct Books: Codable {
    let name: String
    let isbn: Int

}

func getAPI(query: String) {
    print("query:\(query)")
    // リクエストの作成
    let url = URL(string: "https://wwww.googleapis.com/books/vi/volumes?q=" + query)!
    let request = URLRequest(url: url)
    let decoder: JSONDecoder = JSONDecoder()
    
    // サーバとの通信処理
    let task = URLSession.shared.dataTask(with: request) { (data, request, error) in
        guard let data = data else { return }
        do {
            let books: Books = try decoder.decode(Books.self, from: data)
            print(books)
        } catch let error {
            print("JSON Decode Error:\(error)")
            fatalError()
        }
    }
    task.resume()
}

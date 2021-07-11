//
//  GetImageFromGotThumbnailLinkUrl.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/08.
//

import Foundation
import UIKit

struct GetImageFromGotThumbnailLinkUrl {
    // 取得した画像を保存しておく変数
    var gotImage: UIImage?
    
    // delegateの移譲先を保持する
    var gotImageOfBookDelegate: GotImageOfBookDelegate?
    
    mutating func getImageFromGotThumbnailLinkUrl(myUrl: String) {
        let myUrl = URL(string: myUrl)
        
        do {
            let data = try Data(contentsOf: myUrl!)
            gotImage = UIImage(data: data)
            // 画像取得後に表示させる処理を委譲する
            gotImageOfBookDelegate?.setupImageOfBook()
            
        } catch let error {
            print("----------------------------------")
            print("error at getImageFromGotThumbnailLinkUrl: \(error)")
        }

    }
}


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
    
    mutating func getImageFromGotThumbnailLinkUrl(myUrl: String) {
        let myUrl = URL(string: myUrl)
        
        do {
            let data = try Data(contentsOf: myUrl!)
            gotImage = UIImage(data: data)
            
        } catch let error {
            print("----------------------------------")
            print("error at getImageFromGotThumbnailLinkUrl: \(error)")
        }
//        // imageViewのインスタンスを生成
//        let imageView = UIImageView()
//        // 大きさを指定
//        let imageViewRect: CGRect = CGRect(x: 100, y: 100, width: vc.view.frame.size.width / 3, height: vc.view.frame.size.height / 3)
//        imageView.frame = imageViewRect
//
//        imageView.image = gotImage
//
//        vc.view.addSubview(imageView)
    }
}


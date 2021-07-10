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
    
    mutating func getImageFromGotThumbnailLinkUrl(myUrl: String, ResultImageViewController: Void) {
        let myUrl = URL(string: myUrl)
        
        do {
            var data = try Data(contentsOf: myUrl!)
            gotImage = UIImage(data: data)
            // ResultImageViewControllerに移動する処理
            ResultImageViewController
        } catch let error {
            print("----------------------------------")
            print("error at getImageFromGotThumbnailLinkUrl: \(error)")
        }
    }
}


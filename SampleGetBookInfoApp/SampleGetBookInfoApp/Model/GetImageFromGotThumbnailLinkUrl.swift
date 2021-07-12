//
//  GetImageFromGotThumbnailLinkUrl.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/08.
//

import Foundation
import UIKit

class GetImageFromGotThumbnailLinkUrl {
    
    var myVc: UIViewController?
    
    // 取得した画像を保存しておく変数
    var gotImage: UIImage? {
        didSet {
        }
    }
    

    func getImageFromGotThumbnailLinkUrl(myUrl: String) {
        let myUrl = URL(string: myUrl)
        
        do {
            print("3----------------------------------3")
            let data = try Data(contentsOf: myUrl!)
            gotImage = UIImage(data: data)!
            
            print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
           
            
        } catch let error {
            print("----------------------------------")
            print("error at getImageFromGotThumbnailLinkUrl: \(error)")
            return
        }

    }
}


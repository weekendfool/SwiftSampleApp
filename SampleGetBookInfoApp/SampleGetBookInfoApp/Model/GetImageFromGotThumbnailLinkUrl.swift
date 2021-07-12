//
//  GetImageFromGotThumbnailLinkUrl.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/08.
//
import UIKit

struct GetImageFromGotThumbnailLinkUrl {
    
    init() {
        print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        print("make class")
        print("gotImageOfBookDelegate:\(gotImageOfBookDelegate)")
    }
    // デリゲートの委譲先の保持
    var gotImageOfBookDelegate: GotImageOfBookDelegate? {
        didSet {
            print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
            print("gotImageOfBookDelegate:\(gotImageOfBookDelegate)")
        }
    }
    
    // 取得した画像を保存しておく変数
    var gotImage: UIImage? {
        didSet {
        }
    }
    
    // 取得したurlを保存しておく変数
    var linkThumbnailUrl: String?
        
    
    
    func doit() {
        gotImageOfBookDelegate?.showImage()
    }

    mutating func getImageFromGotThumbnailLinkUrl(myUrl: String) {
        let myUrl = URL(string: myUrl)
       
        do {
            
            let data = try Data(contentsOf: myUrl!)
            gotImage = UIImage(data: data)!
            
        } catch let error {
            print("----------------------------------")
            print("error at getImageFromGotThumbnailLinkUrl: \(error)")
            return
        }
    }
}


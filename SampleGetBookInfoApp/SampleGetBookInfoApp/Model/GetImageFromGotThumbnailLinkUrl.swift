//
//  GetImageFromGotThumbnailLinkUrl.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/08.
//
import UIKit

class GetImageFromGotThumbnailLinkUrl {
    
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
            if let gotImage = gotImage {
                gotImageOfBookDelegate?.showImage()
            }
        }
    }
    
    // 取得したurlを保存しておく変数
    // 切り分ける。ResultImageViewController以外では極力使わない
    var linkThumbnailUrl: String?
        
    
    
    func doit() {
        gotImageOfBookDelegate?.showImage()
    }

    func getImageFromGotThumbnailLinkUrl() {
        // imageを取得するためのURLが格納されてたら
        guard let linkThumbnailUrl = linkThumbnailUrl else { return }
        let myUrl = URL(string: linkThumbnailUrl)
           
        do {
    
            let data = try Data(contentsOf: myUrl!)
            gotImage = UIImage(data: data)!
            print("====================================")
            print("gotImage:\(gotImage)")
                
        } catch let error {
            print("----------------------------------")
            print("error at getImageFromGotThumbnailLinkUrl: \(error)")
            return
        }
    }
    
}


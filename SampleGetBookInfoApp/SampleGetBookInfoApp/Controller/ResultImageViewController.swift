//
//  ResultImageViewController.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import UIKit

class ResultImageViewController: UIViewController {
    
    // storyboardの展開
    static func makeFromStoryboadrd() -> ResultImageViewController {
        let vc = UIStoryboard.resultImageViewController
        return vc
    }

    // インスタンスの生成
    var getImageFromGotThumbnailLinkUrl :GetImageFromGotThumbnailLinkUrl?
    let makeImageView = MakeImageView()
    let router = Router()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // imageviewのセットアップ
        makeImageView.setUpImageView(vc: self)
 
        //getImageFromGotThumbnailLinkUrlインスタンスの生成とデリゲートの指定
        getImageFromGotThumbnailLinkUrl = GetImageFromGotThumbnailLinkUrl()
        getImageFromGotThumbnailLinkUrl!.gotImageOfBookDelegate = self
        print("'''''''''''''''''''''''''''''''''''")
        print("delegate oN")
        print("delegate:\(getImageFromGotThumbnailLinkUrl!.gotImageOfBookDelegate)")
        
        // imageの取得
        getImageFromGotThumbnailLinkUrl?.getImageFromGotThumbnailLinkUrl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // delegateの移譲先を保持
        
      
    }
}



extension ResultImageViewController: GotImageOfBookDelegate {
    func showImage() {
        print("OK")
    }
    
    
}

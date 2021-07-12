//
//  ResultImageViewController.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import UIKit

class ResultImageViewController: UIViewController {
    
    
    
    
    static func makeFromStoryboadrd() -> ResultImageViewController {
        let vc = UIStoryboard.resultImageViewController
        return vc
    }

    var getImageFromGotThumbnailLinkUrl :GetImageFromGotThumbnailLinkUrl?
    let makeImageView = MakeImageView()
    let router = Router()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        makeImageView.setUpImageView(vc: self)
 
        getImageFromGotThumbnailLinkUrl = GetImageFromGotThumbnailLinkUrl()
        getImageFromGotThumbnailLinkUrl!.gotImageOfBookDelegate = self
        print("'''''''''''''''''''''''''''''''''''")
        print("delegate oN")
        print("delegate:\(getImageFromGotThumbnailLinkUrl!.gotImageOfBookDelegate)")
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

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

    let getImageFromGotThumbnailLinkUrl = GetImageFromGotThumbnailLinkUrl()
    let makeImageView = MakeImageView()
    let router = Router()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let gotImage =  getImageFromGotThumbnailLinkUrl.gotImage {
            makeImageView.setUpImageView(vc: self, myImage: gotImage)
        } else {
            // getImageFromGotThumbnailLinkUrl.gotImageがnilの場合BarcodeReaderViewへ戻る
            router.showBarcodeReaderView(from: self)
        }
        
        // Do any additional setup after loading the view.
    }

}

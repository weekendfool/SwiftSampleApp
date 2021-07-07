//
//  BarcodeReaderViewController.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import UIKit
import AVFoundation

class BarcodeReaderViewController: UIViewController {
    
    // storyboardからVCを生成する
    static func makeFromStoryboard() -> BarcodeReaderViewController {
        // StoryboardExtensionで実装したgetがある変数を代入している
        let vc = UIStoryboard.barcodeReaderViewController
        return vc
    }
    
    let barcodeReader = BarcodeReader()
    let barcodeReaderTarget = BarcodeReaderTarget()
    let getGoogleBooksAPI = GetGoogleBooksAPI()
    let changeHttpToHttps = ChangeHttpToHttps()
    let alertView = AlertView()
    var router = Router()
    
    
    var gotThumbnailLinkUrl: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // delegateの委譲先にBarcodeReaderViewController自身を設定
        getGoogleBooksAPI.thumbnailLinkUrlDelegate = self
        // バーコードリーダーの設定
//        let view = BarcodeReaderViewController.self
        barcodeReader.setUpCamera(delegate: self, vc: self)
        barcodeReaderTarget.setUpTargetView(vc: self)
        
        
        
    }

}

extension BarcodeReaderViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        var gotIsbn: String? {
            didSet{
                // アラートの設定
                if let gotIsbn = gotIsbn {
                    // アラートの発報
                    alertView.setAlertController(
                        vc: self,
                        metaData: gotIsbn,
                        defaultButtonAction: router.showResultImageView(from: self),
                        cancelButtonAction: barcodeReader.setUpCamera(delegate: self, vc: self)
                    )
                    //　isbnから画像用のURL取得
                    // okが押された後の処理
                    getGoogleBooksAPI.getGoogleBooksAPI(query: gotIsbn)
                }
            }
        }
        
        // isbnを取得
        gotIsbn = barcodeReader.metadataOutput(metadataObjects: metadataObjects)
        
    }
}

extension BarcodeReaderViewController: ThumbnailLinkUrlDelegate {
    //　GoogleBooksAPIからThumbnailLinkUrlを取得した時に実行させる処理
    func accessThumbnailLinkUrl() {
        // GoogleBooksAPIから取得したurlをhttps方式に書き換える
        print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        print("gotGoogleBooksAPI.thumbnailLinkUrl:\(getGoogleBooksAPI.thumbnailLinkUrl)")
        if let gotUrl = getGoogleBooksAPI.thumbnailLinkUrl {
            gotThumbnailLinkUrl = changeHttpToHttps.ChangeHttpToHttps(bforeChangeString: gotUrl)
//            print("getThumbnailLinkUrl:\(gotThumbnailLinkUrl)")
        }
    }
    
    
}


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
    var alertView = AlertView()
    var router = Router()
    var getImageFromGotThumbnailLinkUrl = GetImageFromGotThumbnailLinkUrl()
    
    
    var gotThumbnailLinkUrl: String? = ""
    
    var gotIsbn: String? {
        didSet{
            // アラートの設定
            if let gotIsbn = gotIsbn {
                // アラートの発報
                alertView.setAlertController(
                    vc: self,
                    metaData: gotIsbn
                )
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // delegateの委譲先にBarcodeReaderViewController自身を設定
        getGoogleBooksAPI.thumbnailLinkUrlDelegate = self
        alertView.routerAtAlertDelegate = self
        // バーコードリーダーの設定
        barcodeReader.setUpCamera(delegate: self, vc: self)
        barcodeReaderTarget.setUpTargetView(vc: self)
        
        
        
    }

}

// カメラからバーコードを取得した後の挙動
extension BarcodeReaderViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // isbnを取得
        gotIsbn = barcodeReader.metadataOutput(metadataObjects: metadataObjects)
    }
}

// アラートのボタンが押された時の挙動
extension BarcodeReaderViewController: RouterAtAlertDelegate {
    
    // okが押された後の処理
    func goResultImageView() {
        
        //　isbnから画像用のURL取得
        getGoogleBooksAPI.getGoogleBooksAPI(query: gotIsbn!)
        // gotThumbnailLinkUrlから画像を取得する
        
        
        // 画面遷移
        router.showResultImageView(from: self)
    }
    
    func reStatBarcodeReader() {
        barcodeReader.reStartSession()
    }
}


// isbnから画像用のURL取得した後の挙動
extension BarcodeReaderViewController: ThumbnailLinkUrlDelegate {
    //　GoogleBooksAPIからThumbnailLinkUrlを取得した時に実行させる処理
    func accessThumbnailLinkUrl() {
        // GoogleBooksAPIから取得したurlをhttps方式に書き換える
        print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        print("gotGoogleBooksAPI.thumbnailLinkUrl:\(getGoogleBooksAPI.thumbnailLinkUrl)")
        if let gotUrl = getGoogleBooksAPI.thumbnailLinkUrl {
            gotThumbnailLinkUrl = changeHttpToHttps.ChangeHttpToHttps(bforeChangeString: gotUrl)
            print("getThumbnailLinkUrl:\(gotThumbnailLinkUrl)")
        }
        if let gotThumbnailLinkUrl = gotThumbnailLinkUrl {
            // urlから画像を取得する処理
            getImageFromGotThumbnailLinkUrl.getImageFromGotThumbnailLinkUrl(myUrl: gotThumbnailLinkUrl)
        }
    }
}



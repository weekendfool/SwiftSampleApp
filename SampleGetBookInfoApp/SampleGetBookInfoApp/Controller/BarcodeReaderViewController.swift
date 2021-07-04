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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // バーコードリーダーの設定
//        let view = BarcodeReaderViewController.self
        barcodeReader.setUpCamera(delegate: self, vc: self)
        barcodeReaderTarget.setUpTargetView(vc: self)
        // isbnから探索
        
        
        
    }

}

extension BarcodeReaderViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        var gotAPI: String?
        var query: String?
        gotAPI = barcodeReader.metadataOutput(metadataObjects: metadataObjects)
        query = changeHttpToHttps.ChangeHttpToHttps(bforeChangeString: gotAPI)
        getGoogleBooksAPI.getGoogleBooksAPI(query: query!)

        
    }
}

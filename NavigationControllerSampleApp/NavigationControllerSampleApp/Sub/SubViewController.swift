//
//  SubViewController.swift
//  NavigationControllerSampleApp
//
//  Created by Oh!ara on 2021/07/09.
//

import UIKit
import AVFoundation

class SubViewController: UIViewController {
    
    var barcod = BarcodeReader()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        barcod.setUpCamera(delegate: self, vc: self)
    
    }
    
}

// カメラからバーコードを取得した後の挙動
extension SubViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // isbnを取得
//            gotIsbn = barcodeReader.metadataOutput(metadataObjects: metadataObjects)
    }
}



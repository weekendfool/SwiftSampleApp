//
//  ViewController.swift
//  NavigationControllerSampleApp
//
//  Created by Oh!ara on 2021/07/09.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var barcode = BarcodeReader()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        barcode.setUpCamera(delegate: self, vc: self)
        
    }
}
    // カメラからバーコードを取得した後の挙動
extension ViewController: AVCaptureMetadataOutputObjectsDelegate {
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            // isbnを取得
//            gotIsbn = barcodeReader.metadataOutput(metadataObjects: metadataObjects)
        }
    }





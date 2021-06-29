//
//  ViewController.swift
//  BarCodeReaderSampleApp
//
//  Created by 尾原徳泰 on 2021/06/29.
//

import UIKit
// バーコードリーダー用のライブラリ
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    // カメラやマイクの入力をかんりするインスタンスの生成
    private let session = AVCaptureSession()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    func setUpCamera() {
        // カメラやマイクのデバイスそのものを管理するインスタンスの生成
        // ワイドアングルカメラ、ビデオ、背景カメラを指定
        let discoverySession = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .back)
        
        // ワイドアングルカメラ、ビデオ、背面カメラに該当するデバイスを取得
        let devices = discoverySession.devices
        
        // 一番最初に取得した該当するデバイスを利用
        if let backCamera = devices.first {
            do {
                // バーコードの読み取りに背面カメラの映像を利用するための設定
                let deviceInput = try AVCaptureDeviceInput(device: backCamera)
                if self.session.canAddInput(deviceInput) {
                    self.session.addInput(deviceInput)
                    
                    // 背面カメラの映像からバーコードを読み取るための設定
                    let metadataOutput = AVCaptureMetadataOutput()
                    if self.session.canAddOutput(metadataOutput) {
                        self.session.addOutput(metadataOutput)
                        
                        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                        // 読み取りたいバーコードの種類を指定
                        metadataOutput.metadataObjectTypes = [.ean13]
                        
                        // 読みとり可能エリアの設定を行う
                        let x: CGFloat = 0.1
                        let y: CGFloat = 0.4
                        let width: CGFloat = 0.8
                        let height: CGFloat = 0.2
                        
                        metadataOutput.rectOfInterest = CGRect(x: x, y: y, width: width, height: height)
                        
                        // 背面カメラの映像を画面に表示するためのレイヤーを生成
                        let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
                        previewLayer.frame = self.view.bounds
                        previewLayer.videoGravity = .resizeAspectFill
                        self.view.layer.addSublayer(previewLayer)
                    }
                }
            
        } catch {
        }
        }
    }
}


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
                }
            
        } catch {
        }
        }
    }
}


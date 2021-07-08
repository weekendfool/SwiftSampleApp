//
//  BarcodeReader.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import Foundation
import UIKit
import AVFoundation

struct BarcodeReader {
    //　カメラの入力を管理するインスタンスの生成
    private let avCaptureSession = AVCaptureSession()
    
    func setUpCamera(delegate: AVCaptureMetadataOutputObjectsDelegate, vc: UIViewController) {
        // カメラ設定
        let discoverySession = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .back
        )
        
        let devices = discoverySession.devices
        if let backCamera = devices.first {
            do {
                // カメラで読み取りが成功した時の処理
                let deviceInput = try AVCaptureDeviceInput(device: backCamera)
                doInit(deviceInput: deviceInput, delegate: delegate, vc: vc)
            } catch {
                print("------------------------------------------")
                print("error occured while creating video device input: \(error)")
            }
        }
    }
    
    private func doInit(deviceInput: AVCaptureDeviceInput, delegate: AVCaptureMetadataOutputObjectsDelegate, vc: UIViewController) {
        // 読み取り可能エリアの設定
        let x: CGFloat = 0.1
        let y: CGFloat = 0.4
        let width: CGFloat = 0.8
        let height: CGFloat = 0.2
        
        guard avCaptureSession.canAddInput(deviceInput) else { return }
        
        avCaptureSession.addInput(deviceInput)
        
        let metadataOutput = AVCaptureMetadataOutput()
        metadataOutput.rectOfInterest = CGRect(
            x: x,
            y: y,
            width: width,
            height: height
        )
        
        guard avCaptureSession.canAddOutput(metadataOutput) else { return }
        
        avCaptureSession.addOutput(metadataOutput)
        
        metadataOutput.setMetadataObjectsDelegate(delegate, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [.ean13]
        
        metadataOutput.rectOfInterest = CGRect(
            x: y,
            y: x,
            width: height,
            height: width
        )
        
        // カメラの起動
        let previewLayer = AVCaptureVideoPreviewLayer(session: avCaptureSession)
        previewLayer.frame = vc.view.bounds
        previewLayer.videoGravity = .resizeAspectFill
        vc.view.layer.addSublayer(previewLayer)
        
        avCaptureSession.startRunning()
        
        
    }
    
    func metadataOutput(metadataObjects: [AVMetadataObject]) -> String {
        var gotIsbn: String?
        for metadata in metadataObjects as! [AVMetadataMachineReadableCodeObject] {
//            guard let metadata = metadata.stringValue else { return "non" }
            if metadata.stringValue == nil { continue }
            // 読み取ったデータの値
//            print("metadata.type:\(metadata.type)")
//            print("metadata.stringValue:\(metadata.stringValue!)")
            print("metadata:\(metadata)")
            gotIsbn = metadata.stringValue
            // 読み込めたらキャプチャセッションをストップ
            avCaptureSession.stopRunning()
        }
        if let gotIsbn = gotIsbn {
            return gotIsbn
        } else {
            return "non"
        }
    }

}

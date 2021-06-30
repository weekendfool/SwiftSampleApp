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
        setUpCamera2()
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
                        
                        // 読み取り可能エリアに赤い枠を追加する
                        let detectionArea = UIView()
                        detectionArea.frame = CGRect(x: view.frame.size.width * x, y: view.frame.size.height * y, width: view.frame.size.width * width, height: view.frame.size.height * height)
                        detectionArea.layer.borderColor = UIColor.red.cgColor
                        detectionArea.layer.borderWidth = 3
                        view.addSubview(detectionArea)
                        
                        // 閉じるボタン
                        let closeButton: UIButton = UIButton()
                        closeButton.frame = CGRect(x: 20, y: 20, width: 100, height: 40)
                        closeButton.setTitle("閉じる", for: UIControl.State.normal)
                        closeButton.backgroundColor = UIColor.lightGray
                        closeButton.addTarget(self, action: #selector(closeTaped(sender:)), for: .touchUpInside)
                        self.view.addSubview(closeButton)
                        
                        self.session.startRunning()
                    }
                }
            
        } catch {
            print("error occured while creating video device input: \(error)")
        }
    }
}
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for metadata in metadataObjects as! [AVMetadataMachineReadableCodeObject] {
            // バーコードの内容がからかどうかの確認
            if metadata.stringValue == nil { continue }
            
            // 読み取ったデータの値
            print("metadata.type:\(metadata.type)")
            print("metadata.stringValue:\(metadata.stringValue!)")
            
            // 取得したデータの処理を行う
            let alert: UIAlertController = UIAlertController(title: "バーコードの中身", message: metadata.stringValue, preferredStyle: .alert)
            let cancel: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }
    }
    
    // 閉じる時の挙動
    @objc func closeTaped(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUpCamera2() {
        // カメラの設定
        let discoverySession = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .back)
        
        let devices = discoverySession.devices
        if let backCamera = devices.first {
            do {
                // カメラで読み取り成功したときの処理
                let deviceInput = try AVCaptureDeviceInput(device: backCamera)
                doInit(deviceInput: deviceInput)
            } catch {
                print("error occured while creating video device input: \(error)")
            }
        }
    }
    
    private func doInit(deviceInput: AVCaptureDeviceInput) {
        if !session.canAddInput(deviceInput) {
            return
        }
        
        session.addInput(deviceInput)
        
        let metadataOutput = AVCaptureMetadataOutput()
        if !session.canAddOutput(metadataOutput) {
            return
        }
        
        session.addOutput(metadataOutput)
        
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [.ean13]
        
        // カメラを起動
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        session.startRunning()
    }
}


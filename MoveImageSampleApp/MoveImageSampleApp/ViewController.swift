//
//  ViewController.swift
//  MoveImageSampleApp
//
//  Created by 尾原徳泰 on 2021/06/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleSlider: UISlider!
    @IBOutlet weak var sampleLabel: UILabel!
    
    // uiimageの初期化
    
    
    let imageview = UIImageView()
    var timer: Timer!
    
    var count = 0
    
    var upDown = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initImageView()
    }


    // imageの実装
    func initImageView() {
        // uiimageのインスタンス作成
        let image: UIImage = UIImage(named: "image")!
        imageview.image = image
        // 画面のサイズを取得
        let screenWidth: CGFloat = view.frame.size.width
        let screenHeight: CGFloat = view.frame.size.height
        
        // MARK: - sample image
        
       
        // imageの大きさを指定
        var imageWidth: CGFloat = 100
        var imageHeight: CGFloat = 100
        
        var rect: CGRect = CGRect(x: 100, y: 100, width: imageWidth, height: imageHeight)
        
        // 画像のサイズを合わせる
        imageview.frame = rect
        
        imageview.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        
        self.view.addSubview(imageview)
        
        
        
        
    }
    
    @IBAction func sampleSliderChange(_ sender: Any) {
        // スライダーの値を取得
        sampleSlider.maximumValue = 200
        sampleSlider.minimumValue = 0
        var changeSize = sampleSlider.value
        // imageの大きさを指定
//        var imageWidth: CGFloat = 100
//        var imageHeight: CGFloat = 100
        
        var imageWidth: CGFloat = CGFloat(changeSize)
        var imageHeight: CGFloat = CGFloat(changeSize)
        
        var rect: CGRect = CGRect(x: 100, y: 100, width: imageWidth, height: imageHeight)
        
        // 画像のサイズを合わせる
        imageview.frame = rect
        
    }
    
//
//    func changeSize() {
//        var nowValue = 0
//        var counter = 0
//        while counter < 50 {
//            nowValue += 1
//            sampleLabel.text = "現在値：\(nowValue)"
//            counter += 1
//        }
//
//    }
    
    func startTimer() {
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerCounter), userInfo: nil, repeats: true)

    }
    
    @objc func timerCounter() {
        var number = 0
       
        switch count {
        case 0:
            upDown = true
        case 10:
            upDown = false
        default:
            break
        }
        
        print("count:\(count)")
        
       
        var imageWidth: CGFloat = CGFloat(count * 10)
        var imageHeight: CGFloat = CGFloat(count * 10)
        
        var rect: CGRect = CGRect(x: 100, y: 100, width: imageWidth, height: imageHeight)
        
        // 画像のサイズを合わせる
        imageview.frame = rect
            if upDown {
                number = 1
                
                
                count += 1
            } else {
//                number = -1
//                print("count:\(count)")
//
//                var imageWidth: CGFloat = CGFloat(count * 10)
//                var imageHeight: CGFloat = CGFloat(count * 10)
//
//                var rect: CGRect = CGRect(x: 100, y: 100, width: imageWidth, height: imageHeight)
//
//                // 画像のサイズを合わせる
//                imageview.frame = rect
                
                count -= 1

            
            
        }
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        startTimer()
        
        
    }
    
}


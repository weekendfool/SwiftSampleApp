//
//  ViewController.swift
//  MoveImageSampleApp
//
//  Created by 尾原徳泰 on 2021/06/08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initImageView()
    }


    // imageの実装
    func initImageView() {
        // uiimageのインスタンス作成
        let image: UIImage = UIImage(named: "image")!
        // uiimageの初期化
        let imageview = UIImageView(image: image)
        
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
}


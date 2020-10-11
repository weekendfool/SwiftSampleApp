//
//  AnimationViewController.swift
//  whingingEater
//
//  Created by 尾原徳泰 on 2020/03/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var eatButton: UIButton!

    
    var imageListArray: Array<UIImage> = []
    let image1 = UIImage(named: "same1")!
    let image2 = UIImage(named: "same2")!
    let image3 = UIImage(named: "same3")!
    
    var speachBubbleImage = UIImage(named: "speachBubble")
    
    let igaiga = UIImage(named: "igaiga")!
    
    var testImage = UIImageView()
    var testImage2 = UIImageView()
    var testImage3 = UIImageView()
    var testImage4 = UIImageView()
    
    var num = 0
    
    var text = UserDefaults.standard
    let key = "key"
    
    let textField = UITextField()
    
    var test = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        makeTextField()
        
    }
    
    @IBAction func eatButtonAction(_ sender: Any) {
        
//        makeLabelView()
//        textSmallAnimation()
        textField.removeFromSuperview()
        animation()
        
        
    }
    
 
    
    
    func eatText() {
        //サメの捕食アニメーション
            //配列の作成
            imageListArray.append(image1)
            imageListArray.append(image2)
            imageListArray.append(image3)
            //画面のサイズ取得
            let screenWidth = self.view.bounds.width
            let screenHeight = self.view.bounds.height
            //画像のサイズ
            let imageWidth = 375
            let imageHeight = 212
            //UIImageViewの生成
            let imageView: UIImageView = UIImageView(image: image1)
            //imageviewの大きさを設定
            let rect = CGRect(x: 0, y: 455, width: imageWidth, height: imageHeight)
            imageView.frame = rect
            //viewに追加
            self.view.addSubview(imageView)
        
            testImage4 = imageView
            //アニメーション
            imageView.animationImages = imageListArray
            //間隔
            imageView.animationDuration = 1
            //くり返し
            imageView.animationRepeatCount = -1
            //アニメーション開始
            imageView.startAnimating()
        
                }
  
    func textSmallAnimation() {
        test.removeFromSuperview()
        testImage.removeFromSuperview()
        var scale = 0.25
        //while scale <= 0 {
        //imageを縮小する
        //画像の大きさ指定
        let imageWidth = 375.0
        let imageHeight = 312.0
        //吹き出しのイメージを生成
        let imageView: UIImageView = UIImageView(image: speachBubbleImage)
                    
        //viewもの大きさ設定
        let rect = CGRect(x: 0.0, y: 111.0, width: imageWidth * scale, height: imageHeight * scale)
        imageView.frame = rect
        //viewに追加
        imageView.center = CGPoint(x: Double(self.view.bounds.width / 2), y: imageHeight / 2)
        
        testImage2 = imageView
        self.view.addSubview(testImage2)
    
    }

    func makeLabelView() {
        //画像の大きさ指定
        let imageWidth = 375.0
        let imageHeight = 312.0
        //吹き出しのイメージを生成
        let imageView: UIImageView = UIImageView(image: speachBubbleImage)
      

        let rect = CGRect(x: 0.0, y: 82.0, width: 375.0, height: 238.0)
            imageView.frame = rect
            //viewに追加
//           imageView.center = CGPoint(x: Double(self.view.bounds.width / 2), y: imageHeight / 2)
            self.view.addSubview(imageView)
        
        testImage = imageView
    }

    func end() {
        testImage4.stopAnimating()
        
        testImage4.removeFromSuperview()

    }
    
    func makeTextField() {
        makeLabelView()
        
        test.textColor = .black
        
        test.backgroundColor = .white
        
        test.frame = CGRect(x: 40.0, y: 130.0, width: 250.0, height: 100.0)
        
        test.font = UIFont.boldSystemFont(ofSize: 20)
        
        test.alpha = 2
        
        test.textAlignment = .center
        
        test.numberOfLines = 3
        
        test.text = UserDefaults.standard.object(forKey: key) as! String
        
        self.view.addSubview(test)
        
    }
    
    func maekBlack() {
        testImage2.removeFromSuperview()
        let scale = 0.25
        //imageを縮小する
        //画像の大きさ指定
        let imageWidth = 375.0
        let imageHeight = 312.0
        //吹き出しのイメージを生成
        let imageView: UIImageView = UIImageView(image: igaiga)
        //viewもの大きさ設定
        let rect = CGRect(x: 0.0, y: 111.0, width: imageWidth * scale, height: imageHeight * scale)
        imageView.frame = rect
        //viewに追加
        imageView.center = CGPoint(x: Double(self.view.bounds.width / 2), y: imageHeight / 2)
              
        testImage3 = imageView

        self.view.addSubview(testImage3)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .transitionCurlDown, animations: {   self.testImage3.center.y += 330.0 }) { _ in self.testImage3.removeFromSuperview()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                   self.end()
               }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                     self.dismiss(animated: true, completion: nil)
        }
                    

        
    }
    
    func animation() {
        //テキストを小さくする
        textSmallAnimation()
        self.eatText()
        //遅延させて黒くする
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.maekBlack()
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            print("fin")

    }
    }
      
    

}

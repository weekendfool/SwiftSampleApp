//
//  MakeImageView.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/09.
//

import Foundation
import UIKit

struct MakeImageView {
    
    
    // imegeViewのインスタンスを作成
    let imegeView: UIImageView = UIImageView()
    
//    func setUpImageView(vc: UIViewController, myImage: UIImage) {
//        // imegeViewのインスタンスを作成
//        let imegeView: UIImageView = UIImageView()
//
//        imegeView.image = myImage
//
//        // imageViewの大きさ指定
//        let rect: CGRect = CGRect(x: 100, y: 100, width: vc.view.frame.size.width / 3, height: vc.view.frame.size.height / 3)
//        imegeView.frame = rect
//
//        vc.view.addSubview(imegeView)
//    }
//
    // imageViewの生成のみ担当
    func setUpImageView(vc: UIViewController) {
        
        
//        imegeView.image = myImage
        
        // imageViewの大きさ指定
        let rect: CGRect = CGRect(x: 100, y: 100, width: vc.view.frame.size.width / 3, height: vc.view.frame.size.height / 3)
        imegeView.frame = rect
        
        vc.view.addSubview(imegeView)
    }
    

    // イメージの代入
    func setImage(myImage: UIImage) {
        imegeView.image = myImage
    }
    
}

//
//  MakeImageView.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/09.
//

import Foundation
import UIKit

struct MakeImageView {
    
    
    func setUpImageView(vc: UIViewController, myImage: UIImage) {
        // imegeViewのインスタンスを作成
        let imegeView: UIImageView = UIImageView()
        
        imegeView.image = myImage
        
        // imageViewの大きさ指定
        let rect: CGRect = CGRect(x: 0, y: 0, width: vc.view.frame.size.width, height: vc.view.frame.size.height)
        imegeView.frame = rect
        
        vc.view.addSubview(imegeView)
    }
    
}
